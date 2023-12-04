deflng a-z

Function lastpos( byval s$, byval c$)
       t = 0
       do
         s = instr( t+1, s$, c$)
         if 0 < s then t = s
       loop until 0 = s
       lastpos = t
end Function

function pbmain
open "day1.txt" for input as #1
open "day1b.tmp" for output as #2
dim nr$(10)
nr$(0)="zero"
nr$(1)="one"
nr$(2)="two"
nr$(3)="three"
nr$(4)="four"
nr$(5)="five"
nr$(6)="six"
nr$(7)="seven"
nr$(8)="eight"
nr$(9)="nine"
do while not eof(1)
  line input #1,s$
  p = 0
  do
    p = p + 1
    a = asc( mid$( s$, p, 1))
  loop until a >= 48 and a <= 57
  x = -1 : xmin = 10 : qmin = 99999
  do
    do
      x = x + 1
      q = instr( s$, nr$(x))
    loop until q > 0 or x > 9
    if q < qmin and x <= 9 then
      qmin = q
      xmin = x
    end if
  loop until x > 9
  if xmin <= 9 and qmin < p then
    l$ = chr$(48+xmin)
  else
    l$ = mid$( s$, p, 1)
  end if

  p = len( s$)+1
  do
    p = p - 1
    a = asc( mid$( s$, p, 1))
  loop until a >= 48 and a <= 57
  x = -1 : xmax = -1 : qmax = 0
  do
    do
      x = x + 1
      q = lastpos( s$, nr$(x))
    loop until q > 0 or x > 9
    if q > qmax and x <= 9 then
      qmax = q
      xmax = x
    end if
  loop until x > 9
  if xmax <= 9 and qmax > p then
    r$ = chr$(48+xmax)
  else
    r$ = mid$( s$, p, 1)
  end if

  getal$ = l$ + r$
  print #2, getal$ qmin qmax
  total = total + val( getal$)
loop
print #2,"total="total
print "total="total
end function
