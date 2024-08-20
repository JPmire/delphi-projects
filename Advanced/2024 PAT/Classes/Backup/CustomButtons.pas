// Jean-Pierre Joubert
unit CustomButtons;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
 Dialogs, StdCtrls, ExtCtrls, Math, pngimage, jpeg;



type THover = class(TObject)
 private
  fColor : TColor;
  fHoverColor : boolean;
  fPanelHover : TPanel; //+++++++++++++++++++++++++++++++++++++++++++++++++
  fScaleValue : integer;
  fMainClassBorderRadius : integer;
  fBorderRadius : integer;
  fPanelDupeBorderRadius : integer;
  lblCaption : TLabel;
  
  bHasBaseVertGradImgAssigned, bHasBaseHorizGradImgAssigned : boolean;
  fGradientFromColor, fGradientToColor : TColor;
  bVerticalGradient, bHorizontalGradient : Boolean;
  fVerticalGradientImg, fHorizontalGradientImg: TImage;
  bHorizGradientFirst, bVertGradientFirst : boolean;
  fTransition : integer;
  fOriginalColor : TColor;
  bHorizontallblCaptionExists, bVerticallblCaptionExists : boolean;
  bBaseGradientHoriz, bBaseGradientVertic : boolean;
  bHoverGradientHoriz, bHoverGradientVertic : boolean;
  fBoxShadowRight, fBoxShadowBottom : integer;
  fHasBoxShadow : boolean;

  bBoxShadow : boolean;
  fUserSetBorderRadius : boolean;
  fBoxShadowColor : TColor;

  fOriginalShadowRight, fOriginalShadowBottom : integer;
  function IsMouseOverControl(control: TControl): Boolean;
  procedure AddBorderRadius(Value : integer);
  procedure AddBoxShadow(Right, Bottom : integer);
  procedure AddVerticalGradient(FromColor, ToColor: TColor);
  procedure AddHorizontalGradient(FromColor, ToColor: TColor);

  procedure LabelMouseEnter(Sender: TObject);
  procedure LabelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  procedure LabelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

  procedure ImageMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
 protected
 fPanelDupe : TPanel;
 public

  procedure ScaleBy(Value : integer);
  //property Scale : real read fScale write ScaleBy;
  property BorderRadius : integer read fBorderRadius write fBorderRadius;
  property Color : TColor read fColor write fColor;
  procedure BoxShadow(Right, Bottom : integer; ShadowColor : TColor);
  procedure VerticalGradient(FromColor, ToColor: TColor);
  procedure HorizontalGradient(FromColor, ToColor: TColor);
end;


type TClick = class(THover)
 private
   // ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

  procedure AddBorderRadius(Value : integer);
  procedure AddBoxShadow(Right, Bottom : integer);
  procedure AddVerticalGradient(FromColor, ToColor: TColor);
  procedure AddHorizontalGradient(FromColor, ToColor: TColor);

  procedure LabelMouseEnter(Sender : TObject);
  procedure LabelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  procedure LabelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  procedure LabelMouseLeave(Sender : TObject); // ONLY NEEDED FOR CLICK (LABEL FILLS THE WHOLE PANEL)

 protected
  fPanelClick : TPanel;
 public
  procedure ScaleBy(Value : integer);
  //property Scale : real read fScale write ScaleBy;
  property BorderRadius : integer read fBorderRadius write fBorderRadius;
  property Color : TColor read fColor write fColor;
  procedure BoxShadow(Right, Bottom : integer; ShadowColor : TColor);
  procedure VerticalGradient(FromColor, ToColor: TColor);
  procedure HorizontalGradient(FromColor, ToColor: TColor);
end;



 type TCustomButtons = class(TObject)  { Custom Button }
 private
  tmrUpdate : TTimer;
  fPanel : TPanel;
  fHover : THover;
  fClick : TClick;
  fColor : TColor;
  fImage : TImage;
  lblCaption : TLabel;
  bHorizontallblCaptionExists, bVerticallblCaptionExists : boolean;
  fOriginalColor: TColor;
  fOriginalHeight, fOriginalWidth : integer;
  fVerticalGradientImg, fHorizontalGradientImg : TImage;
  bVerticalGradient, bHorizontalGradient : boolean;
  fHovering : boolean;
  fIsScaled : boolean;
  fIsHoveringShadow : boolean;

  fScaleValue : integer;
  fNewHeight, fNewWidth : integer;
  bImageWithPicture : boolean;
  fImageWithPicture : TImage;
  //fShowMessageFix : Boolean;

  fBorderRadius : integer;
  bClickFirstPart, bClickSecondPart : boolean;
  bIsStaticGradientHoriz, bIsStaticGradientVertic : boolean;

  fTransition : integer;

  fBoxShadowRight, fBoxShadowBottom : integer;
  fOriginalCursorPos : TPoint;

  bBoxShadow : boolean;

  fGradientFromColor, fGradientToColor : TColor;

  fBoxShadowColor : TColor;
  fOriginalLeft, fOriginalTop : integer;
  tmrClick : TTimer;
  fHoverPanelTop, fHoverPanelLeft : integer;
  bHasVertGradientImgAssigned, bHasHorizGradientImgAssigned : boolean;
  bHorizGradientFirst, bVertGradientFirst : boolean;

  fOriginalShadowRight, fOriginalShadowBottom : integer;

  procedure AddBorderRadius(Value : integer);
  // procedure AddBoxShadow(Right, Bottom : integer);

  procedure AddColor(Color : TColor);

  procedure PanelMouseEnter(Sender: TObject);
  procedure PanelMouseLeave(Sender: TObject);
  procedure PanelMouseDown(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: integer);
  procedure PanelMouseUp(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: integer);
  //procedure AddBoxShadow(Right, Bottom : integer; Panel : TPanel);

  function IsMouseOverControl(control: TControl): Boolean;
  procedure TimerOnTimer(Sender : TObject);
  procedure ImageMouseEnter(Sender: TObject);
  procedure ImageMouseLeave(Sender: TObject);
  procedure ImageMouseDown(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: integer);
  procedure ImageMouseUp(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: integer);

  procedure LabelMouseEnter(Sender: TObject);
  procedure LabelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  procedure LabelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);

 protected
  fPanelDupe : TPanel;
 public

  constructor Create(Panel : TPanel);
  destructor Destroy; override;

  procedure ScaleBy(Value : integer);
  //property Scale : real read fScale write ScaleBy;
  property BorderRadius : integer read fBorderRadius write AddBorderRadius;
  property Color : TColor read fColor write AddColor;
  // procedure BoxShadow(Right, Bottom : integer; ShadowColor : TColor);
  procedure VerticalGradient(FromColor, ToColor: TColor);
  procedure HorizontalGradient(FromColor, ToColor: TColor);
  property Hover: THover read fHover;
  property Click: TClick read fClick;
 end;

implementation

// fPanelDupeCustom : TCustomButton;

procedure TCustomButtons.AddBorderRadius(Value: integer);
 var
  R: TRect;
  Rgn: HRGN;
 begin
  with fPanel do
  begin
   R := ClientRect;
   rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, Value, Value) ;
   Perform(EM_GETRECT, 0, lParam(@r)) ;
   InflateRect(r, - 4, - 4) ;
   Perform(EM_SETRECTNP, 0, lParam(@r)) ;
   SetWindowRgn(Handle, rgn, True) ;
   Invalidate;
  end;
  fBorderRadius := Value;
  fHover.fPanelDupeBorderRadius := fBorderRadius;
end;


procedure TCustomButtons.AddColor(Color: TColor);
begin

 fOriginalColor := Color;
 fPanel.Color := fOriginalColor;
 fHover.Color := fOriginalColor;
 fClick.Color := fOriginalColor;

 //Scale


 // Hover:
 // Border Radius





  // Shadow:
//  if fClick.bBoxShadow = True then
//  begin
//   fClick.AddBoxShadow(fClick.fBoxShadowRight, fClick.fBoxShadowBottom);
//  end;
end;


constructor TCustomButtons.Create(Panel: TPanel);
var
  i: Integer;
  fTempImage : TImage;
 begin
  inherited Create;
  // Create the instances of the nested types
  fPanel := Panel;
  fHover := THover.Create;
  fClick := Tclick.Create;
  fPanel.ParentBackground := False;
  fHover.fMainClassBorderRadius := fBorderRadius;
  fIsHoveringShadow := False;

  fOriginalColor := fPanel.Color;
  fHover.fOriginalColor := fOriginalColor;
  fHover.Color := fOriginalColor;


  fOriginalHeight := fPanel.Height;
  fOriginalWidth := fPanel.Width;
  fOriginalLeft := fPanel.Left;
  fOriginalTop := fPanel.Top;

  fHover.bBaseGradientHoriz := False;
  fHover.bBaseGradientVertic := False;
  fHover.bHoverGradientHoriz := False;
  fHover.bHoverGradientVertic := False;
  fHover.fOriginalShadowRight := fPanel.Left;
  fHover.fOriginalShadowBottom := fPanel.Top;
  fHover.bBoxShadow := False;
  fHover.fBoxShadowColor := clSilver;
  fHover.fHasBoxShadow := False;
  fHover.bVerticalGradient := False;
  fHOver.bHorizontalGradient := False;

  //fClick.Color := fOriginalColor;

  fClick.fOriginalShadowRight := fPanel.Left;
  fClick.fOriginalShadowBottom := fPanel.Top;

  fClick.bBoxShadow := False;
  fClick.fBoxShadowColor := clSilver;
  fClick.fScaleValue := 0;
  fClick.bVerticalGradient := False;
  fClick.bHorizontalGradient := False;

  fHover.fUserSetBorderRadius := False;
  fClick.fUserSetBorderRadius := False;

  bVertGradientFirst := False;
  bHorizGradientFirst := False;

  fHover.bVertGradientFirst := False;
  fHover.bHorizGradientFirst := False;

  fClick.bVertGradientFirst := False;
  fClick.bHorizGradientFirst := False;

  bVerticallblCaptionExists := False;
  bHorizontallblCaptionExists := False;
  fHover.bVerticallblCaptionExists := False;
  fHover.bHorizontallblCaptionExists := False;
  fClick.bHorizontallblCaptionExists := False;
  fClick.bVerticallblCaptionExists := False;

  Color := fOriginalColor;
  fOriginalShadowRight := fPanel.Left;
  fOriginalShadowBottom := fPanel.Top;
  fBoxShadowColor := clSilver;

  tmrUpdate := TTimer.Create(fPanel);

  for i := 0 to fPanel.ControlCount - 1 do
  begin
    if fPanel.Controls[i] is TImage then
    begin
      fImage := fPanel.Controls[i] as TImage;

      fImage.OnMouseDown := ImageMouseDown;
      fImage.OnMouseUp := ImageMouseUp;

      fImage.OnMouseEnter := ImageMouseEnter;
      fImage.OnMouseLeave := ImageMouseLeave;
    end;
  end;

  bImageWithPicture := False;
  if fPanel.ControlCount > 0 then
  begin
  for i := 0 to fPanel.ControlCount - 1 do
  begin
    if fPanel.Controls[i] is TImage then
    begin
      fTempImage := fPanel.Controls[i] as TImage;
      if Assigned(fTempImage.Picture.Graphic) then
      begin
        fImageWithPicture := fTempImage;
        bImageWithPicture := True;
        fImageWithPicture.OnClick := fPanel.OnClick;
      end;
    end;
  end;
