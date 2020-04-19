//Set alt To ship:altitude.
//Set ship1 To ship.
//Print alt.
//Print ship1.

set mainVessel to TestLexicon(ship).
print mainVessel["D1"].
print mainVessel["D2"].


Function PrintTest{
   Print "".
   Print 1.
   Print 2.
}

Function TestLexicon{
   parameter ship.
   
   set output to Lexicon().
   output:add("D1", ship:altitude).
   output:add("D2", ship).
   
   return output.
}