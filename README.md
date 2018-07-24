# TDK-Lambda Genesys GEN300 5kW Power Supply

[![Build Status](https://travis-ci.org/icshwi/genesysGEN5kWPS.svg?branch=master)](https://travis-ci.org/icshwi/genesysGEN5kWPS)

## EPICS IOC

* Start IOC

```
$ ./st.cmd 
#!../../bin/linux-x86_64/genesysGEN5kWPS
< envPaths
epicsEnvSet("IOC","iocgenesysGEN5kWPS")
epicsEnvSet("TOP","/home/jhlee/epics_env/epics-Apps/genesysGEN5kWPS")
epicsEnvSet("STREAM_PROTOCOL_PATH", ".:/home/jhlee/epics_env/epics-Apps/genesysGEN5kWPS/db")
epicsEnvSet(P, GEM5kWPS)
epicsEnvSet(R, RFLab)
epicsEnvSet("IOCST", "GEM5kWPS-RFLab:IocStats")
cd "/home/jhlee/epics_env/epics-Apps/genesysGEN5kWPS"
## Register all support components
dbLoadDatabase "dbd/genesysGEN5kWPS.dbd"
genesysGEN5kWPS_registerRecordDeviceDriver pdbbase
# ADR is followed by address which can be 0 to 30 and is used to access the power supply
# However, we uses one-to-one through MOXA, so we don't need that parameter.
epicsEnvSet("ADR", "6")
epicsEnvSet("PORT", "GEN3006")
drvAsynIPPortConfigure("GEN3006","10.0.5.117:4001",0,0,0)
# <0x0d> \r
# <0x0a> \n
asynOctetSetInputEos(GEN3006, 0, "\r")
asynOctetSetOutputEos(GEN3006, 0, "\r")
dbLoadRecords("db/iocAdminSoft.db",  "IOC=GEM5kWPS-RFLab:IocStats")
dbLoadRecords("db/genesysGEN5kWPS.db", "P=GEM5kWPS-RFLab:GEN5kWPS:,PORT=GEN3006")
dbLoadRecords("db/stream_raw.db", "P=GEM5kWPS-RFLab:,PORT=GEN3006")
cd "/home/jhlee/epics_env/epics-Apps/genesysGEN5kWPS/iocBoot/iocgenesysGEN5kWPS"
iocInit
Starting iocInit
############################################################################
## EPICS R3.16.1
## EPICS Base built Jun 26 2018
############################################################################
iocRun: All initialization complete
dbl > "/home/jhlee/epics_env/epics-Apps/genesysGEN5kWPS/iocgenesysGEN5kWPS_PVs.list"

```

One can check its PVs through tools/caget_pvs.bash with *_PVs.list


```
$ bash tools/caget_pvs.bash iocgenesysGEN5kWPS_PVs.list "GEN"
>> Unset ... EPICS_CA_ADDR_LIST and EPICS_CA_AUTO_ADDR_LIST
Set ... EPICS_CA_ADDR_LIST and EPICS_CA_AUTO_ADDR_LIST 
>> Print ... 
EPICS_CA_ADDR_LIST      : 10.0.6.172
EPICS_CA_AUTO_ADDR_LIST : YES
>> Get PVs .... 


GEM5kWPS-RFLab:GEN5kWPS:SR-RB_ 4
GEM5kWPS-RFLab:GEN5kWPS:FR-RB_ 0
GEM5kWPS-RFLab:GEN5kWPS:SR-sts_ 4
GEM5kWPS-RFLab:GEN5kWPS:FR-sts_ 0
GEM5kWPS-RFLab:GEN5kWPS:InfoUpdate-Cmd Revert
GEM5kWPS-RFLab:GEN5kWPS:SR-BIT-STS 4
GEM5kWPS-RFLab:GEN5kWPS:FR-BIT-STS 0
GEM5kWPS-RFLab:GEN5kWPS:InfoUpdate:1-Fout_ 0
GEM5kWPS-RFLab:GEN5kWPS:RMT_SET Remote
GEM5kWPS-RFLab:GEN5kWPS:RMT_RB_ 1
GEM5kWPS-RFLab:GEN5kWPS:MV-RB  0.2
GEM5kWPS-RFLab:GEN5kWPS:PV-RB  0
GEM5kWPS-RFLab:GEN5kWPS:MC-RB  0
GEM5kWPS-RFLab:GEN5kWPS:PC-RB  0
GEM5kWPS-RFLab:GEN5kWPS:MODEL-RB GEN300-17
GEM5kWPS-RFLab:GEN5kWPS:SN-RB  854A134-0001
GEM5kWPS-RFLab:GEN5kWPS:SWVersion-RB 2U5K:5.1.1
GEM5kWPS-RFLab:GEN5kWPS:Date-RB 2018/04/04
GEM5kWPS-RFLab:GEN5kWPS:RMT_SET_RB_ 
GEM5kWPS-RFLab:GEN5kWPS:SR-BIT-DESC CV:Constant Voltage
GEM5kWPS-RFLab:GEN5kWPS:FR-BIT-DESC Spare
GEM5kWPS-RFLab:GEN5kWPS:RMT_RB Remote

```