end;
  fPanel.OnMouseDown := PanelMouseDown;
  fPanel.OnMouseUp := PanelMouseUp;

  fPanel.OnMouseEnter := PanelMouseEnter;
  fPanel.OnMouseLeave := PanelMouseLeave;

  bHorizontalGradient := False;
  bVerticalGradient := False;

  fHover.fPanelHover := fPanel;
  fClick.fPanelClick := fPanel;


  if bImageWithPicture = True then
  begin
    if (fImageWithPicture.Picture.Graphic IS TJPEGImage) then
    begin
      if (fPanel.Caption <> '') {and (bHasHorizGradientImgAssigned = False))} then
      begin
        lblCaption := TLabel.Create(fPanel);
        with lblCaption do
        begin
          Parent := fPanel;
          Width := Parent.Width;
          Height := Parent.Height;
          Font := fPanel.Font;
          Caption := fPanel.Caption;
          Left := (fPanel.Width - lblCaption.Width) div 2;
          Top := (fPanel.Height - lblCaption.Height) div 2;
          BringToFront;
          OnMouseEnter := LabelMouseEnter;
          OnMouseUp := LabelMouseUp;
          OnMouseDown := LabelMouseDown;
          //bHorizontallblCaptionExists := True;
          //Transparent := True;
        end;
      end;
    end;

  end;
 end;



destructor TCustomButtons.Destroy;
begin
 fHover.Free;
 fHover.fPanelDupe.Free;
 fClick.fPanelDupe.Free;
 fClick.Free;
 // fPanel.Free;
 inherited;
end;

procedure TCustomButtons.HorizontalGradient(FromColor, ToColor: TColor);
var
  MyColor: TColor;
  X: integer;
  dr, dg, db: Extended;
  C1, C2: TColor;
  r1, r2, g1, g2, b1, b2: Byte;
  R, G, B: Byte;
  cnt: Integer;
  i : integer;
  TempImage : TImage;

begin
if fPanel.ControlCount > 0 then
begin
  for i := 0 to fPanel.ControlCount - 1 do
  begin
    if fPanel.Controls[i] is TImage then
    begin
      TempImage := fPanel.Controls[i] as TImage;
      if not Assigned(TempImage.Picture.Graphic) then
      begin
        fHorizontalGradientImg := TempImage;
        bHasHorizGradientImgAssigned := False;
        fHover.bHasBaseHorizGradImgAssigned := False;
      end else
      begin
        bHasHorizGradientImgAssigned := True;
        fHover.bHasBaseHorizGradImgAssigned := True;
      end;
    end;
  end;
end;

if (fPanel.ControlCount = 0) or Assigned(TempImage.Picture.Graphic) AND (TempImage <> fHorizontalGradientImg) then
begin
  fHorizontalGradientImg := TImage.Create(fPanel);
  with fHorizontalGradientImg do
  begin
  Parent := fPanel;
  //fHorizontalGradientImg.Align := alClient;
    Top := 0;
    Left := 0;
    Width := fPanel.Width;
    Height := fPanel.Height + 3;
    Stretch := True;
    Visible := True;
    Transparent := True;
    OnMouseEnter := fPanel.OnMouseEnter;
    OnMouseLeave := fPanel.OnMouseLeave;
    OnMouseDown := fPanel.OnMouseDown;
    OnMouseUp := ImageMouseUp;
    SendToBack;
  end;

  //fHorizontalGradientImg.Transparent := True;
  //fHorizontalGradientImg.OnClick := fPanelHover.OnClick;
end;
    fHorizontalGradientImg.Visible := True;
    //fHover.fHorizontalGradientImg.Visible := False;

  C1 := FromColor;
  R1 := GetRValue(C1);
  G1 := GetGValue(C1);
  B1 := GetBValue(C1);
  C2 := ToColor;
  R2 := GetRValue(C2);
  G2 := GetGValue(C2);
  B2 := GetBValue(C2);
  dr := (R2 - R1) / (fHorizontalGradientImg.Width - 1);  // Calculate color differences based on width
  dg := (G2 - G1) / (fHorizontalGradientImg.Width - 1);
  db := (B2 - B1) / (fHorizontalGradientImg.Width - 1);
  cnt := 0;
  for X := 0 to fHorizontalGradientImg.Width - 1 do  // Iterate through X (width)
  begin
    R := R1 + Ceil(dr * cnt);
    G := G1 + Ceil(dg * cnt);
    B := B1 + Ceil(db * cnt);

    MyColor := RGB(R, G, B);
    fHorizontalGradientImg.Canvas.Brush.Color := MyColor;

    fHorizontalGradientImg.Canvas.FillRect(Rect(X, 0, X + 1, fHorizontalGradientImg.Height - 1));  // Fill horizontally
    inc(cnt);
  end;
  fGradientFromColor := FromColor;
  fGradientToColor := ToColor;
  bHorizontalGradient := True;
  fHover.bBaseGradientHoriz := True;

  if (Assigned(lblCaption)) AND (bHorizontallblCaptionExists = False) then
  begin
    lblCaption.Free;
  end;

  if (fPanel.Caption <> '') {and (bHasHorizGradientImgAssigned = False))} then
  begin
  lblCaption := TLabel.Create(fPanel);
  with lblCaption do
  begin
    Parent := fPanel;
    Width := Parent.Width;
    Height := Parent.Height;
    Font := fPanel.Font;
    Caption := fPanel.Caption;
    Left := (fPanel.Width - lblCaption.Width) div 2;
    Top := (fPanel.Height - lblCaption.Height) div 2;
    BringToFront;
    OnMouseEnter := LabelMouseEnter;
    OnMouseUp := LabelMouseUp;
    OnMouseDown := LabelMouseDown;
    bHorizontallblCaptionExists := True;
    //Transparent := True;
  end;
  end;
end;

procedure TCustomButtons.ImageMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  PanelMouseDown(fPanel, mbLeft, Shift, 0, 0);
end;

procedure TCustomButtons.ImageMouseEnter(Sender: TObject);
begin
  PanelMouseEnter(fPanel);
    if (bVerticalGradient = True) then
  begin
    if bImageWithPicture = True then
    begin
      if fImageWithPicture.Picture.Graphic IS TJPEGImage then
      begin
        if fPanel.Color <> fOriginalColor then
        begin
        fVerticalGradientImg.Visible := False;
        end;

      end;

    end;
  end;
  //LabelMouseEnter(fPanel);
end;

procedure TCustomButtons.ImageMouseLeave(Sender: TObject);
begin
  PanelMouseLeave(fPanel);
end;

procedure TCustomButtons.ImageMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  PanelMouseUp(fPanel, mbLeft, Shift, 0, 0);


  if bImageWithPicture <> True then
  begin
    if Assigned(fPanel.OnClick) then
    fPanel.OnClick(nil);
  end;


  if (bVerticalGradient = True) then
  begin
    if IsMouseOverControl(fVerticalGradientImg) then
    begin
      fPanel.OnMouseEnter(nil);
    end;
  end;

    if (bHorizontalGradient = True) then
  begin
    if IsMouseOverControl(fHorizontalGradientImg) then
    begin
      fPanel.OnMouseEnter(nil);
    end;
  end;



end;

function TCustomButtons.IsMouseOverControl(control: TControl): Boolean;
var
  p: TPoint;
  r: TRect;
begin
  p := control.ScreenToClient(Mouse.CursorPos);
  r := Rect(0, 0, control.Width, control.Height);
  Result := PtInRect(r, p);
end;

procedure TCustomButtons.LabelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  PanelMouseDown(fPanel, mbLeft, Shift, 0, 0);
end;

procedure TCustomButtons.LabelMouseEnter(Sender: TObject);
var
  Shift : TShiftState;
begin
    if fHover.bVerticalGradient = True then
    begin
      fHover.fVerticalGradientImg.Visible := True;
    end;

    if fHover.bHorizontalGradient = True then
    begin
      fHover.fHorizontalGradientImg.Visible := True;
    end;
 if (bHorizontalGradient = True) AND (bIsStaticGradientHoriz = True) then
   begin
    fHorizontalGradientImg.Visible := False;
    //fHorizontalGradientImg.OnClick := fPanel.OnClick;
    fHover.fHorizontalGradientImg.Visible := False;
   end;


   if (bVerticalGradient = True) AND (bIsStaticGradientVertic = True) then
   begin
    //fVerticalGradientImg.OnClick := fPanel.OnClick;
    fVerticalGradientImg.Visible := False;
    fHover.fVerticalGradientImg.Visible := False;
   end;
   PanelMouseEnter(fPanel);


end;

procedure TCustomButtons.LabelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin


 PanelMouseUp(fPanel, mbLeft, Shift, 0, 0);
 if Assigned(fPanel.OnClick) then
 fPanel.OnClick(nil);
 if IsMouseOverControl(lblCaption) then
 begin

  PanelMouseEnter(fPanel);
 end;



end;

procedure TCustomButtons.PanelMouseDown(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: integer);
var
  bAddBorderRadius : boolean;
begin
  //ShowMessage(lblCaption.Caption);
  //tmrUpdate.Enabled := False;
    //fHover.lblCaption. Alignment := taCenter;
    //fHover.lblCaption.Layout := tlCenter;

  if fBorderRadius <> 0 then
  begin
    bAddBorderRadius := True;
  end else
  begin
    bAddBorderRadius := False;
  end;

  // fHovering := False;

 //Scale
 if (fClick.fScaleValue <> 0) or (bAddBorderRadius = True) then
 begin

  if (fClick.fBorderRadius = 0) and (fBorderRadius <> 0) and (fClick.fUserSetBorderRadius = False) then      // {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{Origanally, fBorderRaduis <> 0
  begin //
    fClick.fBorderRadius := fBorderRadius + fClick.fScaleValue + fHover.fScaleValue;
  // ShowMessage(IntToStr(fClick.fBorderRadius));
    fHover.fPanelDupeBorderRadius := fClick.BorderRadius;
  end;


  fPanel.Width := fPanel.Width + fClick.fScaleValue;
  fPanel.Height := fPanel.Height + fClick.fScaleValue;


  fPanel.Top := fPanel.Top - ((fClick.fScaleValue) div 2);
  fPanel.Left := fPanel.Left - ((fClick.fScaleValue) div 2);



 end;

 if Button = mbLeft then
 begin

 // Hover:
 // Border Radius
 if fClick.BorderRadius <> 0 then
 begin
 //ShowMessage(IntToStr(fClick.fBorderRadius));
  //fClick.AddBorderRadius(fClick.fBorderRadius);
 end;



  if fClick.Color <> fOriginalColor then
  begin
   fHovering := False;
   fPanel.Color := fClick.Color;
  end;



  // fIsScaled := False;
  if fHover.fHasBoxShadow = True then
  begin
    fHover.fPanelDupe.Visible := False;
  end;

  if (fHovering = False) or (fIsScaled = False) then
  begin
   PanelMouseEnter(fPanel);
  end;

 if (fClick.Color <> fOriginalColor) then
 begin
  fHovering := False;
  fPanel.Color := fClick.fColor;
 end;

