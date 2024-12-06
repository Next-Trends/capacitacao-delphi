program Servidor;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Types,
  IPPeerServer,
  IPPeerAPI,
  IdHTTPWebBrokerBridge,
  Web.WebReq,
  Web.WebBroker,
  Datasnap.DSSession,
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas',
  WebModuleUnit1 in 'WebModuleUnit1.pas' {WebModule1: TWebModule},
  ServerConst1 in 'ServerConst1.pas',
  Connection.Database in '..\Connection\Connection.Database.pas',
  Controllers.Produtos in '..\Controller\Controllers.Produtos.pas',
  Models.Produtos in '..\Model\Models.Produtos.pas',
  Types.Categoria in '..\Types\Types.Categoria.pas';

procedure TerminateThreads;
begin
  if TDSSessionManager.Instance <> nil then
    TDSSessionManager.Instance.TerminateAllSessions;
end;

procedure StartServer(APort: Integer);
var
  LServer: TIdHTTPWebBrokerBridge;
begin
  LServer := TIdHTTPWebBrokerBridge.Create(nil);
  try
    Writeln(Format('Iniciando o servidor na porta %d...', [APort]));
    LServer.DefaultPort := APort;
    LServer.Active := True;
    Writeln('Servidor iniciado. Pressione Ctrl+C para encerrar.');
    while True do
    begin
      Sleep(1000); // Mantém o programa em execução
    end;
  except
    on E: Exception do
    begin
      Writeln('Erro ao iniciar o servidor: ', E.Message);
    end;
  end;
end;

begin
  try
    if WebRequestHandler <> nil then
      WebRequestHandler.WebModuleClass := WebModuleClass;
    StartServer(8080); // Porta padrão 8080
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.

