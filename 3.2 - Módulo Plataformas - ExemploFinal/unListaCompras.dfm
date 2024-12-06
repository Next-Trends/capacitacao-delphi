inherited fListaCompras: TfListaCompras
  Caption = 'fListaCompras'
  StyleElements = [seFont, seClient, seBorder]
  OnCreate = FormCreate
  TextHeight = 15
  inherited Panel1: TPanel
    StyleElements = [seFont, seClient, seBorder]
    inherited Panel3: TPanel
      StyleElements = [seFont, seClient, seBorder]
      inherited DBEdit1: TDBEdit
        DataField = 'NOMEPRODUTO'
        StyleElements = [seFont, seClient, seBorder]
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 191
        Top = 29
        Width = 154
        Height = 23
        DataField = 'ID_CATEGORIA'
        DataSource = DataSource1
        KeyField = 'ID'
        ListField = 'NOMECATEGORIA'
        ListSource = DataSource2
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
    inherited DBGrid1: TDBGrid
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NOMEPRODUTO'
          Title.Caption = 'Produto'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMECATEGORIA'
          Title.Caption = 'Categoria'
          Visible = True
        end>
    end
  end
  inherited DataSource1: TDataSource
    DataSet = DataModule2.qrProdutos
  end
  object DataSource2: TDataSource
    DataSet = DataModule2.qrCategoria
    Left = 272
    Top = 105
  end
end
