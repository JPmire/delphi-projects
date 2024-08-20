program PingPong_P;

uses
  Forms,
  PingPong_U in 'PingPong_U.pas' {frmPingPong};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPingPong, frmPingPong);
  Application.Run;
end.
