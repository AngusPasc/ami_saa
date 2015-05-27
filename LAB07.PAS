program Lab07;
const
  n=3;

procedure move(a, b:integer);
const
  count:integer = 0;
begin
  inc(count); {count := count + 1}
  writeln(count, ' Move disk from ', a, ' to ', b);
end;

procedure hanoj(n, a, b, c:integer);
begin
  if n = 1 then begin
    move(a, b);
  end else begin
    hanoj(n-1, a, c, b);
    move(a, b);
    hanoj(n-1, c, b, a);
  end;
end;

begin
  writeln;
  hanoj(n,1,2,3);
  readln;
end.
{---------------------------------------------------}
program Lab07;

var
  n: integer;
  nf: longint;

function factoriel(n:longint):longint;
begin
  if n = 0 then begin
    factoriel := 1;
  end else begin
    factoriel := n * factoriel(n-1);
  end;
end;

begin
  write('(0-12) n=');readln(n);
  nf := factoriel(n);
  writeln(n,'!=', nf);
  readln;
end.
{---------------------------------------------------}
