﻿unit ClassicGame_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, math, Buttons, pngimage;

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
    procedure tmrMoveTimer(Sender: TObject);
    procedure imgItemClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure tmrTooSlowTimer(Sender: TObject);
    procedure bmbMainMenuClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnStartClick(Sender: TObject);
    procedure imgBonusPointsClick(Sender: TObject);
  private
    { Private declarations }
  iScore : integer;
  iBonusVisible : integer;
  public
    { Public declarations }
  iHighScore : integer;
  bClassic, bEasy, bIntermediate, bHard : boolean;
  end;

var
  frmGame: TfrmGame;

implementation
{$R *.dfm}

procedure TfrmGame.bmbMainMenuClick(Sender: TObject);
begin
  Application.MainForm.Show;
  Self.Close;
end;

procedure TfrmGame.btnStartClick(Sender: TObject);
begin
  //Bereken die difficulty (Spoed van prentjie)
  if bEasy = True then
  begin
    tmrMove.Interval := 2000;
    tmrTooSlow.interval := 2000;
  end else
  if bIntermediate = True then
  begin
    tmrMove.Interval := 1500;
    tmrTooSlow.Interval := 1500;
  end else
  if bHard = True then
  begin
    tmrMove.Interval := 1000;
    tmrTooSlow.Interval := 1000;
  end;

  tmrMove.Enabled := True;
  btnStart.Visible := False;
  bmbMainMenu.Visible := False;
  //Kry 'n random nommer vir wanner die ster(+2 punte) moet verskyn
  Randomize;
  iBonusVisible := iScore + randomrange(3, 10);
end;

procedure TfrmGame.FormClick(Sender: TObject); //As jy mis kliek
begin
  tmrMove.Enabled := False;
  tmrTooSlow.Enabled := False;


  ShowMessage('You Lost');
  iScore := 0;
  pnlScore.Caption := IntToStr(iScore);

  imgItem.Visible := False;
  imgBonusPoints.Visible := False;
  btnStart.Visible := True;
  bmbMainMenu.Visible := True;
end;

procedure TfrmGame.FormCloseQuery(Sender: TObject;  //As jy die die window toe maak
  var CanClose: Boolean);
begin
  Application.MainForm.Show;
  tmrMove.Enabled := False;
  tmrTooSlow.Enabled := False;


  bClassic := False;
  bEasy := False;
  bIntermediate := False;
  bHard := False;

  iScore := 0;
  pnlScore.Caption := IntToStr(iScore);

  imgItem.Visible := False;
  imgBonusPoints.Visible := False;

  btnStart.Visible := True;
  bmbMainMenu.Visible := True;
end;

procedure TfrmGame.imgBonusPointsClick(Sender: TObject); //As jy op die ster kliek
begin
  Inc(iScore,2);
  pnlScore.Caption := IntToStr(iScore);

  imgBonusPoints.Visible := False;

  Randomize;
  iBonusVisible := iScore + RandomRange(3, 10);

  imgItem.Visible := False;
  tmrTooSlow.Enabled := False;

  //Bereken High Score
  if iScore >= iHighScore then
  begin
    pnlHighScore.Caption := IntToStr(iScore);
    iHighScore := StrToInt(pnlHighScore.Caption);
  end;

end;

procedure TfrmGame.imgItemClick(Sender: TObject);
begin
  pnlScore.Caption := IntToStr(iScore + 1);
  iScore := StrToInt(pnlScore.Caption);

  imgItem.Visible := False;

  if imgBonusPoints.Visible = True then
  begin
    Randomize;
    iBonusVisible := iScore + RandomRange(3, 10);
  end;

  imgBonusPoints.Visible := False;
  tmrTooSlow.Enabled := False;



  if iScore >= iHighScore then
  begin
    pnlHighScore.Caption := IntToStr(iScore);
    iHighScore := StrToInt(pnlHighScore.Caption);
  end;

  //Classic Mode (Prentjie word vinniger na tyd)
  if bClassic = True then
  begin
    if iScore < 10 then
    begin
      tmrMove.Interval := 2000;
      tmrTooSlow.Interval := 2000;
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
    end;
  end else
  begin
    bClassic := False;
  end;
  

end;

procedure TfrmGame.tmrMoveTimer(Sender: TObject);
begin
  //Waar die prentjie moet verskyn
  imgItem.Left := RandomRange(imgItem.Width, (frmGame.Width - imgItem.Width) - imgItem.Width);
  imgItem.Top := RandomRange(imgItem.Height, (frmGame.Height - imgItem.Height) - imgItem.Height);

  //Waar die ster moet verskyn
  imgBonusPoints.Left := RandomRange(imgBonusPoints.Width, (frmGame.Width - imgItem.Width) - imgBonusPoints.Height);
  imgBonusPoints.Top := RandomRange(imgBonusPoints.Height, (frmGame.Height - imgItem.Height) - imgBonusPoints.Height);

  imgItem.Visible := True;
  tmrTooSlow.Enabled := True;

  //Wanneer die ster moet verskyn
  if iScore = iBonusVisible then
  begin
    imgBonusPoints.Visible := True;
  end;

end;

procedure TfrmGame.tmrTooSlowTimer(Sender: TObject); //Wat gebeur as jy te lank vat
begin
  tmrMove.Enabled := False;
  tmrTooSlow.Enabled := False;

  showmessage('Too Slow');
  iScore := 0;
  pnlScore.Caption := IntToStr(iScore);

  imgItem.Visible := False;
  imgBonusPoints.Visible := False;

  btnStart.Visible := True;
  bmbMainMenu.Visible := True;
end;

end.
