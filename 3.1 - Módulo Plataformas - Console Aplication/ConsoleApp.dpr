program ConsoleApp;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Classe.Animal in 'Classe.Animal.pas';

begin
  try

    var LAnimal := TAnimal.Create;
    try
      var LLatido := 'auau';

      LAnimal.LatirPorReferencia(LLatido);

      WriteLn(LLatido);
    finally
      LAnimal.Free;

      FreeAndNil(LAnimal);
    end;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
