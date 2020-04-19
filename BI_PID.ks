set PID to PIDLOOP(0.1).

set pid:MaxOutput to 0.
set pid:minOutput to 1.

set input to 0.
set output to 0.

set oldSpeed to 0.

// Sets up the GUI button 
local gui is gui(250).
set gui:x to 500.
set gui:y to 180.
local label is gui:addlabel("Stop Controller").
set label:style:align to "center".
set label:style:hstretch to true.
local ok to gui:addbutton("Stop").
gui:show().
set ok:onclick to Click@.
set stop to false.

until stop = true {
   set input to calcInput().
   set output to pid:update(time:seconds, input).
   set throttle to output.
   
   printData().
}

function calcInput {
   set adjTrhust to SHIP:AVAILABLETHRUST * output.
   set speed to verticalspeed + groundspeed.
   set acc to (speed - oldSpeed) / 10.
   set output to (acc * adjTrhust) * 0.1.
   wait 0.
   set oldSpeed to speed.
   return output.
}

function Click {
   set stop to true.
   clearguis().
   exit().
}

function exit {
   SET SHIP:CONTROL:PILOTMAINTHROTTLE TO 0.
   set output to 0.
   SET SHIP:CONTROL:NEUTRALIZE TO TRUE.
}

function printData {
   clearscreen.
   print("input   " + input).
   print("output  " + output).
}
