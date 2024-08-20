program dil_P;

uses
  Forms,
  dil_U in 'dil_U.pas' {Form1},
  clsDynamicImageLoader in 'clsDynamicImageLoader.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
