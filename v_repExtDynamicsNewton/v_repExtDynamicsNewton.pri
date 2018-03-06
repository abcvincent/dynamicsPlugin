TARGET = v_repExtDynamicsNewton

DEFINES += INCLUDE_NEWTON_CODE
DEFINES += DYNAMICS_PLUGIN_VERSION=4 #4 since V-REP3.5.0Rev3+ # 3 since V-REP release 3.4.0, 2 since refactoring dyn plugins,
DEFINES += LIBRARY_NAME=\\\"DynamicsNewton\\\"
DEFINES += ENGINE_NAME=\\\"Newton\\\"
DEFINES += _CUSTOM_JOINTS_STATIC_LIB
DEFINES += _NEWTON_STATIC_LIB
DEFINES += PTW32_STATIC_LIB
DEFINES += _ASSERTE\\\(x\\\) #for _ASSERTE(x)

USE_THREAD_EMULATION {
    DEFINES += DG_USE_THREAD_EMULATION
}

DOUBLE_PRECISION {
    DEFINES += _NEWTON_USE_DOUBLE
}

!win32 {
    QMAKE_CXXFLAGS += -msse2 -msse3 -g -msse -msse2 -msse3 -msse4 -mfpmath=sse -ffloat-store -ffast-math -freciprocal-math -funsafe-math-optimizations -fsingle-precision-constant
}

*-msvc* {
    DEFINES += _CRT_SECURE_NO_WARNINGS
}

*-clang* {
    QMAKE_CXXFLAGS += -Wno-narrowing
}

INCLUDEPATH += "sourceCode/dynamics/newton"
INCLUDEPATH += "sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/newton"
INCLUDEPATH += "sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core"
INCLUDEPATH += "sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics"
INCLUDEPATH += "sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/meshUtil"
INCLUDEPATH += "sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/ampPhysics"
INCLUDEPATH += "sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dMath"
INCLUDEPATH += "sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints"
INCLUDEPATH += "sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers"

win32 {
    INCLUDEPATH += "sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/pthreads.2"
}

HEADERS += sourceCode/dynamics/newton/CollShapeDyn_newton.h \
    sourceCode/dynamics/newton/RigidBodyDyn_newton.h \
    sourceCode/dynamics/newton/ConstraintDyn_newton.h \
    sourceCode/dynamics/newton/RigidBodyContainerDyn_newton.h \
    sourceCode/dynamics/newton/ParticleDyn_newton.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/newton/Newton.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/newton/NewtonClass.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/newton/NewtonStdAfx.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dg.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgAABBPolygonSoup.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgArray.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgAsyncThread.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgConvexHull3d.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgConvexHull4d.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgCRC.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgDebug.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgDelaunayTetrahedralization.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgFastQueue.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgGeneralMatrix.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgGeneralVector.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgGoogol.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgGraph.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgHeap.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgIntersections.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgList.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgMatrix.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgMemory.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgMutexThread.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgNode.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgObb.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgPathFinder.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgPlane.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgPolygonSoupBuilder.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgPolygonSoupDatabase.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgPolyhedra.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgPolyhedraMassProperties.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgQuaternion.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgRandom.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgRef.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgRefCounter.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgRtti.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgSmallDeterminant.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgSPDMatrix.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgStack.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgStdafx.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgThread.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgThreadHive.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgThreadProfiler.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgTree.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgTypes.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgVector.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgBallConstraint.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgBilateralConstraint.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgBody.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgBodyMasterList.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgBroadPhase.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgBroadPhaseAggregate.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgBroadPhaseDefault.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgBroadPhasePersistent.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollision.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionBox.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionBVH.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionCapsule.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionChamferCylinder.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionCompound.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionCompoundFractured.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionCone.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionConvex.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionConvexHull.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionConvexPolygon.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionCylinder.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionDeformableClothPatch.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionDeformableMesh.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionDeformableSolidMesh.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionHeightField.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionInstance.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionMesh.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionNull.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionScene.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionSphere.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionTaperedCapsule.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionTaperedCylinder.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionUserMesh.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgConstraint.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgContact.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCorkscrewConstraint.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgDeformableBodiesUpdate.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgDeformableBody.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgDeformableContact.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgDynamicBody.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgHingeConstraint.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgKinematicBody.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgPhysics.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgPhysicsStdafx.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgSkeletonContainer.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgSlidingConstraint.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgUniversalConstraint.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgUpVectorConstraint.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgUserConstraint.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgWorld.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgWorldDynamicUpdate.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/meshUtil/dgMeshEffect.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dMath/dLinearAlgebra.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dMath/dMathDefines.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dMath/dMatrix.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dMath/dQuaternion.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dMath/dStdAfxMath.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dMath/dVector.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/Custom6DOF.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomAlloc.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomArcticulatedTransformManager.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomBallAndSocket.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomControllerManager.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomCorkScrew.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomDryRollingFriction.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomGear.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomHinge.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomHingeActuator.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomInputManager.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomJoint.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomJointLibraryStdAfx.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomKinematicController.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomPathFollow.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomPlayerControllerManager.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomPulley.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomRackAndPinion.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomSlider.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomSliderActuator.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomSlidingContact.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomTriggerManager.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomUniversal.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomUniversalActuator.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomUpVector.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomUserBlank.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomVehicleControllerBodyState.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomVehicleControllerComponent.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomVehicleControllerJoint.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomVehicleControllerManager.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dBaseHierarchy.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dClassInfo.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dContainersAlloc.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dContainersStdAfx.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dCRC.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dHeap.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dList.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dRefCounter.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dRtti.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dString.h \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dTree.h \
    sourceCode/dynamics/newton/NewtonConvertUtil.h \

