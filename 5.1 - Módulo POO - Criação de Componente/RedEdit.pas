unit RedEdit;

interface

uses
  System.SysUtils, System.Classes, Vcl.Controls, Vcl.StdCtrls, Vcl.Graphics;

type
  TRedBorderEdit = class(TEdit)
  private
    procedure WMNCPaint(var Message: TMessage); message WM_NCPAINT;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TRedBorderEdit]);
end;

{ TRedBorderEdit }

procedure TRedBorderEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or WS_BORDER;  // Define a borda
end;

procedure TRedBorderEdit.WMNCPaint(var Message: TMessage);
var
  DC: HDC;
  R: TRect;
  Brush: HBRUSH;
begin
  inherited;

  // Obtém o DC da área de não-cliente (a área da borda)
  DC := GetWindowDC(Handle);
  try
    GetWindowRect(Handle, R);
    OffsetRect(R, -R.Left, -R.Top);

    // Define a cor vermelha para a borda
    Brush := CreateSolidBrush(RGB(255, 0, 0));
    FrameRect(DC, R, Brush);
    DeleteObject(Brush);
  finally
    ReleaseDC(Handle, DC);
  end;
end;

end.

