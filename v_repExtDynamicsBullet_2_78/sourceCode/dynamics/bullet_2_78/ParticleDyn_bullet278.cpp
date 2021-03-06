#include "ParticleDyn_bullet278.h"
#include "RigidBodyContainerDyn_bullet278.h"
#include "v_repLib.h"

CParticleDyn_bullet278::CParticleDyn_bullet278(const C3Vector& position,const C3Vector& velocity,int objType,float size,float massOverVolume,float killTime,float addColor[3]) : CParticleDyn(position,velocity,objType,size,massOverVolume,killTime,addColor)
{
}

CParticleDyn_bullet278::~CParticleDyn_bullet278()
{
}

bool CParticleDyn_bullet278::addToEngineIfNeeded(float parameters[18],int objectID)
{
    if (_initializationState!=0)
        return(_initializationState==1);
    _initializationState=1;

    CRigidBodyContainerDyn_bullet278* rbc=(CRigidBodyContainerDyn_bullet278*)(CRigidBodyContainerDyn::currentRigidBodyContainerDynObject);
    btDiscreteDynamicsWorld* bulletWorld=rbc->getWorld();

    float linScaling=CRigidBodyContainerDyn::getPositionScalingFactorDyn();
    float massScaling=CRigidBodyContainerDyn::getMassScalingFactorDyn();
    float masslessInertiaScaling=CRigidBodyContainerDyn::getMasslessInertiaScalingFactorDyn();
    float velScaling=CRigidBodyContainerDyn::getLinearVelocityScalingFactorDyn();

    _collShape=new btSphereShape(_size*linScaling/2.0f); // ********** SCALING

    float mass=_massOverVolume*(4.0f*piValue*(_size*0.5f)*(_size*0.5f)*(_size*0.5f)/3.0f)*massScaling; // ********** SCALING

    btVector3 localInertia(0,0,0);
    float I=2.0f*(_size*0.5f)*(_size*0.5f)/5.0f;
    C3Vector im(I,I,I);
    im*=masslessInertiaScaling; // ********** SCALING
    localInertia.setX(im(0)*mass);
    localInertia.setY(im(1)*mass);
    localInertia.setZ(im(2)*mass);

    C4Vector q;
    q.setIdentity();
    btDefaultMotionState* myMotionState = new btDefaultMotionState(btTransform(btQuaternion(q(1),q(2),q(3),q(0)),btVector3(_currentPosition(0)*linScaling,_currentPosition(1)*linScaling,_currentPosition(2)*linScaling))); // ********** SCALING
    btRigidBody::btRigidBodyConstructionInfo rbInfo(mass,myMotionState,_collShape,localInertia);
    _rigidBody = new btRigidBody(rbInfo);

    _rigidBody->setUserPointer((void*)(CRigidBodyContainerDyn::getDynamicParticlesIdStart()+objectID)); // CRigidBodyContainerDyn::getDynamicParticlesIdStart() is the offset so we don't mix-up with regular shapes

    _rigidBody->setRestitution(parameters[1]);
    _rigidBody->setFriction(parameters[0]);

    if ((_objectType&(sim_particle_respondable1to4+sim_particle_respondable5to8+sim_particle_particlerespondable))==0)
        _rigidBody->setCollisionFlags(_rigidBody->getCollisionFlags()|btCollisionObject::CF_NO_CONTACT_RESPONSE);

    bulletWorld->addRigidBody(_rigidBody);
    _rigidBody->setLinearVelocity(btVector3(_initialVelocityVector(0)*velScaling,_initialVelocityVector(1)*velScaling,_initialVelocityVector(2)*velScaling)); // ********** SCALING
    return(true);
}

