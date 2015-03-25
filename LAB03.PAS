program Lab03;

const
  n = 8;

type
  index = integer;
  item = integer;
  masiv = array[1..n] of item;

const
  testmasiv: masiv = (44, 55, 12, 42, 94, 18, 6, 67);

var
  t : masiv;

procedure read_masiv(var a: masiv);
var
  i:index;
begin
  a := testmasiv;
end;

procedure write_masiv(a: masiv);
var
  i: index;
begin
  for i := 1 to n do begin
    write(a[i],'; ');
  end;
  writeln;
end;

procedure straight_insert(var a: masiv);
var
  i, j: index;
  x: item;
begin
  for i := 2 to n do begin
    x := a[i];
    j := i-1;
    while (j >= 1) and (x < a[j]) do begin
      a[j+1] := a[j];
      j := j-1;
    end;
    a[j+1] := x;
    write_masiv(a);
  end;
end;

begin
  read_masiv(t);
  write_masiv(t);
  straight_insert(t);
  write_masiv(t);
  readln;
end.