deflng a-z
function pbmain

open "day2full.txt" for input as #1
open "day2b.tmp" for output as #2
do while not eof(1)
  line input #1,s$

  p = 0 : rmax = 0
  do
    p = instr( p+1, s$, "red" )
    if p then
      v = val( mid$( s$, p-3, 2))
      if v > rmax then rmax = v
    end if
  loop until p = 0

  p = 0 : gmax = 0
  do
    p = instr( p+1, s$, "green" )
    if p then
      v = val( mid$( s$, p-3, 2))
      if v > gmax then gmax = v
    end if
  loop until p = 0

  p = 0 : bmax = 0
  do
    p = instr( p+1, s$, "blue" )
    if p then
      v = val( mid$( s$, p-3, 2))
      if v > bmax then bmax = v
    end if
  loop until p = 0

' if rmax <= 12 and gmax <= 13 and bmax <= 14 then
'   g = val( mid$( s$, 5))
    power = rmax * gmax * bmax
    print #2,   power
'   total = total + g
    powet = powet + power
' end if
loop
print #2,       powet
end function
