program Lab04;

var
  k,i:integer;
  bk:real;
  xk:real;

begin
  k := 8; Bk := 0;
  while k > 0 do begin
    xk := 500/(2*k-1);
    for i := 1 to k - 1 do begin
      writeln('refuel in B',k, '(',Bk:0:2,')','full reservoir');
      writeln('->', xk:0:2, 'km');
      writeln('store without ', Xk:0:2, 'l');
      writeln('<- B',k, '(',Bk:0:2 ,')',Xk:0:2,' km)');
      writeln;readln;
    end;
    writeln('refuel in B', k ,'(',Bk:0:2,')');
    writeln('->', Xk:0:2, ' km');
    writeln('new base B', k ,'(',Bk:0:2,')');
    writeln;readln;
    k := k - 1;
    Bk := Bk + xk;
  end;
  writeln('finished');
end.
