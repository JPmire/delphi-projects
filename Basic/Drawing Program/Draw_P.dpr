program Draw_P;

uses
  Forms,
  Draw_U in 'Draw_U.pas' {frmDraw};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDraw, frmDraw);
  Application.Run;
end.
