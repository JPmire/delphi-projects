unit AutoTrafficLight_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, OleCtrls, WMPLib_TLB;

type
  TForm1 = class(TForm)
    shpRed: TShape;
    shpYellow: TShape;
    shpGreen: TShape;
    tmrGreen: TTimer;
    tmrYellow: TTimer;
    tmrRed: TTimer;
    Label1: TLabel;
    lblGreen: TLabel;
    lblYellow: TLabel;
    lblRed: TLabel;
    WindowsMediaPlayer1: TWindowsMediaPlayer;
    WindowsMediaPlayer2: TWindowsMediaPlayer;
    WindowsMediaPlayer3: TWindowsMediaPlayer;
    procedure tmrGreenTimer(Sender: TObject);
    procedure tmrYellowTimer(Sender: TObject);
    procedure tmrRedTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Application.Terminate;
end;

procedure TForm1.tmrGreenTimer(Sender: TObject);
begin
  tmrRed.Enabled := false;
  shpRed.Brush.Color := clWhite;
  shpGreen.Brush.Color := clGreen;
  lblGreen.Visible := true;
  lblRed.Visible := false;
  if shpGreen.Brush.Color = clGreen then
  begin
    tmrYellow.Enabled := true;
  end else
  begin
    tmrYellow.Enabled := false;
  end;
  if shpGreen.Brush.Color = clGreen then
  begin
    WindowsMediaPlayer3.controls.play;
  end else
  begin
    WindowsMediaPlayer1.controls.stop;
  end;
end;

procedure TForm1.tmrRedTimer(Sender: TObject);
begin
  tmrYellow.Enabled := false;
  shpYellow.Brush.Color := clWhite;
  shpRed.Brush.Color := clRed;
  lblRed.Visible := true;
  lblYellow.Visible := false;
  if shpRed.Brush.Color = clRed then
  begin
    tmrGreen.Enabled := true;
  end else
  begin
    tmrGreen.Enabled := false;
  end;
  if shpRed.Brush.Color = clRed then
  begin
    WindowsMediaPlayer1.controls.play;
  end else
  begin
    WindowsMediaPlayer1.controls.stop;
  end;
end;

procedure TForm1.tmrYellowTimer(Sender: TObject);
begin
  tmrGreen.Enabled := false;
  shpGreen.Brush.Color := clWhite;
  shpYellow.Brush.Color := clYellow;
  lblYellow.Visible := true;
  lblGreen.Visible := false;
  if shpYellow.Brush.Color = clYellow then
  begin
    tmrRed.Enabled := true;
  end else
  begin
    tmrRed.Enabled := false;
  end;
  if shpYellow.Brush.Color = clYellow then
  begin
    WindowsMediaPlayer2.controls.play;
  end else
  begin
    WindowsMediaPlayer2.controls.stop;
  end;
end;

end.
