// Throttle Limiter for jets
set leftTag to "engL".
set rightTag to "engR".

set stop to false.
set thrustLimName to "Thrust Limiter".
set thrustName to "Thrust".
set adjOutput to "".

set throt to 0.

//set engLeft to SHIP:PARTSDUBBED("engL")[0].
set engLeft to List().
//set engRight to SHIP:PARTSDUBBED("engR")[0].
set engRight to List().
//set engModuleLeft to engLeft:getmodulebyindex(0).
set engModuleLeft to 0.
//set engModuleRight to engRight:getmodulebyindex(0).
set engModuleRight to 0.

//print(engModuleLeft).
// EngineLeft Data :
//set engModuleLeftLimit to engModuleLeft:getfield("Thrust Limiter").
//set engModuleLeftThrust to engModuleLeft:getField("thrust").

// Engine Right Data :
//set engModuleRightLimit to engModuleRight:getField("thrust limiter").
//set engModuleRightThrust to engModuleRight:getField("thrust").
//print(engModuleLeftLimit).
//engModuleLeft:setfield("Thrust Limiter", 100).


//The data :
//0 = set, fuelflow, single
//1 = set, thrust, single
//2 = set, specImp, single
//3 = set, status, string
//4 = set, throttle, bool
//5 = set, thrust limit, single
//6 = get, activate engine, KSPEvent
//7 = get, toggle eng, KSPEvent
//8 = get, shutdown eng, KSPEvent
//9 = get, activate eng, KSPEvent
//10 = get, toggle independent Throttle, KSPEvent

function setup {
   set throt to SHIP:CONTROL:PILOTMAINTHROTTLE.
   set engLeft to SHIP:PARTSDUBBED(leftTag)[0].
   set engRight to SHIP:PARTSDUBBED(rightTag)[0].
   set engModuleLeft to engLeft:getmodulebyindex(0).
   set engModuleRight to engRight:getmodulebyindex(0).
}

function main {
   until stop = true {
      getThrusts().
      set thrustSet to calcThrustDiff(engModuleLeftThrust, engModuleRightThrust, engModuleLeftLimit, engModuleRightLimit).
      engModuleLeft:setfield("Thrust Limiter", thrustSet[0]).
      engModuleRight:setfield("Thrust Limiter", thrustSet[1]).
      
      printData().
      wait 0.
   }
}

function getThrusts {
   // EngineLeft Data :
   set engModuleLeftLimit to engModuleLeft:getfield("Thrust Limiter").
   set engModuleLeftThrust to engModuleLeft:getField("thrust").
   
   // Engine Right Data :
   set engModuleRightLimit to engModuleRight:getField("thrust limiter").
   set engModuleRightThrust to engModuleRight:getField("thrust").
}

function calcThrustDiff {
   parameter left, right, leftLimit, rightLimit.
   set output to List().
   set leftOut to leftLimit.
   set rightOut to rightLimit.
   
   if right < left {
      if leftLimit > 0 {
         set leftOut to leftLimit - 0.5.
      }
      if rightLimit < 100 {
         set rightOut to rightLimit + 0.5.
      }
      set adjOutput to "Lowering".
   }
   else if right > left {
      if leftLimit < 100 {
         set leftOut to leftLimit + 0.5.
      }
      if rightLimit > 0 {
         set rightOut to rightLimit - 0.5.
      }
      set adjOutput to "Raising".
   }
   set output to List(leftOut, rightOut).
   return output.
}

function printData {
   clearscreen.
   print("LImiter Values")at(0,0).
   print("Left Limit:")at(0,1).
   print(engModuleLeftLimit)at(15,1).
   print("Right Limit:")at(0,2).
   print(engModuleRightLimit)at(15,2).
   
   print("Thrust Values")at(0,4).
   print("Left Thrust:")at(0,5).
   print(engModuleLeftThrust)at(15,5).
   print("Right Thrust:")at(0,6).
   print(engModuleRightThrust)at(15,6).
   print("calc Adjust:")at(0,7).
   print(adjOutput)at(15,7).
}

setup().

main().