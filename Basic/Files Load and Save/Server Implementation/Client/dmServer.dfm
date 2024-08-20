object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 558
  Width = 755
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'ServerMethods1'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 328
    Top = 160
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'Datasnap'
    LoginPrompt = False
    Connected = True
    Left = 360
    Top = 264
  end
end
