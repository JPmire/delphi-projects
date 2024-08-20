unit Admin_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, Spin;

type
  TfrmAdmin = class(TForm)
    imgBackground: TImage;
    edtUser: TEdit;
    Label1: TLabel;
    Panel1: TPanel;
    bmbRemoveUser: TBitBtn;
    bmbEditUser: TBitBtn;
    bmbClose: TBitBtn;
    pnlEditUser: TPanel;
    cmbHighScores: TComboBox;
    Label2: TLabel;
    sedHighScore: TSpinEdit;
    Label3: TLabel;
    bmbSubmit: TBitBtn;
    bmbShowUsers: TBitBtn;
    memUsers: TMemo;
    bmbCloseUsers: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bmbRemoveUserClick(Sender: TObject);
    procedure bmbEditUserClick(Sender: TObject);
    procedure bmbSubmitClick(Sender: TObject);
    procedure bmbShowUsersClick(Sender: TObject);
    procedure bmbCloseUsersClick(Sender: TObject);
  private
    { Private declarations }
    sUser : string;
    procedure EditHighScore (sPlaceholder : string);
  public
    { Public declarations }
    sAvailableUsers : string;
    tAvailableUsers : TextFile;
  end;

var
  frmAdmin: TfrmAdmin;

implementation

uses MainMenu_U;

{$R *.dfm}

procedure TfrmAdmin.bmbCloseUsersClick(Sender: TObject);
begin
  memUsers.Visible := False;
  bmbCloseUsers.Visible := False;
  bmbShowUsers.Enabled := True;
end;

procedure TfrmAdmin.bmbEditUserClick(Sender: TObject);
begin
  sUser := edtUser.Text;
  if FileExists('Users/' + sUser + '.txt') then
  begin
    pnlEditUser.Visible := True;
  end else
  begin
    ShowMessage('User not Found');
    pnlEditUser.Visible := False;
  end;

end;

procedure TfrmAdmin.bmbRemoveUserClick(Sender: TObject);
var
iMessage : integer;
begin
  sUser := edtUser.Text;
  iMessage := MessageDlg('Are you sure?',mtConfirmation, [mbOK, mbCancel], 0);
  if iMessage = mrCancel then
  begin
    exit;
  end else
  begin
    if FileExists('Users/' + sUser + '.txt') then
    begin
      DeleteFile('Users/' + sUser + '.txt');
      ShowMessage('User Deleted');
    end else
    begin
      ShowMessage('User not Found');
    end;
    bmbCloseUsers.Click;
    bmbShowUsers.Click;
    edtUser.Clear;
    edtUser.SetFocus;
  end;
end;

procedure TfrmAdmin.bmbShowUsersClick(Sender: TObject);
begin
  memUsers.Lines.Clear;
  AssignFile(tAvailableUsers, 'Admin/AvailableUsers.txt');
  Reset(tAvailableUsers);
  while not (eof(tAvailableUsers)) do
  begin
    Readln(tAvailableUsers, sAvailableUsers);
    if FileExists('Users/' + sAvailableUsers + '.txt') then
    begin
      memUsers.Lines.Add(sAvailableUsers);
    end;
  end;
    Rewrite(tAvailableUsers);
    Writeln(tAvailableUsers, memUsers.Lines.Text);
  CloseFile(tAvailableUsers);
  bmbCloseUsers.Visible := True;
  memUsers.Visible := True;
  bmbShowUsers.Enabled := False;
end;

procedure TfrmAdmin.bmbSubmitClick(Sender: TObject);
begin

  if FileExists('Users/' + sUser + '.txt') then
  begin
    if cmbHighScores.ItemIndex = 0 then
    begin
      EditHighScore('!');
    end else if cmbHighScores.ItemIndex = 1 then
    begin
      EditHighScore('@');
    end else if cmbHighScores.ItemIndex = 2 then
    begin
      EditHighScore('#');
    end else if cmbHighScores.ItemIndex = 3 then
    begin
      EditHighScore('$');
    end else if cmbHighScores.ItemIndex = 4 then
    begin
      EditHighScore('%');
    end else if cmbHighScores.ItemIndex = 5 then
    begin
      EditHighScore('^');
    end;
  end else
  begin
    ShowMessage('User not Found');
  end;

end;

procedure TfrmAdmin.EditHighScore(sPlaceholder: string);
var
tFileUsers : TextFile;
iPos, iCopy : integer;
begin
  AssignFile(tFileUsers, 'Users/' + sUser + '.txt');
  reset(tFileUsers);
  Readln(tFileUsers, frmMainMenu.sCurrentUser);
  iPos := pos(sPlaceholder, frmMainMenu.sCurrentUser);
  try
    iCopy := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
    delete(frmMainMenu.sCurrentUser, iPos + 1, 3);
    insert(IntToStr(sedHighScore.Value), frmMainMenu.sCurrentUser, iPos + 1);
  except
    try
      iCopy := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
      delete(frmMainMenu.sCurrentUser, iPos + 1, 2);
      insert(IntToStr(sedHighScore.Value), frmMainMenu.sCurrentUser, iPos + 1);
    except
      iCopy := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
      delete(frmMainMenu.sCurrentUser, iPos + 1, 1);
      insert(IntToStr(sedHighScore.Value), frmMainMenu.sCurrentUser, iPos + 1);
    end;
  end;
  Rewrite(tFileUsers);
  Writeln(tFileUsers, frmMainMenu.sCurrentUser);
  Closefile(tFileUsers);
  ShowMessage('HighScore has been set');
end;

procedure TfrmAdmin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  pnlEditUser.Visible := False;
  edtUser.Clear;
  edtUser.SetFocus;
  Application.MainForm.Show;
end;

end.
