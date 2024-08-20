unit Settings_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Game_U, PingPong_U, Jumper_U, pngimage,
  ExtCtrls;

type
  TfrmSettings = class(TForm)
    bmbMainMenu: TBitBtn;
    bmbAllHighScores: TBitBtn;
    bmbClassicHighScore: TBitBtn;
    bmbEasyHighScore: TBitBtn;
    bmbInterHighScore: TBitBtn;
    bmbHardHighScore: TBitBtn;
    Label1: TLabel;
    bmbPingPong: TBitBtn;
    bmbJumperHighScore: TBitBtn;
    imgBackground: TImage;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bmbMainMenuClick(Sender: TObject);
    procedure bmbAllHighScoresClick(Sender: TObject);
    procedure bmbClassicHighScoreClick(Sender: TObject);
    procedure bmbEasyHighScoreClick(Sender: TObject);
    procedure bmbInterHighScoreClick(Sender: TObject);
    procedure bmbHardHighScoreClick(Sender: TObject);
    procedure bmbPingPongClick(Sender: TObject);
    procedure bmbJumperHighScoreClick(Sender: TObject);
  private
    { Private declarations }
  tFileClassic, tFileEasy, tFileInter, tFileHard, tFileChasing, tFileJumper,
  tFileUsers : TextFile;
  iPos, iCopy : integer;
  procedure ClearHighScore(sPlaceholder : string);
  public
    { Public declarations }
  end;

var
  frmSettings: TfrmSettings;

implementation

uses MainMenu_U;

{$R *.dfm}

procedure TfrmSettings.bmbPingPongClick(Sender: TObject);
begin
  ClearHighScore('%');
  ShowMessage('Ping Pong HighScore cleared');
end;

procedure TfrmSettings.bmbClassicHighScoreClick(Sender: TObject);
begin
  ClearHighScore('!');
  ShowMessage('Classic HighScore cleared');
end;

procedure TfrmSettings.bmbEasyHighScoreClick(Sender: TObject);
begin
  ClearHighScore('@');
  ShowMessage('Easy HighScore cleared');
end;

procedure TfrmSettings.bmbHardHighScoreClick(Sender: TObject);
begin
  ClearHighScore('$');
  ShowMessage('Hard HighScore cleared');
end;

procedure TfrmSettings.bmbInterHighScoreClick(Sender: TObject);
begin
  ClearHighScore('#');
  ShowMessage('Intermediate HighScore cleared');
end;

procedure TfrmSettings.bmbJumperHighScoreClick(Sender: TObject);
begin
  ClearHighScore('^');
  ShowMessage('Jumper HighScore cleared');
end;

procedure TfrmSettings.bmbMainMenuClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmSettings.ClearHighScore(sPlaceholder: string);
begin
  AssignFile(tFileUsers, 'Users/' + frmMainMenu.sUserLoad + '.txt');
  iPos := pos(sPlaceholder, frmMainMenu.sCurrentUser);
  try
    iCopy := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
    delete(frmMainMenu.sCurrentUser, iPos + 1, 3);
    insert('0', frmMainMenu.sCurrentUser, iPos + 1);
  except
    try
      iCopy := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
      delete(frmMainMenu.sCurrentUser, iPos + 1, 2);
      insert('0', frmMainMenu.sCurrentUser, iPos + 1);
    except
      iCopy := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
      delete(frmMainMenu.sCurrentUser, iPos + 1, 1);
      insert('0', frmMainMenu.sCurrentUser, iPos + 1);
    end;
  end;
  Rewrite(tFileUsers);
  Writeln(tFileUsers, frmMainMenu.sCurrentUser);
  Closefile(tFileUsers);
end;

procedure TfrmSettings.bmbAllHighScoresClick(Sender: TObject);
begin
  frmGame.iHighC := 0;
  frmGame.iHighE := 0;
  frmGame.iHighI := 0;
  frmGame.iHighH := 0;
  frmPingPong.iHighScore := 0;
  frmJumper.iHighScoreJ := 0;


  Rewrite(frmMainMenu.tFileUsers);
  Writeln(frmMainMenu.tFileUsers, '!0@0#0$0%0^0.');
  Reset(frmMainMenu.tFileUsers);
  Readln(frmMainMenu.tFileUsers, frmMainMenu.sUserLine);
  frmMainMenu.sCurrentUser := frmMainMenu.sUserLine;
  frmMainMenu.sCurrentUser := frmMainMenu.sUserLine;
  CloseFile(frmMainMenu.tFileUsers);
  ShowMessage('All HighScores cleared');

end;

procedure TfrmSettings.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Application.MainForm.Show;
end;

end.
