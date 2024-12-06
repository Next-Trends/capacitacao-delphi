unit Connection.Database;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Firedac.Stan.Def, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Stan.Intf;

type
  TConnectionDatabase = class
  private
    class var FConnection: TFDConnection;
  public
    class function GetConnection: TFDConnection;
  end;

implementation

class function TConnectionDatabase.GetConnection: TFDConnection;
begin
  if FConnection = nil then
  begin
    FConnection := TFDConnection.Create(nil);
    try
      var FBDriverLink := TFDPhysFBDriverLink.Create(nil);

      FConnection.Params.DriverID := 'FB';
      FConnection.Params.UserName := 'SYSDBA';
      FConnection.Params.Password := 'masterkey';

      FConnection.Params.Database := '/var/lib/firebird/data/PRODUTOS.fdb';
      FConnection.Params.Values['SERVER'] := GetEnvironmentVariable('SERVER');

    //  FConnection.Params.DriverID := 'FB';
    //  FConnection.Params.Database := 'D:\Projetos\Curso\cursoEmbarcadero\DATA\PRODUTOS.FDB';
    //  FConnection.Params.UserName := 'SYSDBA';
      FConnection.Connected := True;
    except
      on E:Exception do
      begin
        FreeAndNil(FConnection);
        raise Exception.Create('Erro ao conectar ao banco de dados.' + E.Message );
      end;
    end;
  end;

  Result := FConnection;
end;

end.
