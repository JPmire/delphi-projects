unit Math_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, pngimage, Buttons;

type
  TForm1 = class(TForm)
    tmr1: TTimer;
    tmr2: TTimer;
    tmr3: TTimer;
    lblTimer: TLabel;
    lbledtAnswer: TLabeledEdit;
    btnEnter: TButton;
    imgIncorrect: TImage;
    imgCorrect: TImage;
    BitBtn1: TBitBtn;
    procedure tmr1Timer(Sender: TObject);
    procedure tmr2Timer(Sender: TObject);
    procedure tmr3Timer(Sender: TObject);
    procedure btnEnterClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  iCorrectAnswer, iUsrAnswer : integer;
  sCorrectAnswer : string;
implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  lblTimer.Caption := '3';
  tmr1.Enabled := True;
  tmr2.Enabled := False;
  tmr3.Enabled := False;
  lbledtAnswer.Enabled := True;
  btnEnter.Enabled := True;
  lbledtAnswer.SetFocus;
end;

procedure TForm1.btnEnterClick(Sender: TObject);
begin
  iCorrectAnswer := (8 * 10) - 15;
  iUsrAnswer := StrToInt(lbledtAnswer.Text);

  if iUsrAnswer = iCorrectAnswer then
  begin
    imgCorrect.Visible := True;
    imgIncorrect.Visible := False;
    tmr1.Enabled := False;
    tmr2.Enabled := False;
    tmr3.Enabled := False;
  end else
  begin
    imgIncorrect.Visible := True;
    imgCorrect.Visible := False;
  end;

end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  sCorrectAnswer := '8 × 10 - 15';
  lbledtAnswer.EditLabel.Caption := sCorrectAnswer;
end;

procedure TForm1.tmr1Timer(Sender: TObject);
begin
  lblTimer.Caption := '2';
  tmr2.Enabled := True;
  tmr1.Enabled := False;
end;

procedure TForm1.tmr2Timer(Sender: TObject);
begin
  lblTimer.Caption := '1';
  tmr3.Enabled := True;
  tmr2.Enabled := False;

end;

procedure TForm1.tmr3Timer(Sender: TObject);
begin
  tmr3.Enabled := False;
  lblTimer.Caption := '0';
  ShowMessage('The time is up');
  lbledtAnswer.Enabled := False;
  btnEnter.Enabled := False;

end;

end.
