﻿unit Game_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Math, Buttons, pngimage, OleCtrls,
  WMPLib_TLB;

type
  TfrmGame = class(TForm)
    tmrMove: TTimer;
    pnlScore: TPanel;
    imgItem: TImage;
    tmrTooSlow: TTimer;
    Label1: TLabel;
    pnlHighScore: TPanel;
    Label2: TLabel;
    bmbMainMenu: TBitBtn;
    btnStart: TButton;
    imgBonusPoints: TImage;
    imgBomb: TImage;
    pnlLost: TPanel;
    lblLost: TLabel;
    pnlLostScore: TPanel;
    Label4: TLabel;
    pnlLostHighScore: TPanel;
    Label5: TLabel;
    bmbRetry: TBitBtn;
    bmbMainMenu2: TBitBtn;
    lblPauseInstruction: TLabel;
    procedure tmrMoveTimer(Sender: TObject);
    procedure imgItemClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure tmrTooSlowTimer(Sender: TObject);
    procedure bmbMainMenuClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnStartClick(Sender: TObject);
    procedure imgBonusPointsClick(Sender: TObject);
    procedure imgBombClick(Sender: TObject);
    procedure bmbMainMenu2Click(Sender: TObject);
    procedure bmbRetryClick(Sender: TObject);
    procedure FormContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  iScore : integer;
  iBonusVisible, iBombVisible : integer;
  tFileUsers : TextFile;
  procedure SaveHighScore(sPlaceholder : string; bDifficulty : boolean;
  iHighScore : integer);
  public
    { Public declarations }
  bClassic, bEasy, bIntermediate, bHard : boolean;
  iHighC, iHighE, iHighI, iHighH : integer;

  end;

var
  frmGame: TfrmGame;
  wmpBackgroundMusic: TWindowsMediaPlayer;

implementation

uses MainMenu_U;
{$R *.dfm}

procedure TfrmGame.bmbMainMenu2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmGame.bmbMainMenuClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmGame.bmbRetryClick(Sender: TObject);
begin
  iScore := 0;
  pnlScore.Caption := IntToStr(iScore);

  if bClassic = True then
  begin
    pnlHighScore.Caption := IntToStr(iHighC);
  end else if bEasy = True then
  begin
    pnlHighScore.Caption := IntToStr(iHighE);
  end else
  if bIntermediate = True then
  begin
    pnlHighScore.Caption := IntToStr(iHighI);
  end else
  if bHard = True then
  begin
    pnlHighScore.Caption := IntToStr(iHighH);
  end;

  pnlLost.Visible := False;
end;

procedure TfrmGame.btnStartClick(Sender: TObject);
begin
  wmpBackgroundMusic.controls.play;

  //Bereken die difficulty (Spoed van prentjie)
  if bClassic = True then
  begin
    pnlHighScore.Caption := IntToStr(iHighC);
  end else if bEasy = True then
  begin
    pnlHighScore.Caption := IntToStr(iHighE);
    tmrMove.Interval := 1500;
    tmrTooSlow.interval := 1500;
  end else
  if bIntermediate = True then
  begin
    pnlHighScore.Caption := IntToStr(iHighI);
    tmrMove.Interval := 1200;
    tmrTooSlow.Interval := 1200;
  end else
  if bHard = True then
  begin
    pnlHighScore.Caption := IntToStr(iHighH);
    tmrMove.Interval := 1000;
    tmrTooSlow.Interval := 1000;
  end;

  
  tmrMove.Enabled := True;
  btnStart.Visible := False;
  bmbMainMenu.Visible := False;

  //Kry 'n random nommer vir wanner die ster en bom moet verskyn
  Randomize;
  iBonusVisible := iScore + randomrange(4, 10);
  iBombVisible := iScore + randomrange(2, 5);
end;

procedure TfrmGame.Button1Click(Sender: TObject);
begin
  Append(frmMainMenu.tFileUsers);
  Writeln(frmMainMenu.tFileUsers, 'Hello');
  Closefile(frmMainMenu.tFileUsers);
end;

