# location of boost headers
BOOST_INCLUDEPATH = "c:/local/boost_1_62_0"
#BOOST_INCLUDEPATH = "/usr/local/include"
#BOOST_INCLUDEPATH = "/usr/include"
#BOOST_INCLUDEPATH = "c:/msys64/mingw64/include"

# location of bullet source tree (built with release target in build/Release)
BULLET_DIR = "e:/bullet3-2.83.7"
#BULLET_DIR = "../../../bullet3-2.83.7"

# location of bullet build directory
BULLET_BUILD_DIR = $${BULLET_DIR}/build/Release

# location of bullet include files
BULLET_INCLUDEPATH = $${BULLET_DIR}/src

# location of vortex
VORTEX_DIR = "c:/CM Labs/Vortex Studio 2017a"

# location of vortex include files
VORTEX_INCLUDEPATH = $${VORTEX_DIR}/include

# location of vortex libraries
VORTEX_LIBPATH = $${VORTEX_DIR}/lib

exists(../config.pri) { include(../config.pri) }

