
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
  dim se&&(999)
  dim so&&(8,999)
  dim ta&&(8,999)
  dim nr&&(8,999)
  open "day5a.txt" for input as #1
  open "day5l.tmp" for output as #2
  do while not eof(1)
    line input #1,s$
    if instr( s$, "seeds:") then
      p = 0
      do
        do
          p = p + 1
        loop until isnum( mid$( s$, p, 1)) or p > len( s$)
        sx = sx + 1 : se&&(sx) = val( mid$( s$, p))
        do
          p = p + 1
        loop until " " = mid$( s$, p, 1) or p > len( s$)
      loop until p > len( s$)
      print #2, "seeds:" sx
    elseif instr( s$, "-to-") then
      so&&(mx,0) = nx : nx = 0
      mx = mx + 1
    elseif isnum( mid$( s$, 1, 1)) then
      nx = nx + 1
      p = 1
      ta&&(mx,nx) = val( mid$( s$, p))
      do
        p = p + 1
      loop until " " = mid$( s$, p, 1) or p > len( s$)
      do
        p = p + 1
      loop until isnum( mid$( s$, p, 1)) or p > len( s$)
      so&&(mx,nx) = val( mid$( s$, p))
      do
        p = p + 1
      loop until " " = mid$( s$, p, 1) or p > len( s$)
      do
        p = p + 1
      loop until isnum( mid$( s$, p, 1)) or p > len( s$)
      nr&&(mx,nx) = val( mid$( s$, p))
    end if
  loop
  so&&(mx,0) = nx : nx = 0

  vmin&& = 9999999999
  for s = 1 to sx step 2
    for va&& = se&&(s) to se&&(s)+se&&(s+1)
      v&& = va&&
    ' print #2, v&& ;
      for m = 1 to 7
        for n = 1 to so&&(m,0)
          if so&&(m,n) <= v&& and v&& <= so&&(m,n)+nr&&(m,n) then
            v&& = ta&&(m,n) + v&& - so&&(m,n)
            exit for
          end if
        next n
    '   print #2, v&& ;
      next m
    ' print #2, " ."
      if v&& < vmin&& then vmin&& = v&&
    next va&&
  next s
  print #2, vmin&&

end function