//if fClick.fBorderRadius <> 0 then
//begin
  fClick.AddBorderRadius(fClick.fBorderRadius);
  fClick.fPanelDupeBorderRadius := fClick.fBorderRadius;
//end;

// if fHover.fBorderRadius <> 0 then
// begin
//    fHover.AddBorderRadius(fHover.fBorderRadius);
//    fHover.fPanelDupeBorderRadius := fHover.fBorderRadius;
// end;



  if (fHover.fHasBoxShadow = True) and (fClick.bBoxShadow = False) then
  begin
    fClick.BoxShadow(0, 0, fPanel.Color);
  end;

  // Shadow:
  if fClick.bBoxShadow = True then
  begin

   fClick.AddBoxShadow(fClick.fBoxShadowRight, fClick.fBoxShadowBottom);
   fClick.fHasBoxShadow := True;
   if (fHover.fScaleValue <> 0) then
   begin
    if fHover.bBoxShadow = False then
    begin
      //fClick.fPanelDupe.Top := iPanelTop + (fHover.fScaleValue div 2);
      //fClick.fPanelDupe.Left := iPanelLeft + (fHover.fScaleValue div 2);
      fClick.fPanelDupe.Top := fClick.fOriginalShadowBottom; //+ (fHover.fScaleValue div 2);
      fClick.fPanelDupe.Left := fClick.fOriginalShadowRight; //+ (fHover.fScaleValue div 2);
      fPanel.Top := fClick.fOriginalShadowBottom {- (fClick.fBoxShadowBottom)} - (fHover.fScaleValue div 2);
      fPanel.Left := fClick.fOriginalShadowRight {- (fClick.fBoxShadowRight)} - (fHover.fScaleValue div 2);
    end else
    begin
    //fClick.fPanelDupe.Top := iPanelTop + (fHover.fScaleValue div 2);
    //fClick.fPanelDupe.Left := iPanelLeft + (fHover.fScaleValue div 2);
    fClick.fPanelDupe.Top := fClick.fOriginalShadowBottom + (fHover.fScaleValue div 2);
    fClick.fPanelDupe.Left := fClick.fOriginalShadowRight + (fHover.fScaleValue div 2);
    fPanel.Top := fClick.fOriginalShadowBottom - (fClick.fBoxShadowBottom) + (fHover.fScaleValue div 2);
    fPanel.Left := fClick.fOriginalShadowRight - (fClick.fBoxShadowRight) + (fHover.fScaleValue div 2);
    end;

   end;

   if fHover.fScaleValue = 0 then
   begin
      fClick.fPanelDupe.Top := fClick.fOriginalShadowBottom + (fHover.fScaleValue div 2);
      fClick.fPanelDupe.Left := fClick.fOriginalShadowRight + (fHover.fScaleValue div 2);
      fPanel.Top := fClick.fOriginalShadowBottom - (fClick.fBoxShadowBottom) + (fHover.fScaleValue div 2);
      fPanel.Left := fClick.fOriginalShadowRight - (fClick.fBoxShadowRight) + (fHover.fScaleValue div 2);
   end;
//   if fHover.fHasBoxShadow = True then
//   begin
//     fPanel.Top := fHover.fBoxShadowBottom;
//      fPanel.Left := fHover.fBoxShadowRight;
//   end;



  end;

  // Click (Down)

  if (fClick.bVerticalGradient = True) and (fClick.bVertGradientFirst = True) then     // REQUIRED
  begin
    fClick.AddVerticalGradient(fClick.fGradientFromColor, fClick.fGradientToColor);
    fClick.bVertGradientFirst := False;
  end else if (fClick.bVerticalGradient = True) and (fClick.bVertGradientFirst = False) then
  begin
    fClick.fVerticalGradientImg.Visible := True;
  end;

  if (fClick.bHorizontalGradient = True) and (fClick.bHorizGradientFirst = True) then     // REQUIRED
  begin
    fClick.AddHorizontalGradient(fClick.fGradientFromColor, fClick.fGradientToColor);
    fClick.bHorizGradientFirst := False;
  end else if (fClick.bHorizontalGradient = True) and (fClick.bHorizGradientFirst = False) then
  begin
    fClick.fHorizontalGradientImg.Visible := True;
  end;

  
  if Assigned(lblCaption) then
  begin
    lblCaption.Visible := True;
    lblCaption.BringToFront;
  end;

  if Assigned(fHover.lblCaption) then
  begin
    fHover.lblCaption.Visible := True;
    fHover.lblCaption.BringToFront;
  end;

  if bVerticalGradient = True then
  begin
    fVerticalGradientImg.Width := fPanel.Width;
    fVerticalGradientImg.Height := fPanel.Height;
  end;

  if bHorizontalGradient = True then
  begin
    fHorizontalGradientImg.Width := fPanel.Width;
    fHorizontalGradientImg.Height := fPanel.Height;
  end;


  if bVerticallblCaptionExists or bHorizontallblCaptionExists then
  begin
    lblCaption.Left := (fPanel.Width - lblCaption.Width) div 2;
    lblCaption.Top := (fPanel.Height - lblCaption.Height) div 2;
  end;


  if fHover.bVerticallblCaptionExists or fHover.bHorizontallblCaptionExists then
  begin
    fHover.lblCaption.Left := (fPanel.Width - fHover.lblCaption.Width) div 2;
    fHover.lblCaption.Top := (fPanel.Height - fHover.lblCaption.Height) div 2;
  end;


//  if (fHover.bVerticalGradient = False) and (fHover.bHorizontalGradient = False) and (bVerticalGradient = False) and (bHorizontalGradient = False) then
//  begin
//    if (fClick.bVerticallblCaptionExists = True) or (fClick.bHorizontallblCaptionExists = True) then
//    begin
//
//      fClick.lblCaption.Visible := True;
//    end;
//
//  end;

  if (fClick.bVerticalGradient = True) or (fClick.bHorizontalGradient = True) and (bVerticalGradient = True) or (bHorizontalGradient = True) then
  begin
    if (fClick.bVerticallblCaptionExists = True) or (fClick.bHorizontallblCaptionExists = True) then
    begin
      fClick.lblCaption.Visible := False;
    end;
  end;


  if (fHover.bVerticalGradient = False) and (fHover.bHorizontalGradient = False) and (bVerticalGradient = False) and (bHorizontalGradient = False) then
  begin
    if (fClick.bVerticallblCaptionExists = True) or (fClick.bHorizontallblCaptionExists = True) then
    begin

      fClick.lblCaption.Visible := True;
    end;

  end;

  if Assigned(fClick.lblCaption) then
  begin
    fClick.lblCaption.Visible := True;
    fClick.lblCaption.BringToFront;
    if bVerticallblCaptionExists or bHorizontallblCaptionExists then
    begin
      lblCaption.Visible := False;
    end;
  end;

  if fPanel.Color <> fOriginalColor then
  begin
    if (fHover.bVerticalGradient = True) or (fHover.bHorizontalGradient = True) and
        (fClick.bVerticalGradient = False) and (fClick.bHorizontalGradient = False)
        or (bVerticalGradient = True) or (bHorizontalGradient = True) then
    begin
      if (fHover.bVerticalGradient = True) then
      begin
        fHover.fVerticalGradientImg.Visible := False;
      end;

      if (fHover.bHorizontalGradient = True) then
      begin
        fHover.fHorizontalGradientImg.Visible := False;
      end;

      if (bHorizontalGradient = True) then
      begin
        fHorizontalGradientImg.Visible := False;
      end;

      if (bVerticalGradient = True) then
      begin
        fVerticalGradientImg.Visible := False;
      end;


    end;
    if (bImageWithPicture = True) then
    begin
      fImageWithPicture.Visible := False;
    end;
  end;

  if (fHover.bVerticalGradient = True) or (fHover.bHorizontalGradient = True)
  and (fClick.bVerticalGradient = False) and (fClick.bHorizontalGradient = False) then
  begin
    if ((fHover.bHorizontallblCaptionExists) or (fHover.bVerticallblCaptionExists))
    and (fPanel.Color <> fOriginalColor) then
    begin
      if Assigned(fClick.lblCaption) = True then
      begin
        fHover.lblCaption.Visible := False;
      end;

    end;

  end;

  if ((bVerticalGradient = True) or (bHorizontalGradient = True))
  and ((fClick.bVerticalGradient = False) and (fClick.bHorizontalGradient = False)) then
  begin
    if ((bHorizontallblCaptionExists) or (bVerticallblCaptionExists))
    and (fPanel.Color <> fOriginalColor) then
    begin
      lblCaption.Visible := False;
    end;

  end;

  if (fPanel.Color = fOriginalColor) then
  begin
    //Showmessage('Original');
  end else
  begin
    //ShowMessage('Not Original');
  end;

//  if fHover.fScaleValue > 0 then
//  begin
//    if (fHover.bVerticalGradient = True) and (fHover.bVerticallblCaptionExists = True) then
//    begin
//      fHover.lblCaption.v := False;
//    end;
//  end;

    if (fClick.bHorizontalGradient = True) and (fClick.bVerticalGradient = True)
  and (fHover.bHorizontalGradient = False) and (fHover.bHorizontalGradient = False)
  and (bHorizontalGradient = False) and (bVerticalGradient = False) then
  begin

  end;

  if bImageWithPicture = True then
  begin
  if fImageWithPicture.Picture.Graphic IS TPNGImage then
  begin
    fImageWithPicture.BringToFront;
    if (fHover.bVerticalGradient = True) or (fHover.bHorizontalGradient = True) then
    begin
      if (fHover.bHorizontallblCaptionExists = True) or (fHover.bVerticallblCaptionExists = True) then
      begin
        fHover.lblCaption.BringToFront;
      end;
    end;

    if (fClick.bVerticalGradient = True) or (fClick.bHorizontalGradient = True) then
    begin
      if (fClick.bHorizontallblCaptionExists = True) or (fClick.bVerticallblCaptionExists = True) then
      begin
        fClick.lblCaption.BringToFront;
      end;
    end;
  end;
  end;

  if (bHorizontallblCaptionExists = True) or (bVerticallblCaptionExists = True) then
  begin
    lblCaption.BringToFront;
  end;


  if bImageWithPicture = True then
  begin
    if fImageWithPicture.Picture.Graphic IS TPNGImage then
    begin
      fImageWithPicture.Visible := True;
      fImageWithPicture.BringToFront;
    end;
  end;
  end; // mbleft
  //fPanel.OnClick(nil);
  //ShowMessage(ColorToString(fClick.fGradientToColor));
  //ShowMessage('Hello');  //---------------------------------------------------------------------------------------------
