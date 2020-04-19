// setup and gains :
set throtPgain to 0.
set throtIgain to 0.
set throtDgain to 0.

set attPgain to 0.
set attIgain to 0.
set attDgain to 0.

set throtPout to 0.
set throtIout to 0.
set throtDout to 0.

set attPout to 0.
set attIout to 0.
set attDout to 0.

set throtR to 0.
set throtE to 0.
set throtU to 0.
set throtY to 0.

set attR to 0.
set attE to 0.
set attU to 0.
set attY to 0.

set throtISum to 0.
set attISum to 0.

set throtEpast to 0.
set attEpast to 0.

function Comparator {
   parameter r, y.
   return r - y.
}

function Proportion {
   parameter e, pGain.
   return e * pGain.
}

function Integral {
   parameter e, iGain, iSum.
   set iSum to isum + e.
   return iSum * iGain.
}

// Instead lets use the slope?
function Dervative {
   parameter e, dGain, time.
   return der / (der * time) * e.
}

function Slope {
   parameter e, prevE, time, dGain.
   return (prevE - e) / ((time - 1) - time) * dGain.
}

function setup {
   
}

function main {
   
}