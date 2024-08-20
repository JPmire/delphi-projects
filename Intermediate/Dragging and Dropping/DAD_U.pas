unit DAD_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    Shape3: TShape;
    Shape4: TShape;
    Shape2: TShape;
    Shape1: TShape;
    procedure Shape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Shape1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Shape4DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Shape4DragDrop(Sender, Source: TObject; X, Y: Integer);
  private
    { Private declarations }
    FDragging: Boolean;
    FStartX, FStartY: Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Shape1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    FDragging := True;
    FStartX := X;
    FStartY := Y;
  end;
end;

procedure TForm1.Shape1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if FDragging then
  begin
    Shape1.Left := Shape1.Left + (X - FStartX);
    Shape1.Top := Shape1.Top + (Y - FStartY);
    FStartX := X;
    FStartY := Y;
  end;
end;

procedure TForm1.Shape1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDragging := False;
end;

procedure TForm1.Shape4DragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  (Sender as TShape).Shape := (Source as TShape).Shape;
  (Sender as TShape).Brush.Color := (Source as TShape).Brush.Color;
end;

procedure TForm1.Shape4DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Sender is TShape;
end;

end.
