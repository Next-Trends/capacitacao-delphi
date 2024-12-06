inherited fCategorias: TfCategorias
  Caption = 'fCategorias'
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  TextHeight = 15
  inherited Panel1: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited Panel3: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited DBEdit1: TDBEdit
        DataField = 'NOMECATEGORIA'
        StyleElements = [seFont, seClient, seBorder]
      end
      object DBEdit2: TDBEdit
        Left = 208
        Top = 29
        Width = 121
        Height = 23
        DataField = 'ORDEM'
        DataSource = DataSource1
        TabOrder = 1
      end
    end
    inherited Panel4: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited DBNavigator1: TDBNavigator
        Hints.Strings = ()
      end
    end
  end
  inherited Panel2: TPanel
    StyleElements = [seFont, seClient, seBorder]
  end
  inherited DataSource1: TDataSource
    DataSet = DataModule2.qrCategoria
  end
end
