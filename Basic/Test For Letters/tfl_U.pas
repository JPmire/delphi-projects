unit tfl_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    edtText: TEdit;
    btnCheckLetters: TButton;
    procedure btnCheckLettersClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCheckLettersClick(Sender: TObject);
var
  i: Integer;
  sText : string;
  bFound : boolean;
begin
  sText := edtText.Text;
  bFound := False;
  for i := 1 to Length(sText) do
  begin
    if NOT (sText[i] IN ['A'..'Z','a'..'z']) then
    begin
      bFound := True;
    end;
  end;

  if bFound = False then
  begin
    ShowMessage('You only entered letters');
  end else
  begin
    ShowMessage('Only letters are allowed');
  end;

end;

end.
