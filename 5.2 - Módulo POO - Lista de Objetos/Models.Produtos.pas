unit Models.Produtos;

interface

uses System.Generics.Collections;

type
  TCategoria = (Padaria, Mercearia, Hortifruti, Bebidas);

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
    procedure MarcarComoPronto(Index: Integer);
    function ObterItensPorCategoria(ACategoria: TCategoria): TObjectList<TItemCompra>;
    function ObterTodosItens: TObjectList<TItemCompra>;
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


end.

