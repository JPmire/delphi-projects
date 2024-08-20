unit Bullets;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TBullets = class
    private
      fBullet : TShape;
    public
      constructor Create(Parent : TObject); overload;
      constructor Create(); overload;
      procedure Move(step: integer);
  end;

implementation

{ TBullets }

constructor TBullets.Create(Parent: TObject);
begin
//
end;

constructor TBullets.Create();
var
  CursorPos : TPoint;
begin
  //CursorPos := ScreenToClient(Mouse.CursorPos);
  GetCursorPos(CursorPos);
  CursorPos := Application.MainForm.ScreenToClient(CursorPos);
  //CursorPos := ScreenToClient(CursorPos);
  fBullet := TShape.Create(Application.MainForm);
  with fBullet do
  begin
    Parent := Application.MainForm;
    Shape := stCircle;
    Width := 10;
    Height := 10;
    Brush.Color := clBlack;
    Top := CursorPos.Y;
    Left := CursorPos.X;
  end;


end;

procedure TBullets.Move(step: integer);
begin
  fBullet.Left := fBullet.Left + step;
  Application.ProcessMessages;
end;

end.
