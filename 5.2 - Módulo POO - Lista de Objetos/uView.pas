unit uView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Bind.Controls,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.Buttons, Vcl.Bind.Navigator,
  Vcl.StdCtrls, Vcl.ExtCtrls, Models.Produtos, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, StrUtils;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ListBox1: TListBox;
    btIncluir: TButton;
    btExcluir: TButton;
    btObterTodos: TButton;
    Panel3: TPanel;
    edtNome: TEdit;
    Label1: TLabel;
    chbPronto: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btObterTodosClick(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
  private
    FObjetoLista: TListaCompras;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btExcluirClick(Sender: TObject);
var
  I: Integer;
begin
  for I := FObjetoLista.ObterTodosItens.Count - 1 downto 0 do
  begin
    if (FObjetoLista.ObterTodosItens[I].Nome = edtNome.Text) and
       (FObjetoLista.ObterTodosItens[I].Categoria = PADARIA) and
       (FObjetoLista.ObterTodosItens[I].Pronto = chbPronto.checked) then
    begin
      FObjetoLista.ObterTodosItens.Delete(I); // Remove o item com as mesmas propriedades
      Break; // Interrompe o loop após encontrar e remover o item
    end;
  end;
end;

procedure TForm1.btIncluirClick(Sender: TObject);
begin
  var LItem := TItemCompra.Create;
  LItem.Nome := edtNome.Text;
  LItem.Categoria := PADARIA;
  LItem.Pronto := chbPronto.Checked;

  FObjetoLista.AdicionarItem(LItem);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FObjetoLista := TListaCompras.Create;
end;

procedure TForm1.ListBox1DblClick(Sender: TObject);
var
  LSelectedItemIndex: Integer;
  LItemSelecionado: TItemCompra;
begin
  LSelectedItemIndex := ListBox1.ItemIndex;

  if LSelectedItemIndex <> -1 then
  begin
    LItemSelecionado := FObjetoLista.ObterTodosItens[LSelectedItemIndex];
    edtNome.Text := LItemSelecionado.Nome;
    chbPronto.Checked := LItemSelecionado.Pronto;
  end;
end;

procedure TForm1.btObterTodosClick(Sender: TObject);
begin
  ListBox1.Items.Clear;

  for var I := FObjetoLista.ObterTodosItens.Count - 1 downto 0 do
  begin
    ListBox1.Items.Add('Produto: ' + FObjetoLista.ObterTodosItens[I].Nome +
                       ' Pronto: ' +
                       ifthen(FObjetoLista.ObterTodosItens[I].Pronto, 'Sim', 'Não'));
  end;
end;

end.
