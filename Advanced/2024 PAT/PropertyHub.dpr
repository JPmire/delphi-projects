program PropertyHub;

uses
  Forms,
  Main_U in 'Main_U.pas' {frmFrontPage},
  Agent_U in 'Agent_U.pas' {frmAgent},
  dmPropertyHub_U in 'dmPropertyHub_U.pas' {dmPropertyHub: TDataModule},
  PopupPanel in 'Classes\PopupPanel.pas',
  CustomButtons in 'Classes\CustomButtons.pas',
  AgentPropertyCard in 'Classes\AgentPropertyCard.pas',
  Client in 'Classes\Client.pas',
  Client_U in 'Client_U.pas' {frmClient},
  ColoredListBox in 'Classes\ColoredListBox.pas',
  ClientPropertyCard in 'Classes\ClientPropertyCard.pas',
  ListingDetails in 'Classes\ListingDetails.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFrontPage, frmFrontPage);
  Application.CreateForm(TfrmAgent, frmAgent);
  Application.CreateForm(TdmPropertyHub, dmPropertyHub);
  Application.CreateForm(TfrmClient, frmClient);
  Application.Run;
end.
