unit Controller.Produtos;

interface

uses
  Models.produtos, System.Generics.Collections;

type
  TControllerListaCompras = class
  private
    FListaCompras: TListaCompras;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AdicionarItem(Nome: string; Quantidade: Integer; Preco: Currency; Categoria: TCategoria);
    procedure MarcarItemComoPronto(Index: Integer);
    procedure RemoverItem(Index: Integer);
    procedure RemoverItensProntos;
    function ObterItensPorCategoria(Categoria: TCategoria): TObjectList<TItemCompra>;
    function ObterTodosItens: TObjectList<TItemCompra>;
  end;

implementation

constructor TControllerListaCompras.Create;
begin
  FListaCompras := TListaCompras.Create;
end;

destructor TControllerListaCompras.Destroy;
begin
  FListaCompras.Free;
  inherited;
end;

procedure TControllerListaCompras.AdicionarItem(Nome: string; Quantidade: Integer; Preco: Currency; Categoria: TCategoria);
var
  NovoItem: TItemCompra;
begin
  NovoItem := TItemCompra.Create;
  NovoItem.Nome := Nome;
  NovoItem.Categoria := Categoria;
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

function TControllerListaCompras.ObterItensPorCategoria(Categoria: TCategoria): TObjectList<TItemCompra>;
begin
  Result := FListaCompras.ObterItensPorCategoria(Categoria);
end;

function TControllerListaCompras.ObterTodosItens: TObjectList<TItemCompra>;
begin
  Result := FListaCompras.ObterTodosItens;
end;


end.
