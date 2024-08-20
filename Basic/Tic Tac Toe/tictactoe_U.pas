unit tictactoe_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmTicTacToe = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnTic1: TButton;
    btnTic2: TButton;
    btnTic3: TButton;
    btnTic4: TButton;
    btnTic5: TButton;
    btnTic6: TButton;
    btnTic7: TButton;
    btnTic8: TButton;
    btnTic9: TButton;
    lblPlayerXCaption: TLabel;
    lblPlayerOCaption: TLabel;
    btnReset: TButton;
    btnNewGame: TButton;
    btnExit: TButton;
    lblPlayerX: TLabel;
    lblPlayerO: TLabel;
    lblCurrentPlayer: TLabel;
    tmrCurrentPlayer: TTimer;
    Label1: TLabel;
    Panel3: TPanel;
    procedure btnTic1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnTic2Click(Sender: TObject);
    procedure btnTic3Click(Sender: TObject);
    procedure btnTic4Click(Sender: TObject);
    procedure btnTic5Click(Sender: TObject);
    procedure btnTic6Click(Sender: TObject);
    procedure btnTic7Click(Sender: TObject);
    procedure btnTic8Click(Sender: TObject);
    procedure btnTic9Click(Sender: TObject);
    procedure tmrCurrentPlayerTimer(Sender: TObject);
    procedure btnNewGameClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
  private
    { Private declarations }
    bPlayerX : boolean;
    procedure ScoreKeeper;
    procedure Tiles_Enabled_False;

  public
    { Public declarations }
  end;

var
  frmTicTacToe: TfrmTicTacToe;

implementation

{$R *.dfm}

{ TfrmTicTacToe }

procedure TfrmTicTacToe.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmTicTacToe.btnNewGameClick(Sender: TObject);
begin
  btnTic1.Caption := '';
  btnTic2.Caption := '';
  btnTic3.Caption := '';
  btnTic4.Caption := '';
  btnTic5.Caption := '';
  btnTic6.Caption := '';
  btnTic7.Caption := '';
  btnTic8.Caption := '';
  btnTic9.Caption := '';

  btnTic1.Enabled := True;
  btnTic2.Enabled := True;
  btnTic3.Enabled := True;
  btnTic4.Enabled := True;
  btnTic5.Enabled := True;
  btnTic6.Enabled := True;
  btnTic7.Enabled := True;
  btnTic8.Enabled := True;
  btnTic9.Enabled := True;
end;

procedure TfrmTicTacToe.btnResetClick(Sender: TObject);
begin
  lblPlayerX.Caption := '0';
  lblPlayerO.Caption := '0';
end;

procedure TfrmTicTacToe.btnTic1Click(Sender: TObject);
begin
  if btnTic1.Caption <> '' then
  begin
    exit;
  end;

  if bPlayerX = True then
  begin
    btnTic1.Caption := 'x';
    bPlayerX := False;
  end else
  begin
    btnTic1.Caption := 'o';
    bPlayerX := True;
  end;
  ScoreKeeper;
end;

procedure TfrmTicTacToe.btnTic2Click(Sender: TObject);
begin
  if btnTic2.Caption <> '' then
  begin
    exit;
  end;

  if bPlayerX = True then
  begin
    btnTic2.Caption := 'x';
    bPlayerX := False;
  end else
  begin
    btnTic2.Caption := 'o';
    bPlayerX := True;
  end;
  ScoreKeeper;
end;

procedure TfrmTicTacToe.btnTic3Click(Sender: TObject);
begin
  if btnTic3.Caption <> '' then
  begin
    exit;
  end;

  if bPlayerX = True then
  begin
    btnTic3.Caption := 'x';
    bPlayerX := False;
  end else
  begin
    btnTic3.Caption := 'o';
    bPlayerX := True;
  end;
  ScoreKeeper;
end;

