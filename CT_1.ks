set calcOutput to 0.
set calcPast to 0.
set calcScale to 0.000000001.
set calcHist to list().
set oldSpeed to 0.

until false {
   set adjTrhust to SHIP:AVAILABLETHRUST * SHIP:CONTROL:PILOTMAINTHROTTLE.
   set speed to verticalspeed + groundspeed.
   set acc to (speed - oldSpeed) / 10.
   set output to (acc * adjTrhust) * 0.1.
   
   clearscreen.
   print("Calc Output  " + output).
   print("speed  " + speed).
   print("acc  " + acc).
   print("Adj Thrust  " + adjTrhust).
   print("ETA : APO  " + ETA:APOAPSIS).
   print("Velocity??  " + SHIP:VELOCITY:SURFACE:MAG).
   wait 0.
   set oldSpeed to speed.
}

function printOutput {
   parameter input.
   
   clearscreen.
   print(input).
}

function runCalc {
   parameter altitude.
   parameter gSpeed.
   
   //return (altitude ^ 5) * sin(gSpeed) * (10 ^ calcScale).
   return (sin(altitude ^ 0.1) * 180 * CONSTANT:PI) * calcScale.
}