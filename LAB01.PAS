program Lab01;

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

procedure masiv_read(var a: masiv);
begin
  a := testmasiv;
end;

procedure masiv_write(a: masiv);
var
  i:index;
begin
  for i := 1 to n do begin
    Write(a[i],'; ');
  end;
  WriteLn;
end;

procedure masiv_straight_selection(var a: masiv);
var
  i, j, k: index;
  x: item;
begin
  for i := 1 to n-1 do begin
    k := i;
    x := a[i];
    for j := i+1 to n do begin
      if a[j] < x then begin
        k := j;
        x := a[j];
      end;
    end;
    a[k] := a[i];
    a[i] := x;
  end; 
end;

begin
  masiv_read(t);
  masiv_write(t);
  masiv_straight_selection(t);
  masiv_write(t);
  readln;
end.
