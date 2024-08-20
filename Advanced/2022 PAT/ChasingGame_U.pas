unit ChasingGame_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, pngimage, math, OleCtrls, WMPLib_TLB,
  jpeg, Game_U;

type
  TfrmChasing = class(TForm)
    Enemy: TShape;
    tmrEnemyMove: TTimer;
    pnlScore: TPanel;
    Label1: TLabel;
    btnStart: TButton;
    Player: TImage;
    pnlHighScore: TPanel;
    Label2: TLabel;
    bmbQuit: TBitBtn;
    imgBomb: TImage;
    imgStar: TImage;
    tmrStarPopUp: TTimer;
    pnlLost: TPanel;
    lblLost: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pnlLostScore: TPanel;
    pnlLostHighScore: TPanel;
    bmbRetry: TBitBtn;
    bmbMainMenu2: TBitBtn;
    pnlLoseDesign: TPanel;
    imgBackground: TImage;
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure tmrEnemyMoveTimer(Sender: TObject);
    procedure btnStartClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure EnemyMove(iAmount : integer);
    procedure bmbQuitClick(Sender: TObject);
    procedure tmrStarPopUpTimer(Sender: TObject);
    procedure bmbRetryClick(Sender: TObject);
    procedure bmbMainMenu2Click(Sender: TObject);
    procedure Lose;
  private
    { Private declarations }
  iBombPopUp : integer;
  tFileChasing : TextFile;
  iScore : integer;
  public
    { Public declarations }
  iHighScore : integer;

  end;

var
  frmChasing: TfrmChasing;
  wmpBackgroundMusic: TWindowsMediaPlayer;

implementation

uses MainMenu_U;

{$R *.dfm}

procedure TfrmChasing.bmbMainMenu2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmChasing.bmbQuitClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmChasing.bmbRetryClick(Sender: TObject);
begin
  iScore := 0;
  pnlScore.Caption := IntToStr(iScore);
  pnlLost.Hide;
end;

procedure TfrmChasing.btnStartClick(Sender: TObject);
begin
  wmpBackgroundMusic.controls.play;
  btnStart.Visible := False;
  bmbQuit.Visible := False;
  tmrEnemyMove.Enabled := True;
  Player.Visible := True;
  tmrStarPopUp.Enabled := True;
  iBombPopUp := iScore + RandomRange(2, 6);
end;

procedure TfrmChasing.EnemyMove(iAmount: integer);
begin
  if Enemy.Left < Player.Left then Enemy.Left := Enemy.Left + iAmount;
  if Enemy.Left > Player.Left then Enemy.Left := Enemy.Left - iAmount;
  if Enemy.Top < Player.Top then Enemy.Top := Enemy.Top + iAmount;
  if Enemy.Top > Player.Top then Enemy.Top := Enemy.Top - iAmount;
end;

procedure TfrmChasing.FormActivate(Sender: TObject);
var
iPos : integer;
begin
  WindowState := wsMaximized;
  wmpBackgroundMusic := TWindowsMediaPlayer.Create(frmChasing);

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

  Enemy.Left := frmChasing.Width - Enemy.Width;
  Player.Visible := False;

    //Kry Chasing se HighScore
    reset(frmMainMenu.tFileUsers);
    while not eof(frmMainMenu.tFileUsers) do
    begin
        readln(frmMainMenu.tFileUsers, frmMainMenu.sUserLine);
        iPos := pos('%', frmMainMenu.sCurrentUser);
        try
          iHighScore := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
        except
          try
            iHighscore := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
          except
            iHighscore := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
          end;
        end;
       pnlHighScore.Caption := IntToStr(iHighscore);
    end;
    CloseFile(frmMainMenu.tFileUsers);
  
end;

procedure TfrmChasing.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  iScore := 0;
  pnlScore.Caption := IntToStr(iScore);
  wmpBackgroundMusic.Destroy;
  Enemy.Left := frmChasing.Width - Enemy.Width;
  tmrEnemyMove.Enabled := False;
  tmrStarPopUp.Enabled := False;
  btnStart.Visible := True;
  bmbQuit.Visible := True;
  Player.Visible := False;
  imgBomb.Visible := False;
  imgStar.Visible := False;
  pnlLost.Hide;
  Application.MainForm.Show;
