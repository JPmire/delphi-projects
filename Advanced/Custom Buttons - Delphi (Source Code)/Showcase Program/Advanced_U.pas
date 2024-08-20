unit Advanced_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CustomButtons, pngimage;

type
  TfrmAdvanced = class(TForm)
    Label1: TLabel;
    pnlContent: TPanel;
    pnlComb1: TPanel;
    pnlComb2: TPanel;
    pnlComb3: TPanel;
    pnlComb4: TPanel;
    pnlComb5: TPanel;
    pnlComb6: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
    cbtnComb1, cbtnComb2, cbtnComb3, cbtnComb4, cbtnComb5,
    cbtnComb6 : TCustomButtons;
  public
    { Public declarations }
  end;

var
  frmAdvanced: TfrmAdvanced;

implementation

{$R *.dfm}

procedure TfrmAdvanced.FormActivate(Sender: TObject);
begin
  frmAdvanced.Color := RGB(0, 120, 110);
  pnlContent.Color := RGB(240, 240, 240);
  cbtnComb1.BorderRadius := 20;           //NOTE: ONLY A STATIC BORDERADIUS MUST BE
  cbtnComb3.BorderRadius := 5;            //      ADDED TO THE FORM'S -OnActivate-
  cbtnComb6.BorderRadius := 15;           //      EVENT!!!
  cbtnComb4.BorderRadius := 10;
  cbtnComb5.BorderRadius := 10;
  end;

procedure TfrmAdvanced.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Self.Hide;
  Application.MainForm.Show;
end;

procedure TfrmAdvanced.FormCreate(Sender: TObject);
begin
  cbtnComb1 := TCustomButtons.Create(pnlComb1);
  with cbtnComb1 do
  begin
    // Static
    Color := RGB(255, 140, 0); // Electric orange

    // Hover
    Hover.VerticalGradient(RGB(255, 255, 0), RGB(255, 105, 180)); // Yellow to pink
    Hover.ScaleBy(5); // Slightly smaller
    Hover.BoxShadow(2, 2, RGB(128, 128, 128)); // Subtle shadow

    // Click
    Click.ScaleBy(-5); // Slightly scale down on click
  end;



  cbtnComb2 := TCustomButtons.Create(pnlComb2);
  with cbtnComb2 do
  begin
    // Static

    Color := RGB(0, 0, 139); // Deep blue


    // Hover

    Hover.Color := RGB(64, 224, 208); // Turquoise

    // Click

    Click.BoxShadow(2, 2, RGB(128, 128, 128)); // Subtle shadow

  end;



  cbtnComb3 := TCustomButtons.Create(pnlComb3);
  with cbtnComb3 do
  begin
// Static

Color := RGB(255, 127, 80); // Coral




// Hover

Hover.HorizontalGradient(RGB(255, 127, 80), RGB(255, 215, 0)); // Coral to gold

Hover.ScaleBy(10);

Hover.BoxShadow(2, 2, RGB(128, 128, 128)); // Subtle shadow

// Click

Click.ScaleBy(-5); // Slightly scale down on click



  end;



  cbtnComb4 := TCustomButtons.Create(pnlComb4);
  with cbtnComb4 do
  begin
// Static

Color := RGB(75, 0, 130); // Dark purple



// Hover

Hover.VerticalGradient(RGB(75, 0, 130), RGB(230, 230, 250)); // Indigo to lavender

// Click

Click.BoxShadow(2, 2, RGB(128, 128, 128)); // Subtle shadow


  end;



  cbtnComb5 := TCustomButtons.Create(pnlComb5);
  with cbtnComb5 do
  begin
// Static

Color := RGB(0, 255, 0); // Bright green



// Hover

Hover.Color := RGB(50, 205, 50); // Lime green

Hover.ScaleBy(10);

Hover.BoxShadow(2, 2, RGB(128, 128, 128)); // Subtle shadow

// Click

Click.ScaleBy(-5); // Slightly scale down on click


  end;



  cbtnComb6 := TCustomButtons.Create(pnlComb6);
  with cbtnComb6 do
  begin
// Static

Color := RGB(204, 204, 0); // Mustard yellow



// Hover

Hover.HorizontalGradient(RGB(204, 204, 0), RGB(139, 69, 19)); // Mustard to burnt orange

// Click

Click.BoxShadow(2, 2, RGB(128, 128, 128)); // Subtle shadow


  end;
end;

procedure TfrmAdvanced.Image1Click(Sender: TObject);
begin
  Application.MainForm.Show;
  Self.Hide;
end;

end.
