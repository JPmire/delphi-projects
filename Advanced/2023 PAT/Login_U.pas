unit Login_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, pngimage, ExtCtrls, Main_U;

type
  TfrmLogin = class(TForm)
    lblTitle: TLabel;
    imgBackground: TImage;
    lbledtPassword: TLabeledEdit;
    lbledtUsername: TLabeledEdit;
    pnlLogin: TPanel;
    imgLogo: TImage;
    btnLogin: TButton;
    imgUsername: TImage;
    imgPassword: TImage;
    imgShowPswd: TImage;
    procedure FormActivate(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure imgShowPswdClick(Sender: TObject);
  private
    { Private declarations }
    bPswdHidden : boolean;
  public
    { Public declarations }
    sAdminPassword, sAdminUsername : string;
    const
      ADMIN_USERNAME = 'Admin';
      ADMIN_PASSWORD = 'admin123';
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
  tFile : TextFile;
  sUserName, sPassword, sFileUserName, sFilePassword, sLine : string;
  sUserPassword : string;
  iPos, iLoops : integer;
  bCorrectUsername : boolean;
begin
  sUserName := lbledtUsername.Text;
  sPassword := lbledtPassword.Text;
  bCorrectUsername := False;
  iLoops := 1;
  AssignFile(tFile, 'TextFile/Users.txt');
  reset(tFile);
  while not eof(tFile) do
  begin
    Readln(tFile, sLine);
    iPos := pos(':', sLine);
    sFileUserName := copy(sLine, 1, iPos - 1);
    Delete(sLine, 1, iPos);
    sFilePassword := Copy(sLine, 1, Length(sLine));
    if (iLoops = 1) then
    begin
      sAdminUsername := sFileUserName;
      sAdminPassword := sFilePassword;
    end;
    if (sUserName = sFileUserName) then
    begin
      bCorrectUsername := True;
      sUserPassword := sFilePassword;
    end;
    inc(iLoops);
  end;
  CloseFile(tFile);


  if bCorrectUsername = True then
  begin
    if sUserName = sAdminUsername then
    begin
      if sPassword = sAdminPassword then
      begin
        Self.Hide;
        lbledtUsername.Clear;
        lbledtPassword.Clear;
        frmAdmin.btnCustomers.Visible := True;                            // *****NEW*****
        frmAdmin.btnInventory.Visible := True;
        frmAdmin.btnOrders.Top := 383;   // *****NEW*****
        //frmAdmin.Show;
        ShowMessage('Welcome Admin');
        frmAdmin.Show;
        exit;
      end;
    end;

    if sPassword = sUserPassword then
    begin
        Self.Hide;
        lbledtUsername.Clear;
        lbledtPassword.Clear;
        frmAdmin.btnCustomers.Visible := False;                            // *****NEW*****
        frmAdmin.btnInventory.Visible := False;                            // *****NEW*****
        frmAdmin.btnOrders.Top := frmAdmin.btnCustomers.Top;
        frmAdmin.btnOrders.Click;   // *****NEW*****
        frmAdmin.Show;
        exit;
    end else ShowMessage('Incorrect Password');
  end else ShowMessage('Invalid Username');




end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  lblTitle.Font.Color := RGB(48, 36, 13);
  bPswdHidden := True;
end;

procedure TfrmLogin.imgShowPswdClick(Sender: TObject);
begin
  if bPswdHidden = True then
  begin
    imgShowPswd.Picture.LoadFromFile('Images/Icons/show.png');
    lbledtPassword.PasswordChar := #0;
    bPswdHidden := False;
  end else
  begin
    imgShowPswd.Picture.LoadFromFile('Images/Icons/hidden.png');
    lbledtPassword.PasswordChar := '*';
    bPswdHidden := True;
  end;



end;

end.
