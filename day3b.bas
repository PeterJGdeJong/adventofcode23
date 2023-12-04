
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
  open "day3b.tmp" for output as #2
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
      if "*" = mid$( s$(x), y, 1) then
        bo = 0 : be = 0 : li = 0 : re = 0 : lb = 0 : rb = 0 : lu = 0 : ro = 0
        if isnum( mid$( s$(x-1), y, 1)) then
          bo = -1
        else
          if isnum( mid$( s$(x-1), y-1, 1)) then
            lb = -1
          end if
          if isnum( mid$( s$(x-1), y+1, 1)) then
            rb = -1
          end if
        end if
        if isnum( mid$( s$(x), y-1, 1)) then
          li = -1
        end if
        if isnum( mid$( s$(x), y+1, 1)) then
          re = -1
        end if
        if isnum( mid$( s$(x+1), y, 1)) then
          be = -1
        else
          if isnum( mid$( s$(x+1), y-1, 1)) then
            lu = -1
          end if
          if isnum( mid$( s$(x+1), y+1, 1)) then
            ro = -1
          end if
        end if
        prod = 0
        if li + re + be + bo + lu + lb + ro + rb <= -2 then
          print #2, x y
          if li + re + be + bo + lu + lb + ro + rb < -2 then
            print #2, " meer dan twee getallen in de buurt"
          else
            prod = 1
            if li then px = x   : py = y-1 : gosub extr : prod = prod * part
            if re then px = x   : py = y+1 : gosub extr : prod = prod * part
            if be then px = x+1 : py = y   : gosub extr : prod = prod * part
            if bo then px = x-1 : py = y   : gosub extr : prod = prod * part
            if lb then px = x-1 : py = y-1 : gosub extr : prod = prod * part
            if lu then px = x+1 : py = y-1 : gosub extr : prod = prod * part
            if rb then px = x-1 : py = y+1 : gosub extr : prod = prod * part
            if ro then px = x+1 : py = y+1 : gosub extr : prod = prod * part
          end if
        end if
        if prod then
          print #2, "prod:       " prod
          tot = tot + prod
        end if
      end if
    loop while y < 142
  next x
  print #2, tot

exit function

extr:
'in py px
'out: part
        do
          py = py - 1
        loop until not isnum( mid$( s$(px), py, 1))
        y0 = py + 1
        do
          py = py + 1
        loop until not isnum( mid$( s$(px), py, 1))
        part = val( mid$( s$(px), y0, py-y0))
  print #2, "part:" part
    return

end function
