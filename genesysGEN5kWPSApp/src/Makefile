TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = genesysGEN5kWPS
# genesysGEN5kWPS.dbd will be created and installed
DBD += genesysGEN5kWPS.dbd

# genesysGEN5kWPS.dbd will be made up from these files:
genesysGEN5kWPS_DBD += base.dbd
genesysGEN5kWPS_DBD += devIocStats.dbd
genesysGEN5kWPS_DBD += stream.dbd
genesysGEN5kWPS_DBD += asyn.dbd
genesysGEN5kWPS_DBD += drvAsynSerialPort.dbd
genesysGEN5kWPS_DBD += drvAsynIPPort.dbd

genesysGEN5kWPS_LIBS += stream asyn
genesysGEN5kWPS_LIBS += devIocStats


genesysGEN5kWPS_SRCS += genesysGEN5kWPS_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
genesysGEN5kWPS_SRCS_DEFAULT += genesysGEN5kWPSMain.cpp
genesysGEN5kWPS_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#genesysGEN5kWPS_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
genesysGEN5kWPS_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

