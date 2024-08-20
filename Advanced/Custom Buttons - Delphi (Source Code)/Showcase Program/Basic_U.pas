unit Basic_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CustomButtons, pngimage;

type
  TfrmBasic = class(TForm)
    Label1: TLabel;
    pnlClick: TPanel;
    pnlHover: TPanel;
    lblStatic: TLabel;
    lblHover: TLabel;
    lblClick: TLabel;
    pnlStatic: TPanel;
    pnlStaticColor: TPanel;
    pnlStaticBorderRadius: TPanel;
    pnlStaticVerticalGradient: TPanel;
    pnlStaticHorizontalGradient: TPanel;
    pnlStaticScaleBy: TPanel;
    pnlHoverBorderRadius: TPanel;
    pnlHoverColor: TPanel;
    pnlHoverHorizontalGradient: TPanel;
    pnlHoverScaleBy: TPanel;
    pnlHoverVerticalGradient: TPanel;
    pnlHoverBoxShadow: TPanel;
    pnlClickBorderRadius: TPanel;
    pnlClickBoxShadow: TPanel;
    pnlClickColor: TPanel;
    pnlClickHorizontalGradient: TPanel;
    pnlClickScaleBy: TPanel;
    pnlClickVerticalGradient: TPanel;
    Panel1: TPanel;
    Image1: TImage;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
    // Static
    cbtnStaticColor, cbtnStaticBorderR, cbtnStaticVerticalG, cbtnStaticHorizonG,
    cbtnStaticScale : TCustomButtons;

    // Hover
    cbtnHoverColor, cbtnHoverBorderR, cbtnHoverVerticalG, cbtnHoverHorizonG,
    cbtnHoverScale, cbtnHoverBoxShadow : TCustomButtons;

    // Click
    cbtnClickColor, cbtnClickBorderR, cbtnClickVerticalG, cbtnClickHorizonG,
    cbtnClickScale, cbtnClickBoxShadow : TCustomButtons;
  public
    { Public declarations }
  end;

var
  frmBasic: TfrmBasic;

implementation

{$R *.dfm}

procedure TfrmBasic.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Self.Hide;
  Application.MainForm.Show;
end;

procedure TfrmBasic.FormCreate(Sender: TObject);
begin
  frmBasic.Color := RGB(52, 152, 219);
  lblStatic.Font.Color := RGB(64, 64, 64);
  lblHover.Font.Color := RGB(54, 54, 54);
  lblClick.Font.Color := RGB(44, 44, 44);

  // Static
  cbtnStaticColor := TCustomButtons.Create(pnlStaticColor);
  with cbtnStaticColor do
  begin
    Color := clBlue;
  end;

  cbtnStaticBorderR := TCustomButtons.Create(pnlStaticBorderRadius);
  with cbtnStaticBorderR do
  begin
    BorderRadius := 40;
  end;

  cbtnStaticVerticalG := TCustomButtons.Create(pnlStaticVerticalGradient);
  with cbtnStaticVerticalG do
  begin
    VerticalGradient(RGB(52, 152, 219), RGB(173, 216, 230));
  end;

  cbtnStaticHorizonG := TCustomButtons.Create(pnlStaticHorizontalGradient);
  with cbtnStaticHorizonG do
  begin
    HorizontalGradient(RGB(0, 150, 136), RGB(64, 224, 208));
  end;

  cbtnStaticScale := TCustomButtons.Create(pnlStaticScaleBy);
  with cbtnStaticScale do
  begin
    ScaleBy(20);
  end;



  // Hover
  cbtnHoverColor := TCustomButtons.Create(pnlHoverColor);
  with cbtnHoverColor do
  begin
    Hover.Color := clBlue;
  end;

  cbtnHoverBorderR := TCustomButtons.Create(pnlHoverBorderRadius);
  with cbtnHoverBorderR do
  begin
    Hover.BorderRadius := 40;
  end;

  cbtnHoverVerticalG := TCustomButtons.Create(pnlHoverVerticalGradient);
  with cbtnHoverVerticalG do
  begin
    Hover.VerticalGradient(RGB(52, 152, 219), RGB(173, 216, 230));
  end;

  cbtnHoverHorizonG := TCustomButtons.Create(pnlHoverHorizontalGradient);
  with cbtnHoverHorizonG do
  begin
    Hover.HorizontalGradient(RGB(0, 150, 136), RGB(64, 224, 208));
  end;

  cbtnHoverScale := TCustomButtons.Create(pnlHoverScaleBy);
  with cbtnHoverScale do
  begin
    Hover.ScaleBy(20);
  end;

  cbtnHoverBoxShadow := TCustomButtons.Create(pnlHoverBoxShadow);
  with cbtnHoverBoxShadow do
  begin
    Hover.BoxShadow(10, 10, clSilver);
  end;



  // Click
  cbtnClickColor := TCustomButtons.Create(pnlClickColor);
  with cbtnClickColor do
  begin
    Click.Color := clBlue;
  end;

  cbtnClickBorderR := TCustomButtons.Create(pnlClickBorderRadius);
  with cbtnClickBorderR do
  begin
    Click.BorderRadius := 40;
  end;

  cbtnClickVerticalG := TCustomButtons.Create(pnlClickVerticalGradient);
  with cbtnClickVerticalG do
  begin
    Click.VerticalGradient(RGB(52, 152, 219), RGB(173, 216, 230));
  end;

  cbtnClickHorizonG := TCustomButtons.Create(pnlClickHorizontalGradient);
  with cbtnClickHorizonG do
  begin
    Click.HorizontalGradient(RGB(0, 150, 136), RGB(64, 224, 208));
  end;

  cbtnClickScale := TCustomButtons.Create(pnlClickScaleBy);
  with cbtnClickScale do
  begin
    Click.ScaleBy(20);
  end;

  cbtnClickBoxShadow := TCustomButtons.Create(pnlClickBoxShadow);
  with cbtnClickBoxShadow do
  begin
    Click.BoxShadow(10, 10, clSilver);
  end;
end;

procedure TfrmBasic.Image1Click(Sender: TObject);
begin
  Application.MainForm.Show;
  Self.Hide;
end;

end.
