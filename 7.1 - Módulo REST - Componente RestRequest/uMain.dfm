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
    Height = 41
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitLeft = 384
    ExplicitTop = 200
    ExplicitWidth = 185
    object Button1: TButton
      Left = 313
      Top = 1
      Width = 310
      Height = 39
      Align = alClient
      Caption = 'Criar Usuario'
      TabOrder = 0
      OnClick = Button1Click
      ExplicitLeft = 175
      ExplicitTop = 0
      ExplicitWidth = 162
      ExplicitHeight = 25
    end
    object btExecutar: TButton
      Left = 1
      Top = 1
      Width = 312
      Height = 39
      Align = alLeft
      Caption = 'Executar'
      TabOrder = 1
      OnClick = btExecutarClick
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 313
    Height = 400
    Align = alLeft
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 313
    Top = 41
    Width = 311
    Height = 400
    Align = alClient
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 64
    Top = 88
  end
  object RESTClient1: TRESTClient
    BaseURL = 'https://reqres.in/api/users'
    Params = <>
    SynchronizedEvents = False
    Left = 64
    Top = 160
  end
  object RESTResponse1: TRESTResponse
    Left = 64
    Top = 240
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    ResponseJSON = RESTResponse1
    Left = 440
    Top = 208
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 448
    Top = 304
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 368
    Top = 104
  end
end
