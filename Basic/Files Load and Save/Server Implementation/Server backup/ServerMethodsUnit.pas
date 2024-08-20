unit ServerMethodsUnit;

interface

uses
  SysUtils, Classes, DSServer,
  IOUtils, Contnrs;

type
  TServerMethods1 = class(TDSServerModule)
  private
    { Private declarations }
    FSourcePath: string;
    FFileStreams: TObjectList;
    FFileNames: TStringList;
    function GetRelativePath(const BasePath, FullPath: string): string;
    procedure LoadDirectory(const SourcePath: string);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function LoadFiles(const SourcePath: string): TStream;
    function GetFileStream(const RelativePath: string): TStream;
    procedure SaveFile(const DestPath, RelativePath: string; const FileStream: TStream);
  end;

var
  ServerMethods1: TServerMethods1;

implementation

{$R *.dfm}

{ TServerMethods1 }

constructor TServerMethods1.Create(AOwner: TComponent);
begin
  inherited;
  FFileStreams := TObjectList.Create(True); // True for OwnsObjects
  FFileNames := TStringList.Create;
end;

destructor TServerMethods1.Destroy;
begin
  FFileStreams.Free;
  FFileNames.Free;
  inherited;
end;

function TServerMethods1.GetFileStream(const RelativePath: string): TStream;
var
  Index: Integer;
  MemStream: TMemoryStream;
begin
  Index := FFileNames.IndexOf(RelativePath);
  if Index >= 0 then
  begin
    MemStream := TMemoryStream.Create;
    try
      TStream(FFileStreams[Index]).Position := 0; // Ensure the source stream is positioned at the start
      MemStream.CopyFrom(TStream(FFileStreams[Index]), TStream(FFileStreams[Index]).Size);
      MemStream.Position := 0; // Reset the memory stream position to the beginning
      Result := MemStream; // Return the memory stream to the client
    except
      MemStream.Free;
      raise;
    end;
  end
  else
    Result := nil;
end;

function TServerMethods1.GetRelativePath(const BasePath,
  FullPath: string): string;
begin
 Result := ExtractRelativePath(BasePath, FullPath);
end;

procedure TServerMethods1.LoadDirectory(const SourcePath: string);
var
  SearchRec: TSearchRec;
  FileName: string;
  Stream: TStream;
  RelativePath: string;
begin
  FFileStreams.Clear;
  FFileNames.Clear;
  if FindFirst(IncludeTrailingPathDelimiter(SourcePath) + '*.*', faAnyFile, SearchRec) = 0 then
  begin
    try
      repeat
        if (SearchRec.Attr and faDirectory) = 0 then // Not a directory
        begin
          FileName := IncludeTrailingPathDelimiter(SourcePath) + SearchRec.Name;
          Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
          RelativePath := GetRelativePath(FSourcePath, FileName);
          FFileStreams.Add(Stream);
          FFileNames.Add(RelativePath);
        end;
      until FindNext(SearchRec) <> 0;
    finally
      FindClose(SearchRec);
    end;
  end;
end;

function TServerMethods1.LoadFiles(const SourcePath: string): TStream;    // maybe will break
var
  StringListStream: TMemoryStream;
begin
  FSourcePath := IncludeTrailingPathDelimiter(SourcePath);
  LoadDirectory(FSourcePath);

  // Create a memory stream to hold the TStringList
  StringListStream := TMemoryStream.Create;
  try
    FFileNames.SaveToStream(StringListStream);
    StringListStream.Position := 0;  // Reset the stream position to the beginning
    Result := StringListStream;
  except
    StringListStream.Free;
    raise;
  end;
end;

procedure TServerMethods1.SaveFile(const DestPath, RelativePath: string;
  const FileStream: TStream);
var
  FullPath: string;
  DirPath: string;
  SaveStream: TFileStream;
begin
  FullPath := IncludeTrailingPathDelimiter(DestPath) + RelativePath;
  DirPath := ExtractFilePath(FullPath);

  ForceDirectories(DirPath);

  SaveStream := TFileStream.Create(FullPath, fmCreate);
  try
    FileStream.Position := 0;
    SaveStream.CopyFrom(FileStream, FileStream.Size);
  finally
    SaveStream.Free;
  end;
end;

end.




