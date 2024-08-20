unit HowToPlay_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, jpeg;

type
  TfrmHowToPlay = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Shape1: TShape;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Shape2: TShape;
    Label12: TLabel;
    Label13: TLabel;
    bmbQuit: TBitBtn;
    Label14: TLabel;
    Label15: TLabel;
    imgBackground: TImage;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bmbQuitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHowToPlay: TfrmHowToPlay;

implementation

{$R *.dfm}

procedure TfrmHowToPlay.bmbQuitClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmHowToPlay.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Application.MainForm.Show;
end;

end.
