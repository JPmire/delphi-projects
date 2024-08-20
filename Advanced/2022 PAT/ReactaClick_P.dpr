program ReactaClick_P;

uses
  Forms,
  Game_U in 'Game_U.pas' {frmGame},
  MainMenu_U in 'MainMenu_U.pas' {frmMainMenu},
  GameMode_U in 'GameMode_U.pas' {frmGameMode},
  Shop_U in 'Shop_U.pas' {frmShop},
  Settings_U in 'Settings_U.pas' {frmSettings},
  SelectDifficulty_U in 'SelectDifficulty_U.pas' {frmSelectDifficulty},
  HowToPlay_U in 'HowToPlay_U.pas' {frmHowToPlay},
  Jumper_U in 'Jumper_U.pas' {frmJumper},
  Admin_U in 'Admin_U.pas' {frmAdmin},
  PingPong_U in 'PingPong_U.pas' {frmPingPong};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Reacta Click';
  Application.CreateForm(TfrmMainMenu, frmMainMenu);
  Application.CreateForm(TfrmGame, frmGame);
  Application.CreateForm(TfrmGameMode, frmGameMode);
  Application.CreateForm(TfrmShop, frmShop);
  Application.CreateForm(TfrmSettings, frmSettings);
  Application.CreateForm(TfrmSelectDifficulty, frmSelectDifficulty);
  Application.CreateForm(TfrmHowToPlay, frmHowToPlay);
  Application.CreateForm(TfrmJumper, frmJumper);
  Application.CreateForm(TfrmAdmin, frmAdmin);
  Application.CreateForm(TfrmPingPong, frmPingPong);
  Application.Run;
end.
