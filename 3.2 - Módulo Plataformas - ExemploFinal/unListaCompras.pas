unit unListaCompras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unExemplo, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, unDataModule;

type
  TfListaCompras = class(TForm1)
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource2: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fListaCompras: TfListaCompras;

implementation

{$R *.dfm}

procedure TfListaCompras.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

  DataModule2.qrProdutos.Edit;
  DataModule2.qrProdutos.FieldbyName('PRONTO').asBoolean := (not DataModule2.qrProdutos.FieldbyName('PRONTO').asBoolean);
  DataModule2.qrProdutos.Post;
end;

procedure TfListaCompras.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if (DataSource1.DataSet.FieldByName('PRONTO').AsBoolean) then
  begin
    DBGrid1.Canvas.Font.Color := clGray;
  end
  else
  begin
    DBGrid1.Canvas.Font.Color := clBlack;
  end;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);


end;

procedure TfListaCompras.FormCreate(Sender: TObject);
begin
  inherited;

  DataModule2.qrProdutos.Open;
  DataModule2.Qrcategoria.Open;
end;

end.
