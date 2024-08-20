unit dmServer;

interface

uses
  SysUtils, Classes, WideStrings, DbxDatasnap, SqlExpr, DB, DBClient, DSConnect;

type
  TDataModule1 = class(TDataModule)
    DSProviderConnection1: TDSProviderConnection;
    SQLConnection1: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