win32 {
    HEADERS += sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/pthreads.2/pthread.h \
        sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/ampPhysics/dgAMP.h \
        sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/ampPhysics/dgAmpAllocator.h \
        sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/ampPhysics/dgAmpInstance.h
}

SOURCES += sourceCode/dynamics/newton/CollShapeDyn_newton.cpp \
    sourceCode/dynamics/newton/RigidBodyDyn_newton.cpp \
    sourceCode/dynamics/newton/ConstraintDyn_newton.cpp \
    sourceCode/dynamics/newton/RigidBodyContainerDyn_newton.cpp \
    sourceCode/dynamics/newton/ParticleDyn_newton.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/newton/Newton.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/newton/NewtonClass.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dg.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgAABBPolygonSoup.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgAsyncThread.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgConvexHull3d.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgConvexHull4d.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgCRC.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgDebug.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgDelaunayTetrahedralization.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgGeneralMatrix.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgGeneralVector.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgGoogol.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgIntersections.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgMatrix.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgMemory.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgMutexThread.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgNode.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgObb.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgPolygonSoupBuilder.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgPolyhedra.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgPolyhedraMassProperties.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgQuaternion.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgRandom.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgRef.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgRefCounter.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgSmallDeterminant.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgSPDMatrix.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgThread.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgThreadHive.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgTree.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/core/dgTypes.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgBallConstraint.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgBilateralConstraint.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgBody.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgBodyMasterList.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgBroadPhase.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgBroadPhaseAggregate.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgBroadPhaseDefault.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgBroadPhasePersistent.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollision.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionBox.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionBVH.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionCapsule.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionChamferCylinder.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionCompound.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionCompoundFractured.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionCone.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionConvex.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionConvexHull.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionConvexPolygon.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionCylinder.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionDeformableClothPatch.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionDeformableMesh.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionDeformableSolidMesh.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionHeightField.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionInstance.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionMesh.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionNull.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionScene.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionSphere.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionTaperedCapsule.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionTaperedCylinder.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCollisionUserMesh.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgConstraint.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgContact.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgCorkscrewConstraint.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgDeformableBodiesUpdate.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgDeformableBody.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgDeformableContact.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgDynamicBody.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgHingeConstraint.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgKinematicBody.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgNarrowPhaseCollision.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgSkeletonContainer.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgSlidingConstraint.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgUniversalConstraint.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgUpVectorConstraint.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgUserConstraint.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgWorld.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgWorldDynamicsParallelSolver.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgWorldDynamicsSimpleSolver.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/physics/dgWorldDynamicUpdate.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/meshUtil/dgMeshEffect1.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/meshUtil/dgMeshEffect2.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/meshUtil/dgMeshEffect3.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/meshUtil/dgMeshEffect4.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/meshUtil/dgMeshEffect5.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/meshUtil/dgMeshEffect6.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dMath/dLinearAlgebra.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dMath/dMathDefines.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dMath/dMatrix.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dMath/dQuaternion.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dMath/dStdAfxMath.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dMath/dVector.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/Custom6DOF.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomAlloc.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomArcticulatedTransformManager.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomBallAndSocket.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomControllerManager.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomCorkScrew.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomDryRollingFriction.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomGear.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomHinge.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomHingeActuator.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomInputManager.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomJoint.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomJointLibraryStdAfx.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomKinematicController.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomPathFollow.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomPlayerControllerManager.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomPulley.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomRackAndPinion.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomSlider.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomSliderActuator.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomSlidingContact.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomTriggerManager.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomUniversal.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomUniversalActuator.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomUpVector.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomUserBlank.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomVehicleControllerBodyState.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomVehicleControllerComponent.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomVehicleControllerJoint.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dCustomJoints/CustomVehicleControllerManager.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dBaseHierarchy.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dClassInfo.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dContainersAlloc.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dContainersStdAfx.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dCRC.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dRefCounter.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dString.cpp \
    sourceCode/dynamics/newton/newton-dynamics-newton-3.14/packages/dContainers/dTree.cpp \

win32 {
    SOURCES += sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/pthreads.2/pthread.c \
        sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/ampPhysics/dgAMP.cpp \
        sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/ampPhysics/dgAmpSolver.cpp \
        sourceCode/dynamics/newton/newton-dynamics-newton-3.14/coreLibrary_300/source/ampPhysics/dgAmpInstance.cpp
}

