﻿unit Draw_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmDraw = class(TForm)
    Image1: TImage;
    edtHor: TEdit;
    edtVer: TEdit;
    btnClear: TButton;
    btnSaveDrawing: TButton;
    sdDrawing: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnClearClick(Sender: TObject);
    procedure btnSaveDrawingClick(Sender: TObject);
  private
    { Private declarations }
    tulis : Boolean;
  public
    { Public declarations }
  end;

var
  frmDraw: TfrmDraw;
  bitmap : TBitmap;
implementation

{$R *.dfm}

procedure TfrmDraw.btnClearClick(Sender: TObject);
begin
  Image1.Canvas.Pen.Color := clWhite;
  Image1.Canvas.Brush.Color := clWhite;
  Image1.Canvas.Rectangle(0,0,image1.width-1,image1.Height-1);
  Image1.Canvas.Pen.Color := clBlue;
  Image1.Canvas.Brush.Color := clWhite;
  image1.Canvas.Pen.Width := 2;
end;

procedure TfrmDraw.btnSaveDrawingClick(Sender: TObject);
begin
  // Give the dialog a title
  sdDrawing.Title := 'Save your text or word file';

  // Set up the starting directory to be the current one
  sdDrawing.InitialDir := GetCurrentDir;

  // Allow only .txt and .doc file types to be saved
  sdDrawing.Filter := 'Picture|*.jpg';

  // Set the default extension
  sdDrawing.DefaultExt := 'jpg';

  // Select text files as the starting filter type
  sdDrawing.FilterIndex := 1;

  // Display the open file dialog
  if sdDrawing.Execute
  then ShowMessage(sdDrawing.FileName)
  else ShowMessage('Save file was cancelled');

  // Free up the dialog
  sdDrawing.Free;
end;

procedure TfrmDraw.FormCreate(Sender: TObject);
begin
  bitmap := TBitmap.Create;

  with bitmap do
  begin
    width := Image1.Width;
    Height := Image1.Height;
    PixelFormat := pf24bit;
  end;
  Image1.Canvas.Pen.Width := 2;
  Image1.Canvas.Pen.Color := clBlue;

end;

procedure TfrmDraw.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  tulis := true;
  Image1.Canvas.MoveTo(x,y);
end;

procedure TfrmDraw.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if tulis = true then
  begin
    Image1.Canvas.LineTo(x,y);
    edtHor.Text := IntToStr(x);
    edtVer.Text := IntToStr(y);
  end;
end;

procedure TfrmDraw.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  tulis := False;
end;

end.
