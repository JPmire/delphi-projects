unit dmPropertyHub_U;

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
    qryProperties: TADOQuery;
    qryListings: TADOQuery;
    tblClients: TADOTable;
    tblOffers: TADOTable;
    tblOwners: TADOTable;
    tblRentals: TADOTable;
    tblRentalTransactions: TADOTable;
    tblSales: TADOTable;
    dsClients: TDataSource;
    dsOffers: TDataSource;
    dsOwners: TDataSource;
    dsRentals: TDataSource;
    dsRentalTransactions: TDataSource;
    dsSales: TDataSource;
    qryClients: TADOQuery;
    qryOffers: TADOQuery;
    qryOwners: TADOQuery;
    qryRentals: TADOQuery;
    qryRentalTransactions: TADOQuery;
    qrySales: TADOQuery;
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
