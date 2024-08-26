unit Client;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids,
  Menus, dmPropertyHub_U, PopupPanel, CustomButtons, ADODB, AgentPropertyCard,
  Spin, IOUtils;

type TClient = class
  private
    fClientID : integer;
    fUsername, fPassword : string;
    fFirstName, fLastName, fEmail, fPhone : string;
    fDateAdded : TDateTime;
    TextFilePaths : TStringList;
    procedure GetTextFiles(const Directory: string);
    procedure CreateFolder(FolderPath : string);
    function GetClientProperties:TArray<Integer>;

  public
    constructor Create(ClientID : integer); overload;
    constructor Create; overload;
    function GetTotalSalesRevenue : real;
    function GetPropertyCount : integer;
    function GetOfferIDs : TArray<integer>;
    procedure BackupAll;
    procedure RestoreClient(AClientID : integer);
    property ClientID : integer read fClientID;
    property Username : string read fUsername;
    property Password : string read fPassword;
    property FirstName : string read fFirstName;
    property LastName : string read fLastName;
    property Email : string read fEmail;
    property PhoneNum : string read fPhone;
    property DateAdded : TDateTime read fDateAdded;
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
                       DateToStr(tblOwners['OwnStartDate']);
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
      iOwnerID := arrOwnerID[i];
      if tblListings.Locate('OwnerID', iOwnerID, []) then
      begin
        sListingWrite := IntToStr(tblListings['ListingID']) + '#' +
                 IntToStr(tblListings['PropertyID']) + '#' +
                 IntToStr(tblListings['OwnerID']) + '#' +
                 CurrToStr(tblListings['Price']) + '#' +
                 DateToStr(tblListings['ListDate']);

        Writeln(tListingFile, sListingWrite);
      end;
    end;
    CloseFile(tListingFile);

    dsSales.DataSet := tblSales;
    AssignFile(tSalesFile, FPathClient + '/SaleData.txt');
    Rewrite(tSalesFile);
    tblSales.First;
    while not tblSales.Eof do
    begin
      if tblSales['SellerID'] = fClientID then
      begin
        sSalesWrite :=  IntToStr(tblSales['SaleID']) + '#' +
                IntToStr(tblSales['OwnerID']) + '#' +
                IntToStr(tblSales['ListingID']) + '#' +
                IntToStr(tblSales['ClientID']) + '#' +     // New Owner
                CurrToStr(tblSales['SalePrice']) + '#' +
                DateToStr(tblSales['SaleData']);

        Writeln(tSalesFile, sSalesWrite);

      end;

      tblSales.Next;
    end;
    CloseFile(tSalesFile);
  end;

  ShowMessage('Client successfully backed up');
end;

constructor TClient.Create(ClientID: integer);
var
  bFoundclient : boolean;
begin
  fClientID := ClientID;
  bFoundClient := False;
  with dmPropertyHub do
  begin
    tblClients.First;
    dsClients.DataSet := tblClients;
    if tblClients.Locate('ClientID', fClientID, []) then
    begin
      bFoundClient := True;
      fUsername := tblClients['Username'];
      fPassword := tblClients['UserPassword'];
      fFirstName := tblClients['FirstName'];
      fLastName:= tblClients['LastName'];
      fEmail := tblClients['Email'];
      fPhone := tblClients['Phone'];
      fDateAdded := tblClients['DateAdded'];

    end;

    if bFoundclient = False then
    begin
      ShowMessage('Client not Found');
      exit;
    end;
  end;
end;

