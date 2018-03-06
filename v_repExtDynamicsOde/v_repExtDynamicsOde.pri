TARGET = v_repExtDynamicsOde

DEFINES += INCLUDE_ODE_CODE
DEFINES += DYNAMICS_PLUGIN_VERSION=11 #11 since V-REP3.5.0Rev3+ # 10 since V-REP release 3.4.0, 9 with sim_ode_global_randomseed,8 since refactoring dyn plugins, 7 since separation of the 3 engines
DEFINES += LIBRARY_NAME=\\\"DynamicsOde\\\"
DEFINES += ENGINE_NAME=\\\"ODE\\\"
DEFINES += dNODEBUG
DEFINES += dLIBCCD_ENABLED
DEFINES += dLIBCCD_CYL_CYL
DEFINES += ODE_LIB
DEFINES += dLIBCCD_CONVEX_BOX
DEFINES += dLIBCCD_CONVEX_CYL
DEFINES += dLIBCCD_CONVEX_SPHERE
DEFINES += dLIBCCD_CONVEX_CONVEX
DEFINES += dTRIMESH_ENABLED
DEFINES += dTRIMESH_OPCODE

*-msvc* {
    LIBS += -luser32
}

!DOUBLE_PRECISION {
    DEFINES += dSINGLE
    DEFINES += CCD_SINGLE
}

DOUBLE_PRECISION {
    DEFINES += dDOUBLE
    DEFINES += CCD_DOUBLE
}

INCLUDEPATH += "sourceCode/dynamics/ode"
INCLUDEPATH += "sourceCode/dynamics/ode/ode"
INCLUDEPATH += "sourceCode/dynamics/ode/ode/src"
INCLUDEPATH += "sourceCode/dynamics/ode/ode/OPCODE"
INCLUDEPATH += "sourceCode/dynamics/ode/ode/libccd/src"

