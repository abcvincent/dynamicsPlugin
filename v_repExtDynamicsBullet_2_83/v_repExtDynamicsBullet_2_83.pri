TARGET = v_repExtDynamicsBullet-2-83

DEFINES += INCLUDE_BULLET_2_83_CODE
DEFINES += DYNAMICS_PLUGIN_VERSION=9 # 9 since V-REP release 3.4.0, 8 since first plugin release with Bullet 2.83
DEFINES += LIBRARY_NAME=\\\"DynamicsBullet_2_83\\\"
DEFINES += ENGINE_NAME=\\\"Bullet\\\"

INCLUDEPATH += $$BULLET_INCLUDEPATH

*-msvc* {
    LIBS += $${BULLET_BUILD_DIR}/lib/Release/BulletDynamics.lib
    LIBS += $${BULLET_BUILD_DIR}/lib/Release/BulletCollision.lib
    LIBS += $${BULLET_BUILD_DIR}/lib/Release/LinearMath.lib
}

unix {
    LIBS += $${BULLET_BUILD_DIR}/src/BulletDynamics/libBulletDynamics.a
    LIBS += $${BULLET_BUILD_DIR}/src/BulletCollision/libBulletCollision.a
    LIBS += $${BULLET_BUILD_DIR}/src/LinearMath/libLinearMath.a
}

win32-g++ {
    LIBS += $${BULLET_BUILD_DIR}/lib/libBulletDynamics.a
    LIBS += $${BULLET_BUILD_DIR}/lib/libBulletCollision.a
    LIBS += $${BULLET_BUILD_DIR}/lib/libLinearMath.a
}

*-msvc* {
    QMAKE_CFLAGS_RELEASE += -MT
    QMAKE_CXXFLAGS_RELEASE += -MT
}

INCLUDEPATH += "sourceCode/dynamics/bullet_2_83"

HEADERS += sourceCode/dynamics/bullet_2_83/CollShapeDyn_bullet283.h \
    sourceCode/dynamics/bullet_2_83/RigidBodyDyn_bullet283.h \
    sourceCode/dynamics/bullet_2_83/ConstraintDyn_bullet283.h \
    sourceCode/dynamics/bullet_2_83/RigidBodyContainerDyn_bullet283.h \
    sourceCode/dynamics/bullet_2_83/ParticleDyn_bullet283.h \

SOURCES += sourceCode/dynamics/bullet_2_83/CollShapeDyn_bullet283.cpp \
    sourceCode/dynamics/bullet_2_83/RigidBodyDyn_bullet283.cpp \
    sourceCode/dynamics/bullet_2_83/ConstraintDyn_bullet283.cpp \
    sourceCode/dynamics/bullet_2_83/RigidBodyContainerDyn_bullet283.cpp \
    sourceCode/dynamics/bullet_2_83/ParticleDyn_bullet283.cpp \

