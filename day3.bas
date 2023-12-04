
deflng a-z

function isnum( byval c$)
  a = asc( c$)
  if 48 <= a and a <= 57 then
    isnum = -1
  else
    isnum = 0
  end if
end function

function pbmain
  dim s$(141)
  nosym$="01234567890."
  open "day3.txt" for input as #1
  open "day3.tmp" for output as #2
  do while not eof(1)
    x = x + 1
    line input #1,s$(x)
    s$(x) = "." + s$(x) + "."
  loop
  xmax = x
  s$(0) = string$( 142, ".")
  s$(xmax+1) = string$( 142, ".")

  for x = 1 to xmax
    y = 0
    do
      y = y + 1
      if isnum( mid$( s$(x), y, 1)) then
        p$ = "" : y0 = y
        do
          p$ = p$ + mid$( s$(x), y, 1)
          y = y + 1
        loop until y > 141 or not isnum( mid$( s$(x), y, 1))
        hit = 0
        for i = x-1 to x+1
          for j = y0-1 to y
            if 0 = instr( nosym$, mid$( s$(i), j, 1)) then
              hit = -1
              exit for
            end if
          next j
        next i
        if hit then
          print #2, p$
          tot = tot + val( p$)
        end if
      end if
    loop while y < 142
  next x
  print #2, tot
end function