procedure TfrmGame.FormActivate(Sender: TObject);
var
iPos : integer;
begin
  wmpBackgroundMusic := TWindowsMediaPlayer.Create(frmGame);

  with wmpBackgroundMusic do
  begin
    settings.autoStart := False;
    URL := 'Music\Reacta Click (Normal).mp3';
    Width := 245;
    Height := 240;
    Top := 0 - wmpBackgroundMusic.Height;
    Left := 0 - wmpBackgroundMusic.Width;
    settings.playCount := 99;
    settings.volume := 10;
  end;

  //Kry Classic se HighScore
    reset(frmMainMenu.tFileUsers);
    while not eof(frmMainMenu.tFileUsers) do
    begin
        readln(frmMainMenu.tFileUsers, frmMainMenu.sUserLine);
        iPos := pos('!', frmMainMenu.sCurrentUser);
        try
          iHighC := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
        except
          try
            iHighC := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
          except
            iHighC := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
          end;
        end;
       pnlHighScore.Caption := IntToStr(iHighC);
    end;
    CloseFile(frmMainMenu.tFileUsers);

  //Kry Easy se HighScore
    reset(frmMainMenu.tFileUsers);
    while not eof(frmMainMenu.tFileUsers) do
    begin
        readln(frmMainMenu.tFileUsers, frmMainMenu.sUserLine);
        iPos := pos('@', frmMainMenu.sCurrentUser);
        try
          iHighE := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
        except
          try
            iHighE := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
          except
            iHighE := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
          end;
        end;
       pnlHighScore.Caption := IntToStr(iHighE);
    end;
    CloseFile(frmMainMenu.tFileUsers);

  //Kry Intermediate se HighScore
    reset(frmMainMenu.tFileUsers);
    while not eof(frmMainMenu.tFileUsers) do
    begin
        readln(frmMainMenu.tFileUsers, frmMainMenu.sUserLine);
        iPos := pos('#', frmMainMenu.sCurrentUser);
        try
          iHighI := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
        except
          try
            iHighI := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
          except
            iHighI := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
          end;
        end;
       pnlHighScore.Caption := IntToStr(iHighI);
    end;
    CloseFile(frmMainMenu.tFileUsers);

  //Kry Hard se HighScore
    reset(frmMainMenu.tFileUsers);
    while not eof(frmMainMenu.tFileUsers) do
    begin
        readln(frmMainMenu.tFileUsers, frmMainMenu.sUserLine);
        iPos := pos('$', frmMainMenu.sCurrentUser);
        try
          iHighH := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
        except
          try
            iHighH := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
          except
            iHighH := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
          end;
        end;
       pnlHighScore.Caption := IntToStr(iHighH);
    end;
    CloseFile(frmMainMenu.tFileUsers);

  
end;

procedure TfrmGame.FormClick(Sender: TObject); //As jy mis kliek
begin
  tmrMove.Enabled := False;
  tmrTooSlow.Enabled := False;
  wmpBackgroundMusic.controls.stop;

  if (btnStart.Visible = False) AND (bmbMainMenu.Visible = False) then
  begin
    pnlLost.Left := 0;
    pnlLost.Top := 0;
    pnlLost.Visible := True;
    lblLost.Caption := 'You Lost';
    pnlLostScore.Caption := IntToStr(iScore);

    if bClassic = True then
    begin
      pnlLostHighScore.Caption := IntToStr(iHighC);
    end else if bEasy = True then
    begin
      pnlLostHighScore.Caption := IntToStr(iHighE);
    end else if bIntermediate = True then
    begin
      pnlLostHighScore.Caption := IntToStr(iHighI);
    end else if bHard = True then
    begin
      pnlLostHighScore.Caption := IntToStr(iHighH);
    end;
  end;

  imgItem.Visible := False;
  imgBonusPoints.Visible := False;
  imgBomb.Visible := False;
  btnStart.Visible := True;
  bmbMainMenu.Visible := True;
end;

procedure TfrmGame.FormCloseQuery(Sender: TObject;
//As jy die die window toe maak
  var CanClose: Boolean);
