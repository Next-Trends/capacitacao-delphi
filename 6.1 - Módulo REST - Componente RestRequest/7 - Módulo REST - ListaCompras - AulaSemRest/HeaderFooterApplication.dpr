program HeaderFooterApplication;

uses
  System.StartUpCopy,
  FMX.Forms,
  HeaderFooterTemplate in 'HeaderFooterTemplate.pas' {View},
  Models.Produtos in 'Model\Models.Produtos.pas',
  Controllers.Produtos in 'Controller\Controllers.Produtos.pas',
  Types.Categoria in 'Types\Types.Categoria.pas',
  Connection.Database in 'Connection\Connection.Database.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TView, View);
  Application.Run;
end.
