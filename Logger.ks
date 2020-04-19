parameter fileName.

set MISSIONTIME to time.
clearscreen.

set lastWrite to 0.
set memoryStorage to lexicon().
set memoryStorage_2 to list().
set stop to false.
set loggedpass to false.
set rootPath to "0:/logs".
set logFileName to fileName + ".txt".
set valueNames to "".

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

until stop = true {
   createList().
   
   printData().
   
   wait 0.
}

function createList {
   set temp to List().
   
   // ONLY WORKS IF THE SCIENCE SENSORS ARE ON BOARD.
   //temp:add(SHIP:SENSORS:GRAV:Z).
   //temp:add(SHIP:SENSORS:ACC:Z).
   
   temp:add(ALTITUDE).
   temp:add(VERTICALSPEED).
   temp:add(GROUNDSPEED).
   temp:add(SHIP:CONTROL:PILOTYAW).
   temp:add(SHIP:CONTROL:PILOTPITCH).
   temp:add(SHIP:CONTROL:PILOTMAINTHROTTLE).
   temp:add(HEADING).
   temp:add(APOAPSIS).
   temp:add(PERIAPSIS).
   temp:add(SHIP:Q).
   temp:add(AVAILABLETHRUST).
   temp:add(STAGE:NUMBER).
   
   saveData(temp).
}

function printData {
   clearscreen.
   
   // ONLY WORKS IF THE SCIENCE SENSORS ARE ON BOARD.
   //print(SHIP:SENSORS:GRAV:Z).
   //print(SHIP:SENSORS:ACC:Z).
   
   print(ALTITUDE).
   print(VERTICALSPEED).
   print(GROUNDSPEED).
   print(SHIP:CONTROL:PILOTYAW).
   print(SHIP:CONTROL:PILOTPITCH).
   print(SHIP:CONTROL:PILOTMAINTHROTTLE).
   print(HEADING).
   print(APOAPSIS).
   print(PERIAPSIS).
   print(SHIP:Q).
   print(AVAILABLETHRUST).
   print(STAGE:NUMBER).
   print("").
}

function saveData {
   parameter dataLine.
   
   //set valueNames to "GRAVITY,ACCELERATION,ALTITUDE,VERTICALSPEED,GROUNDSPEED,ANGULARVEL_X,ANGULARVEL_Y,ANGULARVEL_Z,HEADING,APOAPSIS,PERIAPSIS,DYNAMICPRESS,AVAILABLETHRUST,STAGE".
   set valueNames to "ALTITUDE,VERTICALSPEED,GROUNDSPEED,PILOTYAW,PILOTPITCH,THROTTLE,HEADING,APOAPSIS,PERIAPSIS,DYNAMICPRESS,AVAILABLETHRUST,STAGE".
   set line to "".
   for data in dataLine {
      set line to line + data + ",".
   }
   set line to line + " nl ".
   memoryStorage_2:add(line).
}

function Click {
   set stop to true.
   clearguis().
   set data to writeLogs_2().
   print("").
   print(data).
   saveLogs(data).
}

function writeLogs {
   print("Writing Log...").
   set output to "".
   set line to "".
   
   for k in memoryStorage:keys {
      set output to output + k + ",".
   }
   
   set output to output + "\n".
   
   for m in memoryStorage:values {
      for d in m {
         set line to line + "," + d.
      }
      
      set output to output + line + "\n".
   }
   return output.
}

function writeLogs_2 {
   set output to valueNames + ", nl ".
   
   for d in memoryStorage_2 {
      set output to output + d.
   }
   
   return output.
}

function saveLogs {
   parameter data.
   set root to path(rootPath).
   set savePath to root:combine(logFileName).
   set logFile to create(savePath).
   set success to logFile:write(data).
   
   if success = true {
      print("save success...").
   } else {
      print("save failed...").
   }
}