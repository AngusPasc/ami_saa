program LAB09;

type
  Te = integer;
  PLIFO = ^LIFO;
  LIFO = record
    data: Te;
    next: PLIFO;
  end;

  procedure Init(var s:PLIFO);
  begin
    s := nil;
  end;

  procedure Push(var s:PLIFO; item:Te; var fl:boolean);
  var
    q: PLIFO;
  begin
    fl := false;
    new(q);
    if q <> nil then begin
      q^.data := item;
      q^.next := s;
      s := q;
      fl := true;
    end;
  end;

procedure Pop(var s:PLIFO; var item:Te; var fl:boolean);
  var
    q: PLIFO;
  begin
    fl := false;
    if s <> nil then begin
      q:= s;
      item := s^.data;
      s := s^.next;
      dispose(q);
      fl := true;
    end;
  end;

  procedure Top(s:PLIFO; var item:Te; var fl: boolean);
  begin
    fl := false;
    if s <> nil then begin
      item := s^.data;
      fl := true;
    end;
  end;

  function Empty(s: PLIFO):boolean;
  begin
    Empty := (s = nil);
  end;

  var
  s1: PLIFO;
  x: Te;
  i: integer;
  fl: boolean;

begin

  Init(s1);

  for i := 1 to 3 do begin
    write('Push value=');readln(x);
    Push(s1, x, fl);
    if not fl then begin
      WriteLn('Error');
    end;
  end;

  writeln('-----------');
  for i := 1 to 4 do begin
    if not Empty(s1) then begin
      Pop(s1, x, fl);
      if fl then begin
        WriteLn('Pop value=', x);
      end else begin
        WriteLn('Error');
      end;
    end;
  end;

  readln;
end.
