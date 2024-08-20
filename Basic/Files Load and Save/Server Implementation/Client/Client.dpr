program Client;

uses
  Forms,
  ClientUnit in 'ClientUnit.pas' {Form1},
  dmServer in 'dmServer.pas' {DataModule1: TDataModule},
  ServerMethod in 'ServerMethod.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
