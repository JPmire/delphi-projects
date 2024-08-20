unit Bullets_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Bullets;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    Bullet : TBullets;
    arrBullets : array of Bullets;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormActivate(Sender: TObject);
begin
  SetLength(arrBullets, 1);
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Bullet := TBullets.Create();
  arrBullets[Length(arrBullets) - 1] := Bullet;
  SetLength(arrBullets, Length(arrBullets) + 1);

end;

end.