end;

procedure TCustomButtons.PanelMouseEnter(Sender: TObject);
var
  i: Integer; // Hover
begin
    fHovering := True;

    tmrUpdate.Enabled := True;
    tmrUpdate.Interval := 50;

    tmrUpdate.OnTimer := TimerOnTimer;

 if (fHover.Color <> fOriginalColor) then
 begin
//  if fClick.bVerticalGradient = True then
//   begin
//     //fClick.fVerticalGradientImg.Visible := False;
//   end;
//
//   if fClick.bHorizontalGradient = True then
//   begin
//     //fClick.fHorizontalGradientImg.Visible := False;
//   end;

  if (bImageWithPicture = False) then
  begin
    if bVerticalGradient = True then
   begin
     fVerticalGradientImg.Visible := False;
   end;

   if bHorizontalGradient = True then
   begin
     fHorizontalGradientImg.Visible := False;
   end;
  end;

  if bImageWithPicture = True then
  begin
    if fImageWithPicture.Picture.Graphic IS TJPEGImage then
    begin
    if bVerticalGradient = True then
   begin
     fVerticalGradientImg.Visible := False;
   end;

   if bHorizontalGradient = True then
   begin
     fHorizontalGradientImg.Visible := False;
   end;
    end;
  end;

  




   if bImageWithPicture = True then
   begin
    if NOT (fImageWithPicture.Picture.Graphic IS TPNGImage) then
    begin
      fImageWithPicture.Visible := False;
    end else
    begin
      fImageWithPicture.Visible := True;
    end;
   end;

//       if (bImageWithPicture = True) then
//  begin
//    fImageWithPicture.Visible := False;
//  end;

   if bHorizontallblCaptionExists = True then
   begin

     //lblCaption.Visible := False;
   end;

   if bVerticallblCaptionExists = True then
   begin
     //lblCaption.Visible := False;
   end;
  fPanel.Color := fHover.fColor;
  // fOriginalColor := fHover.Color;
  //ShowMessage(ColorToString(fOriginalColor));
 end;

   if (fHover.fBorderRadius = 0) and (fBorderRadius <> 0) then      // Origanally, fBorderRaduis <> 0
  begin //
    fHover.fBorderRadius := fBorderRadius + fHover.fScaleValue ;//+ fClick.fScaleValue;
  // ShowMessage(IntToStr(fClick.fBorderRadius));
    fHover.fPanelDupeBorderRadius := fClick.fBorderRadius;
  end;
 //Scale
 if (fHover.fScaleValue <> 0) and (fIsScaled = False) then
 begin


  fIsScaled := True;
  fPanel.Width := fPanel.Width + fHover.fScaleValue;
  fPanel.Height := fPanel.Height + fHover.fScaleValue;
  fNewHeight := fPanel.Height;
  fNewWidth := fPanel.Width;

  fPanel.Top := fPanel.Top - (fHover.fScaleValue div 2);
  fPanel.Left := fPanel.Left - (fHover.fScaleValue div 2);
  fBorderRadius := fBorderRadius + fHover.fScaleValue;
  AddBorderRadius(fBorderRadius);
  fBorderRadius := fBorderRadius - fHover.fScaleValue;

  fClick.fOriginalShadowRight := fPanel.Left;
  fClick.fOriginalShadowBottom := fPanel.Top;
 end;


 // Hover:
 // Border Radius
 if (fHover.fBorderRadius <> 0) then
 begin
    tmrUpdate.Enabled := False;
    fHover.AddBorderRadius(fHover.fBorderRadius);
    fHover.fPanelDupeBorderRadius := fHover.fBorderRadius;
    tmrUpdate.Enabled := True;
 end else
 begin
  fHover.AddBorderRadius(fBorderRadius);
  fHover.fPanelDupeBorderRadius := fBorderRadius;
 end;


 // Shadow:
 if (fHover.bBoxShadow = True) then
 begin
    fHover.AddBoxShadow(fHover.fBoxShadowRight, fHover.fBoxShadowBottom);
  
  //fHover.fHasBoxShadow := True;
 end;


  fHoverPanelTop := fPanel.Top;
  fHoverPanelLeft := fPanel.Left;

  if bVerticalGradient = True then
  begin
    fVerticalGradientImg.Width := fPanel.Width;
    fVerticalGradientImg.Height := fPanel.Height;
  end;

  if bHorizontalGradient = True then
  begin
    fHorizontalGradientImg.Width := fPanel.Width;
    fHorizontalGradientImg.Height := fPanel.Height;
  end;


   //Gradients (Enter)
  if (fHover.bVerticalGradient = True) and (fHover.bVertGradientFirst = True) then     // REQUIRED (Creates for First Time only)
  begin
      fHover.AddVerticalGradient(fHover.fGradientFromColor, fHover.fGradientToColor);
      fHover.bVertGradientFirst := False;

      //fHover.bVerticalGradient := False;
  end;

  if (fHover.bHorizontalGradient = True) and (fHover.bHorizGradientFirst = True)  then     // REQUIRED (Creates for First Time only)
  begin
    fHover.AddHorizontalGradient(fHover.fGradientFromColor, fHover.fGradientToColor);
    fHover.bHorizGradientFirst := False;

    //fHover.bHorizontalGradient := False;
  end;


    if fHover.bVerticalGradient = True then     // REQUIRED (Shows it after first time)
    begin
      fHover.fVerticalGradientImg.Visible := True;
    end;

    if fHover.bHorizontalGradient = True then        // REQUIRED (Shows it after first time)
    begin
      fHover.fHorizontalGradientImg.Visible := True;
    end;






  fClick.bHoverGradientVertic := fHover.bHoverGradientVertic;
  fClick.bHoverGradientHoriz := fHover.bHoverGradientHoriz;



  if fHover.Color <> fOriginalColor then
  begin
    if (bImageWithPicture = True) then
    begin
      fImageWithPicture.Visible := False;
    end;
  end;



  if (fClick.bHorizontalGradient = False) and (fClick.bVerticalGradient = False)
  and (fHover.bHorizontalGradient = False) and (fHover.bHorizontalGradient = False)
  and (bHorizontalGradient = False) and (bVerticalGradient = False) then
  begin
    if (fHover.Color = fOriginalColor) then
    begin
      if (bImageWithPicture = True) then
      begin
        fImageWithPicture.Visible := True;
      end;
    end;

  end;

  if bImageWithPicture = True then
  begin
  if fImageWithPicture.Picture.Graphic IS TPNGImage then
  begin
    fImageWithPicture.BringToFront;
    if (fHover.bVerticalGradient = True) or (fHover.bHorizontalGradient = True) then
    begin
      if (fHover.bHorizontallblCaptionExists = True) or (fHover.bVerticallblCaptionExists = True) then
      begin
        fHover.lblCaption.BringToFront;
      end;
    end;

    if (fClick.bVerticalGradient = True) or (fClick.bHorizontalGradient = True) then
    begin
      if (fClick.bHorizontallblCaptionExists = True) or (fClick.bVerticallblCaptionExists = True) then
      begin
        fClick.lblCaption.BringToFront;
      end;
    end;
  end;
  end;

  if bVerticallblCaptionExists or bHorizontallblCaptionExists then
  begin
    lblCaption.Left := (fPanel.Width - lblCaption.Width) div 2;
    lblCaption.Top := (fPanel.Height - lblCaption.Height) div 2;
  end;

  if fHover.bVerticallblCaptionExists or fHover.bHorizontallblCaptionExists then
  begin
    fHover.lblCaption.Left := (fPanel.Width - fHover.lblCaption.Width) div 2;
    fHover.lblCaption.Top := (fPanel.Height - fHover.lblCaption.Height) div 2;
  end;




    if Assigned(lblCaption) then
  begin
    //lblCaption.Visible := True;
    lblCaption.BringToFront;
  end;

  if Assigned(fHover.lblCaption) then
  begin
    fHover.lblCaption.Caption := fPanel.Caption;
    fHover.lblCaption.BringToFront;
  end;

  if (fHover.bVerticalGradient = True) and (Assigned(fHover.fVerticalGradientImg)) then
  begin
    if fHover.bVerticallblCaptionExists = True then
    begin
      fHover.lblCaption.Visible := True;
    end;

  end;

  if (fHover.bHorizontalGradient = True) and (Assigned(fHover.fHorizontalGradientImg)) then
  begin
    if fHover.bHorizontallblCaptionExists = True then
    begin
      fHover.lblCaption.Visible := True;
    end;
  end;
  //======================================================
  if bImageWithPicture = True then
  begin
    if fImageWithPicture.Picture.Graphic IS TPNGImage then
    begin
      fImageWithPicture.Visible := True;
      fImageWithPicture.BringToFront;
    end;
  end;
end;


procedure TCustomButtons.PanelMouseLeave(Sender: TObject); // Hover
begin
    if fHover.fHasBoxShadow = True then
    begin
      if IsMouseOverControl(fHover.fPanelDupe) then
      begin
        fIsHoveringShadow := True;

        if bVerticalGradient = True then
        begin
          fVerticalGradientImg.Width := fPanel.Width;
          fVerticalGradientImg.Height := fPanel.Height;
        end;

        if bHorizontalGradient = True then
        begin
          fHorizontalGradientImg.Width := fPanel.Width;
          fHorizontalGradientImg.Height := fPanel.Height;
        end;

      end else
      begin
        fIsHoveringShadow := False;
      end;
    end;

  fHovering := False;
  if (fIsHoveringShadow <> True) or (fHover.fHasBoxShadow = False) then

 if (fHover.fScaleValue <> 0) and (fIsScaled = True) then
 begin
   fIsScaled := False;
   fPanel.Width := fOriginalWidth;
   fPanel.Height := fOriginalHeight;

   fPanel.Top := fPanel.Top + (fHover.fScaleValue div 2);
   fPanel.Left := fPanel.Left + (fHover.fScaleValue div 2);
   if fBorderRadius <> 0 then
   begin
    if fIsScaled = True then
    begin
      fBorderRadius := fBorderRadius - fHover.fScaleValue;
    end;

    AddBorderRadius(fBorderRadius);
   end;

 end;




 if fIsHoveringShadow = False then
 begin
 if fHover.bBoxShadow = True then
 begin
  if fHover.fHasBoxShadow = True then
  begin
    fHover.fPanelDupe.Visible := False;
    PanelMouseEnter(fPanel);
    fHover.fHasBoxShadow := False;

  end;

  if (fHover.fScaleValue <> 0) and (fIsScaled = True) then
  begin
   fIsScaled := False;
   fPanel.Width := fOriginalWidth;
   fPanel.Height := fOriginalHeight;

   fPanel.Top := fPanel.Top + (fHover.fScaleValue div 2);
   fPanel.Left := fPanel.Left + (fHover.fScaleValue div 2);
   if fBorderRadius <> 0 then
   begin
    if fIsScaled = True then
    begin
      fBorderRadius := fBorderRadius - fHover.fScaleValue;
    end;

    AddBorderRadius(fBorderRadius);

   end;

 end;
  fPanel.Top := fHover.fOriginalShadowBottom;
  fPanel.Left := fHover.fOriginalShadowRight;
 end;
   // hasboxshadow

    //Orginal Scale




 if {(fHover.BorderRadius <> 0) bug fix vir een rounded corner  and} (fHover.fBorderRadius > 0) then  //}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}
 begin
  fHover.AddBorderRadius(fBorderRadius);
 end else
 begin
   fHover.AddBorderRadius(fBorderRadius);
 end;

 if (fHover.Color <> fOriginalColor) and (bVerticalGradient = False) and (bHorizontalGradient = False) then
 begin
