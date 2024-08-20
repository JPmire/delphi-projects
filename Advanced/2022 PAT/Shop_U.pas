unit Shop_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Game_U, pngimage, Buttons, ChasingGame_U,
  Jumper_U;

type
  TfrmShop = class(TForm)
    Panel1: TPanel;
    pnlHighScoreC: TPanel;
    Label1: TLabel;
    imgBasketBall: TImage;
    lblInstruction: TLabel;
    pnlBasketBallPrice: TPanel;
    rdbBasketBall: TRadioButton;
    rdbDog: TRadioButton;
    imgDog: TImage;
    pnlDogPrice: TPanel;
    bmbMainMenu: TBitBtn;
    imgCow: TImage;
    imgCar: TImage;
    pnlCowPrice: TPanel;
    pnlCarPrice: TPanel;
    rdbCar: TRadioButton;
    rdbCow: TRadioButton;
    pnlHighScoreE: TPanel;
    pnlHighScoreI: TPanel;
    pnlHighScoreH: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pnlHighScoreChasing: TPanel;
    Label6: TLabel;
    pnlClassic: TPanel;
    scrlBarItems: TScrollBar;
    pnlItems: TPanel;
    pnlEasy: TPanel;
    pnlItemsMain: TPanel;
    pnlIntermediate: TPanel;
    pnlHard: TPanel;
    pnlJumper: TPanel;
    Label7: TLabel;
    pnlHighScoreJ: TPanel;
    imgBackground: TImage;
    imgNeptune: TImage;
    imgJupiter: TImage;
    imgMars: TImage;
    imgEarth: TImage;
    rdbEarth: TRadioButton;
    rdbMars: TRadioButton;
    rdbJupiter: TRadioButton;
    rdbNeptune: TRadioButton;
    pnlEarthPrice: TPanel;
    pnlMarsPrice: TPanel;
    pnlJupiterPrice: TPanel;
    pnlNeptunePrice: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    imgInter1: TImage;
    imgInter4: TImage;
    imgInter3: TImage;
    imgInter2: TImage;
    imgHard1: TImage;
    imgHard2: TImage;
    imgHard3: TImage;
    imgHard4: TImage;
    Label10: TLabel;
    rdbHard1: TRadioButton;
    rdbHard2: TRadioButton;
    rdbHard3: TRadioButton;
    rdbHard4: TRadioButton;
    Label12: TLabel;
    imgPlayer2: TImage;
    imgPlayer1: TImage;
    imgPlayer3: TImage;
    rdbPlayer1: TRadioButton;
    rdbPlayer2: TRadioButton;
    rdbPlayer3: TRadioButton;
    rdbPlayer4: TRadioButton;
    pnlPlayer1Price: TPanel;
    pnlPlayer2Price: TPanel;
    pnlPlayer3Price: TPanel;
    pnlPlayer4Price: TPanel;
    pnlChasing: TPanel;
    Label11: TLabel;
    imgChasing2: TImage;
    imgChasing1: TImage;
    imgChasing3: TImage;
    imgChasing4: TImage;
    rdbChasing1: TRadioButton;
    rdbChasing2: TRadioButton;
    rdbChasing3: TRadioButton;
    rdbChasing4: TRadioButton;
    pnlChasing1Price: TPanel;
    pnlChasing2Price: TPanel;
    pnlChasing3Price: TPanel;
    pnlChasing4Price: TPanel;
    rdbInter1: TRadioButton;
    rdbInter2: TRadioButton;
    rdbInter3: TRadioButton;
    rdbInter4: TRadioButton;
    pnlInterPrice1: TPanel;
    pnlInterPrice2: TPanel;
    pnlInterPrice3: TPanel;
    pnlInterPrice4: TPanel;
    pnlHard1: TPanel;
    pnlHard2: TPanel;
    pnlHard3: TPanel;
    pnlHard4: TPanel;
    imgPlayer4: TImage;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure rdbBasketBallClick(Sender: TObject);
    procedure rdbDogClick(Sender: TObject);
    procedure bmbMainMenuClick(Sender: TObject);
    procedure rdbCowClick(Sender: TObject);
    procedure rdbCarClick(Sender: TObject);
    procedure scrlBarItemsChange(Sender: TObject);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure rdbEarthClick(Sender: TObject);
    procedure rdbMarsClick(Sender: TObject);
    procedure rdbJupiterClick(Sender: TObject);
    procedure rdbNeptuneClick(Sender: TObject);
    procedure rdbPlayer1Click(Sender: TObject);
    procedure rdbPlayer2Click(Sender: TObject);
    procedure rdbPlayer3Click(Sender: TObject);
    procedure rdbPlayer4Click(Sender: TObject);
    procedure rdbChasing1Click(Sender: TObject);
    procedure rdbChasing2Click(Sender: TObject);
    procedure rdbChasing3Click(Sender: TObject);
    procedure rdbChasing4Click(Sender: TObject);
    procedure rdbInter1Click(Sender: TObject);
    procedure rdbInter2Click(Sender: TObject);
    procedure rdbInter3Click(Sender: TObject);
    procedure rdbInter4Click(Sender: TObject);
    procedure rdbHard1Click(Sender: TObject);
    procedure rdbHard2Click(Sender: TObject);
    procedure rdbHard3Click(Sender: TObject);
    procedure rdbHard4Click(Sender: TObject);
  private
    { Private declarations }
  iPrice : integer;
  sLowHighScore : string;
  tFileClassic, tFileEasy, tFileInter, tFileHard, tFileChasing, tFileJumper : TextFile;
  iHighC, iHighE, iHighI, iHighH, iHighScore, iHighScoreJ : integer;
  procedure PurchaseItem(GameHighScore : integer; Price : string; TooLow : string; RadioButton : TRadioButton; Picture : TImage);
  public
    { Public declarations }
  end;

