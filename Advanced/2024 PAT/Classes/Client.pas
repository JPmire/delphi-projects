unit Client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids,
  Menus, dmPropertyHub_U, PopupPanel, CustomButtons, ADODB, AgentPropertyCard,
  Spin, IOUtils;

type TClient = class          // NEW
  private
    fClientID : integer;
    fUsername, fPassword : string;
    fFirstName, fLastName, fEmail, fPhone : string;
    fDateAdded : TDateTime;
    fTextFilePaths : TStringList;


    procedure GetTextFiles(const Directory: string);

    procedure CreateFolder(FolderPath : string);
    function GetClientProperties:TArray<Integer>;

  public
    constructor Create(ClientID : integer);
    function GetTotalSalesRevenue : real;
    function GetPropertyCount : integer;
    function GetOfferIDs : TArray<integer>;
    procedure BackupAll;
    property ClientID : integer read fClientID;   // NEW
    property Username : string read fUsername;
    property Password : string read fPassword;
    property FirstName : string read fFirstName;
    property LastName : string read fLastName;
    property Email : string read fEmail;
    property PhoneNum : string read fPhone;
    property DateAdded : TDateTime read fDateAdded;
    procedure RestoreClient;
end;

implementation

{ TClients }

procedure TClient.BackupAll;
var
  tClientFile, tPropertyFile, tOwnerFile, tListingFile, tSalesFile : TextFile; // Add tRental File
  FPathClient, FPathProperty : string;
  arrPropertyID : TArray<integer>;
  arrOwnerID : array of integer;
  i, iPropertyID, iOwnerArrLength, iOwnerID : integer;
  sPropertyWrite, sOwnerWrite, sListingWrite, sSalesWrite : string;
begin
  with dmPropertyHub do
  begin
    iOwnerArrLength := 0;
    setLength(arrOwnerID, iOwnerArrLength);
    FPathClient := 'Backups/Clients/' + IntToStr(fClientID);
    CreateFolder(FPathClient);
    AssignFile(tClientFile, FPathClient + '/Client.txt');
    Rewrite(tClientFile);
    Writeln(tClientFile, IntToStr(fClientID) + '#' + fFirstName + '#' + fLastName
            + '#' + fEmail + '#' + fPhone + '#' + DateToStr(fDateAdded) + '#'
            + fUsername + '#' + fPassword);
    CloseFile(tClientFile);

    arrPropertyID := GetClientProperties();
    dsProperties.DataSet := tblProperties;
    AssignFile(tPropertyFile, FPathClient + '/Properties.txt');
    Rewrite(tPropertyFile);
    for i := 0 to Length(arrPropertyID) - 1 do
    begin
      iPropertyID := arrPropertyID[i];
      if tblProperties.Locate('PropertyID', iPropertyID, []) then
      begin
        sPropertyWrite := IntToStr(tblProperties['PropertyID']) + '#' +
                          tblProperties['StreetAddress'] + '#' +
                          tblProperties['City'] + '#' +
                          tblProperties['Province'] + '#' +
                          tblProperties['PostalCode'] + '#' +
                          tblProperties['Category'] + '#' +
                          tblProperties['Type'] + '#' +
                          IntToStr(tblProperties['Bedrooms']) + '#' +
                          IntToStr(tblProperties['Bathrooms']) + '#' +
                          tblProperties['Notes'] + '#' +
                          IntToStr(tblProperties['SqrMeters']);
        Writeln(tPropertyFile, sPropertyWrite);
      end;


    end;
    CloseFile(tPropertyFile);

    dsOwners.DataSet := tblOwners;
    AssignFile(tOwnerFile, FPathClient + '/OwnerData.txt');
    tblOwners.First;
    Rewrite(tOwnerFile);
    while not tblOwners.Eof do
    begin
      if tblOwners['ClientID'] = fClientID then
      begin
        sOwnerWrite := IntToStr(tblOwners['OwnerID']) + '#' +
                       IntToStr(tblOwners['ClientID']) + '#' +
                       IntToStr(tblOwners['PropertyID']) + '#' +
                       DateToStr(tblOwners['OwnStartDate']) + '#' +
                       DateToStr(tblOwners['OwnEndDate']);
        Writeln(tOwnerFile, sOwnerWrite);
        inc(iOwnerArrLength);
        setLength(arrOwnerID, iOwnerArrLength);
        arrOwnerID[iOwnerArrLength - 1] := tblOwners['OwnerID'];

      end;
      tblOwners.Next;
    end;
    CloseFile(tOwnerFile);

    dsListings.DataSet := tblListings;
    AssignFile(tListingFile, FPathClient + '/ListingData.txt');
    Rewrite(tListingFile);
    for i := 0 to Length(arrOwnerID) - 1 do
    begin
      ShowMessage(Inttostr(arrOwnerID[i]));
      iOwnerID := arrOwnerID[i];
      if tblListings.Locate('OwnerID', iOwnerID, []) then
      begin
        sListingWrite := IntToStr(tblListings['ListingID']) + '#' +
                 IntToStr(tblListings['PropertyID']) + '#' +
                 IntToStr(tblListings['OwnerID']) + '#' +
                 CurrToStr(tblListings['Price']) + '#' +
                 DateToStr(tblListings['ListDate']) + '#' +
                 tblListings['SaleStatus'];

        Writeln(tListingFile, sListingWrite);
      end;
    end;
    CloseFile(tListingFile);

