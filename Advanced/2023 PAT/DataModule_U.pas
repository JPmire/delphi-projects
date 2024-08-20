unit DataModule_U;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmDatabases = class(TDataModule)
    conCoffeeShop: TADOConnection;
    dsEmployees: TDataSource;
    tblEmployees: TADOTable;
    dsCustomers: TDataSource;
    dsInventory: TDataSource;
    tblCustomers: TADOTable;
    tblInventory: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmDatabases: TdmDatabases;

implementation

{$R *.dfm}

end.
