object dmPropertyHub: TdmPropertyHub
  OldCreateOrder = False
  Height = 456
  Width = 882
  object conProperties: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Property.mdb;Persis' +
      't Security Info=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 294
    Top = 55
  end
  object tblProperties: TADOTable
    Connection = conProperties
    TableName = 'tblProperties'
    Left = 262
    Top = 143
  end
  object tblListings: TADOTable
    Connection = conProperties
    TableName = 'tblListings'
    Left = 362
    Top = 141
  end
  object dsProperties: TDataSource
    DataSet = tblProperties
    Left = 260
    Top = 216
  end
  object dsListings: TDataSource
    DataSet = tblListings
    Left = 361
    Top = 219
  end
end
