unit lad_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ImgList, ExtDlgs, jpeg, pngimage;

type
  TForm1 = class(TForm)
    btnLoadNext: TButton;
    Image1: TImage;
    Label1: TLabel;
    procedure btnLoadNextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    ImageFiles : TStringList;
    procedure GetImageFilesFromDirectory(const Directory: string);
    procedure LoadImageFromList(Index: Integer; ImageComponent: TImage);

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

var
  CurrentImageIndex: Integer = -1;

{$R *.dfm}

procedure TForm1.btnLoadNextClick(Sender: TObject);
begin
  if ImageFiles.Count = 0 then
  begin
    GetImageFilesFromDirectory('Images'); // Replace with your directory path
  end;

  Inc(CurrentImageIndex);
  if CurrentImageIndex >= ImageFiles.Count then
    CurrentImageIndex := 0;

  LoadImageFromList(CurrentImageIndex, Image1); // Assuming your TImage component is named Image1
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ImageFiles := TStringList.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  ImageFiles.Free;
end;

procedure TForm1.GetImageFilesFromDirectory(const Directory: string);
var
  SearchRec: TSearchRec;
  FileExt: string;
begin
  ImageFiles.Clear;
  if FindFirst(Directory + '\*.*', faAnyFile, SearchRec) = 0 then
  begin
    try
      repeat
        FileExt := LowerCase(ExtractFileExt(SearchRec.Name));
        if (FileExt = '.jpg') or (FileExt = '.jpeg') or (FileExt = '.png') or (FileExt = '.bmp') then
        begin
          ImageFiles.Add(Directory + '\' + SearchRec.Name);
        end;
      until FindNext(SearchRec) <> 0;
    finally
      FindClose(SearchRec);
    end;
  end;
end;

procedure TForm1.LoadImageFromList(Index: Integer; ImageComponent: TImage);
begin
  if (Index >= 0) and (Index < ImageFiles.Count) then
  begin
    ImageComponent.Picture.LoadFromFile(ImageFiles[Index]);
  end
  else
  begin
    ShowMessage('No more images to display');
  end;
end;

end.
