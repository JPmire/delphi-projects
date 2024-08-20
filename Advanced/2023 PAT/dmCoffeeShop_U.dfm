object dmCoffeeShop: TdmCoffeeShop
  OldCreateOrder = False
  Height = 475
  Width = 889
  object conCoffeeShop: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=Database\CoffeeShop' +
      '.mdb;Mode=ReadWrite|Share Deny None;Persist Security Info=False;' +
      'Jet OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLED' +
      'B:Database Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Databas' +
      'e Locking Mode=0;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:G' +
      'lobal Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet' +
      ' OLEDB:Create System Database=False;Jet OLEDB:Encrypt Database=F' +
      'alse;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Comp' +
      'act Without Replica Repair=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = ADODB
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 136
    Top = 56
  end
  object dsCustomers: TDataSource
    DataSet = tblCustomers
    Left = 48
    Top = 136
  end
  object dsInventory: TDataSource
    DataSet = tblInventory
    Left = 136
    Top = 136
  end
  object tblCustomers: TADOTable
    Active = True
    Connection = conCoffeeShop
    CursorLocation = clUseServer
    TableName = 'tblCustomers'
    Left = 48
    Top = 216
  end
  object tblInventory: TADOTable
    Active = True
    Connection = conCoffeeShop
    CursorType = ctStatic
    TableName = 'tblInventory'
    Left = 136
    Top = 216
  end
  object qryCustomers: TADOQuery
    Connection = conCoffeeShop
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM tblCustomers')
    Left = 48
    Top = 296
  end
  object qryInventory: TADOQuery
    Connection = conCoffeeShop
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM tblCustomers')
    Left = 144
    Top = 296
  end
  object qryOrders: TADOQuery
    Connection = conCoffeeShop
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM tblCustomers')
    Left = 232
    Top = 296
  end
  object dsOrders: TDataSource
    DataSet = tblOrders
    Left = 232
    Top = 136
  end
  object tblOrders: TADOTable
    Active = True
    Connection = conCoffeeShop
    CursorType = ctStatic
    TableName = 'tblOrders'
    Left = 232
    Top = 216
  end
end
