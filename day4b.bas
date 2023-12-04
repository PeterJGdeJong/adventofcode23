
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
  dim w(99)
  dim m(99)
  dim f(999)
  for i = 1 to 999
    f(i) = 1
  next i
  open "day4.txt" for input as #1
  open "day4b.tmp" for output as #2
  do while not eof(1)
    line input #1,s$
    fx = fx + 1
    p = 0 : wx = 0 : mx = 0
    do
      p = p + 1
    loop until ":" = mid$( s$, p, 1)
    do
      do
        p = p + 1
      loop until isnum( mid$( s$, p, 1)) or "|" = mid$( s$, p, 1)
      if isnum( mid$( s$, p, 1)) then
        wx = wx + 1 : w(wx) = val( mid$( s$, p))
        do
          p = p + 1
        loop until "|" = mid$( s$, p, 1) or " " = mid$( s$, p, 1)
      end if
    loop until "|" = mid$( s$, p, 1)
    do
      do
        p = p + 1
      loop until isnum( mid$( s$, p, 1)) or p > len( s$)
      if p <= len( s$) then
        mx = mx + 1 : m(mx) = val( mid$( s$, p))
        do
          p = p + 1
        loop until p > len( s$) or " " = mid$( s$, p, 1)
      end if
    loop until p > len( s$)
    bx = 0
    for wi = 1 to wx
      for mi = 1 to mx
        if m(mi) = w(wi) then
          bx = bx + 1
        end if
      next mi
    next wi
    for x = fx+1 to fx+bx
      f(x) = f(x) + f(fx)
    next x
    print #2, bx f(fx)
    tot = tot + f(fx)
  loop
  print #2, tot
end function
