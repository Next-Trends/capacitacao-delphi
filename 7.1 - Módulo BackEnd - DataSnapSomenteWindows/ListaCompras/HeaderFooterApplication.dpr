program HeaderFooterApplication;

uses
  System.StartUpCopy,
  FMX.Forms,
  HeaderFooterTemplate in 'HeaderFooterTemplate.pas' {View},
  Connection.Database in '..\Connection\Connection.Database.pas',
  Controllers.Produtos in '..\Controller\Controllers.Produtos.pas',
  Models.Produtos in '..\Model\Models.Produtos.pas',
  Types.Categoria in '..\Types\Types.Categoria.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TView, View);
  Application.Run;
end.
