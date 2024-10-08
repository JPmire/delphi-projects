unit Dynamite_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, pngimage;

type
  TfrmKaboom = class(TForm)
    btnCountdown: TButton;
    lblCountdown: TLabel;
    imgOnFire: TImage;
    shpWick: TShape;
    shpDynamite: TShape;
    lblDynamite: TLabel;
    imgKaboom: TImage;
    procedure FormActivate(Sender: TObject);
    procedure btnCountdownClick(Sender: TObject);
    procedure imgOnFireClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
      var
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKaboom: TfrmKaboom;

implementation

{$R *.dfm}


procedure TfrmKaboom.btnCountdownClick(Sender: TObject);
begin
  imgOnFire.Visible := true;
  lblCountdown.Caption := '9';
  btnCountdown.Caption := 'Click on the flame';
  frmKaboom.Caption := 'Watch Out!';
end;

procedure TfrmKaboom.FormActivate(Sender: TObject);
begin
  imgOnFire.Visible := false;
  imgKaboom.Visible := false;

end;

procedure TfrmKaboom.imgOnFireClick(Sender: TObject);
begin
  imgOnFire.Visible := False;
  imgKaboom.Visible := True;
end;

procedure TfrmKaboom.Timer1Timer(Sender: TObject);
begin
  lblCountdown.Caption := '8';
end;

end.
