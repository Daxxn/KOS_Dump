set targetAltitude to 80000.
set targetHorzSpeed to 2200.
set finalAngle to 90.

set currAltProp to 0.
set currHorzProp to 0.

set launchReference to SHIP:FACING.
set facingCalc to 0.

set stop to false.

function main {
   until stop = true {
      calcProportions().
      printData().
      
      wait 0.
   }
}

function printData {
   clearscreen.
   print("altitude")at(0,0).
   print(SHIP:ALTITUDE)at(20,0).
   print("Horz Speed")at(0,1).
   print(SHIP:GROUNDSPEED)at(20,1).
   
   print("Alt Prop")at(0,3).
   print(currAltProp)at(20,3).
   print("speed Prop")at(0,4).
   print(currHorzProp)at(20,4).
   
   print("Facing")at(0,6).
   print(facingCalc:PITCH)at(2,7).
   print(facingCalc:YAW)at(2,8).
   print(facingCalc:ROLL)at(2,9).
}

function calcProportions {
   set currAltProp to calcAltitudeProp().
   set currHorzProp to calcHorzSpeedProp().
   set facingCalc to calcFacingAngle().
}

function calcAltitudeProp {
   return SHIP:ALTITUDE / targetAltitude.
}

function calcHorzSpeedProp {
   return SHIP:GROUNDSPEED / targetHorzSpeed.
}

function calcFacingAngle {
// (Horz Heading, Vertical Heading, Rotation).
   return (SHIP:FACING - launchReference) * R(180,90,0).
}

main().