begin
  wmpBackgroundMusic.destroy;
  Application.MainForm.Show;
  tmrMove.Enabled := False;
  tmrTooSlow.Enabled := False;
  lblPauseInstruction.Caption := 'Pause/UnPause = Right Click';

  bClassic := False;
  bEasy := False;
  bIntermediate := False;
  bHard := False;

  iScore := 0;
  pnlScore.Caption := IntToStr(iScore);

  pnlLost.Visible := False;
  imgItem.Visible := False;
  imgBomb.Visible := False;
  imgBonusPoints.Visible := False;

  btnStart.Visible := True;
  bmbMainMenu.Visible := True;

end;

procedure TfrmGame.FormContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  if tmrMove.Enabled = True then
  begin
    lblPauseInstruction.Caption := 'Paused';
    tmrMove.Enabled := False;
    tmrTooSlow.Enabled := False;
    imgItem.Visible := False;
    imgBonusPoints.Visible := False;
    imgBomb.Visible := False;
  end else
  begin
    lblPauseInstruction.Caption := 'Pause/UnPause = Right Click';
    iBonusVisible := iScore + RandomRange(3, 10);
    iBombVisible := iScore + RandomRange(2, 5);
    tmrMove.Enabled := True;
    if imgItem.Visible = True then
    begin
      tmrTooSlow.Enabled := True;
    end;
  end;
end;



procedure TfrmGame.imgBombClick(Sender: TObject);
begin
  tmrMove.Enabled := False;
  tmrTooSlow.Enabled := False;
  wmpBackgroundMusic.controls.stop;

  pnlLost.Left := 0;
  pnlLost.Top := 0;
  pnlLost.Visible := True;
  pnlLostScore.Caption := IntToStr(iScore);

  if bClassic = True then
  begin
    pnlLostHighScore.Caption := IntToStr(iHighC);
  end else if bEasy = True then
  begin
    pnlLostHighScore.Caption := IntToStr(iHighE);
  end else if bIntermediate = True then
  begin
    pnlLostHighScore.Caption := IntToStr(iHighI);
  end else if bHard = True then
  begin
    pnlLostHighScore.Caption := IntToStr(iHighH);
  end;

  imgItem.Visible := False;
  imgBonusPoints.Visible := False;
  imgBomb.Visible := False;
  btnStart.Visible := True;
  bmbMainMenu.Visible := True;
end;

procedure TfrmGame.imgBonusPointsClick(Sender: TObject); //As jy op die ster kliek
var
iPos : integer;
begin
  Inc(iScore, 3);
  pnlScore.Caption := IntToStr(iScore);

  Randomize;
  iBonusVisible := iScore + RandomRange(3, 10);
  iBombVisible := iScore + RandomRange(2, 5);

  imgBonusPoints.Visible := False;
  imgBomb.Visible := False;
  imgItem.Visible := False;
  tmrTooSlow.Enabled := False;

  //Stoor Classic Se High Score
  SaveHighScore('!', bClassic, iHighC);
  AssignFile(tFileUsers, 'Users/' + frmMainMenu.sUserLoad + '.txt');
  iPos := pos('!', frmMainMenu.sCurrentUser);
  try
    iHighC := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
  except
    try
      iHighC := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
    except
      iHighC := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
    end;
  end;
  Rewrite(tFileUsers);
  Writeln(tFileUsers, frmMainMenu.sCurrentUser);
  Closefile(tFileUsers);

  //Stoor Easy Se High Score
  SaveHighScore('@', bEasy, iHighE);
  AssignFile(tFileUsers, 'Users/' + frmMainMenu.sUserLoad + '.txt');
  iPos := pos('@', frmMainMenu.sCurrentUser);
  try
    iHighE := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
  except
    try
      iHighE := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
    except
      iHighE := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
    end;
  end;
  Rewrite(tFileUsers);
  Writeln(tFileUsers, frmMainMenu.sCurrentUser);
  Closefile(tFileUsers);


  //Stoor Intermediate Se High Score
  SaveHighScore('#', bIntermediate, iHighI);
  AssignFile(tFileUsers, 'Users/' + frmMainMenu.sUserLoad + '.txt');
  iPos := pos('#', frmMainMenu.sCurrentUser);
  try
    iHighI := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
  except
    try
      iHighI := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
    except
      iHighI := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
    end;
  end;
  Rewrite(tFileUsers);
  Writeln(tFileUsers, frmMainMenu.sCurrentUser);
  Closefile(tFileUsers);

  //Stoor Hard Se High Score
  SaveHighScore('$', bHard, iHighH);
  AssignFile(tFileUsers, 'Users/' + frmMainMenu.sUserLoad + '.txt');
  iPos := pos('$', frmMainMenu.sCurrentUser);
  try
    iHighH := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
  except
    try
      iHighH := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
    except
      iHighH := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
    end;
  end;
  Rewrite(tFileUsers);
  Writeln(tFileUsers, frmMainMenu.sCurrentUser);
  Closefile(tFileUsers);

