#-------------------------------------------------
#
# Project created by QtCreator 2013-09-20T14:31:26
#
#-------------------------------------------------

QT       += core gui network qml quick

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = rotfl
TEMPLATE = app

unix:INCLUDEPATH += "../"
QMAKE_CXXFLAGS += -std=c++0x

SOURCES += main.cpp\
        mainwindow.cpp \
    threadReader.cpp \
    ../croi/posixSerial.cpp \
    ../croi/roombaSerial.cpp \
    mapQGraphicsView.cpp \
    poiQGraphicsEllipseItem.cpp \
    ../../ext_lib/RooWifi_11b/roowifi.cpp \
    ../croi/roombaRoowifi.cpp \
    wallQGraphicsLineItem.cpp

HEADERS  += mainwindow.h \
    threadReader.h \
    ../croi/posixSerialUtils.h \
    ../croi/posixSerial.h \
    ../croi/iRoomba.h \
    ../croi/roombaSerial.h \
    ../croi/croiUtil.h \
    poiQGraphicsEllipseItem.h \
    mapQGraphicsView.h \
    ../../ext_lib/RooWifi_11b/roowifi.h \
    ../../ext_lib/RooWifi_11b/roomba.h \
    ../croi/roombaRoowifi.h \
    wallQGraphicsLineItem.h

FORMS    += mainwindow.ui

OTHER_FILES += main.qml
