set stop to false.
set reference to ship:facing.
until stop = true {
   clearscreen.
   print(ship:facing - reference)at(0,0).
   print(ship:facing:Roll)at(0,1).
   print(ship:facing:Pitch)at(0,2).
   print(ship:prograde)at(0,2).
   wait 0.
}