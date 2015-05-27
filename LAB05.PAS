Program Lab05;
const
     n=5;
type
    masiv=array[1..n,1..n] of real;
var
   mark:array[1..n] of boolean;
   tour:array[1..n] of integer;
   cost,cm,cinf:real;
   c:masiv;
   k: integer;
   {s: real;}
procedure Ceni(var c:masiv);
var
   i,j:integer;
begin
  randomize;
  cinf:=0;
  writeln('Ceni:');
  for i:=1 to n do begin
    for j:=i to n do begin
      if i<>j then begin
        write(i,'-',j,':');
        readln(c[i,j]);
        {c[i,j] := random(10)+1;
        writeln(c[i,j]:0:2);}
        c[j,i]:=c[i,j];
        cinf:=cinf+c[i,j];
      end;
    end;
  end;
end;

procedure print;
var
  i:integer;
begin
  writeln;
  for i := 1 to n do begin
    write(tour[i],'-');
  end;
  write('cost=',cost:0:2);
end;

procedure tp(b:integer);
var
  i,j:integer;
  u,v,w:integer;
begin
     cost:=0;
     u := b;
     for i:= 1 to n do mark[i]:=true;
     v:=u;
     tour[1]:=u;
     mark[u]:=false;
     for j:=1 to n-1 do begin
         cm:=cinf;
         for i:=1 to n do begin
             if (mark[i]) and (c[v,i]<cm) then begin
                cm:=c[v,i];
                w:=i;
             end;
         end;
         cost:=cost+cm;
         tour[j+1]:=w;
         v:=w;
         mark[w]:=false;
     end;
     cost:=cost+c[w,u];
     print;
end;

begin
  Ceni(c);
  for k := 1 to n do begin
    tp(k);
    {s := s + cost;}
  end;
  writeln;
  {writeln(s/n:0:2);}
  writeln(cinf:0:2);
  readln;
end.