var
  frmShop: TfrmShop;

implementation

uses MainMenu_U;

{$R *.dfm}

procedure TfrmShop.bmbMainMenuClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmShop.FormActivate(Sender: TObject);
var
sUser : string;
iPos : integer;
begin
    //Kry Jumper se HighScore
    reset(frmMainMenu.tFileUsers);
    while not eof(frmMainMenu.tFileUsers) do
    begin
        readln(frmMainMenu.tFileUsers, frmMainMenu.sUserLine);
        iPos := pos('^', frmMainMenu.sCurrentUser);
        try
          iHighscoreJ := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
        except
          try
            iHighScoreJ  := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
          except
            iHighscoreJ := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
          end;
        end;
       pnlHighScoreJ.Caption := IntToStr(iHighScoreJ);
    end;
    CloseFile(frmMainMenu.tFileUsers);

    //Kry Chasing se HighScore
    reset(frmMainMenu.tFileUsers);
    while not eof(frmMainMenu.tFileUsers) do
    begin
        readln(frmMainMenu.tFileUsers, frmMainMenu.sUserLine);
        iPos := pos('%', frmMainMenu.sCurrentUser);
        try
          iHighscore := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
        except
          try
            iHighScore  := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
          except
            iHighscore := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
          end;
        end;
       pnlHighScoreChasing.Caption := IntToStr(iHighScore);
    end;
    CloseFile(frmMainMenu.tFileUsers);

  //Kry Classic se HighScore
    reset(frmMainMenu.tFileUsers);
    while not eof(frmMainMenu.tFileUsers) do
    begin
        readln(frmMainMenu.tFileUsers, frmMainMenu.sUserLine);
        iPos := pos('!', frmMainMenu.sCurrentUser);
        try
          iHighC := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
        except
          try
            iHighC := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
          except
            iHighC := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
          end;
        end;
       pnlHighScoreC.Caption := IntToStr(iHighC);
    end;
    CloseFile(frmMainMenu.tFileUsers);

  //Kry Easy se HighScore
    reset(frmMainMenu.tFileUsers);
    while not eof(frmMainMenu.tFileUsers) do
    begin
        readln(frmMainMenu.tFileUsers, frmMainMenu.sUserLine);
        iPos := pos('@', frmMainMenu.sCurrentUser);
        try
          iHighE := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
        except
          try
            iHighE := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
          except
            iHighE := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
          end;
        end;
       pnlHighScoreE.Caption := IntToStr(iHighE);
    end;
    CloseFile(frmMainMenu.tFileUsers);

  //Kry Intermediate se HighScore
    reset(frmMainMenu.tFileUsers);
    while not eof(frmMainMenu.tFileUsers) do
    begin
        readln(frmMainMenu.tFileUsers, frmMainMenu.sUserLine);
        iPos := pos('#', frmMainMenu.sCurrentUser);
        try
          iHighI := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
        except
          try
            iHighI := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
          except
            iHighI := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
          end;
        end;
       pnlHighScoreI.Caption := IntToStr(iHighI);
    end;
    CloseFile(frmMainMenu.tFileUsers);

  //Kry Hard se HighScore
    reset(frmMainMenu.tFileUsers);
    while not eof(frmMainMenu.tFileUsers) do
    begin
        readln(frmMainMenu.tFileUsers, frmMainMenu.sUserLine);
        iPos := pos('$', frmMainMenu.sCurrentUser);
        try
          iHighH := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 3));
        except
          try
            iHighH := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 2));
          except
            iHighH := StrToInt(copy(frmMainMenu.sCurrentUser, iPos + 1, 1));
          end;
        end;
       pnlHighScoreH.Caption := IntToStr(iHighH);
    end;
    CloseFile(frmMainMenu.tFileUsers);


  sLowHighScore := 'High Score Is Too Low';
