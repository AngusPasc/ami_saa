program Lab10;

type
  Te = integer;
  PFIFO = ^FIFO;
  FIFO = record
    data: Te;
    next: PFIFO;
  end;

  procedure Init(var first, last:PFIFO);
  begin
    first := nil;
    last := nil;
  end;

  procedure Put(var first, last:PFIFO; item:Te; var fl:boolean);
  var
    q: PFIFO;
  begin
    new(q);
    fl := false;
    if q <> nil then begin
      q^.data := item;
      q^.next := nil;
      if first = nil then begin
        first := q;
      end else begin
        last^.next := q;
      end;
      last := q;
      fl := true;
    end;
  end;

  procedure Get(var first, last:PFIFO; var item:Te; var fl:boolean);
  var
    q: PFIFO;
  begin
    fl := false;
    if first <> nil then begin
      q := first;
      item := first^.data;
      first := first^.next;
      if first = nil then begin
        last := nil;
      end;
      dispose(q);
      fl := true;
    end;
  end;

  function Empty(first, last: PFIFO):boolean;
  begin
    Empty := (first = nil) and (last = nil);
  end;

var
  first, last: PFIFO;
  first2, last2: PFIFO;
  x:Te;
  i:integer;
  fl: boolean;

begin
  Init(first, last);
  for i := 1 to 3 do begin
    write('Put value=');readln(x);
    Put(first, last, x, fl);
  end;
  writeln('-----------');
  for i := 1 to 4 do begin
    Get(first, last, x, fl);
    if fl then begin
      WriteLn('Get value=',x);
    end else begin
      WriteLn('Error');
    end;
  end;
  
  Init(first2, last2);
  Put(first2, last2, 5, fl);
  Put(first2, last2, 12, fl);
  Get(first2, last2, x, fl);
  if fl then begin
    WriteLn('Get value=',x);
  end else begin
    WriteLn('Error');
  end;
  
  ReadLn;
end.
