unit PingPong_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, math, StdCtrls, Buttons, WMPLib_TLB, OleCtrls;

type
  TfrmPingPong = class(TForm)
    shpPlayerPlatform: TShape;
    shpEnemyPlatform: TShape;
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
    pnlLost: TPanel;
    pnlLoseDesign: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    lblLost: TLabel;
    bmbMainMenu2: TBitBtn;
    bmbRetry: TBitBtn;
    pnlLostHighScore: TPanel;
    pnlLostScore: TPanel;
    shpBall: TShape;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure tmrBallMoveTimer(Sender: TObject);
    procedure tmrEnemyPlatformMoveTimer(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure bmbQuitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bmbRetryClick(Sender: TObject);
    procedure bmbMainMenu2Click(Sender: TObject);
  private
    { Private declarations }
    iPlayerPointRandom, iEnemyPointRandom : integer;
    bUp, bDown : boolean;
    iScore : integer;

    iPointer : integer;
    iEnemyBall : integer;
    iPlayerBall : integer;
  public
    { Public declarations }
  iHighScore : integer;
  end;

var
  frmPingPong: TfrmPingPong;
  wmpBackgroundMusic : TWindowsMediaPlayer;

implementation

uses MainMenu_U;

{$R *.dfm}

procedure TfrmPingPong.bmbMainMenu2Click(Sender: TObject);
begin
 Self.Close;
end;

procedure TfrmPingPong.bmbQuitClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmPingPong.bmbRetryClick(Sender: TObject);
begin
  iScore := 0;
  pnlScore.Caption := IntToStr(iScore);
  pnlLost.Hide;
end;

procedure TfrmPingPong.btnStartClick(Sender: TObject);
begin
  wmpBackgroundMusic.controls.play;
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
var
iPos : integer;
begin

  wmpBackgroundMusic := TWindowsMediaPlayer.Create(frmPingPong);

  with wmpBackgroundMusic do
  begin
    settings.autoStart := False;
    URL := 'Music\Reacta Click (Chasing).mp3';
    Width := 245;
    Height := 240;
    Top := 0 - wmpBackgroundMusic.Height;
    Left := 0 - wmpBackgroundMusic.Width;
    settings.playCount := 99;
    settings.volume := 10;
  end;

    reset(frmMainMenu.tFileUsers);
    while not eof(frmMainMenu.tFileUsers) do
    begin
        readln(frmMainMenu.tFileUsers, frmMainMenu.sUserLine);
        iPos := pos('%', frmMainMenu.sCurrentUser);
        try
          iHighScore := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
        except
          try
            iHighScore := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
          except
            iHighScore := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
          end;
        end;
       pnlHighScore.Caption := IntToStr(iHighscore);
    end;
    CloseFile(frmMainMenu.tFileUsers);

  bDown := True;
  bUp := False;
  randomize;
  iPlayerPointRandom := randomrange(frmPingPong.Width - (frmPingPong.Width * 2),
  frmPingPong.Width * 2);
  shpPlayerPoint.Left := iPlayerPointRandom;

  iEnemyPointRandom := randomrange(frmPingPong.Width - (frmPingPong.Width * 2),
  frmPingPong.Width * 2);
  shpEnemyPoint.Left := iEnemyPointRandom;
end;

procedure TfrmPingPong.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  wmpBackgroundMusic.Destroy;
  tmrBallMove.Enabled := False;
  tmrEnemyPlatformMove.Enabled := False;
  shpBall.Top := frmPingPong.Height div 2;
  shpBall.Left := frmPingPong.Width div 2;
  iScore := 0;
  pnlScore.Caption := IntToStr(iScore);
  btnStart.Visible := True;
  bmbQuit.Visible := True;
  shpBall.Left := frmPingPong.Width div 2;
  shpBall.Top := frmPingPong.Height div 2;
  pnlLost.Hide;
  Application.MainForm.Show;
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
tFileUsers : TextFile;
iPos, iCopy : integer;
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
    inc(iScore, 2);
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
    AssignFile(tFileUsers, 'Users/' + frmMainMenu.sUserLoad + '.txt');
    iPos := pos('%', frmMainMenu.sCurrentUser);
    pnlHighScore.Caption := IntToStr(iScore);
    iHighScore := StrToInt(pnlHighScore.Caption);
    try
    iCopy := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
    delete(frmMainMenu.sCurrentUser, iPos + 1, 3);
    except
      try
        iCopy := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
        delete(frmMainMenu.sCurrentUser, iPos + 1, 2);
      except
        iCopy := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
        delete(frmMainMenu.sCurrentUser, iPos + 1, 1);
      end;
    end;
    insert(IntToStr(iHighScore), frmMainMenu.sCurrentUser, iPos + 1);
  try
    iHighScore := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
  except
    try
      iHighScore := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
    except
      iHighScore := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
    end;
  end;
  Rewrite(tFileUsers);
  Writeln(tFileUsers, frmMainMenu.sCurrentUser);
  Closefile(tFileUsers);
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

    iEnemyBall := randomrange(5, 25 + 1);
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
      iEnemyPointRandom := frmPingPong.Width * 2;
      shpEnemyPoint.Left := iEnemyPointRandom;
    end;

    if shpBall.Left > shpEnemyPoint.Left then
    begin
      shpBall.Left := shpBall.Left - iEnemyBall;
    end;

    if shpBall.Left >= frmPingPong.Width - (shpBall.Width * 2) then
    begin
      iEnemyPointRandom := frmPingPong.Width - (frmPingPong.Width * 2);
      shpEnemyPoint.Left := iEnemyPointRandom;
    end;

  end;

  if IntersectRect(overlay, shpEnemyPlatform.BoundsRect, shpBall.BoundsRect) then
  begin
    iEnemyPointRandom := randomrange(frmPingPong.Width - (frmPingPong.Width * 2)
    , frmPingPong.Width * 2);
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

    iPlayerBall := RandomRange(5, 25 + 1);
    bDown := True;
    bUp := False;
  end;

  if shpBall.Top >= shpPlayerPoint.Top then
  begin
    wmpBackgroundMusic.controls.stop;
    tmrBallMove.Enabled := False;
    tmrEnemyPlatformMove.Enabled := False;
    pnlLost.Left := 0;
    pnlLost.Top := 0;
    pnlLost.Visible := True;
    pnlLostScore.Caption := IntToStr(iScore);
    pnlLostHighScore.Caption := IntToStr(iHighScore);
    pnlScore.Caption := IntToStr(iScore);
    shpBall.Top := frmPingPong.Height div 2;
    shpBall.Left := frmPingPong.Width div 2;
    btnStart.Visible := True;
    bmbQuit.Visible := True;
  end;

  if shpBall.Top <= shpEnemyPoint.Top then
  begin
    inc(iScore, 10);
    shpBall.Top := frmPingPong.Height div 2;
    shpBall.Left := frmPingPong.Width div 2;
    tmrBallMove.Interval := 20;
    bDown := True;
    bUp := False;

  end;


end;

procedure TfrmPingPong.tmrEnemyPlatformMoveTimer(Sender: TObject);
begin
  if bUp = True then
  begin
    if (shpBall.Left > shpEnemyPlatform.Left) then
    begin
      shpEnemyPlatform.Left := shpEnemyPlatform.Left + 20;
    end;
    if (shpBall.Left < shpEnemyPlatform.Left) then
    begin
      shpEnemyPlatform.Left := shpEnemyPlatform.Left - 20;
    end;
  end;
end;

end.
