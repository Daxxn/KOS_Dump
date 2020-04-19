set log to list().
set prevTime to 0.
set waitTime to 0.
set MISSIONTIME to time.
set stop to false.

// Sets up the GUI button
local gui is gui(250).
set gui:x to 500.
set gui:y to 180.
local label is gui:addlabel("Stop Logging").
set label:style:align to "center".
set label:style:hstretch to true.
local ok to gui:addbutton("Stop").

gui:show().
set ok:onclick to Click@.

function Main {
   // NOT COMPLETE!!!
   until stop = true {
      if status = "PRELAUNCH" {
         set waitTime to 60.
         print("Awaiting launch.").
      }
      else if status = "FLYING" {
         set waitTime to 0.
         print("Flying").
      }
      else if status = "SUB_ORBITAL" {
         set waitTime to 0.
         print("Sub orbital").
      }
      else if status = "ORBITING" {
         set waitTime to 5.
         print("Orbiting").
      }
   }
}

function logger {
   // log
   wait waitTime.
}

function createList {
   set temp to List().
   
   // ONLY WORKS IF THE SCIENCE SENSORS ARE ON BOARD.
   temp:add(SHIP:SENSORS:GRAV:Z).
   temp:add(SHIP:SENSORS:ACC:Z).
   
   temp:add(ALTITUDE).
   temp:add(VERTICALSPEED).
   temp:add(GROUNDSPEED).
   temp:add(ANGULARVEL:X).
   temp:add(ANGULARVEL:Y).
   temp:add(ANGULARVEL:Z).
   temp:add(HEADING).
   temp:add(APOAPSIS).
   temp:add(PERIAPSIS).
   temp:add(SHIP:Q).
   temp:add(STAGE:NUMBER).
   
   saveData(temp).
}

function printData {
   clearscreen.
   
   // ONLY WORKS IF THE SCIENCE SENSORS ARE ON BOARD.
   print(SHIP:SENSORS:GRAV:Z).
   print(SHIP:SENSORS:ACC:Z).
   
   print(ALTITUDE).
   print(VERTICALSPEED).
   print(GROUNDSPEED).
   print(ANGULARVEL:X).
   print(ANGULARVEL:Y).
   print(ANGULARVEL:Z).
   print(HEADING).
   print(APOAPSIS).
   print(PERIAPSIS).
   print(SHIP:Q).
   print(STAGE:NUMBER).
   print("").
}

function Click {
   set stop to true.
   clearguis().
   set data to writeLogs_2().
   print("").
   print(data).
   saveLogs(data).
}