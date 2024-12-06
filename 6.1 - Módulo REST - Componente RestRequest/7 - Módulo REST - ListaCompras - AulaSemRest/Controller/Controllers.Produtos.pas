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
    procedure SalvarItensDatabase;
    procedure BuscarItensDatabase;
    function ObterItensPorCategoria(Categoria: TCategoria): TObjectList<TItemCompra>;
    function ObterTodosItens: TObjectList<TItemCompra>;
  end;

implementation

procedure TControllerListaCompras.BuscarItensDatabase;
begin
  FListaCompras.CarregarItensDoBanco;
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

procedure TControllerListaCompras.SalvarItensDatabase;
begin
  FListaCompras.SalvarItensnoBanco;
end;

function TControllerListaCompras.ObterItensPorCategoria(Categoria: TCategoria): TObjectList<TItemCompra>;
begin
  Result := FListaCompras.ObterItensPorCategoria(Categoria);
end;

function TControllerListaCompras.ObterTodosItens: TObjectList<TItemCompra>;
begin
  Result := FListaCompras.ObterTodosItens;
end;


end.
