deflng a-z
function pbmain
open "day1.txt" for input as #1
open "day1.tmp" for output as #2
do while not eof(1)
  line input #1,s$
  p = 0
  do
    p = p + 1
    a = asc( mid$( s$, p, 1))
  loop until a >= 48 and a <= 57
  l$ = mid$( s$, p, 1)
  p = len( s$)+1
  do
    p = p - 1
    a = asc( mid$( s$, p, 1))
  loop until a >= 48 and a <= 57
  getal$ = l$ + mid$( s$, p, 1)
  print #2, getal$
  total = total + val( getal$)
loop
print #2,"total="total
print "total="total
end function
