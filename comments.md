## PS Color Codes

```
VOLTAGE indicator : Green (Constant Voltage Operation)
Current indicator : Green (Constant Current Operation)
Out     indicator : Green (DC output enabled)
REM     indicator : Green (REM enabled) 
FOLD    indicator : Green (Fold enabled)

ALARM  : RED fault detection (OVP, OTP, Foldback, Enable, and ac fail) 
         

Output OFF/ON : 

if  OVP or FOLD == 1
     RESET
fi
Output ON
```

## SRQ 
Saw the SRQ event from time to time. If the SCAN PV doesn't exist in the similar time windows when "PV", which makes the SRQ is executed. However, it actaully replaces the original return value of that PV. So it is better to disable SENA 00, and read STAT? and FLT? with SCAN period.


	
