set stop to false.

until stop = true {
  if ag2 = true {
    if SHIP:CONTROL:PILOTMAINTHROTTLE > 0.99 {
      set ag0 to true.
    }
    else {
      set ag0 to false.
    }
  } else {
    set ag0 to false.
  }

  clearscreen.
  print(SHIP:CONTROL:PILOTMAINTHROTTLE)at(0,0).
  print(ag4)at(0,1).
  wait 0.
}