HEADERS += sourceCode/dynamics/ode/CollShapeDyn_ode.h \
    sourceCode/dynamics/ode/RigidBodyDyn_ode.h \
    sourceCode/dynamics/ode/ConstraintDyn_ode.h \
    sourceCode/dynamics/ode/RigidBodyContainerDyn_ode.h \
    sourceCode/dynamics/ode/ParticleDyn_ode.h \
    sourceCode/dynamics/ode/ode/rotation.h \
    sourceCode/dynamics/ode/ode/odemath.h \
    sourceCode/dynamics/ode/ode/odeinit.h \
    sourceCode/dynamics/ode/ode/odecpp_collision.h \
    sourceCode/dynamics/ode/ode/odecpp.h \
    sourceCode/dynamics/ode/ode/odeconfig.h \
    sourceCode/dynamics/ode/ode/ode.h \
    sourceCode/dynamics/ode/ode/objects.h \
    sourceCode/dynamics/ode/ode/misc.h \
    sourceCode/dynamics/ode/ode/memory.h \
    sourceCode/dynamics/ode/ode/matrix.h \
    sourceCode/dynamics/ode/ode/mass.h \
    sourceCode/dynamics/ode/ode/export-dif.h \
    sourceCode/dynamics/ode/ode/error.h \
    sourceCode/dynamics/ode/ode/contact.h \
    sourceCode/dynamics/ode/ode/compatibility.h \
    sourceCode/dynamics/ode/ode/common.h \
    sourceCode/dynamics/ode/ode/collision_trimesh.h \
    sourceCode/dynamics/ode/ode/collision_space.h \
    sourceCode/dynamics/ode/ode/collision.h \
    sourceCode/dynamics/ode/ode/src/util.h \
    sourceCode/dynamics/ode/ode/src/step.h \
    sourceCode/dynamics/ode/ode/src/quickstep.h \
    sourceCode/dynamics/ode/ode/src/odetls.h \
    sourceCode/dynamics/ode/ode/src/odeou.h \
    sourceCode/dynamics/ode/ode/src/obstack.h \
    sourceCode/dynamics/ode/ode/src/objects.h \
    sourceCode/dynamics/ode/ode/src/mat.h \
    sourceCode/dynamics/ode/ode/src/lcp.h \
    sourceCode/dynamics/ode/ode/src/heightfield.h \
    sourceCode/dynamics/ode/ode/src/config.h \
    sourceCode/dynamics/ode/ode/src/collision_util.h \
    sourceCode/dynamics/ode/ode/src/collision_trimesh_internal.h \
    sourceCode/dynamics/ode/ode/src/collision_trimesh_colliders.h \
    sourceCode/dynamics/ode/ode/src/collision_transform.h \
    sourceCode/dynamics/ode/ode/src/collision_std.h \
    sourceCode/dynamics/ode/ode/src/collision_space_internal.h \
    sourceCode/dynamics/ode/ode/src/collision_kernel.h \
    sourceCode/dynamics/ode/ode/src/array.h \
    sourceCode/dynamics/ode/ode/src/joints/universal.h \
    sourceCode/dynamics/ode/ode/src/joints/slider.h \
    sourceCode/dynamics/ode/ode/src/joints/pu.h \
    sourceCode/dynamics/ode/ode/src/joints/pr.h \
    sourceCode/dynamics/ode/ode/src/joints/plane2d.h \
    sourceCode/dynamics/ode/ode/src/joints/piston.h \
    sourceCode/dynamics/ode/ode/src/joints/null.h \
    sourceCode/dynamics/ode/ode/src/joints/lmotor.h \
    sourceCode/dynamics/ode/ode/src/joints/joints.h \
    sourceCode/dynamics/ode/ode/src/joints/joint_internal.h \
    sourceCode/dynamics/ode/ode/src/joints/joint.h \
    sourceCode/dynamics/ode/ode/src/joints/hinge2.h \
    sourceCode/dynamics/ode/ode/src/joints/hinge.h \
    sourceCode/dynamics/ode/ode/src/joints/fixed.h \
    sourceCode/dynamics/ode/ode/src/joints/contact.h \
    sourceCode/dynamics/ode/ode/src/joints/ball.h \
    sourceCode/dynamics/ode/ode/src/joints/amotor.h \
    sourceCode/dynamics/ode/ode/OPCODE/Opcode.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_VolumeCollider.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_TriTriOverlap.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_TriBoxOverlap.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_TreeCollider.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_TreeBuilders.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_SphereTriOverlap.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_SphereCollider.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_SphereAABBOverlap.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_Settings.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_RayTriOverlap.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_RayCollider.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_RayAABBOverlap.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_PlanesTriOverlap.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_PlanesCollider.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_PlanesAABBOverlap.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_Picking.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_OptimizedTree.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_OBBCollider.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_Model.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_MeshInterface.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_LSSTriOverlap.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_LSSCollider.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_LSSAABBOverlap.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_IceHook.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_HybridModel.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_Common.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_Collider.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_BoxBoxOverlap.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_BaseModel.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_AABBTree.h \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_AABBCollider.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceUtils.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceTypes.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceTriList.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceTriangle.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceSegment.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceRevisitedRadix.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceRay.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceRandom.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IcePreprocessor.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IcePoint.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IcePlane.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IcePairs.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceOBB.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceMemoryMacros.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceMatrix4x4.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceMatrix3x3.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceLSS.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceIndexedTriangle.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceHPoint.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceFPU.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceContainer.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceBoundingSphere.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceAxes.h \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceAABB.h \
    sourceCode/dynamics/ode/ode/src/collision_libccd.h \
    sourceCode/dynamics/ode/ode/src/collision_space_internal.h \
    sourceCode/dynamics/ode/ode/src/collision_std.h \
    sourceCode/dynamics/ode/ode/src/collision_trimesh_colliders.h \
    sourceCode/dynamics/ode/ode/src/collision_trimesh_internal.h \
    sourceCode/dynamics/ode/ode/libccd/src/ccd/alloc.h \
    sourceCode/dynamics/ode/ode/libccd/src/ccd/ccd.h \
    sourceCode/dynamics/ode/ode/libccd/src/ccd/compiler.h \
    sourceCode/dynamics/ode/ode/libccd/src/ccd/config.h \
    sourceCode/dynamics/ode/ode/libccd/src/ccd/dbg.h \
    sourceCode/dynamics/ode/ode/libccd/src/ccd/list.h \
    sourceCode/dynamics/ode/ode/libccd/src/ccd/polytope.h \
    sourceCode/dynamics/ode/ode/libccd/src/ccd/quat.h \
    sourceCode/dynamics/ode/ode/libccd/src/ccd/simplex.h \
    sourceCode/dynamics/ode/ode/libccd/src/ccd/support.h \
    sourceCode/dynamics/ode/ode/libccd/src/ccd/vec3.h \

