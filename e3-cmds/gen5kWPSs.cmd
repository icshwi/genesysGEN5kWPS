
require stream,2.7.11
require iocStats,1856ef5

epicsEnvSet("TOP", "$(E3_CMD_TOP)/..")
epicsEnvSet("IOC", "iocgenesysGEN5kWPS")

epicsEnvSet("DB_TOP", "$(TOP)/genesysGEN5kWPSApp/Db")

epicsEnvSet("STREAM_PROTOCOL_PATH", ".:$(DB_TOP)")

epicsEnvSet("TS2MOXA01", "172.16.110.20")

iocshLoad "$(E3_CMD_TOP)/iocStats.cmd" "IOC=$(IOC):IocStats"


epicsEnvSet(P, TS2)
epicsEnvSet(R, RFLPS)

iocshLoad "$(E3_CMD_TOP)/gen5kWPS_n.cmd" "MOXA_IP=$(TS2MOXA01),MOXA_PORT=4001,ADDR=6,PREFIX=$(P)-$(R):GEN5kWPSTOP:,DB_TOP=$(DB_TOP)"
iocshLoad "$(E3_CMD_TOP)/gen5kWPS_n.cmd" "MOXA_IP=$(TS2MOXA01),MOXA_PORT=4002,ADDR=6,PREFIX=$(P)-$(R):GEN5kWPSMID:,DB_TOP=$(DB_TOP)"
iocshLoad "$(E3_CMD_TOP)/gen5kWPS_n.cmd" "MOXA_IP=$(TS2MOXA01),MOXA_PORT=4003,ADDR=6,PREFIX=$(P)-$(R):GEN5kWPSBOT:,DB_TOP=$(DB_TOP)"

iocInit

dbl > "$(TOP)/$(IOC)_PVs.list"

