program prjListaCompras;

uses
  Vcl.Forms,
  unExemplo in 'unExemplo.pas' {Form1},
  unDataModule in 'unDataModule.pas' {DataModule2: TDataModule},
  unListaCompras in 'unListaCompras.pas' {fListaCompras},
  unPrincipal in 'unPrincipal.pas' {Principal},
  unCategoria in 'unCategoria.pas' {fCategorias},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Cyan Dusk');
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfListaCompras, fListaCompras);
  Application.CreateForm(TfCategorias, fCategorias);
  Application.Run;
end.
