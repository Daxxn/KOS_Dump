//Booster Recovery.ks

Clearscreen.
set TVAL to 0.
sas off.
rcs off.
lights off.
gear off.
lock throttle to TVAL.

print "operating." at (0,2).

until ship:apoapsis < 5 {

	when ship:altitude <= 85000 then {
		lock steering to ship:retrograde.
		print "Pointing Retrograde." at(0,3).
		}
	when ship:altitude < 74000 then {
		set TVAL to 1.
		print "Deorbiting." at(0,4).
		}
	when ship:altitude < 4000 then {
		AG1 on.
		print "Drouge Chute Deploy." at(0,5).
		}
	when ship:altitude < 500 then {
		AG2 on.
		print "Main Chute Deploy." at(0,6).
		}
	when ship:altitude < 700 then {
		unlock steering.
		unlock throttle.
		}
}.