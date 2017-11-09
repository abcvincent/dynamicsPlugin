include(../config.pri)

!DOUBLE_PRECISION {
    DEFINES += dynReal=float
}
DOUBLE_PRECISION {
    DEFINES += dynReal=double
}

TEMPLATE = lib
QT -= core
QT -= gui
DEFINES -= UNICODE
DEFINES += COMPILING_EXTERNAL_DYN_DLL

*-msvc* {
    QMAKE_CXXFLAGS += -O2
    QMAKE_CXXFLAGS += -W3
}
*-g++* {
    QMAKE_CXXFLAGS += -O3
    QMAKE_CXXFLAGS += -Wall
    QMAKE_CXXFLAGS += -Wno-unused-parameter
    QMAKE_CXXFLAGS += -Wno-strict-aliasing
    QMAKE_CXXFLAGS += -Wno-empty-body
    QMAKE_CXXFLAGS += -Wno-write-strings

    QMAKE_CXXFLAGS += -Wno-unused-but-set-variable
    QMAKE_CXXFLAGS += -Wno-unused-local-typedefs
    QMAKE_CXXFLAGS += -Wno-narrowing

    QMAKE_CFLAGS += -O3
    QMAKE_CFLAGS += -Wall
    QMAKE_CFLAGS += -Wno-strict-aliasing
    QMAKE_CFLAGS += -Wno-unused-parameter
    QMAKE_CFLAGS += -Wno-unused-but-set-variable
    QMAKE_CFLAGS += -Wno-unused-local-typedefs
}

CONFIG += shared

INCLUDEPATH += $$BOOST_INCLUDEPATH

win32 {
    CONFIG += NEW_VORTEX_SOURCE
    DEFINES += NEW_VORTEX_SOURCE
    DEFINES += NOMINMAX
    DEFINES += WIN_VREP
    LIBS += -lwinmm
}

macx {
    DEFINES += _MACOSX_VER
    DEFINES += MAC_VREP
}

unix:!macx {
    contains(QMAKE_HOST.arch, x86_64):{ # 64 Bit
        CONFIG += NEW_VORTEX_SOURCE
        DEFINES += NEW_VORTEX_SOURCE
        DEFINES += _POSIX_VER_64
    }
    !contains(QMAKE_HOST.arch, x86_64):{ # 32 Bit
        DEFINES += _POSIX_VER
    }
    DEFINES += LIN_VREP
}

INCLUDEPATH += "sourceCode"
INCLUDEPATH += "sourceCode/dynamics"
INCLUDEPATH += "../common/sourceCode"
INCLUDEPATH += "../common/sourceCode/dynamics"
INCLUDEPATH += "../../v_rep/sourceCode/interfaces"
INCLUDEPATH += "../../programming/v_repMath"
INCLUDEPATH += "../../programming/include"
INCLUDEPATH += "../../programming/common"

HEADERS += ../../v_rep/sourceCode/interfaces/dummyClasses.h \
    ../../programming/include/v_repLib.h \
    ../../programming/v_repMath/3Vector.h \
    ../../programming/v_repMath/4Vector.h \
    ../../programming/v_repMath/7Vector.h \
    ../../programming/v_repMath/3X3Matrix.h \
    ../../programming/v_repMath/4X4Matrix.h \
    ../../programming/v_repMath/4X4FullMatrix.h \
    ../../programming/v_repMath/MyMath.h \

HEADERS += ../common/sourceCode/dynamics/CollShapeDyn.h \
    ../common/sourceCode/dynamics/ConstraintDyn.h \
    ../common/sourceCode/dynamics/ParticleContainer.h \
    ../common/sourceCode/dynamics/ParticleObject.h \
    ../common/sourceCode/dynamics/ParticleDyn.h \
    ../common/sourceCode/dynamics/RigidBodyDyn.h \
    ../common/sourceCode/dynamics/RigidBodyContainerDyn.h \
    ../common/sourceCode/v_repExtDynamics.h \

SOURCES += ../../programming/common/v_repLib.cpp \
    ../../programming/v_repMath/3Vector.cpp \
    ../../programming/v_repMath/4Vector.cpp \
    ../../programming/v_repMath/7Vector.cpp \
    ../../programming/v_repMath/3X3Matrix.cpp \
    ../../programming/v_repMath/4X4Matrix.cpp \
    ../../programming/v_repMath/4X4FullMatrix.cpp \
    ../../programming/v_repMath/MyMath.cpp \

SOURCES += ../common/sourceCode/dynamics/CollShapeDyn.cpp \
    ../common/sourceCode/dynamics/ConstraintDyn.cpp \
    ../common/sourceCode/dynamics/ParticleContainer.cpp \
    ../common/sourceCode/dynamics/ParticleObject.cpp \
    ../common/sourceCode/dynamics/ParticleDyn.cpp \
    ../common/sourceCode/dynamics/RigidBodyDyn.cpp \
    ../common/sourceCode/dynamics/RigidBodyContainerDyn.cpp \
    ../common/sourceCode/v_repExtDynamics.cpp \

unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}
