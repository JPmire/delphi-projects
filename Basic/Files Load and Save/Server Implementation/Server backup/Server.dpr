program Server;

uses
  Forms,
  ServerUnit in 'ServerUnit.pas' {frmServer},
  ServerMethodsUnit in 'ServerMethodsUnit.pas' {ServerMethods1: TDSServerModule},
  ServerContainerUnit in 'ServerContainerUnit.pas' {ServerContainer1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmServer, frmServer);
  Application.CreateForm(TServerMethods1, ServerMethods1);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.




