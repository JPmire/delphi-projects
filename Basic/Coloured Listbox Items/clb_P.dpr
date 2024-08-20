program clb_P;

uses
  Forms,
  clb_U in 'clb_U.pas' {Form1},
  ColoredListBox in 'ColoredListBox.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
