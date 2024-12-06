object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 81
    Align = alTop
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object btIncluir: TButton
      Left = 16
      Top = 48
      Width = 75
      Height = 25
      Caption = 'btIncluir'
      TabOrder = 0
      OnClick = btIncluirClick
    end
    object btExcluir: TButton
      Left = 97
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = btExcluirClick
    end
    object btObterTodos: TButton
      Left = 178
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Obter'
      TabOrder = 2
      OnClick = btObterTodosClick
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 622
      Height = 41
      Align = alTop
      ShowCaption = False
      TabOrder = 3
      ExplicitLeft = 104
      ExplicitTop = 16
      ExplicitWidth = 185
      object Label1: TLabel
        Left = 16
        Top = 13
        Width = 43
        Height = 15
        Caption = 'Produto'
      end
      object edtNome: TEdit
        Left = 65
        Top = 10
        Width = 440
        Height = 23
        TabOrder = 0
      end
      object chbPronto: TCheckBox
        Left = 525
        Top = 13
        Width = 97
        Height = 17
        Caption = 'chbPronto'
        TabOrder = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 624
    Height = 360
    Align = alClient
    Caption = 'Panel2'
    ShowCaption = False
    TabOrder = 1
    ExplicitTop = 97
    ExplicitHeight = 344
    object ListBox1: TListBox
      Left = 1
      Top = 1
      Width = 622
      Height = 358
      Align = alClient
      ItemHeight = 15
      TabOrder = 0
      OnDblClick = ListBox1DblClick
      ExplicitLeft = 184
      ExplicitTop = 160
      ExplicitWidth = 121
      ExplicitHeight = 97
    end
  end
end
