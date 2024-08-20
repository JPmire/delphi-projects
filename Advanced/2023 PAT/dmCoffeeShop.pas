unit dmCoffeeShop;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmDatabase = class(TDataModule)
    conCoffeeShop: TADOConnection;
    dsEmployees: TDataSource;
    tblEmployees: TADOTable;
    dsCustomers: TDataSource;
    dsInventory: TDataSource;
    tblCustomers: TADOTable;
    tblInventory: TADOTable;
    Query: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  dmDatabase: TdmDatabase;

implementation

{$R *.dfm}

end.
