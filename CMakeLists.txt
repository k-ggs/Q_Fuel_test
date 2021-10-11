cmake_minimum_required(VERSION 3.14)

project(Q_Fuel_test LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# QtCreator supports the following variables for Android, which are identical to qmake Android variables.
# Check https://doc.qt.io/qt/deployment-android.html for more information.
# They need to be set before the find_package(...) calls below.

#if(ANDROID)
#    set(ANDROID_PACKAGE_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}/android")
#    if (ANDROID_ABI STREQUAL "armeabi-v7a")
#        set(ANDROID_EXTRA_LIBS
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libcrypto.so
#            ${CMAKE_CURRENT_SOURCE_DIR}/path/to/libssl.so)
#    endif()
#endif()

find_package(QT NAMES Qt6 Qt5 COMPONENTS      Core gui Quick Qml printsupport quickcontrols2 serialbus serialport Widgets REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core gui Quick Qml printsupport quickcontrols2 serialbus serialport Widgets REQUIRED)

set(PROJECT_SOURCES
        main.cpp
        qml.qrc
        Res.qrc
)
include_directories(
    thridtool/framelesswindow_all
    thridtool/QCustomPlot/qcustomplot
    thridtool/QCustomPlot/qcustomplotapi

    )
file(GLOB soucres
    "thridtool/framelesswindow_all/*cpp"
    "thridtool/QCustomPlot/qcustomplot/*cpp"
      "thridtool/QCustomPlot/qcustomplotapi/*cpp"
    )

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
    qt_add_executable(Q_Fuel_test
        ${PROJECT_SOURCES}

    )
else()
    if(ANDROID)
        add_library(Q_Fuel_test SHARED
            ${PROJECT_SOURCES}
        )
    else()
        add_executable(Q_Fuel_test
          ${PROJECT_SOURCES}
           ${soucres}
        )
    endif()
endif()

target_compile_definitions(Q_Fuel_test
  PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(Q_Fuel_test
  PRIVATE Qt${QT_VERSION_MAJOR}::Core
  Qt${QT_VERSION_MAJOR}::Quick
  Qt${QT_VERSION_MAJOR}::SerialBus
  Qt${QT_VERSION_MAJOR}::Widgets
   Qt${QT_VERSION_MAJOR}::PrintSupport
  )