end;

procedure TfrmShop.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Application.MainForm.Show;
end;

procedure TfrmShop.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  scrlBarItems.Position := scrlBarItems.Position + 50;
end;

procedure TfrmShop.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  scrlBarItems.Position := scrlBarItems.Position - 50;
end;

procedure TfrmShop.PurchaseItem(GameHighScore: integer; Price: string; TooLow: string; RadioButton : TRadioButton; Picture: TImage);
begin
  if GameHighScore >= StrToInt(Price) then
  begin
    frmGame.imgItem.Picture := Picture.Picture;
    frmJumper.Player.Picture := Picture.Picture;
  end else
  begin
    ShowMessage(TooLow);
    RadioButton.Checked := False;
  end;
end;

procedure TfrmShop.rdbBasketBallClick(Sender: TObject);
begin
  PurchaseItem(iHighC, pnlBasketBallPrice.Caption, 'Classic HighScore is too low', rdbBasketBall, imgBasketBall);
end;

procedure TfrmShop.rdbCarClick(Sender: TObject);
begin
  PurchaseItem(iHighC, pnlCarPrice.Caption, 'Classic HighScore is too low', rdbCar, imgCar);
end;

procedure TfrmShop.rdbChasing1Click(Sender: TObject);
begin
  PurchaseItem(iHighScore, pnlChasing1Price.Caption, 'Ping Pong HighScore is too low', rdbChasing1, imgChasing1);
end;

procedure TfrmShop.rdbChasing2Click(Sender: TObject);
begin
  PurchaseItem(iHighScore, pnlChasing2Price.Caption, 'Ping Pong HighScore is too low', rdbChasing2, imgChasing2);
end;

procedure TfrmShop.rdbChasing3Click(Sender: TObject);
begin
  PurchaseItem(iHighScore, pnlChasing3Price.Caption, 'Ping Pong HighScore is too low', rdbChasing3, imgChasing3);
end;

procedure TfrmShop.rdbChasing4Click(Sender: TObject);
begin
  PurchaseItem(iHighScore, pnlChasing4Price.Caption, 'Ping Pong HighScore is too low', rdbChasing4, imgChasing4);
end;

procedure TfrmShop.rdbCowClick(Sender: TObject);
begin
  PurchaseItem(iHighC, pnlCowPrice.Caption, 'Classic HighScore is too low', rdbCow, imgCow);
end;

