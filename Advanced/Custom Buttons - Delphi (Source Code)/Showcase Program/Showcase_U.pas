unit Showcase_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CustomButtons, StdCtrls, pngimage, ExtCtrls, Basic_U, Advanced_U,
  ImageSupport_U;

type
  TfrmFrontPage = class(TForm)
    Label1: TLabel;
    pnlBasic: TPanel;
    pnlAdvanced: TPanel;
    pnlImageSupport: TPanel;
    imgIcon: TImage;
    procedure FormActivate(Sender: TObject);
    procedure pnlBasicClick(Sender: TObject);
    procedure pnlAdvancedClick(Sender: TObject);
    procedure pnlImageSupportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFrontPage: TfrmFrontPage;

implementation

{$R *.dfm}

procedure TfrmFrontPage.FormActivate(Sender: TObject);
var
  cbtnNav1, cbtnNav2, cbtnNav3 : TCustomButtons;
begin
  frmFrontPage.Color := RGB(240, 240, 240);

  cbtnNav1 := TCustomButtons.Create(pnlBasic);
  with cbtnNav1 do
  begin
    Color := RGB(52, 152, 219);
    Hover.Color := RGB(41, 128, 185);
    BorderRadius := 10;
  end;

  cbtnNav2 := TCustomButtons.Create(pnlAdvanced);
  with cbtnNav2 do
  begin
    Color := RGB(0, 150, 136);
    Hover.Color := RGB(0, 120, 110);
    BorderRadius := 10;
  end;

  cbtnNav3 := TCustomButtons.Create(pnlImageSupport);
  with cbtnNav3 do
  begin
    Color := RGB(155, 89, 182);
    Hover.Color := RGB(130, 70, 150);
    BorderRadius := 10;
  end;

end;

procedure TfrmFrontPage.pnlAdvancedClick(Sender: TObject);
begin
  Self.Hide;
  frmAdvanced.Position := poScreenCenter;
  frmAdvanced.Show;
end;

procedure TfrmFrontPage.pnlBasicClick(Sender: TObject);
begin
  Self.Hide;
  frmBasic.Position := poScreenCenter;
  frmBasic.Show;

end;

procedure TfrmFrontPage.pnlImageSupportClick(Sender: TObject);
begin
  Self.Hide;
  frmImageSupport.Position := poScreenCenter;
  frmImageSupport.Show;
end;

end.
