unit Models.Produtos;

interface

uses System.Generics.Collections, Connection.Database, FireDAC.Comp.Client, Firedac.DApt,
     Firedac.Stan.Async, Types.Categoria, System.JSON,
     REST.Client, REST.Types, System.SysUtils;

type

  TItemCompra = class
  private
    FNome: string;
    FCategoria: TCategoria;
    FPronto: Boolean;
  public
    property Nome: string read FNome write FNome;
    property Categoria: TCategoria read FCategoria write FCategoria;
    property Pronto: Boolean read FPronto write FPronto;
  end;

  TListaCompras = class
  private
    FItens: TObjectList<TItemCompra>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AdicionarItem(AItem: TItemCompra);
    procedure RemoverItem(AItem: TItemCompra);
    procedure RemoverItensProntos;

    procedure CarregarItensDoBancoLocal;
    procedure SalvarItensnoBancoLocal;

    procedure CarregarItensDoBancoServidor;
    procedure SalvarItensnoBancoServidor;

    procedure MarcarComoPronto(Index: Integer);
    function ObterItensPorCategoria(ACategoria: TCategoria): TObjectList<TItemCompra>;
    function ObterTodosItens: TObjectList<TItemCompra>;

    function ItensToJson: TJSONArray;
    procedure JsonToItens(const AJsonArray: TJSONArray);
  end;

implementation

constructor TListaCompras.Create;
begin
  FItens := TObjectList<TItemCompra>.Create(True); // Gerencia a memória dos itens
end;

destructor TListaCompras.Destroy;
begin
  FItens.Free;
  inherited;
end;

procedure TListaCompras.AdicionarItem(AItem: TItemCompra);
begin
  FItens.Add(AItem);
end;

procedure TListaCompras.RemoverItem(AItem: TItemCompra);
begin
  FItens.Remove(AItem);
end;

procedure TListaCompras.RemoverItensProntos;
begin
  for var I := FItens.Count - 1 downto 0 do
  begin
    if FItens[I].Pronto then
      FItens.Delete(I);
  end;
end;

procedure TListaCompras.MarcarComoPronto(Index: Integer);
begin
  FItens[Index].Pronto := not FItens[Index].Pronto;
end;

function TListaCompras.ObterItensPorCategoria(ACategoria: TCategoria): TObjectList<TItemCompra>;
var
  Item: TItemCompra;
  ResultList: TObjectList<TItemCompra>;
begin
  ResultList := TObjectList<TItemCompra>.Create(False); // Não gerencia a memória dos itens
  for Item in FItens do
    if Item.Categoria = ACategoria then
      ResultList.Add(Item);
  Result := ResultList;
end;

function TListaCompras.ObterTodosItens: TObjectList<TItemCompra>;
begin
  Result := FItens;
end;

procedure TListaCompras.SalvarItensnoBancoLocal;
begin
  var LQuery := TFDQuery.Create(nil);
  try
    try
      LQuery.Connection := TConnectionDatabase.GetConnection;
      LQuery.ExecSQL('DELETE FROM PRODUTOS');

      LQuery.SQL.Text := 'INSERT INTO produtos (id, NomeProduto) VALUES (:ID, :NomeProduto)';

      var LCount := 0;

      for var Item in FItens do
      BEGIN
        Inc(LCount);

        LQuery.Parambyname('ID').asInteger := LCount;
        LQuery.Parambyname('NomeProduto').asString := Item.FNome;
        LQuery.ExecSQL;
      END;

    except
      on E:Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    LQuery.Free;
  end;
end;

procedure TListaCompras.CarregarItensDoBancoLocal;
var
  Query: TFDQuery;
  Item: TItemCompra;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := TConnectionDatabase.GetConnection;
    Query.SQL.Text := 'SELECT * FROM produtos';
    Query.Open;

    while not Query.Eof do
    begin
      Item := TItemCompra.Create;
      Item.Nome := Query.FieldByName('NomeProduto').AsString;
      Item.Pronto := Query.FieldByName('PRONTO').asBoolean;

      FItens.Add(Item);

      Query.Next;
    end;
  finally
    Query.Free;
  end;
