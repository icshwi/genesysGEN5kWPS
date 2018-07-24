# TDK-Lambda Genesys GEN300

[![Build Status](https://travis-ci.org/icshwi/fimscb.svg?branch=master)](https://travis-ci.org/icshwi/fimscb)


## EPICS IOC

* Start IOC

```

```

One can check its PVs through tools/caget_pvs.bash with iocfimscb_PVs.list


```
$ genesysGEN5kWPS$ bash tools/caget_pvs.bash iocgenesysGEN5kWPS_PVs.list 
>> Unset ... EPICS_CA_ADDR_LIST and EPICS_CA_AUTO_ADDR_LIST
Set ... EPICS_CA_ADDR_LIST and EPICS_CA_AUTO_ADDR_LIST 
>> Print ... 
EPICS_CA_ADDR_LIST      : 10.0.6.172
EPICS_CA_AUTO_ADDR_LIST : YES
>> Get PVs .... 


GEM5kWPS-RFLab:GEN5kWPS:MV-RB  0.2
GEM5kWPS-RFLab:GEN5kWPS:PV-RB  0
GEM5kWPS-RFLab:GEN5kWPS:MC-RB  0
GEM5kWPS-RFLab:GEN5kWPS:PC-RB  0
GEM5kWPS-RFLab:RAW_CMD         
GEM5kWPS-RFLab:RAW_QUERY       
GEM5kWPS-RFLab:GEN5kWPS:MODEL-RB GEN300-17
GEM5kWPS-RFLab:GEN5kWPS:SN-RB  854A134-0001
GEM5kWPS-RFLab:GEN5kWPS:SWVersion-RB 2U5K:5.1.1
GEM5kWPS-RFLab:GEN5kWPS:Date-RB 2018/04/04
GEM5kWPS-RFLab:RAW_REPLY       
GEM5kWPS-RFLab:GEN5kWPS:SR-sts_ 132
GEM5kWPS-RFLab:GEN5kWPS:FR-sts_ 0
GEM5kWPS-RFLab:GEN5kWPS:SR-BIT-DESC CV : Constant Voltage
GEM5kWPS-RFLab:GEN5kWPS:FR-BIT-DESC Spare
GEM5kWPS-RFLab:GEN5kWPS:SR-BIT-STS 132
GEM5kWPS-RFLab:GEN5kWPS:FR-BIT-STS 0
GEM5kWPS-RFLab:GEN5kWPS:InfoUpdate-Cmd Revert
GEM5kWPS-RFLab:GEN5kWPS:SR-rb_ 132
GEM5kWPS-RFLab:GEN5kWPS:FR-rb_ 0
GEM5kWPS-RFLab:GEN5kWPS:InfoUpdate:1-Fout_ 0

```
