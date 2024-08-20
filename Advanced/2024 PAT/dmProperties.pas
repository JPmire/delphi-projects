unit dmProperties;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmPropertyHub = class(TDataModule)
    conProperties: TADOConnection;
    tblProperties: TADOTable;
    tblListings: TADOTable;
    dsProperties: TDataSource;
    dsListings: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPropertyHub: TdmPropertyHub;

implementation

{$R *.dfm}

end.
