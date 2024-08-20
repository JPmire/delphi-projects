program Dynamite_P;

uses
  Forms,
  Dynamite_U in 'Dynamite_U.pas' {frmKaboom};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmKaboom, frmKaboom);
  Application.Run;
end.
