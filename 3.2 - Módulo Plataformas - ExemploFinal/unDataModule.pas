unit unDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDataModule2 = class(TDataModule)
    FDConnection1: TFDConnection;
    qrProdutos: TFDQuery;
    qrProdutosID: TIntegerField;
    qrProdutosNOMEPRODUTO: TStringField;
    qrProdutosID_CATEGORIA: TIntegerField;
    qrProdutosPRONTO: TBooleanField;
    qrCategoria: TFDQuery;
    qrCategoriaID: TIntegerField;
    qrCategoriaNOMECATEGORIA: TStringField;
    qrCategoriaORDEM: TIntegerField;
    FDUpdateSQL1: TFDUpdateSQL;
    qrProdutosID_1: TIntegerField;
    qrProdutosNOMECATEGORIA: TStringField;
    qrProdutosORDEM: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure qrProdutosAfterInsert(DataSet: TDataSet);
    procedure qrCategoriaAfterInsert(DataSet: TDataSet);
  private
    function RetornaID(const ATabela: String): Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
  FDConnection1.Connected := True;
end;

procedure TDataModule2.DataModuleDestroy(Sender: TObject);
begin
  FDConnection1.Close;
end;

procedure TDataModule2.qrCategoriaAfterInsert(DataSet: TDataSet);
begin
  if DataSet.FieldByName('ID').IsNull then
    DataSet.FieldbyName('ID').asInteger := RetornaID('CATEGORIA');
end;

procedure TDataModule2.qrProdutosAfterInsert(DataSet: TDataSet);
begin
  if DataSet.FieldByName('ID').IsNull then
    DataSet.FieldbyName('ID').asInteger := RetornaID('PRODUTOS');
end;

function TDataModule2.RetornaID(const ATabela: String): Integer;
begin
  var LQuery := TFDQuery.Create(Self);
  try
    LQuery.Connection := FDConnection1;
    LQuery.Open('select max(id) + 1 as proxID from ' + ATabela);

    Result := LQuery.FieldbyName('proxID').asInteger;
  finally
    LQuery.Free;
  end;
end;

end.