//  if bVerticalGradient = True then
//  begin
//    fVerticalGradientImg.Visible := True;
//  end;
//
//  if bHorizontalGradient = True then
//  begin
//    fHorizontalGradientImg.Visible := True;
//  end;
//  if fClick.bVerticalGradient = True then
//   begin
//     //fClick.fVerticalGradientImg.Visible := False;
//   end;
//
//   if fClick.bHorizontalGradient = True then
//   begin
//     //fClick.fHorizontalGradientImg.Visible := False;
//   end;

  //fPanel.Color := fHover.fColor;
  // fOriginalColor := fHover.Color;
  //ShowMessage(ColorToString(fOriginalColor));

  fPanel.Color := fOriginalColor; //************************
 end;


 if IsMouseOverControl(fPanel) = False then
 begin
    if fPanel.Top <> fOriginalTop then
    begin
      fPanel.Top := fOriginalTop
    end;

    if fPanel.Left <> fOriginalLeft then
    begin
      fPanel.Left := fOriginalLeft;
    end;

   if bHorizontallblCaptionExists = True then
   begin
     lblCaption.Visible := True;
   end;

   if bVerticallblCaptionExists = True then
   begin
     lblCaption.Visible := True;
   end;
   

 end;


  tmrUpdate.Enabled := False;
 end;  // fishoveringshadow

  // Gradients (Leave)
  if fHover.bVerticalGradient = True then    // REQUIRED
  begin
    fHover.fVerticalGradientImg.Visible := False;
    if Assigned(fHover.lblCaption) then
    begin
      fHover.lblCaption.Visible := False;
    end;

  end;

  if fHover.bHorizontalGradient = True then     // REQUIRED
  begin
    fHover.fHorizontalGradientImg.Visible := False;
    if Assigned(fHover.lblCaption) then
    begin
      fHover.lblCaption.Visible := False;
    end;
  end;

  if (bImageWithPicture = True) then
  begin
    fImageWithPicture.Visible := True;
  end;

  if (bVerticalGradient = True) then
  begin
    fVerticalGradientImg.Visible := True;
    if (bVerticallblCaptionExists = True) and (fHover.Color <> fOriginalColor) then
    begin
      if IsMouseOverControl(lblCaption) then
      fVerticalGradientImg.Visible := False;
    end;
  end;

  if bHorizontalGradient = True then
  begin
    fHorizontalGradientImg.Visible := True;
    if (bHorizontallblCaptionExists = True) and (fHover.Color <> fOriginalColor) then
    begin
      if IsMouseOverControl(lblCaption) then
      fHorizontalGradientImg.Visible := False;
    end;
  end;


   if (fHover.Color <> fOriginalColor) then
 begin
//  if fClick.bVerticalGradient = True then
//   begin
//     //fClick.fVerticalGradientImg.Visible := False;
//   end;
//
//   if fClick.bHorizontalGradient = True then
//   begin
//     //fClick.fHorizontalGradientImg.Visible := False;
//   end;


   if bHorizontallblCaptionExists = True then
   begin
     lblCaption.Visible := True;

   end;

   if bVerticallblCaptionExists = True then
   begin
     lblCaption.Visible := True;
   end;
 end;
  //fClick.lblCaption.Visible := False;
  //lblCaption.Visible := False;
  if bVerticallblCaptionExists or bHorizontallblCaptionExists then
  begin
    lblCaption.Left := (fPanel.Width - lblCaption.Width) div 2;
    lblCaption.Top := (fPanel.Height - lblCaption.Height) div 2;
    lblCaption.BringToFront;
  end;


  //fVerticalGradientImg.Visible := False;
  //fVerticalGradientImg.Visible := False;


end;


procedure TCustomButtons.PanelMouseUp(Sender: TObject; Button: TMouseButton;
 Shift: TShiftState; X, Y: integer);
begin

  if (bHorizontalGradient = True) and (bHorizontallblCaptionExists = True) then
   begin

     lblCaption.Visible := True;
   end;

   if (bVerticalGradient = True) and (bVerticallblCaptionExists = True) then
   begin
     lblCaption.Visible := True;
   end;



  if (bVerticallblCaptionExists = True) or (bHorizontallblCaptionExists = True) then
  begin
    if (IsMouseOverControl(lblCaption)) then
    begin
      PanelMouseEnter(fPanel);
    end;
  end;


 if (fClick.Color <> fOriginalColor) and (bVerticalGradient = False) and (bHorizontalGradient = False) then
 begin
  fHovering := True;
//  if bVerticalGradient = True then
//  begin
//    fVerticalGradientImg.Visible := True;
//  end;
//
//  if bHorizontalGradient = True then
//  begin
//    fHorizontalGradientImg.Visible := True;

//  end;
  fPanel.Color := fOriginalColor;
 end;
 //Orginal Scale

 if fClick.fScaleValue <> 0 then
 begin

  if fHover.fScaleValue <> 0 then
  begin
   fPanel.Height := fNewHeight;
   fPanel.Width := fNewWidth;
  end else
  begin
   fPanel.Height := fOriginalHeight;
   fPanel.Width := fOriginalWidth;
  end;

 if fHover.fScaleValue <> 0 then
 begin
//  fPanel.Top := fPanel.Top + (fClick.fScaleValue div 2);
//  fPanel.Left := fPanel.Left + (fClick.fScaleValue div 2);
 end else
 begin

 end;
    fPanel.Top := fPanel.Top + (fClick.fScaleValue div 2);
    fPanel.Left := fPanel.Left + (fClick.fScaleValue div 2);

  if fBorderRadius <> 0 then
  begin
    if fHover.fScaleValue <> 0 then
    begin

    end;
   fBorderRadius := fBorderRadius + fHover.fScaleValue;
   AddBorderRadius(fBorderRadius);
   fBorderRadius := fBorderRadius - fHover.fScaleValue;
  end;

 end;

 if (fClick.BorderRadius <> 0) AND (fBorderRadius = 0) then
 begin
  fClick.AddBorderRadius(0);
 end;




 if fClick.bBoxShadow = True then
 begin

  //fPanelDupeCustom.Destroy;
  fClick.fPanelDupe.Destroy;
  //fPanel.Top := fHoverPanelTop;
  //fPanel.Left := fHoverPanelLeft;
  fPanel.Top := fClick.fOriginalShadowBottom;
  fPanel.Left := fClick.fOriginalShadowRight;




//  if fClick.fScaleValue <> 0 then
//  begin
//    fPanel.Top := fOriginalTop;
//    fPanel.Left := fOriginalLeft;
//  end;
  //fPanel.Top := fOriginalTop;
  //fPanel.Left := fOriginalLeft;
 end;


 // Simulate cursor entering panel
 fHovering := False;
  if (fHovering = False) or (fIsScaled = False) then
  begin
   if (fHover.bBoxShadow = True) then
   begin
    fHover.fPanelDupe.Destroy;
    fHover.fHasBoxShadow := False;
    //fPanelDupeCustom.Destroy;
    fPanel.Top := fHover.fOriginalShadowBottom;
    fPanel.Left := fHover.fOriginalShadowRight;
   end;
   if fHover.fBorderRadius <> 0 then
   begin
     //fClick.fBorderRadius := fHover.fBorderRadius;
   end;


  end;

  // Gradient (Up)

  if fClick.bVerticalGradient = True then    // REQUIRED
  begin

    fClick.fVerticalGradientImg.Visible := False;
    if Assigned(fClick.lblCaption) then
    begin
      fClick.lblCaption.Visible := False;
    end;

  end;

  if fClick.bHorizontalGradient = True then     // REQUIRED
  begin
    fClick.fHorizontalGradientImg.Visible := False;
    if Assigned(fClick.lblCaption) then
    begin
      fClick.lblCaption.Visible := False;
    end;
  end;

  if (fClick.bVerticalGradient = True) or (fClick.bHorizontalGradient = True) then
  begin
    if (fHover.bVerticalGradient = False) and (fHover.bHorizontalGradient = False)
    and (bVerticalGradient = False) and (bHorizontalGradient = False) then
    begin
      if IsMouseOverControl(fClick.lblCaption) then
      begin
        PanelMouseEnter(nil);
      end;
    end;

  end;


    if fPanel.Color <> fOriginalColor then
  begin
    if (fHover.bVerticalGradient = True) or (fHover.bHorizontalGradient = True) and
        (fClick.bVerticalGradient = False) and (fClick.bHorizontalGradient = False)
        or (bVerticalGradient = True) or (bHorizontalGradient = True) then
    begin
//      if (fHover.bVerticalGradient = True) then
//      begin
//        fHover.fVerticalGradientImg.Visible := False;
//      end;
//
//      if (fHover.bHorizontalGradient = True) then
//      begin
//        fHover.fHorizontalGradientImg.Visible := False;
//      end;

      if (bHorizontalGradient = True) then
      begin
        fHorizontalGradientImg.Visible := True;
      end;

      if (bVerticalGradient = True) then
      begin
        fVerticalGradientImg.Visible := True;
      end;
    end;
  end;

  if bVerticallblCaptionExists or bHorizontallblCaptionExists then
  begin
    lblCaption.Left := (fPanel.Width - lblCaption.Width) div 2;
    lblCaption.Top := (fPanel.Height - lblCaption.Height) div 2;
  end;
  // Introduce a timer for delayed execution

  if fHover.bVerticallblCaptionExists or fHover.bHorizontallblCaptionExists then
  begin
    fHover.lblCaption.Left := (fPanel.Width - fHover.lblCaption.Width) div 2;
    fHover.lblCaption.Top := (fPanel.Height - fHover.lblCaption.Height) div 2;
  end;

  if bImageWithPicture = True then
  begin
    if fImageWithPicture.Picture.Graphic IS TJPEGImage then
    begin
      if fPanel.Color <> fOriginalColor then
      begin
        fImageWithPicture.Visible := True;
      end;
    end;
  end;

   PanelMouseEnter(fPanel);

  //---------------------------------------------------------------------------------------------------
 // PanelMouseLeave(fPanel);
end;

