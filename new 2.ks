//Booster Recovery.ks

Clearscreen.

sas off.
rcs off.
lights off.
lock throttle to 0.
gear off.

print "operating." at (0,5).

lock steering to mysteer.
lock mythr to throttle.

set mythr to 0.


if ship:atlitude < 75000 {
	set mysteer to ship:retrograde.
	}