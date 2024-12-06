object Principal: TPrincipal
  Left = 0
  Top = 0
  Caption = 'Lista de Compras'
  ClientHeight = 231
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object btCategoria: TButton
    Left = 0
    Top = 0
    Width = 624
    Height = 121
    Align = alTop
    Caption = 'Cadastro de Categorias'
    TabOrder = 0
    StyleElements = []
    StyleName = 'Windows'
    OnClick = btCategoriaClick
  end
  object btListaCompras: TButton
    Left = 0
    Top = 121
    Width = 624
    Height = 110
    Align = alClient
    Caption = 'Lista de Compras'
    TabOrder = 1
    StyleElements = []
    StyleName = 'Windows'
    OnClick = btListaComprasClick
    ExplicitTop = 145
    ExplicitHeight = 86
  end
end
