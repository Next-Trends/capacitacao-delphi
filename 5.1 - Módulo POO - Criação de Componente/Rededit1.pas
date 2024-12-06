unit Rededit1;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, VCL.Graphics;

type
  TRedEdit = class(TEdit)
  public
    procedure CreateWnd; override;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TRedEdit]);
end;

{ TRedEdit }

procedure TRedEdit.CreateWnd;
begin
  inherited;

  Font.Color := clRed;
end;

end.
