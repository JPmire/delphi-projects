object dmPropertyHub: TdmPropertyHub
  OldCreateOrder = False
  Height = 456
  Width = 1021
  object conProperties: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=Prope' +
      'rty.mdb;Mode=ReadWrite;Persist Security Info=False;Jet OLEDB:Sys' +
      'tem database="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Pa' +
      'ssword="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mod' +
      'e=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Tr' +
      'ansactions=1;Jet OLEDB:New Database Password="";Jet OLEDB:Create' +
      ' System Database=False;Jet OLEDB:Encrypt Database=False;Jet OLED' +
      'B:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact Without R' +
      'eplica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 537
    Top = 35
  end
  object tblProperties: TADOTable
    Active = True
    Connection = conProperties
    CursorType = ctStatic
    TableName = 'tblProperties'
    Left = 70
    Top = 109
  end
  object tblListings: TADOTable
    Active = True
    Connection = conProperties
    CursorType = ctStatic
    TableName = 'tblListings'
    Left = 181
    Top = 115
  end
  object dsProperties: TDataSource
    DataSet = qryProperties
    Left = 71
    Top = 181
  end
  object dsListings: TDataSource
    DataSet = qryListings
    Left = 181
    Top = 186
  end
  object qryProperties: TADOQuery
    Connection = conProperties
    Parameters = <>
    Left = 66
    Top = 263
  end
  object qryListings: TADOQuery
    Connection = conProperties
    Parameters = <>
    Left = 180
    Top = 262
  end
  object tblClients: TADOTable
    Active = True
    Connection = conProperties
    CursorType = ctStatic
    TableName = 'tblClients'
    Left = 274
    Top = 112
  end
  object tblOffers: TADOTable
    Active = True
    Connection = conProperties
    CursorType = ctStatic
    TableName = 'tblOffers'
    Left = 409
    Top = 117
  end
  object tblOwners: TADOTable
    Active = True
    Connection = conProperties
    CursorType = ctStatic
    TableName = 'tblOwners'
    Left = 534
    Top = 115
  end
  object tblSales: TADOTable
    Active = True
    Connection = conProperties
    CursorType = ctStatic
    TableName = 'tblSales'
    Left = 703
    Top = 119
  end
  object dsClients: TDataSource
    DataSet = qryClients
    Left = 274
    Top = 183
  end
  object dsOffers: TDataSource
    DataSet = qryOffers
    Left = 402
    Top = 183
  end
  object dsOwners: TDataSource
    DataSet = qryOwners
    Left = 533
    Top = 192
  end
  object dsSales: TDataSource
    DataSet = qrySales
    Left = 703
    Top = 205
  end
  object qryClients: TADOQuery
    Connection = conProperties
    Parameters = <>
    Left = 276
    Top = 263
  end
  object qryOffers: TADOQuery
    Connection = conProperties
    Parameters = <>
    Left = 402
    Top = 259
  end
  object qryOwners: TADOQuery
    Connection = conProperties
    Parameters = <>
    Left = 535
    Top = 262
  end
  object qrySales: TADOQuery
    Connection = conProperties
    Parameters = <>
    Left = 704
    Top = 270
  end
end