constructor TClient.Create;
begin
  // Placeholder constructor for when client has been deleted
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
  if Assigned(TextFilePaths) then
  begin
    TextFilePaths.Clear;
  end else
  begin
    TextFilePaths := TStringList.Create;
  end;

  if FindFirst(Directory + '\*.txt', faAnyFile, SearchRec) = 0 then
  begin
    try
      repeat
        FileExt := LowerCase(ExtractFileExt(SearchRec.Name));
        if (FileExt = '.txt') then
        begin
          TextFilePaths.Add(Directory + '\' + SearchRec.Name)
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

procedure TClient.RestoreClient(AClientID : integer);
var
  CurrentPath : string;
  i: Integer;
  tFile : TextFile;

  // Client Table
  iClientID : integer;
  sFirstName, sLastName, sEmail, sPhone : string;
  dDateAdded : TDateTime;
  sUsername, sUserPassword : string;

  // Listing Table
  iListingID, iLPropertyID, iLOwnerID : integer;
  rPrice : real;
  dListDate : TDateTime;

  // Owner Table
  iOwnerID, iOClientID, iOPropertyID : integer;
  dOwnStartDate : TDateTime;

  // Properties Table
  iPropertyID : integer;
  sStreetAddress, sCity, sProvince, sPostalCode, sCategory : string;
  sType : string;
  iBedrooms, iBathrooms : integer;
  sNotes : string;
  iSqrMeters : integer;

  // Sale Table
  iSaleID, iSellerID, iSPropertyID, iBuyerID : integer;
  rSalePrice : real;
  dSaleDate : TDateTime;


  sLine : string;
  iPos : integer;
  iCount : integer;

begin
  if TextFilePaths.Count = 0 then
  begin
    GetTextFiles('Backups\Clients\' + IntToStr(fClientID));
  end;

  for i := 0 to TextFilePaths.Count - 1 do
  begin
    CurrentPath := TextFilePaths[i];
    AssignFile(tFile, CurrentPath);
    try
      Reset(tFile);
    except
      ShowMessage('File not Found');
      exit;
    end;
    // SELECT tblClients.Name, tblClients... FROM tblClients, tbl... WHERE tblClients....
    case i of
      0 : begin
            while not Eof(tFile) do
            begin
              Readln(tFile, sLine);
              iPos := Pos('#', sLine);
              iClientID := StrToInt(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              sFirstName := Copy(sLine, 1, iPos - 1);
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              sLastName := Copy(sLine, 1, iPos - 1);
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              sEmail := Copy(sLine, 1, iPos - 1);
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              sPhone := Copy(sLine, 1, iPos - 1);
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              dDateAdded := StrToDate(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              sUsername := Copy(sLine, 1, iPos - 1);
              Delete(sLine, 1, iPos);

              sUserPassword := Copy(sLine, 1, Length(sLine));
            end;

          end;
      1 : begin
            while not Eof(tFile) do
            begin
              Readln(tFile, sLine);
              iPos := Pos('#', sLine);
              iListingID := StrToInt(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              iLPropertyID := StrToInt(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              iLOwnerID := StrToInt(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              rPrice := StrToFloat(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);

              dListDate := StrToDate(Copy(sLine, 1, Length(sLine)));


            end;
          end;
      2 : begin
            while not Eof(tFile) do
            begin
              Readln(tFile, sLine);
              iPos := Pos('#', sLine);
              iOwnerID := StrToInt(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              iOClientID := StrToInt(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              iOPropertyID:= StrToInt(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);

              dOwnStartDate := StrToDate(Copy(sLine, 1, Length(sLine)));
            end;
          end;
      3 : begin
            while not Eof(tFile) do
            begin
              Readln(tFile, sLine);
              iPos := Pos('#', sLine);
              iPropertyID := StrToInt(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              sStreetAddress := Copy(sLine, 1, iPos - 1);
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              sCity := Copy(sLine, 1, iPos - 1);
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              sProvince := Copy(sLine, 1, iPos - 1);
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              sPostalCode := Copy(sLine, 1, iPos - 1);
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              sCategory := Copy(sLine, 1, iPos - 1);
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              sType := Copy(sLine, 1, iPos - 1);
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              iBedrooms := StrToInt(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              iBathrooms := StrToInt(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              sNotes := Copy(sLine, 1, iPos - 1);
              Delete(sLine, 1, iPos);


              iSqrMeters := StrToInt(Copy(sLine, 1, Length(sLine)));
            end;
          end;
      4 : begin
            while not Eof(tFile) do
            begin
              Readln(tFile, sLine);
              iPos := Pos('#', sLine);
              iSaleID := StrToInt(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              iSellerID := StrToInt(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              iSPropertyID := StrToInt(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);


              iPos := Pos('#', sLine);
              iBuyerID := StrToInt(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);

              iPos := Pos('#', sLine);
              rSalePrice := StrToFloat(Copy(sLine, 1, iPos - 1));
              Delete(sLine, 1, iPos);

              dSaleDate := StrToDate(Copy(sLine, 1, Length(sLine)));
            end;
          end;
    end;
   CloseFile(tFile);

  end;

  with dmPropertyHub do
  begin
    dsClients.DataSet := tblClients;
    dsListings.DataSet := tblListings;
    dsOwners.DataSet := tblOwners;
    dsProperties.DataSet := tblProperties;
    dsSales.DataSet := tblSales;

    tblClients.Insert;
    tblClients['ClientID'] := iClientID;
    tblClients['FirstName'] :=  sFirstName;
    tblClients['LastName'] := sLastName;
    tblClients['Email'] :=  sEmail;
    tblClients['Phone'] := sPhone;
    tblClients['DateAdded'] := dDateAdded;
    tblClients['Username'] := sUsername;
    tblClients['UserPassword'] := sUserPassword;
    tblClients.Post;

    tblListings.Insert;
    tblListings['ListingID'] := iListingID;
    tblListings['PropertyID'] := iLPropertyID;
    tblListings['OwnerID'] := iLOwnerID;
    tblListings['Price'] := rPrice;
    tblListings['ListDate'] := dListDate;
    tblListings.Post;

    tblOwners.Insert;
    tblOwners['OwnerID'] := iOwnerID;
    tblOwners['ClientID'] := iOClientID;
    tblOwners['PropertyID'] := iOPropertyID;
    tblOwners['OwnStartDate'] := dOwnStartDate;
    tblOwners.Post;

    tblProperties.Insert;
    tblProperties['PropertyID'] := iPropertyID;
    tblProperties['StreetAddress'] := sStreetAddress;
    tblProperties['City'] :=  sCity;
    tblProperties['Province'] := sProvince;
    tblProperties['PostalCode'] := sPostalCode;
    tblProperties['Category'] := sCategory;
    tblProperties['Type'] := sType;
    tblProperties['Bedrooms'] := iBedrooms;
    tblProperties['Bathrooms'] := iBathrooms;
    tblProperties['Notes'] := sNotes;
    tblProperties['SqrMeters'] := iSqrMeters;
    tblProperties.Post;

    tblSales.Insert;
    tblSales['SaleID'] := iSaleID;
    tblSales['SellerID'] := iSellerID;
    tblSales['PropertyID'] := iSPropertyID;
    tblSales['BuyerID'] := iBuyerID;
    tblSales['SalePrice'] := rSalePrice;
    tblSales['SaleDate'] := dSaleDate;
    tblSales.Post;
  end;

  ShowMessage('Successfully Restored');

end;

end.
