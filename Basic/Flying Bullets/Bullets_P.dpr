program Bullets_P;

uses
  Forms,
  Bullets_U in 'Bullets_U.pas' {Form1},
  Bullets in 'Bullets.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
