unit unCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unExemplo, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, unDatamodule;

type
  TfCategorias = class(TForm1)
    DBEdit2: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCategorias: TfCategorias;

implementation

{$R *.dfm}

procedure TfCategorias.FormCreate(Sender: TObject);
begin
  inherited;

  DataModule2.qrCategoria.Open;
end;

end.