void CParticleDyn_bullet278::handleAntiGravityForces_andFluidFrictionForces(const C3Vector& gravity,float linearFluidFrictionCoeff,float quadraticFluidFrictionCoeff,float linearAirFrictionCoeff,float quadraticAirFrictionCoeff)
{
    bool isWaterButInAir=false;
    if ( (_objectType&sim_particle_ignoresgravity)||(_objectType&sim_particle_water) )
    {
        float mass=_massOverVolume*((piValue*_size*_size*_size)/6.0f)*CRigidBodyContainerDyn::getMassScalingFactorDyn(); // ********** SCALING
        C3Vector f=gravity*-mass*CRigidBodyContainerDyn::getGravityScalingFactorDyn(); // ********** SCALING
        bool reallyIgnoreGravity=true;
        if (_objectType&sim_particle_water)
        { // We ignore gravity only if we are in the water (z<0) (New since 27/6/2011):
            float ps=CRigidBodyContainerDyn::getPositionScalingFactorDyn(); // ********** SCALING
            if (_rigidBody->getWorldTransform().getOrigin().getZ()/ps>=0.0f) // ********** SCALING (not really needed here!)
            {
                reallyIgnoreGravity=false;
                isWaterButInAir=true;
            }
        }

        if (reallyIgnoreGravity)
        {

            btVector3 ff;
            ff.setX(f(0));
            ff.setY(f(1));
            ff.setZ(f(2));
            _rigidBody->applyCentralForce(ff);
        }
    }
    if ((linearFluidFrictionCoeff!=0.0f)||(quadraticFluidFrictionCoeff!=0.0f)||(linearAirFrictionCoeff!=0.0f)||(quadraticAirFrictionCoeff!=0.0f))
    { // New since 27/6/2011
        float lfc=linearFluidFrictionCoeff;
        float qfc=quadraticFluidFrictionCoeff;
        if (isWaterButInAir)
        {
            lfc=linearAirFrictionCoeff;
            qfc=quadraticAirFrictionCoeff;
        }
        C3Vector vVect;

        btVector3 btlv(_rigidBody->getLinearVelocity());
        vVect.set(btlv.getX(),btlv.getY(),btlv.getZ());

        float v=vVect.getLength();
        if (v!=0.0f)
        {
            float vs=CRigidBodyContainerDyn::getLinearVelocityScalingFactorDyn(); // ********** SCALING
            float fs=CRigidBodyContainerDyn::getForceScalingFactorDyn(); // ********** SCALING
            v/=vs; // ********** SCALING
            C3Vector nv(vVect.getNormalized()*-1.0f);
            C3Vector f(nv*(v*lfc+v*v*qfc));
            f*=fs; // ********** SCALING

            btVector3 ff(f(0),f(1),f(2));
            _rigidBody->applyCentralForce(ff);
        }
    }
}

void CParticleDyn_bullet278::removeFromEngine()
{
    if (_initializationState==1)
    {
        delete _collShape;
        CRigidBodyContainerDyn_bullet278* rbc=(CRigidBodyContainerDyn_bullet278*)(CRigidBodyContainerDyn::currentRigidBodyContainerDynObject);
        rbc->getWorld()->removeCollisionObject(_rigidBody);

        if (_rigidBody->getMotionState()!=NULL)
            delete _rigidBody->getMotionState();
        delete _rigidBody;
        _initializationState=2;
    }
}

void CParticleDyn_bullet278::updatePosition()
{
    if (_initializationState==1)
    {
        float linScaling=CRigidBodyContainerDyn::getPositionScalingFactorDyn(); 

        btTransform wt;
        btMotionState* ms=_rigidBody->getMotionState();
        if (ms!=NULL)
            ms->getWorldTransform(wt);
        else
            wt=_rigidBody->getWorldTransform();
        btVector3 wtx(wt.getOrigin());
        _currentPosition(0)=wtx.getX()/linScaling; // ********** SCALING
        _currentPosition(1)=wtx.getY()/linScaling; // ********** SCALING
        _currentPosition(2)=wtx.getZ()/linScaling; // ********** SCALING
    }
}
