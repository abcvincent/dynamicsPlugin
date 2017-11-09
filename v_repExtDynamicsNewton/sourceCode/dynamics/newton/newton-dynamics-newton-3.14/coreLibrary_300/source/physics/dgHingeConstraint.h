/* Copyright (c) <2003-2011> <Julio Jerez, Newton Game Dynamics>
* 
* This software is provided 'as-is', without any express or implied
* warranty. In no event will the authors be held liable for any damages
* arising from the use of this software.
* 
* Permission is granted to anyone to use this software for any purpose,
* including commercial applications, and to alter it and redistribute it
* freely, subject to the following restrictions:
* 
* 1. The origin of this software must not be misrepresented; you must not
* claim that you wrote the original software. If you use this software
* in a product, an acknowledgment in the product documentation would be
* appreciated but is not required.
* 
* 2. Altered source versions must be plainly marked as such, and must not be
* misrepresented as being the original software.
* 
* 3. This notice may not be removed or altered from any source distribution.
*/

#if !defined(AFX_DGHINGECONSTRAINT_H__3FF7D7AA_90CC_4BA5_B2A4_D3BA51AD2FFD_H)
#define AFX_DGHINGECONSTRAINT_H__3FF7D7AA_90CC_4BA5_B2A4_D3BA51AD2FFD_H
#include "dgBilateralConstraint.h"

//template<class T> class dgPool;

class dgHingeConstraint;


typedef dgUnsigned32 (dgApi *dgHingeJointAcceleration) (const dgHingeConstraint& hinge, dgJointCallbackParam* param);

class dgHingeConstraint: public dgBilateralConstraint
{
    public:
    dgFloat32 GetJointAngle () const;
    dgFloat32 GetJointOmega () const;
    dgVector GetJointForce () const;
    dgFloat32 CalculateStopAlpha (dgFloat32 angle, const dgJointCallbackParam* param) const;
    void SetJointParameterCallback (dgHingeJointAcceleration callback);

    private:
    virtual dgUnsigned32 JacobianDerivative (dgContraintDescritor& params); 
    virtual void Serialize (dgSerialize serializeCallback, void* const userData) {dgAssert (0);}

    dgHingeConstraint();
    virtual ~dgHingeConstraint();

    dgMatrix m_localMatrix0;
    dgMatrix m_localMatrix1;

    dgFloat32 m_angle;
    dgHingeJointAcceleration m_jointAccelFnt;


//#ifdef _NEWTON_USE_DOUBLE
//  dgUnsigned32 m_reserve[1];
//#else
//  dgUnsigned32 m_reserve[2];
//#endif

    friend class dgWorld;
//  friend class dgPool<dgHingeConstraint>;
};

//class dgHingeConstraintArray: public dgPoolContainer<dgHingeConstraint>
//{
//};


#endif // !defined(AFX_DGHINGECONSTRAINT_H__3FF7D7AA_90CC_4BA5_B2A4_D3BA51AD2FFD_H)

