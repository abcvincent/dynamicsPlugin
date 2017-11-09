#ifndef V_REPEXTDYNAMICS_H
#define V_REPEXTDYNAMICS_H

#ifdef _WIN32
#define VREP_DLLEXPORT extern "C" __declspec(dllexport)
#endif /* _WIN32 */

#if defined (__linux) || defined (__APPLE__)
#define VREP_DLLEXPORT extern "C"
#endif /* __linux || __APPLE__ */

// The 3 required entry points of the plugin:
VREP_DLLEXPORT unsigned char v_repStart(void* reservedPointer,int reservedInt);
VREP_DLLEXPORT void v_repEnd();
VREP_DLLEXPORT void* v_repMessage(int message,int* auxiliaryData,void* customData,int* replyData);

VREP_DLLEXPORT char v_repDyn_startSimulation(int engine,int version,const float floatParams[20],const int intParams[20]);
VREP_DLLEXPORT void v_repDyn_endSimulation();
VREP_DLLEXPORT void v_repDyn_step(float timeStep,float simulationTime);
VREP_DLLEXPORT char v_repDyn_isDynamicContentAvailable();
VREP_DLLEXPORT void v_repDyn_serializeDynamicContent(const char* filenameAndPath,int bulletSerializationBuffer);
VREP_DLLEXPORT int v_repDyn_addParticleObject(int objectType,float size,float massOverVolume,const void* params,float lifeTime,int maxItemCount,const float* ambient,const float* diffuse,const float* specular,const float* emission);
VREP_DLLEXPORT char v_repDyn_removeParticleObject(int objectHandle);
VREP_DLLEXPORT char v_repDyn_addParticleObjectItem(int objectHandle,const float* itemData,float simulationTime);
VREP_DLLEXPORT int v_repDyn_getParticleObjectOtherFloatsPerItem(int objectHandle);
VREP_DLLEXPORT float* v_repDyn_getContactPoints(int* count);
VREP_DLLEXPORT void** v_repDyn_getParticles(int index,int* particlesCount,int* objectType,float** cols);
VREP_DLLEXPORT char v_repDyn_getParticleData(const void* particle,float* pos,float* size,int* objectType,float** additionalColor);
VREP_DLLEXPORT char v_repDyn_getContactForce(int dynamicPass,int objectHandle,int index,int objectHandles[2],float contactInfo[6]);
VREP_DLLEXPORT void v_repDyn_reportDynamicWorldConfiguration(int totalPassesCount,char doNotApplyJointIntrinsicPositions,float simulationTime);
VREP_DLLEXPORT int v_repDyn_getDynamicStepDivider();
VREP_DLLEXPORT int v_repDyn_getEngineInfo(int* engine,int* data1,char* data2,char* data3);
#endif // V_REPEXTDYNAMICS_H