procedure TfrmShop.rdbDogClick(Sender: TObject);
begin
  PurchaseItem(iHighC, pnlDogPrice.Caption, 'Classic HighScore is too low', rdbDog, imgDog);
end;

procedure TfrmShop.rdbEarthClick(Sender: TObject);
begin
  PurchaseItem(iHighE, pnlEarthPrice.Caption, 'Easy HighScore is too low', rdbEarth, imgEarth);
end;

procedure TfrmShop.rdbHard1Click(Sender: TObject);
begin
  PurchaseItem(iHighH, pnlHard1.Caption, 'Hard HighScore is too low', rdbHard1, imgHard1);
end;

procedure TfrmShop.rdbHard2Click(Sender: TObject);
begin
  PurchaseItem(iHighH, pnlHard2.Caption, 'Hard HighScore is too low', rdbHard2, imgHard2);
end;

procedure TfrmShop.rdbHard3Click(Sender: TObject);
begin
  PurchaseItem(iHighH, pnlHard3.Caption, 'Hard HighScore is too low', rdbHard3, imgHard3);
end;

procedure TfrmShop.rdbHard4Click(Sender: TObject);
begin
  PurchaseItem(iHighH, pnlHard4.Caption, 'Hard HighScore is too low', rdbHard4, imgHard4);
end;

procedure TfrmShop.rdbInter1Click(Sender: TObject);
begin
  PurchaseItem(iHighI, pnlInterPrice1.Caption, 'Intermediate HighScore is too low', rdbInter1, imgInter1);
end;

procedure TfrmShop.rdbInter2Click(Sender: TObject);
begin
  PurchaseItem(iHighI, pnlInterPrice2.Caption, 'Intermediate HighScore is too low', rdbInter2, imgInter2);
end;

procedure TfrmShop.rdbInter3Click(Sender: TObject);
begin
PurchaseItem(iHighI, pnlInterPrice3.Caption, 'Intermediate HighScore is too low', rdbInter3, imgInter3);
end;

procedure TfrmShop.rdbInter4Click(Sender: TObject);
begin
PurchaseItem(iHighI, pnlInterPrice4.Caption, 'Intermediate HighScore is too low', rdbInter4, imgInter4);
end;

procedure TfrmShop.rdbJupiterClick(Sender: TObject);
begin
  PurchaseItem(iHighE, pnlJupiterPrice.Caption, 'Easy HighScore is too low', rdbJupiter, imgJupiter);
end;

procedure TfrmShop.rdbMarsClick(Sender: TObject);
begin
  PurchaseItem(iHighE, pnlMarsPrice.Caption, 'Easy HighScore is too low', rdbMars, imgMars);
end;

procedure TfrmShop.rdbNeptuneClick(Sender: TObject);
begin
  PurchaseItem(iHighE, pnlNeptunePrice.Caption, 'Easy HighScore is too low', rdbNeptune, imgNeptune);
end;

procedure TfrmShop.rdbPlayer1Click(Sender: TObject);
begin
  PurchaseItem(iHighScoreJ, pnlPlayer1Price.Caption, 'Jumper HighScore is too low', rdbPlayer1, imgPlayer1);
end;

procedure TfrmShop.rdbPlayer2Click(Sender: TObject);
begin
  PurchaseItem(iHighScoreJ, pnlPlayer2Price.Caption, 'Jumper HighScore is too low', rdbPlayer2, imgPlayer2);
end;

procedure TfrmShop.rdbPlayer3Click(Sender: TObject);
begin
  PurchaseItem(iHighScoreJ, pnlPlayer3Price.Caption, 'Jumper HighScore is too low', rdbPlayer3, imgPlayer3);
end;

procedure TfrmShop.rdbPlayer4Click(Sender: TObject);
begin
  PurchaseItem(iHighScoreJ, pnlPlayer4Price.Caption, 'Jumper HighScore is too low', rdbPlayer4, imgPlayer4);
end;

procedure TfrmShop.scrlBarItemsChange(Sender: TObject);
begin
  pnlItems.Top := - scrlBarItems.Position;
end;

end.
