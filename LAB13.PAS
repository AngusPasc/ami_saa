program Lab13;

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

procedure read_masiv(var a: masiv);
begin
  a := testmasiv;
end;

procedure write_masiv(a: masiv);
var
  i:index;
begin
  for i := 1 to n do begin
    write(a[i],'; ');
  end;
  writeln;
end;

procedure partition(var a: masiv; f, l : integer; var i: integer);
var
  j: integer;
  p: integer;
begin
  i := f; j:= l; p := a[f];
  repeat
    while a[j] > p do j:=j-1;
    if i<j then begin
      A[i]:=A[j];
      A[j]:=p;
      i:=i+1;
    end;
    while  A[i] < p do i:=i+1;
    if i<j then begin
      A[j]:=A[i];
      A[i]:=p;
      j:=j-1;
    end;
  until i >= j;
end;

procedure quick_sort(var a: masiv; f, l : integer);
var
  i: integer;
begin
  if f < l then begin
    partition(a,f,l,i);
    quick_sort(a, f, i);
    quick_sort(a, i+1, l);
  end;
end;

begin
  read_masiv(t);
  write_masiv(t);
  quick_sort(t, 1, n);
  write_masiv(t);
  readln;
end.
