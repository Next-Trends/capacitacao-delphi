unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, Controllers.Produtos,
  System.JSON;

type
{$METHODINFO ON}
  TServerMethods1 = class(TComponent)
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function GetData: TJsonArray;
    function UpdatePostData(const AData: TJsonObject): String;
  end;
{$METHODINFO OFF}

implementation


uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

function TServerMethods1.GetData: TJsonArray;
begin
  var LControllerListaCompras := TControllerListaCompras.Create;
  try
    LControllerListaCompras.BuscarItensDatabaseLocal;
    Result := LControllerListaCompras.ToJson;
  finally
    LControllerListaCompras.Free;
  end;
end;

function TServerMethods1.UpdatePostData(const AData: TJsonObject): String;
begin
  if Assigned(AData) then
    Result := 'Dados recebidos: ' + AData.ToString
  else
    Result := 'Nenhum dados recebido.';

  var LControllerListaCompras := TControllerListaCompras.Create;
  try
    LControllerListaCompras.JsonToItens(AData.GetValue<TJsonArray>('produtos'));
    LControllerListaCompras.SalvarItensDatabaseLocal;
  finally
    LControllerListaCompras.Free;
  end;
end;



end.

