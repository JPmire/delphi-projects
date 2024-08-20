program tictactoe_P;

uses
  Forms,
  tictactoe_U in 'tictactoe_U.pas' {frmTicTacToe};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTicTacToe, frmTicTacToe);
  Application.Run;
end.
