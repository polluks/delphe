OPT MODULE
OPT EXPORT

OBJECT arr
    PRIVATE max  : LONG
    PRIVATE items: PTR TO LONG
ENDOBJECT

PROC create(initialSize=10) OF arr
  self.max:=initialSize
  self.items:=List(self.max)
ENDPROC

PROC add(item:PTR TO LONG) OF arr
  DEF l
  l:=ListLen(self.items)
  IF (l = self.max)
    self.expand()
  ENDIF
  ListAdd(self.items, [0])
  self.items[l]:=item
ENDPROC

PROC length() OF arr
ENDPROC ListLen(self.items)

PROC getItem(i) OF arr
ENDPROC self.items[i]

PROC expand() OF arr
  DEF tmp

  tmp:=self.items
  self.max:=self.max + 10
  self.items:=List(self.max)
  ListAdd(self.items, tmp)
  DisposeLink(tmp)
ENDPROC

PROC clear(freeContent=FALSE) OF arr
  DEF i

  IF freeContent
    FOR i:=0 TO ListLen(self.items)
      DisposeLink(self.items[i])
    ENDFOR
  ENDIF

  DisposeLink(self.items)
  self.items:=List(self.max)
ENDPROC

PROC sortStr() OF arr
  -> Just do a bubble sort
  DEF i, j, t
  
  FOR i:= 0 TO ListLen(self.items) -1
    FOR j:=0 TO ListLen(self.items) - (i+2)
      IF OstrCmp(self.items[j], self.items[j+1]) = -1
        t := self.items[j]
        self.items[j] := self.items[j+1]
        self.items[j+1] := t
      ENDIF
    ENDFOR
  ENDFOR 
ENDPROC

PROC end() OF arr
  DisposeLink(self.items)
ENDPROC
