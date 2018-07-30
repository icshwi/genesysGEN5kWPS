#!../../bin/linux-x86_64/genesysGEN5kWPS

#- You may have to change genesysGEN5kWPS to something else
#- everywhere it appears in this file

< envPaths


epicsEnvSet("STREAM_PROTOCOL_PATH", ".:${TOP}/db")

epicsEnvSet(P, GEM5kWPS)
epicsEnvSet(R, RFLab)

epicsEnvSet("IOCST", "$(P)-$(R):IocStats")

< $(TOP)/iocBoot/$(IOC)/GEN300-17-env.cmd

cd "$(TOP)"

## Register all support components
dbLoadDatabase "dbd/genesysGEN5kWPS.dbd"
genesysGEN5kWPS_registerRecordDeviceDriver pdbbase


# ADR is followed by address which can be 0 to 30 and is used to access the power supply
# However, we uses one-to-one through MOXA, so we don't need that parameter.

epicsEnvSet("ADR", "6")
epicsEnvSet("PORT", "GEN300-ADR$(ADR)")

drvAsynIPPortConfigure("$(PORT)","10.0.4.99:4001",0,0,0)

# <0x0d> \r
# <0x0a> \n
asynOctetSetInputEos($(PORT), 0, "\r")
asynOctetSetOutputEos($(PORT), 0, "\r")

dbLoadRecords("db/iocAdminSoft.db",  "IOC=${IOCST}")
dbLoadRecords("db/genesysGEN5kWPS.db", "P=$(P)-$(R):GEN5kWPS:,PORT=$(PORT),OVPMIN=$(OVPMIN),OVPMAX=$(OVPMAX),UVLMIN=$(UVLMIN),UVLMAX=$(UVLMAX),VMIN=$(VMIN),VMAX=$(VMAX),CMIN=$(CMIN),CMAX=$(CMAX)")
dbLoadRecords("db/stream_raw.db", "P=$(P)-$(R):,PORT=$(PORT)")

cd "${TOP}/iocBoot/${IOC}"

iocInit

dbl > "$(TOP)/$(IOC)_PVs.list"
