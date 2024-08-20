unit ReadFile_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Spin;

type
  TForm1 = class(TForm)
    redJunior: TRichEdit;
    redSenior: TRichEdit;
    edtName: TEdit;
    btnAdd: TButton;
    sedAge: TSpinEdit;
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
    sName, sLine : string;
    iAge : integer;
    tMyFile : TextFile;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnAddClick(Sender: TObject);
var
  iPos : integer;
  sNameFile : string;
  iAgeFile : integer;
begin
  sName := edtName.Text;
  iAge := sedAge.Value;
  AssignFile(tMyFile, 'People.txt');
  append(tMyFile);
  Writeln(tMyFile, sName + ' ' + IntToStr(iAge));

redJunior.Clear;
redSenior.Clear;
redJunior.Lines.Add('Junior' + #13);
redSenior.Lines.Add('Senior' + #13);

try
  reset(tMyFile);
except
  showmessage('file does not exist');
  exit;
end;

while not eof(tMyFile) do
begin
  readln(tMyFile, sLine);
  iPos := Pos(' ', sLine);
  sNameFile := copy(sLine, 1, iPos - 1);
  delete(sLine, 1, iPos);
  iAgeFile := strtoint(sLine);

if iAgeFile >= 18 then
begin
  redSenior.Lines.Add(sNameFile + '(' + inttostr(iAgeFile) + ')');
end else
begin
  redJunior.Lines.Add(sNameFile + '(' + inttostr(iAgeFile) + ')');
end;

end;
CloseFile(tMyFile);
end;

end.