procedure TfrmTicTacToe.btnTic4Click(Sender: TObject);
begin
  if btnTic4.Caption <> '' then
  begin
    exit;
  end;

  if bPlayerX = True then
  begin
    btnTic4.Caption := 'x';
    bPlayerX := False;
  end else
  begin
    btnTic4.Caption := 'o';
    bPlayerX := True;
  end;
  ScoreKeeper;
end;

procedure TfrmTicTacToe.btnTic5Click(Sender: TObject);
begin
  if btnTic5.Caption <> '' then
  begin
    exit;
  end;

  if bPlayerX = True then
  begin
    btnTic5.Caption := 'x';
    bPlayerX := False;
  end else
  begin
    btnTic5.Caption := 'o';
    bPlayerX := True;
  end;
  ScoreKeeper;
end;

procedure TfrmTicTacToe.btnTic6Click(Sender: TObject);
begin
  if btnTic6.Caption <> '' then
  begin
    exit;
  end;

  if bPlayerX = True then
  begin
    btnTic6.Caption := 'x';
    bPlayerX := False;
  end else
  begin
    btnTic6.Caption := 'o';
    bPlayerX := True;
  end;
  ScoreKeeper;
end;

procedure TfrmTicTacToe.btnTic7Click(Sender: TObject);
begin
  if btnTic7.Caption <> '' then
  begin
    exit;
  end;

  if bPlayerX = True then
  begin
    btnTic7.Caption := 'x';
    bPlayerX := False;
  end else
  begin
    btnTic7.Caption := 'o';
    bPlayerX := True;
  end;
  ScoreKeeper;
end;

procedure TfrmTicTacToe.btnTic8Click(Sender: TObject);
begin
  if btnTic8.Caption <> '' then
  begin
    exit;
  end;

  if bPlayerX = True then
  begin
    btnTic8.Caption := 'x';
    bPlayerX := False;
  end else
  begin
    btnTic8.Caption := 'o';
    bPlayerX := True;
  end;
  ScoreKeeper;
end;

procedure TfrmTicTacToe.btnTic9Click(Sender: TObject);
begin
  if btnTic9.Caption <> '' then
  begin
    exit;
  end;

  if bPlayerX = True then
  begin
    btnTic9.Caption := 'x';
    bPlayerX := False;
  end else
  begin
    btnTic9.Caption := 'o';
    bPlayerX := True;
  end;
  ScoreKeeper;
end;

procedure TfrmTicTacToe.FormActivate(Sender: TObject);
begin
  bPlayerX := True;
end;

procedure TfrmTicTacToe.ScoreKeeper;
var
  x, o : integer;
