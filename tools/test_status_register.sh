caget GEM5kWPS-RFLab:GEN5kWPS:ACK_MSG_RB
caput GEM5kWPS-RFLab:GEN5kWPS:RMT_SP Local
caget GEM5kWPS-RFLab:GEN5kWPS:ACK_MSG_RB
bash tools/caget_pvs.bash iocgenesysGEN5kWPS_PVs.list "StatusRegister"
for i in `seq 0 7`; do caget GEM5kWPS-RFLab:GEN5kWPS:StatusRegister-BIT-RB.B$i; done
for i in `seq 0 7`; do caget GEM5kWPS-RFLab:GEN5kWPS:StatusEventRegister-BIT-RB.B$i; done


printf "\n\n\n\n\n"
caget GEM5kWPS-RFLab:GEN5kWPS:ACK_MSG_RB
caput GEM5kWPS-RFLab:GEN5kWPS:RMT_SP Local
caget GEM5kWPS-RFLab:GEN5kWPS:ACK_MSG_RB
bash tools/caget_pvs.bash iocgenesysGEN5kWPS_PVs.list "StatusRegister"
for i in `seq 0 7`; do caget GEM5kWPS-RFLab:GEN5kWPS:StatusRegister-BIT-RB.B$i; done
for i in `seq 0 7`; do caget GEM5kWPS-RFLab:GEN5kWPS:StatusEventRegister-BIT-RB.B$i; done
caput GEM5kWPS-RFLab:GEN5kWPS:UpdateEvents.PROC 1
for i in `seq 0 7`; do caget GEM5kWPS-RFLab:GEN5kWPS:StatusEventRegister-BIT-RB.B$i; done


printf "\n\n\n\n\n"
caget GEM5kWPS-RFLab:GEN5kWPS:ACK_MSG_RB
caput GEM5kWPS-RFLab:GEN5kWPS:RMT_SP Remote
caget GEM5kWPS-RFLab:GEN5kWPS:ACK_MSG_RB
bash tools/caget_pvs.bash iocgenesysGEN5kWPS_PVs.list "StatusRegister"
for i in `seq 0 7`; do caget GEM5kWPS-RFLab:GEN5kWPS:StatusRegister-BIT-RB.B$i; done
for i in `seq 0 7`; do caget GEM5kWPS-RFLab:GEN5kWPS:StatusEventRegister-BIT-RB.B$i; done
caput GEM5kWPS-RFLab:GEN5kWPS:UpdateEvents.PROC 1 

for i in `seq 0 7`; do caget GEM5kWPS-RFLab:GEN5kWPS:StatusEventRegister-BIT-RB.B$i; done
