unit dil_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, clsDynamicImageLoader, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ScrollBox1: TScrollBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  imageLoader : TDynamicImageLoader;
begin
  imageLoader := TDynamicImageLoader.Create(ScrollBox1);

  imageLoader.Orientation := ioHorizontal;
  imageLoader.LoadSavedImages;
end;

end.
