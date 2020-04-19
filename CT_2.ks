set apoScale to 10^6.
set targetApo to 100000.
set oldSpeed to 0.
set stop to false.

set PIDOut to 0.
set apoOut to 0.
set both to 0.

//set apoGain to 0.00001.
set apoGain to 0.00001.
set qGain to 1.8.
set accGain to 0.2.

until stop = true {
   set PIDOut to PIDcalcInput().
   set apoOut to adjustApo().
   set both to PIDOut + apoOut.
   clearscreen.
   print("PIDcalcInput")at(0,0).
   print(PIDcalcInput())at(14,0).
   print("adjustApo")at(0,1).
   print(adjustApo())at(14,1).
   print("total")at(0,2).
   print(both)at(14,2).
   wait 0.
}

function adjustApo {
   //return (APOAPSIS / apoScale) * -1.
   //set apoPow to APOAPSIS^0.1.
   //return tan((APOAPSIS - targetApo) * apoGain + 1) * constant:pi / 180 * 1.8.
   return (APOAPSIS^1.8 - targetApo) * apoGain * 0.0001.
}

function PIDcalcInput {
   set adjTrhust to SHIP:AVAILABLETHRUST * 0.1.
   set speed to verticalspeed + groundspeed.
   set acc to (speed - oldSpeed) * accGain.
   set output to (acc * adjTrhust) * 0.1.
   wait 0.
   set oldSpeed to speed.
   return output * (ship:Q * qGain).
   //return acc.
}