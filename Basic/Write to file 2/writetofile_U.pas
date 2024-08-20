unit writetofile_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    btnEnter: TButton;
    edtName: TEdit;
    procedure btnEnterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnEnterClick(Sender: TObject);
var
sName, sGreet : string;
tFile : TextFile;
begin
  sName := edtName.Text;
  sGreet := 'Hello ' + sName + '.';

  AssignFile(tFile, 'Greet.txt');
  Append(tFile);
  writeln(tFile, sGreet);
  CloseFile(tFile);

end;

end.