end;

procedure TListaCompras.SalvarItensnoBancoServidor;
var
  LRESTClient: TRESTClient;
  LRESTRequest: TRESTRequest;
  LRESTResponse: TRESTResponse;
begin
  // Cria os componentes REST
  LRESTClient := TRESTClient.Create(nil);
  LRESTRequest := TRESTRequest.Create(nil);
  LRESTResponse := TRESTResponse.Create(nil);
  try
    // Configura o cliente REST
    LRESTClient.BaseURL := 'http://localhost:8080/datasnap/rest';

    // Configura a requisição
    LRESTRequest.Client := LRESTClient;
    LRESTRequest.Response := LRESTResponse;
    LRESTRequest.Resource := 'TServerMethods1/PostData';
    LRESTRequest.Method := rmPOST;
    LRESTRequest.AddParameter('Content-Type', 'application/json', pkHTTPHEADER);

    var LBody := TJsonObject.Create;
    try
      LBody.AddPair('produtos', ItensToJson);

      LRESTRequest.AddBody(LBody.toString, TRESTContentType.ctAPPLICATION_JSON);

      // Executa a requisição
      LRESTRequest.Execute;

      // Verifica a resposta
      if LRESTResponse.StatusCode <> 200 then
      begin
        raise Exception.Create('Erro ao enviar itens: ' + LRESTResponse.StatusText);
      end;

    finally
      LBody.Free;
    end;
  finally
    LRESTClient.Free;
    LRESTRequest.Free;
    LRESTResponse.Free;
  end;
end;

procedure TListaCompras.CarregarItensDoBancoServidor;
var
  LRESTClient: TRESTClient;
  LRESTRequest: TRESTRequest;
  LRESTResponse: TRESTResponse;
begin
  // Cria os componentes REST
  LRESTClient := TRESTClient.Create(nil);
  LRESTRequest := TRESTRequest.Create(nil);
  LRESTResponse := TRESTResponse.Create(nil);
  try
    // Configura o cliente REST
    LRESTClient.BaseURL := 'http://localhost:8080/datasnap/rest';

    // Configura a requisição
    LRESTRequest.Client := LRESTClient;
    LRESTRequest.Response := LRESTResponse;
    LRESTRequest.Resource := 'TServerMethods1/GetData';
    LRESTRequest.Method := rmGET;

    // Executa a requisição
    LRESTRequest.Execute;

    // Verifica a resposta
    if LRESTResponse.StatusCode = 200 then
       JsonToItens((LRestResponse.JSONValue.GetValue<TJsonArray>('result').Items[0] as TJSONArray))
    else
    begin
      // Exibe erro caso a requisição falhe
      raise Exception.Create('Erro ao carregar itens: ' + LRESTResponse.StatusText);
    end;
  finally
    LRESTClient.Free;
    LRESTRequest.Free;
    LRESTResponse.Free;
  end;
end;

function TListaCompras.ItensToJson: TJSONArray;
var                             //Serialização
  Item: TItemCompra;
  JsonItem: TJSONObject;
begin
  Result := TJSONArray.Create;

  for Item in FItens do
  begin
    JsonItem := TJSONObject.Create;
    JsonItem.AddPair('Nome', Item.Nome);
    JsonItem.AddPair('Pronto', TJSONBool.Create(Item.Pronto));
    Result.AddElement(JsonItem);
  end;
end;

procedure TListaCompras.JsonToItens(const AJsonArray: TJSONArray);
var                            //Deserialização
  JsonValue: TJSONValue;
  JsonItem: TJSONObject;
  Item: TItemCompra;
begin
  FItens.Clear;

  for JsonValue in AJsonArray do
  begin
    JsonItem := JsonValue as TJSONObject;
    Item := TItemCompra.Create;
    Item.Nome := JsonItem.GetValue<string>('Nome');
    Item.Pronto := JsonItem.GetValue<Boolean>('Pronto');
    FItens.Add(Item);
  end;
end;


end.
