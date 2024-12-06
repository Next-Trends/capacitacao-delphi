unit HeaderFooterTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, Models.Produtos, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, Controller.Produtos,
  FMX.Edit, FireDAC.UI.Intf, FireDAC.FMXUI.Wait, FireDAC.Stan.Intf,
  FireDAC.Comp.UI, System.ImageList, FMX.ImgList;

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
    CornerButton2: TCornerButton;
    CornerButton3: TCornerButton;
    CornerButton4: TCornerButton;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    ImageList1: TImageList;
    StyleBook1: TStyleBook;
    procedure FormCreate(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure ListViewComprasItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure CornerButton4Click(Sender: TObject);
    procedure CornerButton2Click(Sender: TObject);
  private
    FController: TControllerListaCompras;
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

procedure TView.CornerButton2Click(Sender: TObject);
begin
  FController.SalvarItensDatabase;
end;

procedure TView.CornerButton4Click(Sender: TObject);
begin
  FController.BuscarItensDatabase;
  AtualizarView;
end;

procedure TView.FormCreate(Sender: TObject);
begin
  FController := TControllerListaCompras.Create;

  // Carregar alguns dados de exemplo
  FController.AdicionarItem('Pão', 6, 10, TCategoria.Padaria);
  FController.AdicionarItem('Leite', 2, 5, TCategoria.Mercearia);

  AtualizarView;
end;

procedure TView.ListViewComprasItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  FController.MarcarItemComoPronto(AItem.Index);
end;

end.
