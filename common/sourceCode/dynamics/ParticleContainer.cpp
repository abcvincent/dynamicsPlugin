#include "ParticleContainer.h"
#include "v_repLib.h"

CParticleContainer::CParticleContainer()
{
    
}

CParticleContainer::~CParticleContainer()
{
    removeAllObjects();
}

CParticleObject* CParticleContainer::getObject(int objectID,bool getAlsoTheOnesFlaggedForDestruction)
{
    if ( (objectID>=0)&&(objectID<int(_allObjects.size())) )
    {
        if (getAlsoTheOnesFlaggedForDestruction)
            return(_allObjects[objectID]);
        if (_allObjects[objectID]!=NULL)
        {
            if (_allObjects[objectID]->isFlaggedForDestruction())
                return(NULL);
            return(_allObjects[objectID]);
        }
        return(NULL);
    }
    return(NULL);
}

int CParticleContainer::addObject(CParticleObject* it)
{
    int newID=0;
    while (getObject(newID,true)!=NULL)
        newID++;
    it->setObjectID(newID);
    if (newID>=int(_allObjects.size()))
        _allObjects.push_back(NULL);
    _allObjects[newID]=it;
    if ((it->getLifeTime()<0.0f)&&(it->getSize()<-100.0f))
        return(131183);
    return(newID);
}

void CParticleContainer::removeAllObjects()
{
    for (int i=0;i<int(_allObjects.size());i++)
        delete _allObjects[i]; // Can be NULL!
    _allObjects.clear();
}

void CParticleContainer::removeObject(int objectID)
{ // objectID is the index
    if ( (objectID>=0)&&(objectID<int(_allObjects.size())) )
    {
        if (_allObjects[objectID]!=NULL)
        {
            if (!_allObjects[objectID]->isFlaggedForDestruction())
            {
                if (_allObjects[objectID]->canBeDestroyed())
                {
                    delete _allObjects[objectID];
                    _allObjects[objectID]=NULL;
                }
                else
                    _allObjects[objectID]->flagForDestruction();
            }
        }
    }
}

void** CParticleContainer::getParticles(int index,int* particlesCount,int* objectType,float** cols)
{
    if (index>=int(_allObjects.size()))
    {
        particlesCount[0]=-1;
        return(NULL);
    }
    if ( (_allObjects[index]!=NULL)&&(!_allObjects[index]->isFlaggedForDestruction()) )
        return(_allObjects[index]->getParticles(particlesCount,objectType,cols));
    particlesCount=0;
    return(NULL);
}

bool CParticleContainer::addParticlesIfNeeded()
{ // return value indicates if there are particles that need to be simulated
    bool particlesPresent=false;
    for (int i=0;i<int(_allObjects.size());i++)
    {
        if ( (_allObjects[i]!=NULL)&&(!_allObjects[i]->isFlaggedForDestruction()) )
            particlesPresent|=_allObjects[i]->addParticlesIfNeeded();
    }
    return(particlesPresent);
}

void CParticleContainer::handleAntiGravityForces_andFluidFrictionForces(const C3Vector& gravity)
{
    for (int i=0;i<int(_allObjects.size());i++)
    {
        if ( (_allObjects[i]!=NULL)&&(!_allObjects[i]->isFlaggedForDestruction()) )
            _allObjects[i]->handleAntiGravityForces_andFluidFrictionForces(gravity);
    }
}

void CParticleContainer::removeKilledParticles()
{ // beware, _allObjects[i] can be NULL!
    for (int i=0;i<int(_allObjects.size());i++)
    {
        if (_allObjects[i]!=NULL)
        {
            if (_allObjects[i]->isFlaggedForDestruction())
            {
                _allObjects[i]->removeAllParticles();
                delete _allObjects[i];
                _allObjects[i]=NULL;
            }
            else
                _allObjects[i]->removeKilledParticles();
        }
    }
}

void CParticleContainer::removeAllParticles()
{ // beware, _allObjects[i] can be NULL!
    for (int i=0;i<int(_allObjects.size());i++)
    {
        if (_allObjects[i]!=NULL)
        {
            if (_allObjects[i]->isFlaggedForDestruction())
            {
                _allObjects[i]->removeAllParticles();
                delete _allObjects[i];
                _allObjects[i]=NULL;
            }
            else
                _allObjects[i]->removeAllParticles();
        }
    }
}

void CParticleContainer::updateParticlesPosition(float simulationTime)
{
    for (int i=0;i<int(_allObjects.size());i++)
    {
        if ( (_allObjects[i]!=NULL)&&(!_allObjects[i]->isFlaggedForDestruction()) )
            _allObjects[i]->updateParticlesPosition(simulationTime);
    }
}



