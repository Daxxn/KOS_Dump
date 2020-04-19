set calcOutput to 0.
set calcPast to 0.
set calcScale to 0.000000001.
set calcHist to list().

until false {
   set output to SHIP:SENSORS:ACC * Q * AVAILABLETHRUST
   print(output).
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