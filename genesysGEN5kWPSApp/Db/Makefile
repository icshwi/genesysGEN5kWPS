TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
# Create and install (or just install) into <top>/db
# databases, templates, substitutions like this
#DB += xxx.db
DB += genesysGEN5kWPS.db
DB += stream_raw.db
DB_INSTALLS += $(TOP)/genesysGEN5kWPSApp/Db/genesysGEN5kWPS.proto
DB_INSTALLS += $(TOP)/genesysGEN5kWPSApp/Db/stream_raw.proto
DB_INSTALLS += $(devIocStats)/db/iocAdminSoft.db



#----------------------------------------------------
# If <anyname>.db template is not named <anyname>*.template add
# <anyname>_template = <templatename>

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