procedure TCustomButtons.ScaleBy(Value: integer);
begin
 fScaleValue := Value;
 fPanel.Width := fPanel.Width + fScaleValue;
 fPanel.Height := fPanel.Height + fScaleValue;

 fPanel.Top := fPanel.Top - ((fScaleValue) div 2);
 fPanel.Left := fPanel.Left - ((fScaleValue) div 2);

 fOriginalWidth := fPanel.Width;
 fOriginalHeight := fPanel.Height;
 fOriginalLeft := fPanel.Left;
 fOriginalTop := fPanel.Top;
end;

procedure TCustomButtons.TimerOnTimer(Sender: TObject);
var
  Shift : TShiftState;
begin
  if IsMouseOverControl(fPanel) = False then
  begin
//    if fHover.bVerticalGradient = True then
//    begin
//      fHover.fVerticalGradientImg.Destroy;
//    end;
//
//    if fHover.bHorizontalGradient = True then
//    begin
//      fHover.fHorizontalGradientImg.Destroy;
//    end;
    PanelMouseLeave(fPanel);
    if fClick.fHasBoxShadow = True then
    begin
      if fIsHoveringShadow = False then
      begin
        fClick.fPanelDupe.Visible := False;
      end;
    end;
  end;


    if bVerticallblCaptionExists or bHorizontallblCaptionExists then
  begin
    //lblCaption.Left := (fPanel.Width - lblCaption.Width) div 2;
    //lblCaption.Top := (fPanel.Height - lblCaption.Height) div 2;
  end;

//
//  if Assigned(lblCaption) then
//  begin
//    //lblCaption.Visible := True;
//    lblCaption.BringToFront;
//  end;
//
//  if Assigned(fHover.lblCaption) then
//  begin
//    fHover.lblCaption.Caption := fPanel.Caption;
//    fHover.lblCaption.BringToFront;
//  end;
//
//  if (fHover.bVerticalGradient = True) and (Assigned(fHover.fVerticalGradientImg)) then
//  begin
//    if fHover.bVerticallblCaptionExists = True then
//    begin
//      fHover.lblCaption.Visible := True;
//    end;
//
//  end;
//
//  if (fHover.bHorizontalGradient = True) and (Assigned(fHover.fHorizontalGradientImg)) then
//  begin
//    if fHover.bHorizontallblCaptionExists = True then
//    begin
//      fHover.lblCaption.Visible := True;
//    end;
//  end;

  //lblCaption.Visible := False;
  //fHover.lblCaption.Visible := False;

end;

procedure TCustomButtons.VerticalGradient(FromColor, ToColor: TColor);
var
  MyColor: TColor;
  Y: integer;
  dr, dg, db: Extended;
  C1, C2: TColor;
  r1, r2, g1, g2, b1, b2: Byte;
  R, G, B: Byte;
  cnt: Integer;
  i : integer;
  TempImage : TImage;
begin
if fPanel.ControlCount > 0 then
begin
  for i := 0 to fPanel.ControlCount - 1 do
  begin
    if fPanel.Controls[i] is TImage then
    begin
      TempImage := fPanel.Controls[i] as TImage;
      if not Assigned(TempImage.Picture.Graphic) then
      begin
        fVerticalGradientImg := TempImage;
        bHasVertGradientImgAssigned := False;
        fHover.bHasBaseVertGradImgAssigned := False;
      end else
      begin
        bHasVertGradientImgAssigned := True;
        fHover.bHasBaseVertGradImgAssigned := True;
      end;
    end;
  end;
end;

if (fPanel.ControlCount = 0) or Assigned(TempImage.Picture.Graphic) AND (TempImage <> fVerticalGradientImg) then
begin
  fVerticalGradientImg := TImage.Create(fPanel);
  with fVerticalGradientImg do
  begin
  Parent := fPanel;
  //fHorizontalGradientImg.Align := alClient;
    Top := 0;
    Left := 0;
    Width := fPanel.Width;
    Height := fPanel.Height + 3;
    Stretch := True;
    Visible := True;
    Transparent := True;
    OnMouseEnter := fPanel.OnMouseEnter;
    OnMouseLeave := fPanel.OnMouseLeave;
    OnMouseDown := fPanel.OnMouseDown;
    //OnMouseUp := fPanel.OnMouseUp;
    OnMouseUp := ImageMouseUp;
    SendToBack;
  end;

  //fHorizontalGradientImg.Transparent := True;

end;
  fVerticalGradientImg.Visible := True;

  C1 := FromColor;
  R1 := GetRValue(C1);
  G1 := GetGValue(C1);
  B1 := GetBValue(C1);
  C2 := ToColor;
  R2 := GetRValue(C2);
  G2 := GetGValue(C2);
  B2 := GetBValue(C2);
  dr := (R2 - R1) / (fVerticalGradientImg.Height - 1);
  dg := (G2 - G1) / (fVerticalGradientImg.Height - 1);
  db := (B2 - B1) / (fVerticalGradientImg.Height - 1);
  cnt := 0;
  for Y := 0 to fVerticalGradientImg.Height - 1 do
  begin
    R := R1 + Ceil(dr * cnt);
    G := G1 + Ceil(dg * cnt);
    B := B1 + Ceil(db * cnt);

    MyColor := RGB(R, G, B);
    fVerticalGradientImg.Canvas.Brush.Color := MyColor;

    fVerticalGradientImg.Canvas.FillRect(Rect(0, y, fVerticalGradientImg.Width, Y + 1));
    inc(cnt);
  end;
  fGradientFromColor := FromColor;
  fGradientToColor := ToColor;
  bVerticalGradient := True;
  fHover.bBaseGradientVertic := True;

  if (Assigned(lblCaption)) AND (bVerticallblCaptionExists = False) then
  begin
    lblCaption.Free;
  end;


  if (fPanel.Caption <> '') {and (bHasVertGradientImgAssigned = False)} then
  begin
  lblCaption := TLabel.Create(fPanel);
  with lblCaption do
  begin
    Parent := fPanel;
    Width := Parent.Width;
    Height := Parent.Height;
    Font := fPanel.Font;
    Caption := fPanel.Caption;
    Left := (fPanel.Width - lblCaption.Width) div 2;
    Top := (fPanel.Height - lblCaption.Height) div 2;
    BringToFront;
    OnMouseEnter := LabelMouseEnter;
    OnMouseUp := LabelMouseUp;
    OnMouseDown := LabelMouseDown;
    bVerticallblCaptionExists := True;
    //Transparent := True;
  end;
  end;

end;

{ THover }

procedure THover.AddBorderRadius(Value: integer);
 var
  R: TRect;
  Rgn: HRGN;
 begin
  with fPanelHover do
  begin
   R := ClientRect;
   rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, Value, Value) ;
   Perform(EM_GETRECT, 0, lParam(@r)) ;
   InflateRect(r, - 4, - 4) ;
   Perform(EM_SETRECTNP, 0, lParam(@r)) ;
   SetWindowRgn(Handle, rgn, True) ;
   Invalidate;
  end;
end;


procedure THover.AddBoxShadow(Right, Bottom: integer);
var
  R: TRect;
  Rgn: HRGN;
begin
  // fOriginalShadowRight := fPanelHover.Left;
  // fOriginalShadowBottom := fPanelHover.Top;

 if fHasBoxShadow = False then
 begin
 fPanelDupe := TPanel.Create(fPanelHover.Parent);
 with fPanelDupe do
  begin
   Parent := fPanelHover.Parent;
   fPanelDupe.Color := fBoxShadowColor;
   fPanelDupe.ParentBackground := False;
   SendToBack;
   Width := fPanelHover.Width;
   Height := fPanelHover.Height;
   Top := fOriginalShadowBottom;
   Left := fOriginalShadowRight;
   Enabled := False;
   BevelInner := bvNone;
   BevelKind := bkNone;
   BevelOuter := bvNone;
   Color := fBoxShadowColor;
  end;

  with fPanelDupe do
   begin
    R := ClientRect;
    rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom,
    fPanelDupeBorderRadius, fPanelDupeBorderRadius);
    Perform(EM_GETRECT, 0, lParam(@r)) ;
    InflateRect(r, - 4, - 4) ;
    Perform(EM_SETRECTNP, 0, lParam(@r)) ;
    SetWindowRgn(Handle, rgn, True) ;
    Invalidate;
   end;
  fPanelHover.Top := fOriginalShadowBottom - fBoxShadowBottom;
  fPanelHover.Left := fOriginalShadowRight - fBoxShadowRight;


  fHasBoxShadow := True;
 end;

end;

procedure THover.AddHorizontalGradient(FromColor,
  ToColor: TColor);
var
  MyColor: TColor;
  X: integer;
  dr, dg, db: Extended;
  C1, C2: TColor;
  r1, r2, g1, g2, b1, b2: Byte;
  R, G, B: Byte;
  cnt: Integer;
  i : integer;
  TempImage : TImage;
begin
if fPanelHover.ControlCount > 0 then
begin
  for i := 0 to fPanelHover.ControlCount - 1 do
  begin
    if fPanelHover.Controls[i] is TImage then
    begin
      TempImage := fPanelHover.Controls[i] as TImage;
      if not Assigned(TempImage.Picture.Graphic) then
      begin
        fHorizontalGradientImg := TempImage;
      end;
    end;
  end;
end;

if (fPanelHover.ControlCount = 0) or Assigned(TempImage.Picture.Graphic) AND NOT Assigned(fHorizontalGradientImg) then
begin
  fHorizontalGradientImg := TImage.Create(fPanelHover);
  fHorizontalGradientImg.Parent := fPanelHover;
  fHorizontalGradientImg.Align := alClient;
  fHorizontalGradientImg.Stretch := True;
  fHorizontalGradientImg.Visible := True;
  fHorizontalGradientImg.Transparent := True;
  fHorizontalGradientImg.OnMouseEnter := fPanelHover.OnMouseEnter;
  fHorizontalGradientImg.OnMouseLeave := fPanelHover.OnMouseLeave;
  fHorizontalGradientImg.OnMouseDown := fPanelHover.OnMouseDown;
  fHorizontalGradientImg.OnMouseUp := ImageMouseUp;
  //fHorizontalGradientImg.OnClick := fPanelHover.OnClick;
end;

fHorizontalGradientImg.Visible := True;

  C1 := FromColor;
  R1 := GetRValue(C1);
  G1 := GetGValue(C1);
  B1 := GetBValue(C1);
  C2 := ToColor;
  R2 := GetRValue(C2);
  G2 := GetGValue(C2);
  B2 := GetBValue(C2);
  dr := (R2 - R1) / (fHorizontalGradientImg.Width - 1);  // Calculate color differences based on width
  dg := (G2 - G1) / (fHorizontalGradientImg.Width - 1);
  db := (B2 - B1) / (fHorizontalGradientImg.Width - 1);
  cnt := 0;
  for X := 0 to fHorizontalGradientImg.Width - 1 do  // Iterate through X (width)
  begin
    R := R1 + Ceil(dr * cnt);
    G := G1 + Ceil(dg * cnt);
    B := B1 + Ceil(db * cnt);

    MyColor := RGB(R, G, B);
    fHorizontalGradientImg.Canvas.Brush.Color := MyColor;

    fHorizontalGradientImg.Canvas.FillRect(Rect(X, 0, X + 1, fHorizontalGradientImg.Height - 1));  // Fill horizontally
    inc(cnt);
  end;

