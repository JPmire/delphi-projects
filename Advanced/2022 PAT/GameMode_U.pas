unit GameMode_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Game_U, Buttons, SelectDifficulty_U, ChasingGame_U,
  Jumper_U, pngimage, PingPong_U;

type
  TfrmGameMode = class(TForm)
    pnlInstruction: TPanel;
    btnClassic: TButton;
    btnCustomDifficulty: TButton;
    bmbMainMenu: TBitBtn;
    btnPingPong: TButton;
    btnJumper: TButton;
    imgBackground: TImage;
    procedure btnClassicClick(Sender: TObject);
    procedure bmbMainMenuClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCustomDifficultyClick(Sender: TObject);
    procedure btnPingPongClick(Sender: TObject);
    procedure btnJumperClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bClassicBackAvailable : boolean;
  end;

var
  frmGameMode: TfrmGameMode;
  BackgroundClassic : TImage;

implementation

{$R *.dfm}

procedure TfrmGameMode.bmbMainMenuClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmGameMode.btnPingPongClick(Sender: TObject);
begin
  frmPingPong.Show;
  Self.Hide;
end;

procedure TfrmGameMode.btnClassicClick(Sender: TObject);
begin
  frmGame.Show;
  frmGame.tmrMove.Interval := 1800;
  frmGame.tmrTooSlow.Interval := 1800;
  frmGame.bClassic := True;
  frmGame.bEasy := False;
  frmGame.bIntermediate := False;
  frmGame.bHard := False;
  BackgroundClassic := TImage.Create(frmGame);
  with BackgroundClassic do
  begin
    Stretch := True;
    Align := alClient;
    Picture.LoadFromFile('Game\Classic\Classic(Background).png');
    Parent := frmGame;
    Enabled := False;
    SendToBack;
  end;
  bClassicBackAvailable := True;

  if (frmSelectDifficulty.bInterBackAvailable = True) then
  begin
    BackgroundInter.Destroy;
    frmSelectDifficulty.bInterBackAvailable := False;
  end;

  if (frmSelectDifficulty.bHardBackAvailable = True) then
  begin
    BackgroundHard.Destroy;
    frmSelectDifficulty.bHardBackAvailable := False;
  end;

  if (frmSelectDifficulty.bEasyBackAvailable = True) then
  begin
    BackgroundEasy.Destroy;
    frmSelectDifficulty.bEasyBackAvailable := False;
  end;
  Self.Close;
end;

procedure TfrmGameMode.btnCustomDifficultyClick(Sender: TObject);
begin
  frmSelectDifficulty.Show;
  Self.Hide;
end;

procedure TfrmGameMode.btnJumperClick(Sender: TObject);
begin
  frmJumper.Show;
  Self.Hide;
end;

procedure TfrmGameMode.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Application.MainForm.Show;
end;

end.