end;

procedure TfrmGame.imgItemClick(Sender: TObject);  //As jy op die item kliek
var
iPos : integer;
begin
  pnlScore.Caption := IntToStr(iScore + 1);
  iScore := StrToInt(pnlScore.Caption);

  imgItem.Visible := False;

  if imgBonusPoints.Visible = True then
  begin
    Randomize;
    iBonusVisible := iScore + RandomRange(3, 10);
  end else if imgBomb.Visible = True then
  begin
    Randomize;
    iBombVisible := iScore + RandomRange(2, 5);
  end;

  //Stoor Classic Se High Score
  SaveHighScore('!', bClassic, iHighC);
  AssignFile(tFileUsers, 'Users/' + frmMainMenu.sUserLoad + '.txt');
  iPos := pos('!', frmMainMenu.sCurrentUser);
  try
    iHighC := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
  except
    try
      iHighC := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
    except
      iHighC := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
    end;
  end;
  Rewrite(tFileUsers);
  Writeln(tFileUsers, frmMainMenu.sCurrentUser);
  Closefile(tFileUsers);

  //Stoor Easy Se High Score
  SaveHighScore('@', bEasy, iHighE);
  AssignFile(tFileUsers, 'Users/' + frmMainMenu.sUserLoad + '.txt');
  iPos := pos('@', frmMainMenu.sCurrentUser);
  try
    iHighE := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
  except
    try
      iHighE := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
    except
      iHighE := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
    end;
  end;
  Rewrite(tFileUsers);
  Writeln(tFileUsers, frmMainMenu.sCurrentUser);
  Closefile(tFileUsers);


  //Stoor Intermediate Se High Score
  SaveHighScore('#', bIntermediate, iHighI);
  AssignFile(tFileUsers, 'Users/' + frmMainMenu.sUserLoad + '.txt');
  iPos := pos('#', frmMainMenu.sCurrentUser);
  try
    iHighI := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
  except
    try
      iHighI := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
    except
      iHighI := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
    end;
  end;
  Rewrite(tFileUsers);
  Writeln(tFileUsers, frmMainMenu.sCurrentUser);
  Closefile(tFileUsers);

  //Stoor Hard Se High Score
  SaveHighScore('$', bHard, iHighH);
  AssignFile(tFileUsers, 'Users/' + frmMainMenu.sUserLoad + '.txt');
  iPos := pos('$', frmMainMenu.sCurrentUser);
  try
    iHighH := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
  except
    try
      iHighH := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
    except
      iHighH := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
    end;
  end;
  Rewrite(tFileUsers);
  Writeln(tFileUsers, frmMainMenu.sCurrentUser);
  Closefile(tFileUsers);

  imgBonusPoints.Visible := False;
  imgBomb.Visible := False;
  tmrTooSlow.Enabled := False;


  //Classic Mode (Prentjie word vinniger na tyd)
  if bClassic = True then
  begin
    if iScore < 10 then
    begin
      tmrMove.Interval := 1800;
      tmrTooSlow.Interval := 1800;
    end
    else if (iScore >= 10) AND (iScore < 20)then
    begin
      tmrMove.Interval := 1500;
      tmrTooSlow.Interval := 1500;
    end
    else if (iScore >= 20) AND (iScore < 50) then
    begin
      tmrMove.Interval := 1200;
      tmrTooSlow.Interval := 1200;
    end
    else if (iScore >= 50) AND (iScore < 65) then
    begin
      tmrMove.Interval := 1000;
      tmrTooSlow.Interval := 1000;
    end
    else if (iScore >= 65) then
    begin
      tmrMove.Interval := 800;
      tmrTooSlow.Interval := 800;
    end else
    begin
      bClassic := False;
    end;
  end;
  end;

