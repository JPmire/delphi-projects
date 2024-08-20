unit PingPong_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, math, StdCtrls, Buttons;

type
  TfrmPingPong = class(TForm)
    shpPlayerPlatform: TShape;
    shpEnemyPlatform: TShape;
    shpBall: TShape;
    shpEnemyPoint: TShape;
    shpPlayerPoint: TShape;
    tmrBallMove: TTimer;
    tmrEnemyPlatformMove: TTimer;
    btnStart: TButton;
    bmbQuit: TBitBtn;
    pnlScore: TPanel;
    pnlHighScore: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure tmrBallMoveTimer(Sender: TObject);
    procedure tmrEnemyPlatformMoveTimer(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure bmbQuitClick(Sender: TObject);
  private
    { Private declarations }
    iPlayerPointRandom, iEnemyPointRandom : integer;
    bUp, bDown : boolean;
    iScore : integer;
    iHighScore : integer;
    iPointer : integer;
    iEnemyBall : integer;
    iPlayerBall : integer;
  public
    { Public declarations }
  end;

var
  frmPingPong: TfrmPingPong;

implementation

{$R *.dfm}

procedure TfrmPingPong.bmbQuitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPingPong.btnStartClick(Sender: TObject);
begin
  tmrBallMove.Enabled := True;
  tmrEnemyPlatformMove.Enabled := True;
  btnStart.Visible := False;
  bmbQuit.Visible := False;
  iScore := 0;
  iEnemyBall := 0;
  iPlayerBall := 0;
  tmrBallMove.Interval := 20;
end;

procedure TfrmPingPong.FormActivate(Sender: TObject);
begin
  bDown := True;
  bUp := False;
  randomize;
  iPlayerPointRandom := randomrange(frmPingPong.Width - (frmPingPong.Width * 2), frmPingPong.Width * 2);
  shpPlayerPoint.Left := iPlayerPointRandom;

  iEnemyPointRandom := randomrange(frmPingPong.Width - (frmPingPong.Width * 2), frmPingPong.Width * 2);
  shpEnemyPoint.Left := iEnemyPointRandom;
end;

procedure TfrmPingPong.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  iPointer := x;
  if btnStart.Visible = False then
  begin
    shpPlayerPlatform.Left := x - shpPlayerPlatform.Width div 2;
  end;
end;

procedure TfrmPingPong.tmrBallMoveTimer(Sender: TObject);
var
overlay : tRect;
begin


  if bDown = True then
  begin
    if shpBall.Top < shpPlayerPoint.Top then
    begin
      shpBall.Top := shpBall.Top + 10;
    end;

    if shpBall.Left < shpPlayerPoint.Left then
    begin
      shpBall.Left := shpBall.Left + iPlayerBall;
    end;

    if (shpBall.Left <= 0) then
    begin
      iPlayerPointRandom := frmPingPong.Width * 2;
      shpPlayerPoint.Left := iPlayerPointRandom;
    end;

    if shpBall.Left > shpPlayerPoint.Left then
    begin
      shpBall.Left := shpBall.Left - iPlayerBall;
    end;

    if shpBall.Left >= frmPingPong.Width - (shpBall.Width * 2) then
    begin
      iPlayerPointRandom := frmPingPong.Width - (frmPingPong.Width * 2);
      shpPlayerPoint.Left := iPlayerPointRandom;
    end;

  end;
  if IntersectRect(overlay, shpPlayerPlatform.BoundsRect, shpBall.BoundsRect) then
  begin
    inc(iScore);
    pnlScore.Caption := IntToStr(iScore);
    if iScore >= 5 then
    begin
      tmrBallMove.Interval := 17;
    end;
    if iScore >= 10 then
    begin
      tmrBallMove.Interval := 16;
    end;
    if iScore >= 40 then
    begin
      tmrBallMove.Interval := 14;
    end;
    if iScore >= 70 then
    begin
      tmrBallMove.Interval := 12;
    end;
    if iScore >= 100 then
    begin
      tmrBallMove.Interval := 10;
    end;
    if iScore >= iHighScore then
    begin
      iHighScore := iScore;
      pnlHighScore.Caption := IntToStr(iHighScore);
    end;

    if shpBall.Left < iPointer then
    begin
      iEnemyPointRandom := frmPingPong.Width - (frmPingPong.Width * 2);
      shpEnemyPoint.Left := iEnemyPointRandom;
    end else if shpBall.Left > iPointer then
    begin
      iEnemyPointRandom := frmPingPong.Width * 2;
      shpEnemyPoint.Left := iEnemyPointRandom;
    end;

    iEnemyBall := randomrange(10, 25 + 1);
    bDown := False;
    bUp := True;



  end;

  if bUp = True then
  begin
    if shpBall.Top > shpEnemyPoint.Top then
    begin
      shpBall.Top := shpBall.Top - 10;
    end;

    if shpBall.Left < shpEnemyPoint.Left then
    begin
      shpBall.Left := shpBall.Left + iEnemyBall;
    end;

    if shpBall.Left <= 0 then
    begin
      shpEnemyPoint.Left := iEnemyPointRandom * - 3;
    end;

    if shpBall.Left > shpEnemyPoint.Left then
    begin
      shpBall.Left := shpBall.Left - iEnemyBall;
    end;

    if shpBall.Left >= frmPingPong.Width - (shpBall.Width * 2) then
    begin
      shpEnemyPoint.Left := iEnemyPointRandom * - 3;
    end;

  end;

  if IntersectRect(overlay, shpEnemyPlatform.BoundsRect, shpBall.BoundsRect) then
  begin
    iEnemyPointRandom := randomrange(frmPingPong.Width - (frmPingPong.Width * 2), frmPingPong.Width * 2);
    shpEnemyPoint.Left := iEnemyPointRandom;

    if shpBall.Left < iPointer then
    begin
      iPlayerPointRandom := frmPingPong.Width - (frmPingPong.Width * 2);
      shpPlayerPoint.Left := iPlayerPointRandom;
    end else if shpBall.Left > iPointer then
    begin
      iPlayerPointRandom := frmPingPong.Width * 2;
      shpPlayerPoint.Left := iPlayerPointRandom;
    end;

    iPlayerBall := RandomRange(10, 25 + 1);
    bDown := True;
    bUp := False;
  end;

  if shpBall.Top >= shpPlayerPoint.Top then
  begin
    tmrBallMove.Enabled := False;
    tmrEnemyPlatformMove.Enabled := False;
    ShowMessage('You Lost');
    iScore := 0;
    pnlScore.Caption := IntToStr(iScore);
    shpBall.Top := frmPingPong.Height div 2;
    shpBall.Left := frmPingPong.Width div 2;
    btnStart.Visible := True;
    bmbQuit.Visible := True;
  end;

  if shpBall.Top <= shpEnemyPoint.Top then
  begin
    tmrBallMove.Enabled := False;
    tmrEnemyPlatformMove.Enabled := False;
    ShowMessage('You Won');
    shpBall.Top := frmPingPong.Height div 2;
    shpBall.Left := frmPingPong.Width div 2;
    btnStart.Visible := True;
    bmbQuit.Visible := True;
  end;


end;

procedure TfrmPingPong.tmrEnemyPlatformMoveTimer(Sender: TObject);
begin
  if bUp = True then
  begin
    if shpBall.Left > shpEnemyPlatform.Left then
    begin
      shpEnemyPlatform.Left := shpEnemyPlatform.Left + 30;
    end;
    if shpBall.Left < shpEnemyPlatform.Left then
    begin
      shpEnemyPlatform.Left := shpEnemyPlatform.Left - 30;
    end;
  end;
end;

end.
