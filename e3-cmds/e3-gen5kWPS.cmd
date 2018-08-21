
require stream,2.7.11
require iocStats,1856ef5

epicsEnvSet("TOP", "$(E3_CMD_TOP)/..")
epicsEnvSet("IOC", "iocgenesysGEN5kWPS")

epicsEnvSet("DB_TOP", "$(TOP)/genesysGEN5kWPSApp/Db")

epicsEnvSet("STREAM_PROTOCOL_PATH", ".:$(DB_TOP)")

epicsEnvSet("TS2MOXA01", "10.0.4.91")

epicsEnvSet(P, TS2-010RFC:)
epicsEnvSet(R, RFS-SOLPS-001:)


iocshLoad "$(E3_CMD_TOP)/iocStats.cmd" "IOC=$(P)$(R)IocStats"




iocshLoad "$(E3_CMD_TOP)/gen5kWPS_n.cmd" "MOXA_IP=$(TS2MOXA01),MOXA_PORT=4001,ADDR=6,PREFIX=$(P)$(R),DB_TOP=$(DB_TOP)"

iocInit

dbl > "$(TOP)/$(IOC)_PVs.list"

