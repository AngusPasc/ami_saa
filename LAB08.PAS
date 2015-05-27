program Lab08;

uses
  Graph;

const
  r = 120;
  Rmin = 1;

function SetGraph:boolean;
var
  grDriver, grMode, errCode: integer;
begin
  grDriver := Detect;
  InitGraph(grDriver, grMode, 'c:\bp\bgi');
  errCode := GraphResult;
  if (errCode <> grOk) then
    SetGraph := false
  else begin
    SetGraphMode (grMode);
    setGraph:=true;
  end;
end;

procedure  Draw(x, y, r, bg:integer);
var
  poly: array[1..8] of integer;
begin
  poly[1]:=x-r; poly[2]:=y-r;
  poly[3]:=x+r; poly[4]:=y-r;
  poly[5]:=x+r; poly[6]:=y+r;
  poly[7]:=x-r; poly[8]:=y+r;
  SetFillStyle(solidfill, bg);
  FillPoly(4, poly);
end;

procedure fractal(x, y, r, bg:integer);
begin
  if r > Rmin then begin
    Draw(x, y, r, bg);
    fractal(x-r,y-r, r div 2, 1-bg);
    fractal(x+r,y-r, r div 2, 1-bg);
    fractal(x+r,y+r, r div 2, 1-bg);
    fractal(x-r,y+r, r div 2, 1-bg);
  end;
end;

procedure Main;
begin
  if(SetGraph) then begin
    fractal(GetMaxX div 2, GetMaxY div 2, r, 15);
    readln;
    CloseGraph;
  end else begin
    writeln('Error in ...');
  end;
end;

begin
  Main;
end.