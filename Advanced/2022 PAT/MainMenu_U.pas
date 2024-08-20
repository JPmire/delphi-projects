unit MainMenu_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GameMode_U, StdCtrls, Game_U, Shop_U, Settings_U, Buttons, pngimage,
  ExtCtrls, HowToPlay_U, jpeg, Admin_U;

type
  TfrmMainMenu = class(TForm)
    btnPlay: TButton;
    btnSettings: TButton;
    lblTitle: TLabel;
    btnShop: TButton;
    bmbClose: TBitBtn;
    Label1: TLabel;
    imgIcon: TImage;
    bmbHowToPlay: TBitBtn;
    imgBackground: TImage;
    pnlUser: TPanel;
    btnLoadUser: TButton;
    btnCreateUser: TButton;
    imgUsersBackground: TImage;
    Shape1: TShape;
    Shape2: TShape;
    btnSwitchUser: TBitBtn;
    btnAdmin: TButton;
    Shape3: TShape;
    procedure btnPlayClick(Sender: TObject);
    procedure btnShopClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure bmbHowToPlayClick(Sender: TObject);
    procedure btnLoadUserClick(Sender: TObject);
    procedure btnCreateUserClick(Sender: TObject);
    procedure btnSwitchUserClick(Sender: TObject);
    procedure btnAdminClick(Sender: TObject);
    procedure bmbCloseClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    sUserLine, sCurrentUser, sUserName : string;
    sUserCreate, sUserLoad, sAvailableUsers, sWriteUser : string;
    tFileUsers, tAvailableUsers : TextFile;
  end;

var
  frmMainMenu: TfrmMainMenu;

implementation

{$R *.dfm}

procedure TfrmMainMenu.bmbCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMainMenu.bmbHowToPlayClick(Sender: TObject);
begin
  Self.Hide;
  frmHowToPlay.Show;
end;

procedure TfrmMainMenu.btnAdminClick(Sender: TObject);
var
sPassword, sCorrectPassword : string;
begin
  sPassword := InputBox('Admin Password', 'Enter the Admin Password','');
  sCorrectPassword := 'admin123';
  if sPassword = sCorrectPassword then
  begin
    Self.Hide;
    frmAdmin.Show;
  end else
  begin
    ShowMessage('Incorrect Password');
  end;


end;

procedure TfrmMainMenu.btnCreateUserClick(Sender: TObject);
var
iPos : integer;
  i: Integer;
begin
  sUserCreate := InputBox('Username', 'Enter your username','');
  if sUserCreate = '' then
  begin
    ShowMessage('Invalid Username');
    exit;
  end;

  for i := 1 to length(sUserCreate) do
  begin
    if sUserCreate[i] = ' ' then
    begin
      ShowMessage('No Spaces');
      exit;
    end;
  end;

    if FileExists('Users/' + sUserCreate + '.txt') = True then
    begin
      Showmessage('User Already Exists');
      exit;
    end else
    begin
      AssignFile(tFileUsers, 'Users/' + sUserCreate + '.txt');
      Rewrite(tFileUsers);
      Writeln(tFileUsers, '!0@0#0$0%0^0.');
      ShowMessage('User Created');
    end;
    CloseFile(tFileUsers);

    AssignFile(frmAdmin.tAvailableUsers, 'Admin/AvailableUsers.txt');
    Append(frmAdmin.tAvailableUsers);
    Writeln(frmAdmin.tAvailableUsers, sUserCreate);
    CloseFile(frmAdmin.tAvailableUsers);


end;


procedure TfrmMainMenu.btnLoadUserClick(Sender: TObject);
var
iPos : integer;
begin
    sUserLoad := InputBox('Username', 'Enter your username','');
    AssignFile(tFileUsers, 'Users/' + sUserLoad + '.txt');
    if FileExists('Users/' + sUserLoad + '.txt') = True then
    begin
      reset(tFileUsers);
      readln(tFileUsers, sUserLine);
      sCurrentUser := sUserLine;
      CloseFile(tFileUsers);
      ShowMessage('User Found');
      pnlUser.Visible := False;
      exit;
    end;

    if FileExists('Users/' + sUserLoad + '.txt') = False then
    begin
      ShowMessage('User Not Found');
      exit;
    end;
 end;

procedure TfrmMainMenu.btnPlayClick(Sender: TObject);
begin
  Self.Hide;
  frmGameMode.Show;
end;
procedure TfrmMainMenu.btnSettingsClick(Sender: TObject);
begin
  Self.Hide;
  frmSettings.Show;
end;

procedure TfrmMainMenu.btnShopClick(Sender: TObject);
begin
  Self.Hide;
  frmShop.Show;
end;

procedure TfrmMainMenu.btnSwitchUserClick(Sender: TObject);
begin
  pnlUser.Visible := True;
end;

end.
