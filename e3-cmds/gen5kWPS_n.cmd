# iocshLoad "$(TOP)/gen5kWPS_n.cmd" "MOXA_IP=10.0.0.1,MOXA_PORT=4001,PREFIX=$(P)-$(R):GEN5kWPS:,DB_TOP=$(DB_TOP)"


# Table 7-3 : Voltage Programming Range
epicsEnvSet("_VMIN", "0.0")
epicsEnvSet("_VMAX", "300")

# Table 7-4 : Current Programming Range
epicsEnvSet("_CMIN", "0")
epicsEnvSet("_CMAX", "17")

# Table 7-5 : OVP Programming Range
epicsEnvSet("_OVPMIN", "5.0")
epicsEnvSet("_OVPMAX", "330")

# Table 7-6 : UVL Programming Range
epicsEnvSet("_UVLMIN", "0")
epicsEnvSet("_UVLMAX", "285")

epicsEnvSet("PORT$(MOXA_PORT)", "$(MOXA_PORT)")
drvAsynIPPortConfigure("PORT$(MOXA_PORT)","$(MOXA_IP):$(MOXA_PORT)",0,0,0)
asynOctetSetInputEos(PORT$(MOXA_PORT),  0, "\r")
asynOctetSetOutputEos(PORT$(MOXA_PORT), 0, "\r")
dbLoadRecords("$(DB_TOP)/genesysGEN5kWPS.db", "P=$(PREFIX),PORT=PORT$(MOXA_PORT),OVPMIN=$(_OVPMIN),OVPMAX=$(_OVPMAX),UVLMIN=$(_UVLMIN),UVLMAX=$(_UVLMAX),VMIN=$(_VMIN),VMAX=$(_VMAX),CMIN=$(_CMIN),CMAX=$(_CMAX)")


