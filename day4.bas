
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
  open "day4.txt" for input as #1
  open "day4al.tmp" for output as #2
  do while not eof(1)
    line input #1,s$
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
    print #2, w(wx) ;
        do
          p = p + 1
        loop until "|" = mid$( s$, p, 1) or " " = mid$( s$, p, 1)
      end if
    loop until "|" = mid$( s$, p, 1)
    print #2, " | " ;
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
    sc = 0
    for wi = 1 to wx
      for mi = 1 to mx
        if m(mi) = w(wi) then
          if sc = 0 then
            sc = 1
          else
            sc = sc * 2
          end if
    print #2, w(wi) ;
        end if
      next mi
    next wi
    print #2, sc
    tot = tot + sc
  loop
  print #2, tot
end function
