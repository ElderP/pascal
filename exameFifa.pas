program exameFifa;

{Voce foi contratado para fazer o sistema para nova eleição do presitende da FIFA.Desenvolva um sistema na linguagem pascal que atenda os seguintes critérios:
1 - Deve permitir o cadastro de Federações, cada Federação tem direito a um único voto por eleição;
2 - O candidato a presidencia deve ser filiado a uma, e somente uma, dessas Federações;
3 - O candidato a presidencia deve ter idade mínima de 32 anos;
4 - Será considerado eleito o candidato que ao final da votação conseguir o maior número de votos válidos

O sistema deverá possuir:
1 - Uma UNIT contendo as funções e procedimentos criados e utilizados;
2 - Os dados devem ser armazenados na memória até que o programa seja encerrado;
3 - O sistema deverá conter quatro registros, uma para pessoa federada, um para entidades federadas, um para registrar os candidatos e outro para armazenar os dados da votação;
4 - Ao final da votação o sistema deverá emitir um relatório contendo o total de votos computados, o total de votos não computados (faltantes), o total de votos que cada candidato recebeu, juntamente com o percentual correspondente ao total de votos válidos obtidos;
5 -O sistema deverá permitir a inclusão de federações, pessoas federadas e candidatos. }


uses
	crt;

procedure limpaTela();
begin
	clrscr;
end;

type
	TipoFederacao = ^RegistroFederacao;
	RegistroFederacao = Record
		Sigla : String;
		Nome  : String;
		proximo : TipoFederacao;
	End;

procedure insereFederacao(R : TipoFederacao);
	var
		atual: TipoFederacao;
		anterior : TipoFederacao;
		opcao : Char;
	begin
		repeat
			Writeln('Digite a Sigla da Federação');
			Readln(atual^.Sigla);
			Writeln('Digite o nome da Federação');
			Readln(atual^.Nome);
			if (R = nil) then
				R := atual
				else
					anterior^.proximo := atual;
			atual^.proximo := nil;
			anterior := atual;

			Writeln('0 - Para Sair | Qualquer tecla para continuar');
			Readln(opcao);

		until opcao = '0';
	end;

procedure mostraFederacao(R : TipoFederacao);
	var
		atual: TipoFederacao;
	begin
		while (R^.proximo = nil) do
		begin
			atual := R;
			R := R^.proximo;
			Writeln('Federação: ', atual^.Nome);
			Writeln('Sigla    : ', atual^.Sigla);
			dispose(atual);
		end;
	end;	

var
	opc: Byte;
	R : TipoFederacao;

Begin
	R:= nil;
	opc := 0;

	repeat
		
	Writeln('Selecione uma opcao');
	Writeln('1 - Cadastro de Federação ');
	Writeln('2 - Consulta Federações Cadastradas ');
	Writeln('3 - Cadastro de ...');
	Writeln('4 - Cadastro de ...');
	Writeln('5 - Cadastro de ...');
	Writeln('0 - Para encerrar');

	Readln(opc);
	limpaTela;

	case opc of
			
		1 : Begin
				Writeln('Chamar cadastro de Federações ... opcao ', opc);
				insereFederacao(R);
			End;
		2 : Begin
				Writeln('Chamar Consulta de federações ... opcao ', opc);
				mostraFederacao;
			End;
		3 : Writeln('Chamar cadastro de ... opcao ', opc);
		4 : Writeln('Chamar cadastro de ... opcao ', opc);
		5 : Writeln('Chamar cadastro de ... opcao ', opc);
		0 : Writeln('Voce decidiu encerrar o Programa ...  opcao | ', opc, ' | Pressione Qualquer tecla ');
		
	end;
	until opc = 0;
	Readln;
	limpaTela;

End.
