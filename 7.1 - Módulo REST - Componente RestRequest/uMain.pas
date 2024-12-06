unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Vcl.StdCtrls, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, REST.Response.Adapter,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    RESTRequest1: TRESTRequest;
    RESTClient1: TRESTClient;
    RESTResponse1: TRESTResponse;
    Button1: TButton;
    btExecutar: TButton;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    procedure btExecutarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btExecutarClick(Sender: TObject);
begin
  RESTREQUEST1.Execute;

  Memo1.Lines.Text := RestResponse1.Content;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  RESTClient1.BaseURL := 'https://reqres.in';
  RESTRequest1.Client := RESTClient1;
  RESTRequest1.Response := RESTResponse1;
  RESTRequest1.Resource := '/api/users';
  RESTRequest1.Method := TRESTRequestMethod.rmPOST;

  RESTRequest1.AddBody('{"name": "John", "job": "Developer"}', TRESTContentType.ctAPPLICATION_JSON);

  RESTRequest1.Execute;
  ShowMessage('POST Response: ' + RESTResponse1.Content);
end;

end.
