unit clsDynamicImageLoader;

interface

uses
  SysUtils, Classes, Controls, ExtCtrls, Dialogs, Graphics, Forms, Windows, JPEG, PNGImage, ShellAPI;

type
  TImageOrientation = (ioVertical, ioHorizontal);

  TDynamicImageLoader = class
  private
    FContainer: TWinControl;
    FOrientation: TImageOrientation;
    FSavePath: string;
    FImageList: TStringList;
    procedure ArrangeImages;
  public
    constructor Create(AContainer: TWinControl);
    destructor Destroy; override;
    procedure UploadImages;
    procedure LoadSavedImages;
    property Orientation: TImageOrientation read FOrientation write FOrientation;
    property SavePath: string read FSavePath write FSavePath;
  end;

implementation

{ TDynamicImageLoader }

constructor TDynamicImageLoader.Create(AContainer: TWinControl);
begin
  inherited Create;
  FContainer := AContainer;
  FOrientation := ioVertical;
  FSavePath := ExtractFilePath(Application.ExeName) + 'Images\';
  FImageList := TStringList.Create;
  ForceDirectories(FSavePath);
end;

destructor TDynamicImageLoader.Destroy;
begin
  FImageList.Free;
  inherited;
end;

procedure TDynamicImageLoader.UploadImages;
var
  OpenDialog: TOpenDialog;
  I: Integer;
  Image: TImage;
  FileName: string;
begin
  OpenDialog := TOpenDialog.Create(nil);
  try
    OpenDialog.Options := [ofAllowMultiSelect, ofFileMustExist];
    OpenDialog.InitialDir := 'C:\';
    OpenDialog.Filter := 'Image files (*.jpg;*.jpeg;*.bmp;*.png)|*.jpg;*.jpeg;*.bmp;*.png';

    if OpenDialog.Execute then
    begin
      for I := 0 to OpenDialog.Files.Count - 1 do
      begin
        FileName := ExtractFileName(OpenDialog.Files[I]);
        Image := TImage.Create(FContainer);
        Image.Parent := FContainer;
        Image.Picture.LoadFromFile(OpenDialog.Files[I]);
        Image.AutoSize := True;
        Image.Proportional := True;
        Image.Stretch := True;

        // Save image to the specified folder
        CopyFile(PChar(OpenDialog.Files[I]), PChar(FSavePath + FileName), False);

        // Add filename to the list
        FImageList.Add(FileName);
      end;

      ArrangeImages;
    end;
  finally
    OpenDialog.Free;
  end;
end;

procedure TDynamicImageLoader.LoadSavedImages;
var
  I: Integer;
  Image: TImage;
  SearchRec: TSearchRec;
begin
  // Clear existing images
  for I := FContainer.ControlCount - 1 downto 0 do
    if FContainer.Controls[I] is TImage then
      FContainer.Controls[I].Free;

  FImageList.Clear;

  // Load saved images
  if FindFirst(FSavePath + '*.*', faAnyFile, SearchRec) = 0 then
  begin
    repeat
      if (SearchRec.Attr and faDirectory) = 0 then
      begin
        Image := TImage.Create(FContainer);
        Image.Parent := FContainer;
        Image.Picture.LoadFromFile(FSavePath + SearchRec.Name);
        Image.Width := FContainer.Width;
        Image.Height := FContainer.Height;
        //Image.AutoSize := True;
        Image.Proportional := True;
        Image.Stretch := True;

        FImageList.Add(SearchRec.Name);
      end;
    until FindNext(SearchRec) <> 0;
    //FindClose(SearchRec);
  end;

  ArrangeImages;
end;

procedure TDynamicImageLoader.ArrangeImages;
var
  I: Integer;
  CurrentLeft, CurrentTop: Integer;
  MaxWidth, MaxHeight: Integer;
begin
  CurrentLeft := 0;
  CurrentTop := 0;
  MaxWidth := 0;
  MaxHeight := 0;

  for I := 0 to FContainer.ControlCount - 1 do
  begin
    if FContainer.Controls[I] is TImage then
    begin
      with TImage(FContainer.Controls[I]) do
      begin
        if FOrientation = ioVertical then
        begin
          Left := 0;
          Top := CurrentTop;
          CurrentTop := CurrentTop + Height + 5;
          if Width > MaxWidth then MaxWidth := Width;
        end
        else // ioHorizontal
        begin
          Left := CurrentLeft;
          Top := 0;
          CurrentLeft := CurrentLeft + Width + 5;
          if Height > MaxHeight then MaxHeight := Height;
        end;
      end;
    end;
  end;

  if FOrientation = ioVertical then
    FContainer.Width := MaxWidth
  else
    FContainer.Height := MaxHeight;
end;

end.
