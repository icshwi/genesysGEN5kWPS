
require stream,2.7.11
require iocStats,1856ef5

epicsEnvSet("TOP", "$(E3_CMD_TOP)/..")

epicsEnvSet("DB_TOP", "$(TOP)/genesysGEN5kWPSApp/Db")

epicsEnvSet("STREAM_PROTOCOL_PATH", ".:$(DB_TOP)")

epicsEnvSet("TS2MOXA01", "172.16.110.20")

epicsEnvSet(P, TS2-010RFC:)
epicsEnvSet(R, RFS-SOLPS)
epicsEnvSet(R1, $(R)-001:)
epicsEnvSet(R2, $(R)-002:)
epicsEnvSet(R3, $(R)-003:)
epicsEnvSet(IOC, $(P)$(R))

iocshLoad "$(E3_CMD_TOP)/iocStats.cmd" "IOC=$(IOC)-IocStats"


iocshLoad "$(E3_CMD_TOP)/gen5kWPS_n.cmd" "MOXA_IP=$(TS2MOXA01),MOXA_PORT=4001,ADDR=6,PREFIX=$(P)$(R1),DB_TOP=$(DB_TOP)"
iocshLoad "$(E3_CMD_TOP)/gen5kWPS_n.cmd" "MOXA_IP=$(TS2MOXA01),MOXA_PORT=4002,ADDR=6,PREFIX=$(P)$(R2),DB_TOP=$(DB_TOP)"
iocshLoad "$(E3_CMD_TOP)/gen5kWPS_n.cmd" "MOXA_IP=$(TS2MOXA01),MOXA_PORT=4003,ADDR=6,PREFIX=$(P)$(R3),DB_TOP=$(DB_TOP)"

iocInit

dbl > "$(TOP)/$(IOC)_PVs.list"

