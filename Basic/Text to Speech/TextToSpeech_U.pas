unit TextToSpeech_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComObj, StdCtrls;

type
  TForm1 = class(TForm)
    btnTextToSpeech: TButton;
    edtUserText: TEdit;
    Label1: TLabel;
    procedure btnTextToSpeechClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnTextToSpeechClick(Sender: TObject);
var
Voice : OleVariant;
begin
try
 Voice := CreateOleObject('SAPI.SpVoice');
 Voice.speak(edtUserText.Text);
except
  Showmessage('You have to type something');
  edtUserText.Text := ('Like this');
end;

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
   edtUserText.Clear;
end;

end.
