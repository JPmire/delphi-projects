unit clb_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ColoredListBox;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    ItemColors: array of TColor;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
begin
for i := 1 to 10 do
    ListBox1.Items.Add('Item ' + IntToStr(i));
  ListBox1.SetItemColor(0, clRed);
  ListBox1.SetItemColor(1, clBlue);
  ListBox1.SetItemColor(2, clGreen);
  ListBox1.SetItemColor(3, clYellow);
  ListBox1.SetItemColor(4, clPurple);
end;

procedure TForm1.FormActivate(Sender: TObject);
var
  i: Integer;
begin

end;

end.
