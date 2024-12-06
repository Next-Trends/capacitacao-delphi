unit Controllers.Produtos;

interface

uses
  Models.produtos, System.Generics.Collections, Types.Categoria;

type
  TControllerListaCompras = class
  private
    FListaCompras: TListaCompras;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AdicionarItem(const ANome: string; const ACategoria: TCategoria);
    procedure MarcarItemComoPronto(Index: Integer);
    procedure RemoverItem(Index: Integer);
    procedure RemoverItensProntos;

    procedure SalvarItensDatabaseLocal;
    procedure BuscarItensDatabaseLocal;

    procedure SalvarItensDatabaseServidor;
    procedure BuscarItensDatabaseServidor;

    function ObterItensPorCategoria(Categoria: TCategoria): TObjectList<TItemCompra>;

    function ObterTodosItens: TObjectList<TItemCompra>;
    function ObterNomesItens: TArray<string>;
  end;

implementation

procedure TControllerListaCompras.BuscarItensDatabaseLocal;
begin
  FListaCompras.CarregarItensDoBancoLocal;

  FListaCompras.itenstoJson;
end;

procedure TControllerListaCompras.BuscarItensDatabaseServidor;
begin
  FListaCompras.CarregarItensDoBancoServidor;
end;

constructor TControllerListaCompras.Create;
begin
  FListaCompras := TListaCompras.Create;
end;

destructor TControllerListaCompras.Destroy;
begin
  FListaCompras.Free;
  inherited;
end;

procedure TControllerListaCompras.AdicionarItem(const ANome: string; const ACategoria: TCategoria);
var
  NovoItem: TItemCompra;
begin
  NovoItem := TItemCompra.Create;
  NovoItem.Nome := ANome;
  NovoItem.Categoria := ACategoria;
  FListaCompras.AdicionarItem(NovoItem);
end;

procedure TControllerListaCompras.MarcarItemComoPronto(Index: Integer);
begin
  FListaCompras.MarcarComoPronto(Index);
end;

procedure TControllerListaCompras.RemoverItem(Index: Integer);
var
  Item: TItemCompra;
begin
  Item := FListaCompras.ObterTodosItens[Index];
  FListaCompras.RemoverItem(Item);
end;

procedure TControllerListaCompras.RemoverItensProntos;
begin
  FListaCompras.RemoverItensProntos;
end;

procedure TControllerListaCompras.SalvarItensDatabaseLocal;
begin
  FListaCompras.SalvarItensnoBancoLocal;
end;

procedure TControllerListaCompras.SalvarItensDatabaseServidor;
begin
  FListaCompras.SalvarItensnoBancoServidor;
end;

function TControllerListaCompras.ObterItensPorCategoria(Categoria: TCategoria): TObjectList<TItemCompra>;
begin
  Result := FListaCompras.ObterItensPorCategoria(Categoria);
end;

function TControllerListaCompras.ObterTodosItens: TObjectList<TItemCompra>;
begin
  Result := FListaCompras.ObterTodosItens;
end;

function TControllerListaCompras.ObterNomesItens: TArray<string>;
var
  LItem: TItemCompra;
  ListaNomes: TList<string>;
begin
  ListaNomes := TList<string>.Create;
  try
    for LItem in FListaCompras.ObterTodosItens do
      ListaNomes.Add(LItem.Nome);
    Result := ListaNomes.ToArray;
  finally
    ListaNomes.Free;
  end;
end;


end.