//  lblCaption := TLabel.Create(fHorizontalGradientImg);
//  with lblCaption do
//  begin
//    Parent := fPanelHover;
//    Width := Parent.Width;
//    Height := Parent.Height;
//    Font := fPanelHover.Font;
//    Caption := fPanelHover.Caption;
//    Left := (fPanelHover.Width - lblCaption.Width) div 2;
//    Top := (fPanelHover.Height - lblCaption.Height) div 2;
//    BringToFront;
//    BringToFront;
//    OnMouseEnter := LabelMouseEnter;
//    OnMouseUp := LabelMouseUp;
//    OnMouseDown := LabelMouseDown;
//    if fPanelHover.Caption <> '' then
//    begin
//      bLblCaptionExists := True;
//    end;
//  end;
  if ((bBaseGradientHoriz = False) and (bBaseGradientVertic = False) and (fPanelHover.Caption <> ''))
      or (bHasBaseVertGradImgAssigned = True) or (bHasBaseHorizGradImgAssigned = True) then
  begin

  lblCaption := TLabel.Create(fPanelHover);
  with lblCaption do
  begin
    Parent := fPanelHover;
    Width := Parent.Width;
    Height := Parent.Height;
    Font := fPanelHover.Font;
    Caption := fPanelHover.Caption;
    Left := (fPanelHover.Width - lblCaption.Width) div 2;
    Top := (fPanelHover.Height - lblCaption.Height) div 2;
    BringToFront;
    BringToFront;
    OnMouseEnter := LabelMouseEnter;
    OnMouseUp := LabelMouseUp;
    OnMouseDown := LabelMouseDown;
    bHorizontallblCaptionExists := True;
    //Transparent := True;
  end;
  end;
  bHoverGradientHoriz := True;
  bHorizGradientFirst := False;
end;

procedure THover.AddVerticalGradient(FromColor, ToColor: TColor);
var
  MyColor: TColor;
  Y: integer;
  dr, dg, db: Extended;
  C1, C2: TColor;
  r1, r2, g1, g2, b1, b2: Byte;
  R, G, B: Byte;
  cnt: Integer;
  i : integer;
  TempImage : TImage;
begin
if fPanelHover.ControlCount > 0 then
begin
  for i := 0 to fPanelHover.ControlCount - 1 do
  begin
    if fPanelHover.Controls[i] is TImage then
    begin
      TempImage := fPanelHover.Controls[i] as TImage;
      if not Assigned(TempImage.Picture.Graphic) then
      begin
        fVerticalGradientImg := TempImage;
      end;
    end;
  end;
end;

if (fPanelHover.ControlCount = 0) or Assigned(TempImage.Picture.Graphic) AND NOT Assigned(fVerticalGradientImg) then
begin
  fVerticalGradientImg := TImage.Create(fPanelHover);
  fVerticalGradientImg.Parent := fPanelHover;
  fVerticalGradientImg.Align := alClient;
  fVerticalGradientImg.Stretch := True;
  fVerticalGradientImg.Visible := True;
  fVerticalGradientImg.Transparent := True;
  fVerticalGradientImg.OnMouseEnter := fPanelHover.OnMouseEnter;
  fVerticalGradientImg.OnMouseLeave := fPanelHover.OnMouseLeave;
  fVerticalGradientImg.OnMouseDown := fPanelHover.OnMouseDown;
  fVerticalGradientImg.OnMouseUp := ImageMouseUp;
  //fHorizontalGradientImg.OnClick := fPanelHover.OnClick;

end;

  fVerticalGradientImg.Visible := True;
  C1 := FromColor;
  R1 := GetRValue(C1);
  G1 := GetGValue(C1);
  B1 := GetBValue(C1);
  C2 := ToColor;
  R2 := GetRValue(C2);
  G2 := GetGValue(C2);
  B2 := GetBValue(C2);
  dr := (R2 - R1) / (fVerticalGradientImg.Height - 1);
  dg := (G2 - G1) / (fVerticalGradientImg.Height - 1);
  db := (B2 - B1) / (fVerticalGradientImg.Height - 1);
  cnt := 0;
  for Y := 0 to fVerticalGradientImg.Height - 1 do
  begin
    R := R1 + Ceil(dr * cnt);
    G := G1 + Ceil(dg * cnt);
    B := B1 + Ceil(db * cnt);

    MyColor := RGB(R, G, B);
    fVerticalGradientImg.Canvas.Brush.Color := MyColor;

    fVerticalGradientImg.Canvas.FillRect(Rect(0, Y, fVerticalGradientImg.Width - 1, Y + 1));
    inc(cnt);
  end;

//  lblCaption := TLabel.Create(fVerticalGradientImg);
//  with lblCaption do
//  begin
//    Parent := fPanelHover;
//    Width := Parent.Width;
//    Height := Parent.Height;
//    Font := fPanelHover.Font;
//    Caption := fPanelHover.Caption;
//    Left := (fPanelHover.Width - lblCaption.Width) div 2;
//    Top := (fPanelHover.Height - lblCaption.Height) div 2;
//    BringToFront;
//    BringToFront;
//    OnMouseEnter := LabelMouseEnter;
//    OnMouseUp := LabelMouseUp;
//    OnMouseDown := LabelMouseDown;
//     if fPanelHover.Caption <> '' then
//    begin
//      bLblCaptionExists := True;
//    end;
//  end;

  if ((bBaseGradientHoriz = False) and (bBaseGradientVertic = False) and (fPanelHover.Caption <> ''))
  or (bHasBaseVertGradImgAssigned = True) or (bHasBaseHorizGradImgAssigned = True) then
  begin
  lblCaption := TLabel.Create(fPanelHover);
  with lblCaption do
  begin
    Parent := fPanelHover;
    Width := Parent.Width;
    Height := Parent.Height;
    Font := fPanelHover.Font;
    Caption := fPanelHover.Caption;
    Left := (fPanelHover.Width - lblCaption.Width) div 2;
    Top := (fPanelHover.Height - lblCaption.Height) div 2;
    BringToFront;
    BringToFront;
    OnMouseEnter := LabelMouseEnter;
    OnMouseUp := LabelMouseUp;
    OnMouseDown := LabelMouseDown;
    bVerticallblCaptionExists := True;

    //Transparent := True;
  end;
  end;
  bHoverGradientVertic := True;
  bVertGradientFirst := False;
end;

procedure THover.BoxShadow(Right, Bottom: integer; ShadowColor : TColor);
begin
 fBoxShadowRight := Right;
 fBoxShadowBottom := Bottom;
 bBoxShadow := True;
 fBoxShadowColor := ShadowColor;
end;

procedure THover.HorizontalGradient(FromColor, ToColor: TColor);
begin
  fGradientFromColor := FromColor;
  fGradientToColor := ToColor;
  bHorizontalGradient := True;
  bHorizGradientFirst := True;
end;

procedure THover.ImageMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  fPanelHover.OnMouseUp(fPanelHover, mbLeft, Shift, 0, 0);
  if Assigned(fPanelHover.OnClick) then
  fPanelHover.OnClick(nil);
  if (bVerticalGradient = True) then
  begin
    if IsMouseOverControl(fVerticalGradientImg) then
    begin
      fPanelHover.OnMouseEnter(nil);
    end;
  end;

    if (bHorizontalGradient = True) then
  begin
    if IsMouseOverControl(fHorizontalGradientImg) then
    begin
      fPanelHover.OnMouseEnter(nil);
    end;
  end;
end;

function THover.IsMouseOverControl(control: TControl): Boolean;
var
  p: TPoint;
  r: TRect;
begin
  p := control.ScreenToClient(Mouse.CursorPos);
  r := Rect(0, 0, control.Width, control.Height);
  Result := PtInRect(r, p);
end;

procedure THover.LabelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  fPanelHover.OnMouseDown(fPanelHover, mbLeft, Shift, 0, 0);
end;

procedure THover.LabelMouseEnter(Sender: TObject);
begin
    fPanelHover.OnMouseEnter(nil);
    //ShowMessage('Hi');
//    if bVerticalGradient = True then
//    begin
//      fVerticalGradientImg.Visible := True;
//      lblCaption.Visible := True;
//    end;
//
//    if bHorizontalGradient = True then
//    begin
//      fHorizontalGradientImg.Visible := True;
//      lblCaption.Visible := True;
//    end;
end;

procedure THover.LabelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  fPanelHover.OnMouseUp(fPanelHover, mbLeft, Shift, 0, 0);
  if Assigned(fPanelHover.OnClick) then
  fPanelHover.OnClick(nil);
   if IsMouseOverControl(lblCaption) then
    begin
      fPanelHover.OnMouseEnter(nil);
  end;
end;

procedure THover.ScaleBy(Value: integer);
begin
 fScaleValue := Value;
 
end;

procedure THover.VerticalGradient(FromColor, ToColor: TColor);
begin
  fGradientFromColor := FromColor;
  fGradientToColor := ToColor;
  bVerticalGradient := True;
  bVertGradientFirst := True
end;

{ TClick }

procedure TClick.AddBorderRadius(Value: integer);
var
  R: TRect;
  Rgn: HRGN;
 begin
  with fPanelClick do
  begin
   R := ClientRect;
   rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom, Value, Value) ;
   Perform(EM_GETRECT, 0, lParam(@r)) ;
   InflateRect(r, - 4, - 4) ;
   Perform(EM_SETRECTNP, 0, lParam(@r)) ;
   SetWindowRgn(Handle, rgn, True) ;
   Invalidate;
  end;

  if Value = 0 then
  begin
    fUserSetBorderRadius := True;
  end;
end;

procedure TClick.AddBoxShadow(Right, Bottom: integer);
var
 R: TRect;
 Rgn: HRGN;
begin

 //fOriginalShadowRight := fPanelClick.Left;
 //fOriginalShadowBottom := fPanelClick.Top;

 fPanelDupe := TPanel.Create(fPanelClick.Parent);
 with fPanelDupe do
  begin
   Parent := fPanelClick.Parent;
   fPanelDupe.Color := fBoxShadowColor;
   fPanelDupe.ParentBackground := False;
   SendToBack;
   Width := fPanelClick.Width;
   Height := fPanelClick.Height;
   Top := fOriginalShadowBottom;
   Left := fOriginalShadowRight;
   Enabled := False;
   BevelInner := bvNone;
   BevelKind := bkNone;
   BevelOuter := bvNone;
   Color := fBoxShadowColor;
   AddBorderRadius(fBorderRadius);

  end;
 
  with fPanelDupe do
   begin
    R := ClientRect;

    rgn := CreateRoundRectRgn(R.Left, R.Top, R.Right, R.Bottom,
    fBorderRadius, fBorderRadius);
    //ShowMessage(IntToStr(fBorderRadius));

    Perform(EM_GETRECT, 0, lParam(@r)) ;
    InflateRect(r, - 4, - 4) ;
    Perform(EM_SETRECTNP, 0, lParam(@r)) ;
    SetWindowRgn(Handle, rgn, True) ;
    Invalidate;
   end;
