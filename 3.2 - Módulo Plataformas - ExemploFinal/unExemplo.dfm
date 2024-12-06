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
    ExplicitTop = -5
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 360
      Height = 79
      Align = alLeft
      Caption = 'Panel3'
      ShowCaption = False
      TabOrder = 0
      object DBEdit1: TDBEdit
        Left = 16
        Top = 29
        Width = 169
        Height = 23
        DataSource = DataSource1
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 361
      Top = 1
      Width = 262
      Height = 79
      Align = alClient
      Caption = 'Panel3'
      ShowCaption = False
      TabOrder = 1
      ExplicitLeft = 312
      ExplicitTop = 20
      ExplicitWidth = 185
      ExplicitHeight = 41
      object DBNavigator1: TDBNavigator
        Left = 1
        Top = 1
        Width = 260
        Height = 77
        DataSource = DataSource1
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 6
        ExplicitTop = 27
        ExplicitWidth = 240
        ExplicitHeight = 25
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 624
    Height = 360
    Align = alClient
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
    ExplicitLeft = 192
    ExplicitTop = 344
    ExplicitWidth = 185
    ExplicitHeight = 41
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 622
      Height = 358
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object DataSource1: TDataSource
    Left = 168
    Top = 233
  end
end
