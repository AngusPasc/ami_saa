program Lab02;

const
  n = 8;

type
  index = integer;
  item = integer;
  masiv = array[1..n] of item;

const
  testmasiv: masiv = (44, 55, 12, 42, 94, 18, 6, 67);

var
  t: masiv;

procedure masiv_read(var a: masiv);
begin
  a := testmasiv;
end;

procedure masiv_write(a: masiv);
var
  i:index;
begin
  for i := 1 to n do begin
    write(a[i],'; ');
  end;
  writeln;
end;

procedure masiv_buble_sort(var a:masiv);
var
  i, j: index;
  x: item;
begin
  for i := 2 to n do begin
    for j := n downto i do begin
      if a[j] < a[j-1] then begin
        x := a[j-1];
        a[j-1] := a[j];
        a[j] := x;
      end;
    end;
    masiv_write(t);
  end;
end;

begin
  masiv_read(t);
  masiv_write(t);
  masiv_buble_sort(t);
  masiv_write(t);
  readln;
end.
