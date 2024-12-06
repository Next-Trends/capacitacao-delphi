unit HeaderFooterTemplate;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.Edit, FMX.Controls.Presentation, Controllers.Produtos, Types.Categoria, Models.Produtos,
  FireDAC.UI.Intf, FireDAC.FMXUI.Wait, FireDAC.Stan.Intf, FireDAC.Comp.UI;

type
  TView = class(TForm)
    Header: TToolBar;
    Footer: TToolBar;
    HeaderLabel: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    ListView1: TListView;
    btRemover: TButton;
    btSalvarBanco: TButton;
    btTrazerDB: TButton;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure btDeleteClick(Sender: TObject);
    procedure btRemoverClick(Sender: TObject);
    procedure btTrazerDBClick(Sender: TObject);
    procedure btSalvarBancoClick(Sender: TObject);
  private
    { Private declarations }
    FController : TControllerListaCompras;
    procedure AtualizarView;
  public
    { Public declarations }
  end;

var
  View: TView;

implementation

uses
  System.Generics.Collections;

{$R *.fmx}

procedure TView.Button1Click(Sender: TObject);
begin
  FController.AdicionarItem(Edit1.text, TCategoria.PADARIA);
  AtualizarView;
end;

procedure TView.btDeleteClick(Sender: TObject);
begin
  FController.RemoverItensProntos;
  AtualizarView;
end;

procedure TView.btRemoverClick(Sender: TObject);
begin
  FController.RemoverItensProntos;
  AtualizarView;
end;

procedure TView.btSalvarBancoClick(Sender: TObject);
begin
  FController.SalvarItensDatabase;
end;

procedure TView.btTrazerDBClick(Sender: TObject);
begin
  FController.BuscarItensDatabase;
  AtualizarView;
end;

procedure TView.FormCreate(Sender: TObject);
begin
  FController := TControllerListaCompras.Create;

  FController.AdicionarItem('Pão', TCategoria.PADARIA);
  FController.AdicionarItem('manteiga', TCategoria.PADARIA);

  AtualizarView;
end;

procedure TView.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  FController.MarcarItemComoPronto(AItem.Index);
end;

procedure TView.AtualizarView;
var
  LItem: TItemCompra;
  LListaItem: TListViewItem;
  LItens: TObjectList<TItemCompra>;
begin
  ListView1.Items.Clear;

  LItens := FController.ObterTodosItens;

  for LItem in LItens do
  begin
    LListaItem := ListView1.Items.Add;

    LListaItem.text := LItem.Nome;
  end;
end;

end.
