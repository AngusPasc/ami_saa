program Lab11;

type
  Te = integer;
  PList = ^List;
  List = record
    info: Te;
    next: PList;
  end;

procedure Init(var p: PList);
  begin
    p := nil;
  end;

procedure InList(var list: PList; x: Te; var fl:boolean);
  var
    pt,l,lp: PList;
  begin
    fl := false;
    new(pt);
    if pt <> nil then begin
      fl := true;
      pt^.info := x;
      l := list;
      lp := list;
      while (l <> nil) and (l^.info < x) do begin
        lp := l;
        l := l^.next;
      end;
      if l = lp then begin
        pt^.next := list;
        list := pt;
      end else begin
        pt^.next := lp^.next;
        lp^.next := pt;
      end;
    end;
  end;

procedure OutList(var list: plist; x:te ;var fl:boolean);
  var
    l, lp: plist;
  begin
    fl:=false;
    l:=list;
    lp:=list;
    while (l <> nil) and (l^.info <> x) do begin
      lp:=l;
      l:=l^.next;
    end;
    if l <> nil then begin
      fl:=true;
      if l=lp then
        list := l^.next
      else
        lp^.next:=l^.next;
      dispose(l);
    end;
  end;

procedure WriteItem(x: Te);
  begin
    writeln(x);
  end;

procedure Scan(list: PList);
  var
    pt: PList;
  begin
    pt := list;
    while pt <> nil do begin
      WriteItem(pt^.info);
      pt := pt^.next;
    end;
  end;

function Empty(p: PList):boolean;
  begin
    Empty := p = nil;
  end;

var
  p: PList;
  x:Te;
  fl: boolean;

begin
  Init(p);
  repeat
    write('x='); readln(x);
    InList(p, x, fl);
  until x = 0;
  Scan(p);
  write('x='); readln(x);
  OutList(p, x, fl);
  Scan(p);
  readln;
end.