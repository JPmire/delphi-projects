object dmDatabases: TdmDatabases
  OldCreateOrder = False
  Height = 475
  Width = 889
  object conCoffeeShop: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\Skool\IT\Graad 1' +
      '1\IT PAT (2023)\Database\CoffeeShop.mdb;Mode=Share Deny None;Per' +
      'sist Security Info=False;Jet OLEDB:System database="";Jet OLEDB:' +
      'Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine' +
      ' Type=5;Jet OLEDB:Database Locking Mode=0;Jet OLEDB:Global Parti' +
      'al Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New' +
      ' Database Password="";Jet OLEDB:Create System Database=False;Jet' +
      ' OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Com' +
      'pact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OL' +
      'EDB:SFP=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 168
    Top = 48
  end
  object dsEmployees: TDataSource
    DataSet = tblEmployees
    Left = 152
    Top = 128
  end
  object tblEmployees: TADOTable
    Active = True
    Connection = conCoffeeShop
    CursorType = ctStatic
    TableName = 'tblEmployees'
    Left = 152
    Top = 216
  end
  object dsCustomers: TDataSource
    Left = 32
    Top = 128
  end
  object dsInventory: TDataSource
    Left = 248
    Top = 128
  end
  object tblCustomers: TADOTable
    Connection = conCoffeeShop
    TableName = 'tblCustomers'
    Left = 40
    Top = 216
  end
  object tblInventory: TADOTable
    Connection = conCoffeeShop
    TableName = 'tblInventory'
    Left = 256
    Top = 208
  end
end
