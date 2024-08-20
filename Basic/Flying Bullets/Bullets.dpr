program Bullets;

uses
  Forms,
  Bullets_P in 'Bullets_P.pas' {Form1},
  Bullets_U in 'Bullets_U.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
