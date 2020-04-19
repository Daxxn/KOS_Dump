set stop to false.

set tankTag to "tank".
set tankAmount to 0.
set tankCap to 0.
set tankPerc to 0.
set drop to ag3.

function setup {
   set tank to SHIP:PARTSDUBBED(tankTag)[0].
   set tankCap to tank:resources[0]:capacity.
   checkTank().
}

function checkTank {
   set tankAmount to tank:resources[0]:amount.
   set tankPerc to tankAmount / tankCap.
   
   if tankPerc < 0.01 {
      dropTanks().
   }
}

function dropTanks {
   set ag3 to true.
}

function printData {
   clearscreen.
   print("Fuel Left In Tank :")at(0,0).
   print("Percent")at(0,1).
   print(tankPerc * 100)at(10,1).
}

function main {
   until stop = true {
      checkTank().
      printData().
      
      wait 0.
   }
}

setup().
main().