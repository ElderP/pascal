Program SenoCosseno;

uses
	crt, sysutils;

var
	i: integer;
	pi, radianos, seno, cosseno : Real;

Begin
	clrscr;
	pi := 3.14;
	
	
	for i:=1 to 90 do
		Begin
			radianos:= (i*pi/180);
			seno:= sin(radianos);
			cosseno:= cos(radianos);
			Writeln(i,' <--Graus  Radianos--> ',(radianos):4:4,' Seno--> ',(seno):4:4,' Cosseno--> ',(cosseno):4:4 );
		End;

End.
