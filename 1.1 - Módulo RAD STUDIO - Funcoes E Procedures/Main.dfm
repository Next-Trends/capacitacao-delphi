object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 77
  ClientWidth = 471
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 471
    Height = 77
    Margins.Top = 8
    Align = alClient
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    ExplicitHeight = 140
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 469
      Height = 75
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 185
      ExplicitHeight = 138
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 467
        Height = 15
        Align = alTop
        Caption = 'Valor Condicionais:'
        ExplicitLeft = 0
        ExplicitTop = -5
      end
      object btBotao: TButton
        Left = 1
        Top = 42
        Width = 467
        Height = 32
        Align = alBottom
        Caption = 'Me aperte'
        TabOrder = 0
        OnClick = btBotaoClick
        ExplicitTop = 39
        ExplicitWidth = 183
      end
      object Edit1: TEdit
        Left = 1
        Top = 16
        Width = 467
        Height = 23
        Align = alTop
        TabOrder = 1
        ExplicitLeft = 136
        ExplicitTop = 8
        ExplicitWidth = 121
      end
    end
  end
end