//    dsSales.DataSet := tblSales;
//    AssignFile(tSalesFile, FPathClient + '/SaleDate.txt');
//    Rewrite(tSalesFile);
//    if tblSales.Locate('OwnerID', fClientID, []) then
//    begin
//      sSalesWrite :=  IntToStr(tblSales['SaleID']) + '#' +
//                      IntToStr(tblSales['OwnerID']) + '#' +
//                      IntToStr(tblSales['ListingID']) + '#' +
//                      IntToStr(tblSales['ClientID']) + '#' +     // New Owner
//                      CurrToStr(tblSales['SalePrice']) + '#' +
//                      DateToStr(tblSales['SaleData']);
//
//      Writeln(tSalesFile, sSalesWrite);
//    end;
//    CloseFile(tSalesFile);




 end;



end;

constructor TClient.Create(ClientID: integer);     // NEW
var
  bFoundclient : boolean;
begin
  fClientID := ClientID;
  bFoundClient := False;
  with dmPropertyHub do
  begin
    dsClients.DataSet := tblClients; // NEW
    if tblClients.Locate('ClientID', fClientID, []) then
    begin
      bFoundClient := True;
      fUsername := tblClients['Username'];
      fPassword := tblClients['UserPassword'];
      fFirstName := tblClients['FirstName'];
      fLastName := tblClients['LastName'];
      fEmail := tblClients['Email'];
      fPhone := tblClients['Phone'];
      fDateAdded := tblClients['DateAdded'];
    end;

    if bFoundclient = False then
    begin
      ShowMessage('Client does not exist');
      exit;
    end;
  end;
end;

procedure TClient.CreateFolder(FolderPath: string);
begin
  if not TDirectory.Exists(FolderPath) then
  begin
    try
      TDirectory.CreateDirectory(FolderPath);
    except
      on E: Exception do
      begin
        raise Exception.CreateFmt('Failed to create folder: %s. Error: %s',
                                  [FolderPath, E.Message]);
      end;
    end;
  end;
end;

function TClient.GetClientProperties: TArray<Integer>;
var
  PropertyID : Integer;
  arrResult : TArray<integer>;
begin
  SetLength(arrResult, 0);
  with dmPropertyHub do
  begin
    dsOwners.DataSet := qryOwners;
    qryOwners.SQL.Clear;
    qryOwners.SQL.Add('SELECT PropertyID FROM tblOwners WHERE ClientID = '
                      + IntToStr(fClientID));
    qryOwners.Open;

    while not qryOwners.Eof do
    begin
      PropertyID := qryOwners.FieldByName('PropertyID').AsInteger;
      SetLength(arrResult, Length(arrResult) + 1);
      arrResult[High(arrResult)] := PropertyID;
      qryOwners.Next;
    end;

    result := arrResult;
  end;
end;

function TClient.GetOfferIDs: TArray<integer>;
var
  OfferID : Integer;
  arrResult : TArray<integer>;
begin
  SetLength(arrResult, 0);
  with dmPropertyHub do
  begin
    dsOwners.DataSet := qryOffers;
    qryOffers.SQL.Clear;
    qryOffers.SQL.Add('SELECT OfferID FROM tblOffers WHERE ClientID = '
                      + IntToStr(fClientID));
    qryOffers.Open;

    while not qryOffers.Eof do
    begin
      OfferID := qryOffers.FieldByName('OfferID').AsInteger;
      SetLength(arrResult, Length(arrResult) + 1);
      arrResult[High(arrResult)] := OfferID;
      qryOffers.Next;
    end;

    result := arrResult;
  end;
end;

function TClient.GetPropertyCount: integer;
var
  iPropertyCount : integer;
begin
  with dmPropertyHub do
  begin
    dsOwners.DataSet := qryOwners;
    qryOwners.SQL.Clear;
    qryOwners.SQL.Add('SELECT COUNT(*) as PropertyCount FROM tblOwners WHERE (ClientID = ' + IntToStr(fClientID) + ')');
    qryOwners.Open;
    iPropertyCount := qryOwners.FieldByName('PropertyCount').AsInteger;
    result := iPropertyCount;
  end;
end;

procedure TClient.GetTextFiles(const Directory: string);
var
  SearchRec : TSearchRec;
  FileExt : string;
begin
  if Assigned(fTextFilePaths) then
  begin
    fTextFilePaths.Clear;
  end else
  begin
    fTextFilePaths := TStringList.Create;
  end;

  if FindFirst(Directory + '\*.*', faAnyFile, SearchRec) = 0 then
  begin
    try
      repeat
        FileExt := LowerCase(ExtractFileExt(SearchRec.Name));
        if (FileExt = '.txt') then
        begin
          fTextFilePaths.Add(Directory + '\' + SearchRec.Name);
        end;
      until FindNext(SearchRec) <> 0;
    finally
      FindClose(SearchRec);
    end;
  end;

end;

function TClient.GetTotalSalesRevenue: real;
var
  rRevenueSum : real;
begin
  with dmPropertyHub do
  begin
    dsSales.DataSet := qrySales;
    qrySales.SQL.Clear;
    qrySales.SQL.Add('SELECT SUM(SalePrice) as TotalRevenue FROM tblSales WHERE (OwnerID = ' + IntToStr(fClientID) + ')' );
    qrySales.Open;
    rRevenueSum := qrySales.FieldByName('TotalRevenue').AsInteger;
    result := rRevenueSum;
  end;
end;

procedure TClient.RestoreClient;   // NEW
var
  tFile : TextFile;
  CurrentPath : String;
  i: Integer;
  sPrefixPath : string;
begin
  sPrefixPath := 'Backups\Clients\' + IntToStr(fClientID);
  GetTextFiles(sPrefixPath);
  for i := 0 to fTextFilePaths.Count - 1 do
  begin
    CurrentPath := fTextFilePaths[i];
    AssignFile(tFile, CurrentPath);
    try
      reset(tFile);
    except
      ShowMessage('File not Found');
      exit;
    end;




  end;
end;

end.
