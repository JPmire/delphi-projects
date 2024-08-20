unit ls_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl;

type
  TForm1 = class(TForm)
    btnLoad: TButton;
    btnSave: TButton;
    procedure btnLoadClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    FSourcePath: string;
    procedure LoadDirectory(const SourcePath: string);
    procedure SaveDirectory(const DestPath: string);
    function GetRelativePath(const BasePath, FullPath: string): string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  FileNames: TStringList;
  FileStreams: TList;

implementation

{$R *.dfm}

uses
  ShellAPI;

procedure TForm1.btnLoadClick(Sender: TObject);
var
  Dir: string;
begin
  if SelectDirectory('Select Folder', 'D:\Skool\IT\Graad 12\IT PAT (2024) - Eiendom', Dir) then
  begin
    FSourcePath := IncludeTrailingBackslash(Dir);
    FileNames := TStringList.Create;
    FileStreams := TList.Create;
    try
      LoadDirectory(FSourcePath);
    except
      FileNames.Free;
      FileStreams.Free;
      raise;
    end;
  end;
end;

procedure TForm1.btnSaveClick(Sender: TObject);
var
  DestFolder: string;
  i : integer;
begin
  try
    if SelectDirectory('Select Destination Folder', '', DestFolder) then
    begin
      DestFolder := IncludeTrailingBackslash(DestFolder);
      SaveDirectory(DestFolder);
    end;
  finally
    FileNames.Free; // Free the list of filenames
    for i := 0 to FileStreams.Count - 1 do
      TStream(FileStreams[i]).Free; // Free each stream
    FileStreams.Free; // Free the list of streams
  end;
end;

function TForm1.GetRelativePath(const BasePath, FullPath: string): string;
var
  BaseLen: Integer;
begin
  BaseLen := Length(BasePath);
  if (Length(FullPath) > BaseLen) and (AnsiCompareText(Copy(FullPath, 1, BaseLen), BasePath) = 0) then
    Result := Copy(FullPath, BaseLen + 1, MaxInt)
  else
    Result := ExtractFileName(FullPath);
end;

procedure TForm1.LoadDirectory(const SourcePath: string);
var
  SearchRec: TSearchRec;
  FullPath: string;
  Stream: TStream;
  RelativePath: string;
begin
  if FindFirst(SourcePath + '*.*', faAnyFile, SearchRec) = 0 then
  begin
    try
      repeat
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
        begin
          FullPath := SourcePath + SearchRec.Name;
          if (SearchRec.Attr and faDirectory) <> 0 then
            LoadDirectory(IncludeTrailingBackslash(FullPath))
          else
          begin
            Stream := TFileStream.Create(FullPath, fmOpenRead or fmShareDenyWrite);
            RelativePath := GetRelativePath(fSourcePath, FullPath);
            FileNames.Add(RelativePath);
            FileStreams.Add(Stream);
          end;
        end;
      until FindNext(SearchRec) <> 0;
    finally
      FindClose(SearchRec);
    end;
  end;
end;

procedure TForm1.SaveDirectory(const DestPath: string);
var
  i: Integer;
  RelativePath: string;
  Stream: TStream;
  FileStream: TFileStream;
  FullPath: string;
  DirPath: string;
begin
  for i := 0 to FileStreams.Count - 1 do
  begin
    RelativePath := FileNames[i];
    Stream := TStream(FileStreams[i]);
    FullPath := DestPath + RelativePath;

    // Extract the directory path from the full path
    DirPath := ExtractFilePath(FullPath);

    // Create directories if necessary
    ForceDirectories(DirPath);

    try
      FileStream := TFileStream.Create(FullPath, fmCreate);
      try
        Stream.Position := 0; // Reset stream position to the beginning
        FileStream.CopyFrom(Stream, Stream.Size);
      finally
        FileStream.Free;
      end;
    except
      on E: Exception do
        ShowMessage(Format('Error saving file %s: %s', [FullPath, E.Message]));
    end;
  end;
end;

end.
