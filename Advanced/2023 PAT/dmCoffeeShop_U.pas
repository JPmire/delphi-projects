unit dmCoffeeShop_U;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmCoffeeShop = class(TDataModule)
    conCoffeeShop: TADOConnection;
    dsCustomers: TDataSource;
    dsInventory: TDataSource;
    tblCustomers: TADOTable;
    tblInventory: TADOTable;
    qryCustomers: TADOQuery;
    qryInventory: TADOQuery;
    qryOrders: TADOQuery;
    dsOrders: TDataSource;
    tblOrders: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  dmCoffeeShop: TdmCoffeeShop;

implementation

{$R *.dfm}

end.