end;

procedure TfrmChasing.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if tmrEnemyMove.Enabled = True then
  begin
    Player.Left := x - Player.Width div 2;
    Player.Top := y - Player.Height div 2;
  end;
end;

procedure TfrmChasing.Lose;
begin
  pnlLost.Width := frmChasing.Width;
  pnlLost.Height := frmChasing.Height;
  pnlLost.Left := 0;
  pnlLost.Top := 0;
  pnlLoseDesign.Left := pnlLost.Width div 2 - (pnlLoseDesign.Width div 2);
  pnlLoseDesign.Top := pnlLost.Height div 2 - (pnlLoseDesign.Height div 2);
  pnlLostScore.Caption := IntToStr(iScore);
  pnlLostHighScore.Caption := IntToStr(iHighScore);
  pnlLost.Show;
end;

procedure TfrmChasing.tmrStarPopUpTimer(Sender: TObject);
var
overlay : TRect;
begin
  imgStar.Visible := True;
  if not IntersectRect(overlay, imgStar.BoundsRect, Player.BoundsRect) then
  begin
    imgStar.Visible := True;
  end;

  if IntersectRect(overlay, imgStar.BoundsRect, Player.BoundsRect) then
  begin
    inc(iScore);
    pnlScore.Caption := IntToStr(iScore);

    //Waar ster moet verskyn
    imgStar.Left := RandomRange(imgStar.Width,
    (frmChasing.Width - imgStar.Width) - imgStar.Width);
    imgStar.Top := RandomRange(imgStar.Height,
    (frmChasing.Height - imgStar.Height) - imgStar.Height);

    //Waar bom moet verskyn
    imgBomb.Left := RandomRange(imgBomb.Width,
    (frmChasing.Width - imgBomb.Width) - imgBomb.Width);

    imgBomb.Top := RandomRange(imgBomb.Height,
    (frmChasing.Height - imgBomb.Height) - imgBomb.Height);

    if (Player.Visible = True) AND (imgBomb.Visible = True) then
    begin
      iBombPopUp := iScore + RandomRange(2, 6);
      imgBomb.Visible := False;
    end;
  end;


end;

procedure TfrmChasing.tmrEnemyMoveTimer(Sender: TObject);
var
overlay : TRect;
tFileUsers : TextFile;
iPos, iCopy : integer;
begin

  EnemyMove(10);
  if IntersectRect(overlay, Enemy.BoundsRect, Player.BoundsRect) then
  begin
    tmrEnemyMove.Enabled := False;
  end;

  if imgBomb.Visible = True then
  begin
    if IntersectRect(overlay, imgBomb.BoundsRect, Player.BoundsRect) then
    begin
      tmrEnemyMove.Enabled := False;
    end;
  end;

  if iScore >= 20 then
    begin
      tmrEnemyMove.Interval := 15;
  end else if iScore >= 40 then
    begin
      tmrEnemyMove.Interval := 10;
  end else if iScore >= 60 then
    begin
      tmrEnemyMove.Interval := 5;
    end else if iScore >= 80 then
    begin
      tmrEnemyMove.Interval := 1;
    end else
    begin
      tmrEnemyMove.Interval := 20;
    end;

  //Stoor Chasing se HighScore
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

  if iScore = iBombPopUp then
  begin
    imgBomb.Visible := True;
  end else
  begin
    imgBomb.Visible := False;
  end;

    if tmrEnemyMove.Enabled = False then
    begin
      wmpBackgroundMusic.controls.stop;
      tmrStarPopUp.Enabled := False;
      btnStart.Visible := True;
      bmbQuit.Visible := True;
      Player.Visible := False;
      imgBomb.Visible := False;
      imgStar.Visible := False;
      Enemy.Left := frmChasing.Width - Enemy.Width;
      Lose;
    end;
  end;
end.
