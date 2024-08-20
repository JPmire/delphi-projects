unit SelectDifficulty_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Game_U, jpeg, Buttons;

type
  TfrmSelectDifficulty = class(TForm)
    btnEasy: TButton;
    btnIntermediate: TButton;
    btnHard: TButton;
    Panel1: TPanel;
    imgBackground: TImage;
    bmbQuit: TBitBtn;
    procedure btnEasyClick(Sender: TObject);
    procedure btnIntermediateClick(Sender: TObject);
    procedure btnHardClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bmbQuitClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    bInterBackAvailable, bEasyBackAvailable, bHardBackAvailable : boolean;
  end;

var
  frmSelectDifficulty: TfrmSelectDifficulty;
  BackgroundEasy, BackgroundInter, BackgroundHard: TImage;

implementation

uses GameMode_U;

{$R *.dfm}


procedure TfrmSelectDifficulty.bmbQuitClick(Sender: TObject);
begin
  Application.MainForm.Show;
  Self.Close;
end;

procedure TfrmSelectDifficulty.btnEasyClick(Sender: TObject);
begin
  frmGame.Show;
  frmGame.bEasy := True;
  frmGame.bIntermediate := False;
  frmGame.bHard := False;
  BackgroundEasy := TImage.Create(frmGame);
  with BackgroundEasy do
  begin
    Stretch := True;
    Align := alClient;
    Picture.LoadFromFile('Game\Easy\EasyBackground.jpg');
    Parent := frmGame;
    Enabled := False;
    SendToBack;
  end;
  bEasyBackAvailable := True;

  if (frmGameMode.bClassicBackAvailable = True) then
  begin
    BackgroundClassic.Destroy;
    frmGameMode.bClassicBackAvailable := False;
  end;

  if (bInterBackAvailable = True) then
  begin
    BackgroundInter.Destroy;
    bInterBackAvailable := False;
  end;

  if (bHardBackAvailable = True) then
  begin
    BackgroundHard.Destroy;
    bHardBackAvailable := False;
  end;

  frmGame.pnlHighScore.Caption := IntToStr(frmGame.iHighE);
  Self.Hide;
end;

procedure TfrmSelectDifficulty.btnHardClick(Sender: TObject);
begin
  frmGame.Show;
  frmGame.bEasy := False;
  frmGame.bIntermediate := False;
  frmGame.bHard := True;
  BackgroundHard := TImage.Create(frmGame);
  with BackgroundHard do
  begin
    Stretch := True;
    Align := alClient;
    Picture.LoadFromFile('Game\Hard\HardBackground.png');
    Parent := frmGame;
    Enabled := False;
    SendToBack;
  end;
  bHardBackAvailable := True;

  if (frmGameMode.bClassicBackAvailable = True) then
  begin
    BackgroundClassic.Destroy;
    frmGameMode.bClassicBackAvailable := False;
  end;

  if (bInterBackAvailable = True) then
  begin
    BackgroundInter.Destroy;
    bInterBackAvailable := False;
  end;

  if (bEasyBackAvailable = True) then
  begin
    BackgroundEasy.Destroy;
    bEasyBackAvailable := False;
  end;
  frmGame.pnlHighScore.Caption := IntToStr(frmGame.iHighH);
  Self.Hide;
end;

procedure TfrmSelectDifficulty.btnIntermediateClick(Sender: TObject);
begin
  frmGame.Show;
  frmGame.bEasy := False;
  frmGame.bIntermediate := True;
  frmGame.bHard := False;
  BackgroundInter := TImage.Create(frmGame);
  with BackgroundInter do
  begin
    Stretch := True;
    Align := alClient;
    Picture.LoadFromFile('Game\Intermediate\InterBackground.png');
    Parent := frmGame;
    Enabled := False;
    SendToBack;
  end;
  bInterBackAvailable := True;

  if (frmGameMode.bClassicBackAvailable = True) then
  begin
    BackgroundClassic.Destroy;
    frmGameMode.bClassicBackAvailable := False;
  end;

  if (bHardBackAvailable = True) then
  begin
    BackgroundHard.Destroy;
    bHardBackAvailable := False;
  end;

  if (bEasyBackAvailable = True) then
  begin
    BackgroundEasy.Destroy;
    bEasyBackAvailable := False;
  end;
  frmGame.pnlHighScore.Caption := IntToStr(frmGame.iHighI);
  Self.Hide;
end;

procedure TfrmSelectDifficulty.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Application.MainForm.Hide;
  frmGameMode.show;
end;

end.