procedure TfrmGame.SaveHighScore(sPlaceholder: string; bDifficulty: boolean;
  iHighScore: integer);
var
iPosC : integer;
iCopy : integer;
begin
 if bDifficulty = True
  then begin
      if iScore >= iHighScore then
      begin
        AssignFile(tFileUsers, 'Users/' + frmMainMenu.sUserLoad + '.txt');
        iPosC := pos(sPlaceholder, frmMainMenu.sCurrentUser);
        pnlHighScore.Caption := IntToStr(iScore);
        iHighScore := StrToInt(pnlHighScore.Caption);
        try
          iCopy := StrToInt(copy(frmMainMenu.sCurrentUser, iPosC + 1, 3));
          delete(frmMainMenu.sCurrentUser, iPosC + 1, 3);
        except
          try
            iCopy := StrToInt(copy(frmMainMenu.sCurrentUser, iPosC + 1, 2));
            delete(frmMainMenu.sCurrentUser, iPosC + 1, 2);
          except
            iCopy := StrToInt(copy(frmMainMenu.sCurrentUser, iPosC + 1, 1));
            delete(frmMainMenu.sCurrentUser, iPosC + 1, 1);
          end;
        end;
        insert(IntToStr(iHighScore), frmMainMenu.sCurrentUser, iPosC + 1);
      end;
  end;
end;

procedure TfrmGame.tmrMoveTimer(Sender: TObject);
begin
  //Waar die prentjie moet verskyn
  imgItem.Left := RandomRange(imgItem.Width,
  (frmGame.Width - imgItem.Width) - imgItem.Width);

  imgItem.Top := RandomRange(imgItem.Height,
  (frmGame.Height - imgItem.Height) - imgItem.Height);

  //Waar die ster moet verskyn
  imgBonusPoints.Left := RandomRange(imgBonusPoints.Width,
  (frmGame.Width - imgBonusPoints.Width) - imgBonusPoints.Width);

  imgBonusPoints.Top := RandomRange(imgBonusPoints.Height, (
  frmGame.Height - imgBonusPoints.Height) - imgBonusPoints.Height);

  //Waar bom moet verskyn
  imgBomb.Left := RandomRange(imgBomb.Width,
  (frmGame.Width - imgBomb.Width) - imgBomb.Width);

  imgBomb.Top := RandomRange(imgBomb.Height,
  (frmGame.Height - imgBomb.Height) - imgBomb.Height);

  imgItem.Visible := True;
  tmrTooSlow.Enabled := True;

  //Wanneer die ster moet verskyn
  if iScore = iBonusVisible then
  begin
    imgBonusPoints.Visible := True;
  end else if iScore = iBombVisible then
  begin
    imgBomb.Visible := True;
  end;

end;

procedure TfrmGame.tmrTooSlowTimer(Sender: TObject); //Wat gebeur as jy te lank vat
begin
  tmrMove.Enabled := False;
  tmrTooSlow.Enabled := False;
  wmpBackgroundMusic.controls.stop;

  pnlLost.Left := 0;
  pnlLost.Top := 0;
  pnlLost.Visible := True;
  lblLost.Caption := 'Too Slow';
  pnlLostScore.Caption := IntToStr(iScore);

  if bClassic = True then
  begin
    pnlLostHighScore.Caption := IntToStr(iHighC);
  end else if bEasy = True then
  begin
    pnlLostHighScore.Caption := IntToStr(iHighE);
  end else if bIntermediate = True then
  begin
    pnlLostHighScore.Caption := IntToStr(iHighI);
  end else if bHard = True then
  begin
    pnlLostHighScore.Caption := IntToStr(iHighH);
  end;

  imgItem.Visible := False;
  imgBonusPoints.Visible := False;
  imgBomb.Visible := False;

  btnStart.Visible := True;
  bmbMainMenu.Visible := True;
end;
end.
