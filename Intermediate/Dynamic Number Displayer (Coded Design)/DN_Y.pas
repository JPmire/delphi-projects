unit DN_Y;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btnCreate: TButton;
    lblNumber: TLabel;
    procedure btnCreateClick(Sender: TObject);
  private
    { Private declarations }
    arrButtons : array[1..10] of TButton;
  public
    { Public declarations }
    procedure ButtonClick(Sender : TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCreateClick(Sender: TObject);
var
  i: Integer;
  iCount : integer;
  btnTemp : TButton;
  iTop : integer;
begin
  iCount := 1;
  iTop := 10;
  for i := 1 to 10 do
  begin

    btnTemp := TButton.Create(Form1);
    with btnTemp do
    begin
      Caption := IntToStr(iCount);
      Parent := Form1;
      Width := 100;
      Height := 40;
      Top := iTop;
      Left := Form1.Width div 2;
      iTop := iTop + Height + 10;
      OnClick := ButtonClick;
    end;
      Sleep(20);
      Application.ProcessMessages;
    arrButtons[i] := btnTemp;
    inc(iCount);
  end;
end;

procedure TForm1.ButtonClick(Sender: TObject);
begin
  lblNumber.Caption := (Sender as TButton).Caption;
end;

end.
