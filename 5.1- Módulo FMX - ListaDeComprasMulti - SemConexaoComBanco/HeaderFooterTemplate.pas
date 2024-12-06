unit HeaderFooterTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, Models.Produtos, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, Controller.Produtos,
  FMX.Edit;

type
  TView = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    ListViewCompras: TListView;
    Label1: TLabel;
    CornerButton1: TCornerButton;
    Edit1: TEdit;
    btDelete: TCornerButton;
    procedure FormCreate(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure ListViewComprasItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    FController: TControllerListaCompras;
    procedure AtualizarView(Categoria: TCategoria); overload;
    procedure AtualizarView; overload;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  View: TView;

implementation

uses
  System.Generics.Collections;

{$R *.fmx}

procedure TView.AtualizarView(Categoria: TCategoria);
var
  Item: TItemCompra;
  ListItem: TListViewItem;
  Itens: TObjectList<TItemCompra>;
begin
  ListViewCompras.Items.Clear;

  Itens := FController.ObterItensPorCategoria(Categoria);

  for Item in Itens do
  begin
    ListItem := ListViewCompras.Items.Add;
    ListItem.Text := Item.Nome;
    if Item.Pronto then
      ListItem.Text := ListItem.Text + ' ✓';  // Marcar visualmente o item como comprado
  end;
end;

procedure TView.AtualizarView;
var
  Item: TItemCompra;
  ListItem: TListViewItem;
  Itens: TObjectList<TItemCompra>;
begin
  ListViewCompras.Items.Clear;

  Itens := FController.ObterTodosItens;

  for Item in Itens do
  begin
    ListItem := ListViewCompras.Items.Add;
    ListItem.Text := Item.Nome;
    if Item.Pronto then
      ListItem.Text := ListItem.Text + 'pronto';
  end;
end;

procedure TView.btDeleteClick(Sender: TObject);
begin
  FController.RemoverItensProntos;
  AtualizarView;
end;

procedure TView.CornerButton1Click(Sender: TObject);
begin
  FController.AdicionarItem(Edit1.text, 2, 5, TCategoria.Mercearia);
  AtualizarView;
end;

procedure TView.FormCreate(Sender: TObject);
begin
  FController := TControllerListaCompras.Create;

  // Carregar alguns dados de exemplo
  FController.AdicionarItem('Pão', 6, 10, TCategoria.Padaria);
  FController.AdicionarItem('Leite', 2, 5, TCategoria.Mercearia);

  //AtualizarView(TCategoria.Padaria);
  AtualizarView;
end;

procedure TView.ListViewComprasItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  FController.MarcarItemComoPronto(AItem.Index);
end;

end.
