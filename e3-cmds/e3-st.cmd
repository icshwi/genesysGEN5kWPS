require stream,2.7.11
require iocStats,1856ef5


epicsEnvSet("TOP", "$(E3_CMD_TOP)/..")
epicsEnvSet("IOC","iocgenesysGEN5kWPS")
epicsEnvSet("DB_TOP", "$(TOP)/genesysGEN5kWPSApp/Db")
epicsEnvSet("STREAM_PROTOCOL_PATH", ".:$(DB_TOP)")

epicsEnvSet(P, GEM5kWPS)
epicsEnvSet(R, RFLab)

epicsEnvSet("IOCST", "$(P)-$(R):IocStats")

< $(TOP)/iocBoot/$(IOC)/GEN300-17-env.cmd

# ADR is followed by address which can be 0 to 30 and is used to access the power supply
# However, we uses one-to-one through MOXA, so we don't need that parameter.

epicsEnvSet("ADR", "6")
epicsEnvSet("PORT", "GEN300-ADR$(ADR)")

drvAsynIPPortConfigure("$(PORT)","10.0.4.99:4001",0,0,0)

# <0x0d> \r
# <0x0a> \n
asynOctetSetInputEos($(PORT), 0, "\r")
asynOctetSetOutputEos($(PORT), 0, "\r")

dbLoadRecords("iocAdminSoft.db",  "IOC=${IOCST}")
dbLoadRecords("$(DB_TOP)/genesysGEN5kWPS.db", "P=$(P)-$(R):GEN5kWPS:,PORT=$(PORT),OVPMIN=$(OVPMIN),OVPMAX=$(OVPMAX),UVLMIN=$(UVLMIN),UVLMAX=$(UVLMAX),VMIN=$(VMIN),VMAX=$(VMAX),CMIN=$(CMIN),CMAX=$(CMAX)")
dbLoadRecords("$(DB_TOP)/stream_raw.template", "P=$(P)-$(R):,PORT=$(PORT)")

iocInit

dbl > "$(TOP)/$(IOC)_PVs.list"

