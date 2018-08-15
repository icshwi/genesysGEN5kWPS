require stream,2.7.11
require iocStats,1856ef5


epicsEnvSet("TOP", "$(E3_CMD_TOP)/..")
epicsEnvSet("IOC", "iocgenesysGEN5kWPS")

epicsEnvSet("DB_TOP",      "$(TOP)/genesysGEN5kWPSApp/Db")
epicsEnvSet("ENV_CMD_TOP", "$(TOP)/iocBoot/$(IOC)")

epicsEnvSet("STREAM_PROTOCOL_PATH", ".:$(DB_TOP)")

epicsEnvSet(P, GEM5kWPS)
epicsEnvSet(R, RFLab)

epicsEnvSet("IOCST", "$(P)-$(R):IocStats")
dbLoadRecords("iocAdminSoft.db",  "IOC=${IOCST}")


< $(ENV_CMD_TOP)/GEN300-17-env.cmd

epicsEnvSet("TS2MOXA01", "172.16.110.20")

epicsEnvSet("PORT1", "4001")
drvAsynIPPortConfigure("$(PORT1)","$(TS2MOXA01):$(PORT1)",0,0,0)
asynOctetSetInputEos($(PORT1),  0, "\r")
asynOctetSetOutputEos($(PORT1), 0, "\r")
dbLoadRecords("$(DB_TOP)/genesysGEN5kWPS.db", "P=$(P)-$(R):GEN5kWPS:,PORT=$(PORT1),OVPMIN=$(OVPMIN),OVPMAX=$(OVPMAX),UVLMIN=$(UVLMIN),UVLMAX=$(UVLMAX),VMIN=$(VMIN),VMAX=$(VMAX),CMIN=$(CMIN),CMAX=$(CMAX)")


epicsEnvSet("PORT2", "4002")
drvAsynIPPortConfigure("$(PORT2)","$(TS2MOXA01):$(PORT2)",0,0,0)
asynOctetSetInputEos($(PORT2),  0, "\r")
asynOctetSetOutputEos($(PORT2), 0, "\r")
dbLoadRecords("$(DB_TOP)/genesysGEN5kWPS.db", "P=$(P)-$(R):GEN5kWPS:,PORT=$(PORT2),OVPMIN=$(OVPMIN),OVPMAX=$(OVPMAX),UVLMIN=$(UVLMIN),UVLMAX=$(UVLMAX),VMIN=$(VMIN),VMAX=$(VMAX),CMIN=$(CMIN),CMAX=$(CMAX)")


epicsEnvSet("PORT3", "4003")
drvAsynIPPortConfigure("$(PORT3)","$(TS2MOXA01):$(PORT3)",0,0,0)
asynOctetSetInputEos($(PORT3),  0, "\r")
asynOctetSetOutputEos($(PORT3), 0, "\r")
dbLoadRecords("$(DB_TOP)/genesysGEN5kWPS.db", "P=$(P)-$(R):GEN5kWPS:,PORT=$(PORT3),OVPMIN=$(OVPMIN),OVPMAX=$(OVPMAX),UVLMIN=$(UVLMIN),UVLMAX=$(UVLMAX),VMIN=$(VMIN),VMAX=$(VMAX),CMIN=$(CMIN),CMAX=$(CMAX)")


iocInit

dbl > "$(TOP)/$(IOC)_PVs.list"

