// 
// Created by the DataSnap proxy generator.
// 

unit ServerMethod;

interface

uses DBXCommon, DBXJSON, Classes, SysUtils, DB, SqlExpr, DBXDBReaders;

type
  TServerMethods1Client = class
  private
    FDBXConnection: TDBXConnection;
    FInstanceOwner: Boolean;
    FGetFileNameCommand: TDBXCommand;
    FGetStreamsCommand: TDBXCommand;
    FLoadDirectoryCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetFileName: TStream;
    function GetStreams: TStream;
    procedure LoadDirectory;
  end;

implementation

function TServerMethods1Client.GetFileName: TStream;
begin
  if FGetFileNameCommand = nil then
  begin
    FGetFileNameCommand := FDBXConnection.CreateCommand;
    FGetFileNameCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetFileNameCommand.Text := 'TServerMethods1.GetFileName';
    FGetFileNameCommand.Prepare;
  end;
  FGetFileNameCommand.ExecuteUpdate;
  Result := FGetFileNameCommand.Parameters[0].Value.GetStream(FInstanceOwner);
end;

function TServerMethods1Client.GetStreams: TStream;
begin
  if FGetStreamsCommand = nil then
  begin
    FGetStreamsCommand := FDBXConnection.CreateCommand;
    FGetStreamsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetStreamsCommand.Text := 'TServerMethods1.GetStreams';
    FGetStreamsCommand.Prepare;
  end;
  FGetStreamsCommand.ExecuteUpdate;
  Result := FGetStreamsCommand.Parameters[0].Value.GetStream(FInstanceOwner);
end;

procedure TServerMethods1Client.LoadDirectory;
begin
  if FLoadDirectoryCommand = nil then
  begin
    FLoadDirectoryCommand := FDBXConnection.CreateCommand;
    FLoadDirectoryCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLoadDirectoryCommand.Text := 'TServerMethods1.LoadDirectory';
    FLoadDirectoryCommand.Prepare;
  end;
  FLoadDirectoryCommand.ExecuteUpdate;
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := True;
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create;
  if ADBXConnection = nil then
    raise EInvalidOperation.Create('Connection cannot be nil.  Make sure the connection has been opened.');
  FDBXConnection := ADBXConnection;
  FInstanceOwner := AInstanceOwner;
end;


destructor TServerMethods1Client.Destroy;
begin
  FreeAndNil(FGetFileNameCommand);
  FreeAndNil(FGetStreamsCommand);
  FreeAndNil(FLoadDirectoryCommand);
  inherited;
end;

end.
