program LAB12;

type
  Te = integer;
  PBinTree = ^BinTree;
  BinTree = record
    info: Te;
    left: PBinTree;
    right: PBinTree;
  end;

procedure Init(var root:PBinTree);
  begin
    root := nil;
  end;

function EmptyTree(d: PBinTree):boolean;
  begin
    EmptyTree := d = nil;
  end;

procedure ReadTe(var x: Te);
  begin
    write('x=');readln(x)
  end;

procedure CreateBinTree(var d: PBinTree);
  var
    x: Te;
    ch: char;
  begin
    ReadTe(x);
    new(d);
    d^.info := x;
    d^.left := nil;
    d^.right := nil;

    write('Left sub tree with root ', d^.info, ' y/n');
    readln(ch);
    if ch = 'y' then CreateBinTree(d^.left);

    write('Right sub tree with root ', d^.info, ' y/n');
    readln(ch);
    if ch = 'y' then CreateBinTree(d^.right);

  end;

procedure action(x: Te);
  begin
    writeln(x);
  end;

procedure scan(d:PBinTree);
  begin
    if not EmptyTree(d) then begin
      scan(d^.left);
      action(d^.info);
      scan(d^.right);
    end;
  end;

procedure search1(root:PBinTree; x:Te; var fl:boolean);
  var
    p:PBinTree;
  begin
    p := root;
    fl:= false;
    while (p <> nil) and (p^.info <> x) do begin
      if x > p^.info then
        p := p^.right
      else
        p := p^.left;
    end;
    if p <> nil then begin
      fl := true;
      writeln(p^.info);
    end;
  end;

procedure search2(root:PBinTree; x:Te; var fl:boolean);
  begin
    if root = nil then begin
      fl := false;
    end else begin
      if root^.info = x then begin
        fl := true;
        writeln(root^.info);
      end else begin
        if root^.info < x then
          search2(root^.right, x, fl)
        else
          search2(root^.left, x, fl)
      end;
    end;
  end;

procedure insert(var root: PBinTree; x:Te; var fl:boolean);
  var
    k, p, pp: PBinTree;
  begin
    fl := false;
    new(k);
    if k <> nil then begin
      fl := true;
      k^.info := x; k^.left := nil; k^.right := nil;
      p := root; pp := root;
      while p <> nil do begin
        pp := p;
        if x > p^.info then
          p := p^.right
        else
          p := p^.left;
      end;
      if p = pp then
        root := k
      else
        if pp^.info < x then
          pp^.right := k
        else
          pp^.left := k;
    end;
  end;

procedure delete(var root: PBinTree; x:Te; var fl:boolean);
  var
    k, kp, t, q: PBinTree;
  begin
    fl := false;
    k := root; kp := root;

    while (k <> nil) and (k^.info <> x) do begin
      kp := k;
      if x > k^.info then
        k := k^.right
      else
        k := k^.left;
    end;

    if k <> nil then begin
      fl := true;
      if k^.right = nil then
        t := k^.left
      else
        if k^.left = nil then
          t := k^.right
        else begin
          t := k^.left; q := k^.left;
          while q^.right <> nil do q := q^.right;
          q^.right := k^.right;
        end;

      if k = root then
        root := t
      else
        if kp^.left = k then
          kp^.left := t
        else
          kp^.right := t;
          
      dispose(k);
    end;
  end;

var
  d: PBinTree;
  fl: boolean;

begin
  CreateBinTree(d);
  {scan(d);}
  search1(d, 3, fl);
  {insert(d, 6, fl);
  search2(d, 6, fl);
  scan(d);
  delete(d, 7, fl);
  scan(d);}
  readln;
end.