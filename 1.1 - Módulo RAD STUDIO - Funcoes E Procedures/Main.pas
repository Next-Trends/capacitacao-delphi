unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.NumberBox;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    btBotao: TButton;
    Edit1: TEdit;
    procedure btBotaoClick(Sender: TObject);
  private
    function RetornaTextoNovo(const ATextoAdicional: String): String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btBotaoClick(Sender: TObject);
begin
   var LText := 'ola';

   LText := Ltext + ' estudante';

   Edit1.text := Ltext + RetornaTextoNovo('BBBB');
end;

function TForm1.RetornaTextoNovo(const ATextoAdicional: String): String;
begin
  Result := 'TEXTO NOVO' + ATextoAdicional;
end;

end.
