object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 140
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
    Height = 140
    Margins.Top = 8
    Align = alClient
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 185
      Height = 138
      Align = alLeft
      TabOrder = 0
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 183
        Height = 15
        Align = alTop
        Caption = 'Valor Condicionais:'
        ExplicitWidth = 101
      end
      object NumberBox1: TNumberBox
        Left = 1
        Top = 16
        Width = 183
        Height = 23
        Align = alTop
        MaxValue = 10.000000000000000000
        TabOrder = 0
      end
      object btIF: TButton
        Left = 1
        Top = 39
        Width = 183
        Height = 32
        Align = alTop
        Caption = 'Me Aperte IF'
        TabOrder = 1
        OnClick = btIFClick
      end
      object btCase: TButton
        Left = 1
        Top = 71
        Width = 183
        Height = 32
        Align = alTop
        Caption = 'Me Aperte case'
        TabOrder = 2
        OnClick = btCaseClick
      end
    end
    object Panel3: TPanel
      Left = 186
      Top = 1
      Width = 284
      Height = 138
      Align = alClient
      Caption = 'Panel3'
      ShowCaption = False
      TabOrder = 1
      object Label2: TLabel
        Left = 1
        Top = 1
        Width = 282
        Height = 15
        Align = alTop
        Caption = 'Valor Loopings:'
        ExplicitWidth = 81
      end
      object Memo1: TMemo
        Left = 5
        Top = 16
        Width = 185
        Height = 89
        TabOrder = 0
      end
      object btFORto: TButton
        Left = 196
        Top = 15
        Width = 75
        Height = 25
        Caption = 'FOR TO'
        TabOrder = 1
        OnClick = btFORtoClick
      end
      object BtForIn: TButton
        Left = 196
        Top = 46
        Width = 75
        Height = 25
        Caption = 'FOR IN'
        TabOrder = 2
        OnClick = BtForInClick
      end
      object btWhile: TButton
        Left = 196
        Top = 75
        Width = 75
        Height = 25
        Caption = 'WHILE'
        TabOrder = 3
        OnClick = btWhileClick
      end
      object btRepeat: TButton
        Left = 196
        Top = 104
        Width = 75
        Height = 25
        Caption = 'btRepeat'
        TabOrder = 4
        OnClick = btRepeatClick
      end
    end
  end
end
