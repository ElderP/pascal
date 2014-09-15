Program maiusculo;
uses crt, sysutils;

var
	frase : String;
	c : char;

Begin
	clrscr;
	Writeln('Digite uma frase :');
	readln(frase);

	Writeln(UpperCase(frase));

End.
