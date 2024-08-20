program TextToSpeech_P;

uses
  Forms,
  TextToSpeech_U in 'TextToSpeech_U.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
