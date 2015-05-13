program Lab06;

const
  N=4;

var
  x,r:array[1..N] of integer;

procedure print;
const
  z:integer = 0;
var i:integer;
begin
  inc(z);
  writeln('Solution:',z);
  for i:=1 to N do begin
    Writeln('x[',i,']=',x[i]);
  end;
  readln;
end;

procedure test(k:integer;var fl:boolean);
var
  i:integer;
begin
  fl:=true;
  for i:=1 to k-1 do begin
    if (x[i]=x[k]) then fl:=false;
    if(abs(x[k]-x[i])=k-i) then fl:=false;
  end;
end;

procedure arrange;
var
  k:integer;
  fl:boolean;
begin
  k:=1;r[k]:=1;
  while k > 0 do begin
    while r[k] <= n do begin
      x[k]:=r[k];
      r[k]:=r[k]+1;
      test(k,fl);
      if fl then begin
        if k = n then  begin
          print;
        end else begin
          k:=k+1;
          r[k]:=1;
        end;
      end;
    end;
    k:=k-1;
  end;
end;

begin
  writeln;
  arrange;
  writeln('finished');
  readln;
end.


