unit Write_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    edtName: TEdit;
    Name: TLabel;
    btnLogOn: TButton;
    procedure btnLogOnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnLogOnClick(Sender: TObject);
var
sName, sTime, sDate, sLog : string;
tFile : textfile;
begin
  sName := edtName.Text;
  sDate := DateToStr(Date());
  sTime := TimeToStr(Time());
  sLog := sName + ' ' + sDate + ' ' + sTime;
  AssignFile(tFile, 'log.txt');
  Append(tFile);
  Writeln(tFile, sLog);
  CloseFile(tFile);
end;

end.
