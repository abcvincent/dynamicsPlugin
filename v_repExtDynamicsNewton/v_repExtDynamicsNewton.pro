# Tested with MSVC2015

#CONFIG += USE_THREAD_EMULATION # not recomended. Use only if you need to handle Newton contacts in a contact callback script
#CONFIG += DOUBLE_PRECISION # not yet supported

include(../common/v_repExtDynamics.pri)
include(v_repExtDynamicsNewton.pri)
