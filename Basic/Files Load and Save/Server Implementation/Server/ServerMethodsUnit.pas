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
    FileNames: TStringList;
    FileStreams: TList;


    function GetRelativePath(const BasePath, FullPath: string): string;
  public
    { Public declarations }

    constructor Create(AOwner: TComponent); override;
    function GetFileName:TStream;
    function GetStreams: TStream;
    procedure LoadDirectory;

  end;

var
  ServerMethods1: TServerMethods1;


implementation
const
  SourcePath = 'D:\Skool\IT\Graad 12\IT PAT (2024) - Eiendom';

{$R *.dfm}

{ TServerMethods1 }

constructor TServerMethods1.Create(AOwner: TComponent);
begin
  inherited;

end;


function TServerMethods1.GetFileName: TStream;
var
  fFileNames : TStream;
begin
  FileNames.SaveToStream(fFileNames);
  result := fFileNames;
end;

function TServerMethods1.GetRelativePath(const BasePath,
  FullPath: string): string;
var
  BaseLen: Integer;
begin
  BaseLen := Length(BasePath);
  if (Length(FullPath) > BaseLen) and (AnsiCompareText(Copy(FullPath, 1, BaseLen), BasePath) = 0) then
    Result := Copy(FullPath, BaseLen + 1, MaxInt)
  else
    Result := ExtractFileName(FullPath);
end;

function TServerMethods1.GetStreams: TStream;
var
  MemoryStream: TMemoryStream;
  I: Integer;
  StreamSize: Int64;
begin
  MemoryStream := TMemoryStream.Create;

  try
    // Serialize each stream in the TList to the MemoryStream
    for I := 0 to FileStreams.Count - 1 do
    begin
      StreamSize := TStream(FileStreams[I]).Size;
      MemoryStream.Write(StreamSize, SizeOf(StreamSize)); // Write the size of the stream
      TStream(FileStreams[I]).Position := 0; // Ensure the stream is at the beginning
      MemoryStream.CopyFrom(TStream(FileStreams[I]), StreamSize); // Copy the stream content
    end;

    MemoryStream.Position := 0; // Reset the memory stream to the start
    Result := MemoryStream; // Return the serialized memory stream
  except
    MemoryStream.Free;
    raise;
  end;
end;

procedure TServerMethods1.LoadDirectory;
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
            LoadDirectory
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



end.




