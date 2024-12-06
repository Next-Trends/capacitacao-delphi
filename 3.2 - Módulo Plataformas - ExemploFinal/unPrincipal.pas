unit unPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, unListaCompras, unCategoria;

type
  TPrincipal = class(TForm)
    btCategoria: TButton;
    btListaCompras: TButton;
    procedure btListaComprasClick(Sender: TObject);
    procedure btCategoriaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

procedure TPrincipal.btCategoriaClick(Sender: TObject);
begin
  var LCategoria := TfCategorias.Create(Self);
  try
    LCategoria.ShowModal;
  finally
    LCategoria.Free;
  end;
end;

procedure TPrincipal.btListaComprasClick(Sender: TObject);
begin
  var LListaCompras := TfListaCompras.Create(Self);
  try
    LListaCompras.ShowModal;
  finally
    LListaCompras.Free;
  end;
end;

end.