end;

procedure TClick.AddHorizontalGradient(FromColor, ToColor: TColor);
var
  MyColor: TColor;
  X: integer;
  dr, dg, db: Extended;
  C1, C2: TColor;
  r1, r2, g1, g2, b1, b2: Byte;
  R, G, B: Byte;
  cnt: Integer;
  TempImage : TImage;
  i : integer;
begin
if fPanelClick.ControlCount > 0 then
begin
  for i := 0 to fPanelClick.ControlCount - 1 do
  begin

    if fPanelClick.Controls[i] is TImage then
    begin
      TempImage := fPanelClick.Controls[i] as TImage;
      if not Assigned(TempImage.Picture.Graphic) then
      begin
        fHorizontalGradientImg := TempImage;
      end;
    end;
  end;
end;

if ((fPanelClick.ControlCount = 0) or Assigned(TempImage.Picture.Graphic)) AND (TempImage <> fHorizontalGradientImg) then
begin

  fHorizontalGradientImg := TImage.Create(fPanelClick);
  fHorizontalGradientImg.Parent := fPanelClick;
  fHorizontalGradientImg.Align := alClient;
  fHorizontalGradientImg.Stretch := True;
  fHorizontalGradientImg.Visible := True;
  fHorizontalGradientImg.Transparent := True;
  fHorizontalGradientImg.OnMouseEnter := fPanelClick.OnMouseEnter;
  fHorizontalGradientImg.OnMouseLeave := fPanelClick.OnMouseLeave;
  fHorizontalGradientImg.OnMouseDown := fPanelClick.OnMouseDown;
  fHorizontalGradientImg.OnMouseUp := fPanelClick.OnMouseUp;
  //fHorizontalGradientImg.OnClick := fPanelHover.OnClick;
end;

fHorizontalGradientImg.Visible := True;


  C1 := FromColor;
  R1 := GetRValue(C1);
  G1 := GetGValue(C1);
  B1 := GetBValue(C1);
  C2 := ToColor;
  R2 := GetRValue(C2);
  G2 := GetGValue(C2);
  B2 := GetBValue(C2);
  dr := (R2 - R1) / (fHorizontalGradientImg.Width - 1);  // Calculate color differences based on width
  dg := (G2 - G1) / (fHorizontalGradientImg.Width - 1);
  db := (B2 - B1) / (fHorizontalGradientImg.Width - 1);
  cnt := 0;
  for X := 0 to fHorizontalGradientImg.Width - 1 do  // Iterate through X (width)
  begin
    R := R1 + Ceil(dr * cnt);
    G := G1 + Ceil(dg * cnt);
    B := B1 + Ceil(db * cnt);

    MyColor := RGB(R, G, B);
    fHorizontalGradientImg.Canvas.Brush.Color := MyColor;

    fHorizontalGradientImg.Canvas.FillRect(Rect(X, 0, X + 1, fHorizontalGradientImg.Height - 1));  // Fill horizontally
    inc(cnt);
  end;

//  lblCaption := TLabel.Create(fVerticalGradientImg);
//  with lblCaption do
//  begin
//    Parent := fPanelHover;
//    Width := Parent.Width;
//    Height := Parent.Height;
//    Font := fPanelHover.Font;
//    Caption := fPanelHover.Caption;
//    Left := (fPanelHover.Width - lblCaption.Width) div 2;
//    Top := (fPanelHover.Height - lblCaption.Height) div 2;
//    BringToFront;
//    BringToFront;
//    OnMouseEnter := LabelMouseEnter;
//    OnMouseUp := LabelMouseUp;
//    OnMouseDown := LabelMouseDown;
  //    bLblCaptionExists := True;
//  end;

  if (bBaseGradientHoriz = False) and (bBaseGradientVertic = False)
  and (bHoverGradientHoriz = False) and (bHoverGradientVertic = False) then
  begin
  lblCaption := TLabel.Create(fPanelClick);
  with lblCaption do
  begin
    Parent := fPanelClick;
    Width := Parent.Width;
    Height := Parent.Height;
    Align := alClient;
    Alignment := taCenter;
    Layout := tlCenter;
    Font := fPanelClick.Font;
    Caption := fPanelClick.Caption;
    //Left := (fPanelClick.Width - lblCaption.Width) div 2;
    //Top := (fPanelClick.Height - lblCaption.Height) div 2;
    BringToFront;
    BringToFront;
    OnMouseEnter := LabelMouseEnter;
    OnMouseUp := LabelMouseUp;
    OnMouseDown := LabelMouseDown;
    bHorizontallblCaptionExists := True;
    //Transparent := True;
  end;
  end;
end;

procedure TClick.AddVerticalGradient(FromColor, ToColor: TColor);
var
  MyColor: TColor;
  Y: integer;
  dr, dg, db: Extended;
  C1, C2: TColor;
  r1, r2, g1, g2, b1, b2: Byte;
  R, G, B: Byte;
  cnt: Integer;
  TempImage : TImage;
  i: Integer;
begin
if fPanelClick.ControlCount > 0 then
begin
  for i := 0 to fPanelClick.ControlCount - 1 do
  begin

    if fPanelClick.Controls[i] is TImage then
    begin
      TempImage := fPanelClick.Controls[i] as TImage;
      if not Assigned(TempImage.Picture.Graphic) then
      begin
        fVerticalGradientImg := TempImage;
      end;
    end;
  end;
end;

if ((fPanelClick.ControlCount = 0) or Assigned(TempImage.Picture.Graphic)) AND (TempImage <> fVerticalGradientImg) then
begin

  fVerticalGradientImg := TImage.Create(fPanelClick);
  fVerticalGradientImg.Parent := fPanelClick;
  fVerticalGradientImg.Align := alClient;
  fVerticalGradientImg.Stretch := True;
  fVerticalGradientImg.Visible := True;
  fVerticalGradientImg.Transparent := True;
  fVerticalGradientImg.OnMouseEnter := fPanelClick.OnMouseEnter;
  fVerticalGradientImg.OnMouseLeave := fPanelClick.OnMouseLeave;
  fVerticalGradientImg.OnMouseDown := fPanelClick.OnMouseDown;
  fVerticalGradientImg.OnMouseUp := fPanelClick.OnMouseUp;
end;

fVerticalGradientImg.Visible := True;

  C1 := FromColor;
  R1 := GetRValue(C1);
  G1 := GetGValue(C1);
  B1 := GetBValue(C1);
  C2 := ToColor;
  R2 := GetRValue(C2);
  G2 := GetGValue(C2);
  B2 := GetBValue(C2);
  dr := (R2 - R1) / (fVerticalGradientImg.Height - 1);
  dg := (G2 - G1) / (fVerticalGradientImg.Height - 1);
  db := (B2 - B1) / (fVerticalGradientImg.Height - 1);
  cnt := 0;
  for Y := 0 to fVerticalGradientImg.Height - 1 do
  begin
    R := R1 + Ceil(dr * cnt);
    G := G1 + Ceil(dg * cnt);
    B := B1 + Ceil(db * cnt);

    MyColor := RGB(R, G, B);
    fVerticalGradientImg.Canvas.Brush.Color := MyColor;

    fVerticalGradientImg.Canvas.FillRect(Rect(0, Y, fVerticalGradientImg.Width - 1, Y + 1));
    inc(cnt);
  end;

//  lblCaption := TLabel.Create(fVerticalGradientImg);
//  with lblCaption do
//  begin
//    Parent := fPanelHover;
//    Width := Parent.Width;
//    Height := Parent.Height;
//    Font := fPanelHover.Font;
//    Caption := fPanelHover.Caption;
//    Left := (fPanelHover.Width - lblCaption.Width) div 2;
//    Top := (fPanelHover.Height - lblCaption.Height) div 2;
//    BringToFront;
//    BringToFront;
//    OnMouseEnter := LabelMouseEnter;
//    OnMouseUp := LabelMouseUp;
//    OnMouseDown := LabelMouseDown;
     // bLblCaptionExists := True;
//  end;


  if (bBaseGradientHoriz = False) and (bBaseGradientVertic = False)
  and (bHoverGradientHoriz = False) and (bHoverGradientVertic = False) then
  begin
  lblCaption := TLabel.Create(fPanelClick);
  with lblCaption do
  begin
    Parent := fPanelClick;
    Width := Parent.Width;
    Height := Parent.Height;
    Align := alClient;
    Alignment := taCenter;
    Layout := tlCenter;
    Font := fPanelClick.Font;
    Caption := fPanelClick.Caption;
    //Left := (fPanelClick.Width - lblCaption.Width) div 2;
    //Top := (fPanelClick.Height - lblCaption.Height) div 2;
    BringToFront;
    BringToFront;
    OnMouseEnter := LabelMouseEnter;
    OnMouseUp := LabelMouseUp;
    OnMouseDown := LabelMouseDown;
    OnMouseLeave := LabelMouseLeave;
    bVerticallblCaptionExists := True;
    //Transparent := True;
    //ShowMessage('Click label');
  end;
  end;

end;

procedure TClick.BoxShadow(Right, Bottom: integer; ShadowColor: TColor);
begin
 fBoxShadowRight := Right;
 fBoxShadowBottom := Bottom;
 bBoxShadow := True;
 fBoxShadowColor := ShadowColor;
end;

procedure TClick.HorizontalGradient(FromColor, ToColor: TColor);
begin
  fGradientFromColor := FromColor;
  fGradientToColor := ToColor;
  bHorizontalGradient := True;
  bHorizGradientFirst := True;
end;

procedure TClick.LabelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  fPanelClick.OnMouseDown(fPanelClick, mbLeft, Shift, 0, 0);
end;

procedure TClick.LabelMouseEnter(Sender: TObject);
begin
  fPanelClick.OnMouseEnter(nil);
end;

procedure TClick.LabelMouseLeave(Sender: TObject);
begin
  fPanelClick.OnMouseLeave(nil);
end;

procedure TClick.LabelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  fPanelClick.OnMouseUp(fPanelClick, mbLeft, Shift, 0, 0);
  if Assigned(fPanelClick.OnClick) then
  fPanelClick.OnClick(nil);
end;

procedure TClick.ScaleBy(Value: integer);
begin
 fScaleValue := Value;
end;

procedure TClick.VerticalGradient(FromColor, ToColor: TColor);
begin
  fGradientFromColor := FromColor;
  fGradientToColor := ToColor;
  bVerticalGradient := True;
  bVertGradientFirst := True;
end;

end.
