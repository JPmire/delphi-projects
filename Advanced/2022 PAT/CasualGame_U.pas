unit CasualGame_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, math;

type
  TfrmCasualGame = class(TForm)
    tmrEasy: TTimer;
    pnlScore: TPanel;
    imgBall: TImage;
    lblInstruction: TLabel;
    tmrTooSlow: TTimer;
    procedure tmrEasyTimer(Sender: TObject);
    procedure imgBallClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure tmrTooSlowTimer(Sender: TObject);
  private
    { Private declarations }
  iScore, iTop, iLeft : integer;

  public
    { Public declarations }
  end;

var
  frmCasualGame: TfrmCasualGame;

implementation

{$R *.dfm}

procedure TfrmCasualGame.FormClick(Sender: TObject);
begin
  iTop := 176;
  iLeft := 536;
  tmrEasy.Enabled := False;
  tmrTooSlow.Enabled := False;
  imgBall.Top := iTop;
  imgBall.Left := iLeft;
  ShowMessage('Sorry, You Lost');
  ShowMessage('Your final score was ' + IntToStr(iScore));
  pnlScore.Caption := '0';
  imgBall.Visible := True;
  lblInstruction.Visible := True;
end;

procedure TfrmCasualGame.imgBallClick(Sender: TObject);
begin
  iScore := StrToInt(pnlScore.Caption);
  pnlScore.Caption := IntToStr(iScore + 1);
  imgBall.Visible := False;;
  lblInstruction.Visible := False;
  tmrEasy.Enabled := True;
  tmrTooSlow.Enabled := False;
end;

procedure TfrmCasualGame.tmrEasyTimer(Sender: TObject);
begin
  imgBall.Left := RandomRange(1, frmCasualGame.Width - imgBall.Width);
  imgBall.Top := RandomRange(1, frmCasualGame.Height - imgBall.Height);
  imgBall.Visible := True;
  tmrTooSlow.Enabled := True;

end;

procedure TfrmCasualGame.tmrTooSlowTimer(Sender: TObject);
begin
  tmrEasy.Enabled := False;
  tmrTooSlow.Enabled := False;
  showmessage('Sorry you were too slow');
  pnlScore.Caption := '0';
  imgBall.Top := iTop;
  imgBall.Left := iLeft;
  lblInstruction.Visible := True;
end;

end.
