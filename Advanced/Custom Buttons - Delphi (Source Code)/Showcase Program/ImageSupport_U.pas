unit ImageSupport_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage, jpeg, CustomButtons;

type
  TfrmImageSupport = class(TForm)
    Label1: TLabel;
    pnlContent: TPanel;
    pnlImg1: TPanel;
    pnlImg2: TPanel;
    pnlImg3: TPanel;
    pnlImg4: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Panel1: TPanel;
    Image5: TImage;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image5Click(Sender: TObject);
  private
    { Private declarations }
    cbtnImg1, cbtnImg2, cbtnImg3, cbtnImg4 : TCustomButtons;
  public
    { Public declarations }
  end;

var
  frmImageSupport: TfrmImageSupport;

implementation

{$R *.dfm}

procedure TfrmImageSupport.FormActivate(Sender: TObject);
begin
  frmImageSupport.Color := RGB(130, 70, 150);

  cbtnImg1.BorderRadius := 50;
  cbtnImg3.BorderRadius := 20;
  cbtnImg4.BorderRadius := 10;

end;

procedure TfrmImageSupport.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Self.Hide;
  Application.MainForm.Show;
end;

procedure TfrmImageSupport.FormCreate(Sender: TObject);
begin
  cbtnImg1 := TCustomButtons.Create(pnlImg1);
  with cbtnImg1 do
  begin
    Click.BoxShadow(10, 10, clSilver);

  end;



  cbtnImg2 := TCustomButtons.Create(pnlImg2);
  with cbtnImg2 do
  begin
    Click.BoxShadow(3, 3, clSilver);
    Hover.ScaleBy(10);
    Hover.BorderRadius := 30;
    Click.BorderRadius := 30;
  end;



  cbtnImg3 := TCustomButtons.Create(pnlImg3);
  with cbtnImg3 do
  begin
    HorizontalGradient(RGB(0, 0, 128), RGB(0, 0, 255));
    Hover.HorizontalGradient(RGB(0, 128, 255), RGB(135, 206, 250));
    Click.HorizontalGradient(RGB(70, 130, 180), RGB(240, 248, 255));
    Click.BoxShadow(3, 3, clSilver);
  end;



  cbtnImg4 := TCustomButtons.Create(pnlImg4);
  with cbtnImg4 do
  begin
    Color := RGB(135, 206, 250);
    Click.Color := RGB(130, 195, 240);
    Click.ScaleBy(5);
  end;
end;

procedure TfrmImageSupport.Image5Click(Sender: TObject);
begin
  Application.MainForm.Show;
  Self.Hide;
end;

end.