begin
  x := StrToInt(lblPlayerX.Caption);
  o := StrToInt(lblPlayerO.Caption);

  //Player x:
  if (btnTic1.Caption = 'x') and (btnTic2.Caption = 'x') and (btnTic3.Caption = 'x') then
  begin
    inc(x);
    lblPlayerX.Caption := IntToStr(x);
    ShowMessage('Player x won');
    Tiles_Enabled_False;
  end else if (btnTic4.Caption = 'x') and (btnTic5.Caption = 'x') and (btnTic6.Caption = 'x') then
  begin
    inc(x);
    lblPlayerX.Caption := IntToStr(x);
    ShowMessage('Player x won');
    Tiles_Enabled_False;
  end else if (btnTic7.Caption = 'x') and (btnTic8.Caption = 'x') and (btnTic9.Caption = 'x') then
  begin
    inc(x);
    lblPlayerX.Caption := IntToStr(x);
    ShowMessage('Player x won');
    Tiles_Enabled_False;
  end else if (btnTic1.Caption = 'x') and (btnTic4.Caption = 'x') and (btnTic7.Caption = 'x') then
  begin
    inc(x);
    lblPlayerX.Caption := IntToStr(x);
    ShowMessage('Player x won');
    Tiles_Enabled_False;
  end else if (btnTic2.Caption = 'x') and (btnTic5.Caption = 'x') and (btnTic8.Caption = 'x') then
  begin
    inc(x);
    lblPlayerX.Caption := IntToStr(x);
    ShowMessage('Player x won');
    Tiles_Enabled_False;
  end else if (btnTic3.Caption = 'x') and (btnTic6.Caption = 'x') and (btnTic9.Caption = 'x') then
  begin
    inc(x);
    lblPlayerX.Caption := IntToStr(x);
    ShowMessage('Player x won');
    Tiles_Enabled_False;
  end else if (btnTic1.Caption = 'x') and (btnTic5.Caption = 'x') and (btnTic9.Caption = 'x') then
  begin
    inc(x);
    lblPlayerX.Caption := IntToStr(x);
    ShowMessage('Player x won');
    Tiles_Enabled_False;
  end else if (btnTic3.Caption = 'x') and (btnTic5.Caption = 'x') and (btnTic7.Caption = 'x') then
  begin
    inc(x);
    lblPlayerX.Caption := IntToStr(x);
    ShowMessage('Player x won');
    Tiles_Enabled_False;
  end;

  //Player o:
  if (btnTic1.Caption = 'o') and (btnTic2.Caption = 'o') and (btnTic3.Caption = 'o') then
  begin
    inc(o);
    lblPlayerO.Caption := IntToStr(o);
    ShowMessage('Player o won');
    Tiles_Enabled_False;
  end else if (btnTic4.Caption = 'o') and (btnTic5.Caption = 'o') and (btnTic6.Caption = 'o') then
  begin
    inc(o);
    lblPlayerO.Caption := IntToStr(o);
    ShowMessage('Player o won');
    Tiles_Enabled_False;
  end else if (btnTic7.Caption = 'o') and (btnTic8.Caption = 'o') and (btnTic9.Caption = 'o') then
  begin
    inc(o);
    lblPlayerO.Caption := IntToStr(o);
    ShowMessage('Player o won');
    Tiles_Enabled_False;
  end else if (btnTic1.Caption = 'o') and (btnTic4.Caption = 'o') and (btnTic7.Caption = 'o') then
  begin
    inc(o);
    lblPlayerO.Caption := IntToStr(o);
    ShowMessage('Player o won');
    Tiles_Enabled_False;
  end else if (btnTic2.Caption = 'o') and (btnTic5.Caption = 'o') and (btnTic8.Caption = 'o') then
  begin
    inc(o);
    lblPlayerO.Caption := IntToStr(o);
    ShowMessage('Player o won');
    Tiles_Enabled_False;
  end else if (btnTic3.Caption = 'o') and (btnTic6.Caption = 'o') and (btnTic9.Caption = 'o') then
  begin
    inc(o);
    lblPlayerO.Caption := IntToStr(o);
    ShowMessage('Player o won');
    Tiles_Enabled_False;
  end else if (btnTic1.Caption = 'o') and (btnTic5.Caption = 'o') and (btnTic9.Caption = 'o') then
  begin
    inc(o);
    lblPlayerO.Caption := IntToStr(o);
    ShowMessage('Player o won');
    Tiles_Enabled_False;
  end else if (btnTic3.Caption = 'o') and (btnTic5.Caption = 'o') and (btnTic7.Caption = 'o') then
  begin
    inc(o);
    lblPlayerO.Caption := IntToStr(o);
    ShowMessage('Player o won');
    Tiles_Enabled_False;
  end;

  //if (btnTic1.Cancel <> '') and (btnTic2.Caption <> '') then


end;

procedure TfrmTicTacToe.Tiles_Enabled_False;
begin
  btnTic1.Enabled := False;
  btnTic2.Enabled := False;
  btnTic3.Enabled := False;
  btnTic4.Enabled := False;
  btnTic5.Enabled := False;
  btnTic6.Enabled := False;
  btnTic7.Enabled := False;
  btnTic8.Enabled := False;
  btnTic9.Enabled := False;


end;

procedure TfrmTicTacToe.tmrCurrentPlayerTimer(Sender: TObject);
begin
  if bPlayerX = True then lblCurrentPlayer.Caption := 'x'
  else lblCurrentPlayer.Caption := 'o';
end;

end.
