object DataModule2: TDataModule2
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\PRODUTOS.FDB'
      'DriverID=FB'
      'Password=masterkey'
      'User_Name=SYSDBA'
      'Server=localhost')
    Connected = True
    LoginPrompt = False
    Left = 72
    Top = 40
  end
  object qrProdutos: TFDQuery
    AfterInsert = qrProdutosAfterInsert
    Connection = FDConnection1
    UpdateObject = FDUpdateSQL1
    SQL.Strings = (
      'select * from produtos p '
      'left join categoria c on p.id_categoria = c.id '
      'order by p.pronto, c.ordem')
    Left = 80
    Top = 192
    object qrProdutosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrProdutosNOMEPRODUTO: TStringField
      FieldName = 'NOMEPRODUTO'
      Origin = 'NOMEPRODUTO'
      Size = 100
    end
    object qrProdutosID_CATEGORIA: TIntegerField
      FieldName = 'ID_CATEGORIA'
      Origin = 'ID_CATEGORIA'
    end
    object qrProdutosPRONTO: TBooleanField
      FieldName = 'PRONTO'
      Origin = 'PRONTO'
    end
    object qrProdutosID_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_1'
      Origin = 'ID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qrProdutosNOMECATEGORIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOMECATEGORIA'
      Origin = 'NOMECATEGORIA'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qrProdutosORDEM: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qrCategoria: TFDQuery
    AfterInsert = qrCategoriaAfterInsert
    Connection = FDConnection1
    SQL.Strings = (
      '            select * from categoria')
    Left = 184
    Top = 112
    object qrCategoriaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrCategoriaNOMECATEGORIA: TStringField
      FieldName = 'NOMECATEGORIA'
      Origin = 'NOMECATEGORIA'
      Size = 50
    end
    object qrCategoriaORDEM: TIntegerField
      FieldName = 'ORDEM'
      Origin = 'ORDEM'
    end
  end
  object FDUpdateSQL1: TFDUpdateSQL
    Connection = FDConnection1
    InsertSQL.Strings = (
      'INSERT INTO PRODUTOS'
      '(ID, NOMEPRODUTO, ID_CATEGORIA, PRONTO)'
      
        'VALUES (:NEW_ID, :NEW_NOMEPRODUTO, :NEW_ID_CATEGORIA, :NEW_PRONT' +
        'O)'
      'RETURNING ID')
    ModifySQL.Strings = (
      'UPDATE PRODUTOS'
      
        'SET ID = :NEW_ID, NOMEPRODUTO = :NEW_NOMEPRODUTO, ID_CATEGORIA =' +
        ' :NEW_ID_CATEGORIA, '
      '  PRONTO = :NEW_PRONTO'
      'WHERE ID = :OLD_ID'
      'RETURNING ID')
    DeleteSQL.Strings = (
      'DELETE FROM PRODUTOS'
      'WHERE ID = :OLD_ID')
    FetchRowSQL.Strings = (
      'SELECT ID, NOMEPRODUTO, ID_CATEGORIA, PRONTO'
      'FROM PRODUTOS'
      'WHERE ID = :OLD_ID')
    Left = 344
    Top = 176
  end
end