SOURCES += sourceCode/dynamics/ode/CollShapeDyn_ode.cpp \
    sourceCode/dynamics/ode/RigidBodyDyn_ode.cpp \
    sourceCode/dynamics/ode/ConstraintDyn_ode.cpp \
    sourceCode/dynamics/ode/RigidBodyContainerDyn_ode.cpp \
    sourceCode/dynamics/ode/ParticleDyn_ode.cpp \
    sourceCode/dynamics/ode/ode/src/util.cpp \
    sourceCode/dynamics/ode/ode/src/timer.cpp \
    sourceCode/dynamics/ode/ode/src/step.cpp \
    sourceCode/dynamics/ode/ode/src/sphere.cpp \
    sourceCode/dynamics/ode/ode/src/rotation.cpp \
    sourceCode/dynamics/ode/ode/src/ray.cpp \
    sourceCode/dynamics/ode/ode/src/quickstep.cpp \
    sourceCode/dynamics/ode/ode/src/plane.cpp \
    sourceCode/dynamics/ode/ode/src/odetls.cpp \
    sourceCode/dynamics/ode/ode/src/odeou.cpp \
    sourceCode/dynamics/ode/ode/src/odemath.cpp \
    sourceCode/dynamics/ode/ode/src/odeinit.cpp \
    sourceCode/dynamics/ode/ode/src/ode.cpp \
    sourceCode/dynamics/ode/ode/src/obstack.cpp \
    sourceCode/dynamics/ode/ode/src/misc.cpp \
    sourceCode/dynamics/ode/ode/src/memory.cpp \
    sourceCode/dynamics/ode/ode/src/matrix.cpp \
    sourceCode/dynamics/ode/ode/src/mat.cpp \
    sourceCode/dynamics/ode/ode/src/mass.cpp \
    sourceCode/dynamics/ode/ode/src/lcp.cpp \
    sourceCode/dynamics/ode/ode/src/heightfield.cpp \
    sourceCode/dynamics/ode/ode/src/fastltsolve.c \
    sourceCode/dynamics/ode/ode/src/fastlsolve.c \
    sourceCode/dynamics/ode/ode/src/fastldlt.c \
    sourceCode/dynamics/ode/ode/src/fastdot.c \
    sourceCode/dynamics/ode/ode/src/export-dif.cpp \
    sourceCode/dynamics/ode/ode/src/error.cpp \
    sourceCode/dynamics/ode/ode/src/cylinder.cpp \
    sourceCode/dynamics/ode/ode/src/convex.cpp \
    sourceCode/dynamics/ode/ode/src/collision_util.cpp \
    sourceCode/dynamics/ode/ode/src/collision_trimesh_trimesh_new.cpp \
    sourceCode/dynamics/ode/ode/src/collision_trimesh_trimesh.cpp \
    sourceCode/dynamics/ode/ode/src/collision_trimesh_sphere.cpp \
    sourceCode/dynamics/ode/ode/src/collision_trimesh_ray.cpp \
    sourceCode/dynamics/ode/ode/src/collision_trimesh_plane.cpp \
    sourceCode/dynamics/ode/ode/src/collision_trimesh_opcode.cpp \
    sourceCode/dynamics/ode/ode/src/collision_trimesh_gimpact.cpp \
    sourceCode/dynamics/ode/ode/src/collision_trimesh_distance.cpp \
    sourceCode/dynamics/ode/ode/src/collision_trimesh_disabled.cpp \
    sourceCode/dynamics/ode/ode/src/collision_trimesh_ccylinder.cpp \
    sourceCode/dynamics/ode/ode/src/collision_trimesh_box.cpp \
    sourceCode/dynamics/ode/ode/src/collision_transform.cpp \
    sourceCode/dynamics/ode/ode/src/collision_space.cpp \
    sourceCode/dynamics/ode/ode/src/collision_sapspace.cpp \
    sourceCode/dynamics/ode/ode/src/collision_quadtreespace.cpp \
    sourceCode/dynamics/ode/ode/src/collision_kernel.cpp \
    sourceCode/dynamics/ode/ode/src/collision_cylinder_trimesh.cpp \
    sourceCode/dynamics/ode/ode/src/collision_cylinder_sphere.cpp \
    sourceCode/dynamics/ode/ode/src/collision_cylinder_plane.cpp \
    sourceCode/dynamics/ode/ode/src/collision_cylinder_box.cpp \
    sourceCode/dynamics/ode/ode/src/capsule.cpp \
    sourceCode/dynamics/ode/ode/src/box.cpp \
    sourceCode/dynamics/ode/ode/src/array.cpp \
    sourceCode/dynamics/ode/ode/src/joints/universal.cpp \
    sourceCode/dynamics/ode/ode/src/joints/slider.cpp \
    sourceCode/dynamics/ode/ode/src/joints/pu.cpp \
    sourceCode/dynamics/ode/ode/src/joints/pr.cpp \
    sourceCode/dynamics/ode/ode/src/joints/plane2d.cpp \
    sourceCode/dynamics/ode/ode/src/joints/piston.cpp \
    sourceCode/dynamics/ode/ode/src/joints/null.cpp \
    sourceCode/dynamics/ode/ode/src/joints/lmotor.cpp \
    sourceCode/dynamics/ode/ode/src/joints/joint.cpp \
    sourceCode/dynamics/ode/ode/src/joints/hinge2.cpp \
    sourceCode/dynamics/ode/ode/src/joints/hinge.cpp \
    sourceCode/dynamics/ode/ode/src/joints/fixed.cpp \
    sourceCode/dynamics/ode/ode/src/joints/contact.cpp \
    sourceCode/dynamics/ode/ode/src/joints/ball.cpp \
    sourceCode/dynamics/ode/ode/src/joints/amotor.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/Opcode.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_VolumeCollider.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_TreeCollider.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_TreeBuilders.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_SphereCollider.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_RayCollider.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_PlanesCollider.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_Picking.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_OptimizedTree.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_OBBCollider.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_Model.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_MeshInterface.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_LSSCollider.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_HybridModel.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_Common.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_Collider.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_BaseModel.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_AABBTree.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/OPC_AABBCollider.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceUtils.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceTriangle.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceSegment.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceRevisitedRadix.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceRay.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceRandom.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IcePoint.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IcePlane.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceOBB.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceMatrix4x4.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceMatrix3x3.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceIndexedTriangle.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceHPoint.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceContainer.cpp \
    sourceCode/dynamics/ode/ode/OPCODE/Ice/IceAABB.cpp \
    sourceCode/dynamics/ode/ode/src/collision_libccd.cpp \
    sourceCode/dynamics/ode/ode/src/nextafterf.c \
    sourceCode/dynamics/ode/ode/libccd/src/alloc.c \
    sourceCode/dynamics/ode/ode/libccd/src/ccd.c \
    sourceCode/dynamics/ode/ode/libccd/src/mpr.c \
    sourceCode/dynamics/ode/ode/libccd/src/polytope.c \
    sourceCode/dynamics/ode/ode/libccd/src/support.c \
    sourceCode/dynamics/ode/ode/libccd/src/vec3.c \

