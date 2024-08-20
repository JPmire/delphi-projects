unit GuessingGameU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    btnSubmit: TButton;
    edtInput: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure btnSubmitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnSubmitClick(Sender: TObject);
var
iCorrectNumber : integer;
begin
iCorrectNumber := 10;

if StrToInt(edtInput.Text) = iCorrectNumber then
begin
    ShowMessage('You won');
end
else if StrToInt(edtInput.text) < iCorrectNumber then
begin
  ShowMessage('Higher');
end
else if StrToInt(edtInput.Text) > iCorrectNumber then
begin
  ShowMessage('Lower');
end
else
begin
  ShowMessage('Invalid');
end;
edtInput.SetFocus;
end;

end.
