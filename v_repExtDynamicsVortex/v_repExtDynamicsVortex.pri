TARGET = v_repExtDynamicsVortex

DEFINES += INCLUDE_VORTEX_CODE
DEFINES += VX_DLL
DEFINES += DYNAMICS_PLUGIN_VERSION=11 #11 since V-REP3.5.0Rev3+ # 10 since V-REP release 3.4.0, 9 since new Vortex (V-REP 3.4.0), 8 since refactoring dyn plugins,
DEFINES += LIBRARY_NAME=\\\"DynamicsVortex\\\"
DEFINES += ENGINE_NAME=\\\"Vortex\\\"

CONFIG += DOUBLE_PRECISION

win32 {
    CONFIG(debug, debug|release) {
        LIBS += "$${VORTEX_LIBPATH}/VxCored.lib"
        LIBS += "$${VORTEX_LIBPATH}/VxPlatformd.lib"
        LIBS += "$${VORTEX_LIBPATH}/VxMathd.lib"
        LIBS += "$${VORTEX_LIBPATH}/VxFoundationd.lib"
    }
    CONFIG(release, debug|release) {
        LIBS += "$${VORTEX_LIBPATH}/VxCore.lib"
        LIBS += "$${VORTEX_LIBPATH}/VxPlatform.lib"
        LIBS += "$${VORTEX_LIBPATH}/VxMath.lib"
        LIBS += "$${VORTEX_LIBPATH}/VxFoundation.lib"
    }
}

unix:!macx {
    NEW_VORTEX_SOURCE {
        CONFIG(release, debug|release) {
            LIBS += "$${VORTEX_LIBPATH}/libVxCore.so"
            LIBS += "$${VORTEX_LIBPATH}/libVxMath.so"
            LIBS += "$${VORTEX_LIBPATH}/libVxPlatform.so"
        }
        CONFIG += c++11
    }
}

INCLUDEPATH += "sourceCode/dynamics/vortex"

INCLUDEPATH += $$VORTEX_INCLUDEPATH

HEADERS += sourceCode/dynamics/vortex/CollShapeDyn_vortex.h \
    sourceCode/dynamics/vortex/RigidBodyDyn_vortex.h \
    sourceCode/dynamics/vortex/ConstraintDyn_vortex.h \
    sourceCode/dynamics/vortex/RigidBodyContainerDyn_vortex.h \
    sourceCode/dynamics/vortex/ParticleDyn_vortex.h \

SOURCES += sourceCode/dynamics/vortex/CollShapeDyn_vortex.cpp \
    sourceCode/dynamics/vortex/RigidBodyDyn_vortex.cpp \
    sourceCode/dynamics/vortex/ConstraintDyn_vortex.cpp \
    sourceCode/dynamics/vortex/RigidBodyContainerDyn_vortex.cpp \
    sourceCode/dynamics/vortex/ParticleDyn_vortex.cpp \

