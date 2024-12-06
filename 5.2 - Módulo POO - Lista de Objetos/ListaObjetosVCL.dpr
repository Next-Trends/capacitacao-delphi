program ListaObjetosVCL;

uses
  Vcl.Forms,
  uView in 'uView.pas' {Form1},
  Models.Produtos in 'Models.Produtos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
