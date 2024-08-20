unit Main_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, pngimage, CustomButtons, Agent_U, dmPropertyHub_U,
  Client_U, ImgList;

type
  TfrmFrontPage = class(TForm)
    pnlAgent: TPanel;
    pnlClient: TPanel;
    imgBackground: TImage;
    imgLogo: TImage;
    pnlContainer: TPanel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure pnlClientClick(Sender: TObject);
    procedure pnlAgentClick(Sender: TObject);
  private
    { Private declarations }
    iClientID : integer;
  public
    { Public declarations }

  end;

var
  frmFrontPage: TfrmFrontPage;

implementation


{$R *.dfm}


procedure TfrmFrontPage.FormCreate(Sender: TObject);
var
  cbtnClient, cbtnAgent : TCustomButtons;
begin

  cbtnClient := TCustomButtons.Create(pnlClient);
  cbtnAgent := TCustomButtons.Create(pnlAgent);
  with cbtnClient do
  begin
    BorderRadius := 5;
    // VerticalGradient(rgb(135, 206, 250), rgb(70, 130, 180));
    Color := rgb(70, 130, 180);
    Hover.Color := rgb(100, 149, 237);
    Click.Color := rgb(95, 158, 250);
  end;

  with cbtnAgent do
  begin
    BorderRadius := 5;
   // VerticalGradient(rgb(135, 206, 250), rgb(70, 130, 180));
   Color := rgb(70, 130, 180);
    Hover.Color := rgb(100, 149, 237);
    Click.Color := rgb(95, 158, 250);
  end;

  pnlContainer.Color := rgb(180, 210, 210);
end;

procedure TfrmFrontPage.pnlAgentClick(Sender: TObject);
begin
  frmAgent.Show;
  Self.Hide;
end;

procedure TfrmFrontPage.pnlClientClick(Sender: TObject);
var
  sUsername : string;
  sPassword : string;
begin
  sUsername := inputbox('Username', 'Enter your Username:', 'ericardod');
  sPassword := inputbox('Password', 'Enter your Password:', 'TempPass580');

  with dmPropertyHub do
  begin
    if tblClients.Locate('Username', sUsername, []) then
    begin
        if sPassword = tblClients['UserPassword'] then
        begin
          ShowMessage('Welcome! ' + tblClients['FirstName']);
          iClientID := tblClients['ClientID'];
          frmClient.iClientID := iClientID;
          frmClient.pnlProfile.Caption := tblClients['FirstName'];
          Self.Hide;
          Client_U.frmClient.Show;
        end else
        begin
          ShowMessage('Incorrect Password');
          exit;
        end;
      end else
      begin
        ShowMessage('Incorrect Username');
        exit;
      end;
  end;
end;

end.
