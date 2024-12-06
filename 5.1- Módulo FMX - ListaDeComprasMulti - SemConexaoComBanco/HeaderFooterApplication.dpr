program HeaderFooterApplication;

uses
  System.StartUpCopy,
  FMX.Forms,
  HeaderFooterTemplate in 'HeaderFooterTemplate.pas' {View},
  Models.Produtos in 'Models\Models.Produtos.pas',
  Controller.Produtos in 'Controllers\Controller.Produtos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TView, View);
  Application.Run;
end.
