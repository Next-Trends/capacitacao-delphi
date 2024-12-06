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
    NumberBox1: TNumberBox;
    btIF: TButton;
    btCase: TButton;
    Panel3: TPanel;
    Memo1: TMemo;
    Label2: TLabel;
    btFORto: TButton;
    BtForIn: TButton;
    btWhile: TButton;
    btRepeat: TButton;
    procedure btCaseClick(Sender: TObject);
    procedure btIFClick(Sender: TObject);
    procedure btFORtoClick(Sender: TObject);
    procedure BtForInClick(Sender: TObject);
    procedure btWhileClick(Sender: TObject);
    procedure btRepeatClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtForInClick(Sender: TObject);
var
  LLista : TStringList;
  LElemento: String;
begin
  LLista := TStringList.Create; //Criar o nosso objeto lista de string
  try
    LLista.Add('testeum'); //adicionar os valores
    LLista.Add('testedois');
    LLista.Add('testetres');

    for LElemento in LLista do
    begin
      Memo1.Lines.Add(LElemento); //Alimentar o Memo com os Valores
    end;
  finally
    LLista.Free;
  end;

end;

procedure TForm1.btFORtoClick(Sender: TObject);
begin
  for var I := 10 downto 0 do
  begin
    var B := I;
  end;

end;

procedure TForm1.btIfClick(Sender: TObject);
var
  LValue: String;
begin
  LValue := NumberBox1.Value.ToString;

  if (LValue = '0') or (LValue = '5') then
    showmessage('ZERO ou cinco')
  else if LValue = '2' then
    showmessage('DOIS')
  else
    showmessage('não é zero');

end;

procedure TForm1.btRepeatClick(Sender: TObject);
var
  A: Integer;
begin
  A := 1;

  repeat
    A := A + 1;
  until (A > 5);
end;

procedure TForm1.btWhileClick(Sender: TObject);
var
  A: Integer;
begin
  A := 1;

  while (A < 5) do
  begin
    A := A + 1;
  end;

end;

procedure TForm1.btCaseClick(Sender: TObject);
var
  LValue: Integer;
begin
  LValue := NumberBox1.ValueInt;

  case LValue of
    1: showmessage('um');
    2: showmessage('dois');
    else showmessage('outra coisa');
  end;

end;

end.
