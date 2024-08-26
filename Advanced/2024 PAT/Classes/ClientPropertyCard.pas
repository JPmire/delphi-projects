unit ClientPropertyCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids,
  Menus, PopupPanel, CustomButtons, ADODB, Spin, ListingDetails, IOUtils; // NEW


type
  TClientPropertyCard = class(TPanel)
  private
    FPropertyID: Integer;

    // Card Components
    flblPropertyID, flblProvince, flblCategory, flblNotes, flblSqrMeters : TLabel;
    fpnlPropertyID : TPanel;
    flbledtCity, flbledtPostalCode : TLabeledEdit;
    flbledtBedrooms, flbledtBathrooms : TLabeledEdit;
    flblPropertyStreet : TLabel;
    fViewListingPanel : TPanel;
    fcmbxProvince, fcmbxCategory : TComboBox;
    frdgType : TRadioGroup;
    fsedSqrMeters : TSpinEdit;
    FListingDetailsContainer : TWinControl;
    fmemNotes : TMemo;
    fListingDetailsManager : TListingDetailsManager;
    fIsOwnedProperty : boolean;
    fAddListingPanel : TPanel;
    function CreateID(Table : string; Query : TADOQuery): integer;
    function CheckID(iID: integer):integer;

  public
    constructor Create(AOwner: TWinControl; APropertyID: Integer; AIsOwnedProperty : boolean); reintroduce;
    property PropertyID: Integer read FPropertyID;
    property ListingManager : TListingDetailsManager read fListingDetailsManager write fListingDetailsManager; // Kyk
    procedure ViewListingClick(Sender: TObject); // Kyk
    procedure AddListingClick(Sender: TObject);
  end;

  TPropertyCardManager = class
  private
    FScrollBox: TScrollBox;
    FCards: TList;
    FListingDetailsContainer : TWinControl;
    fVisibleCardCount : integer;
    fVisibleCardLimit : integer;
    fIsOwnedProperty : boolean;
    function GetCard(Index: Integer): TClientPropertyCard;


  public
    constructor Create(AScrollBox: TScrollBox; AListingDetailsContainer: TWinControl);
    destructor Destroy; override;
    procedure Add(APropertyID: Integer);
    procedure Delete(Index: Integer);
    property Cards[Index: Integer]: TClientPropertyCard read GetCard; default;
    procedure MoveLastToFirst;
    function Filter(Field : string; Value: string): TStringList; overload;
    function Filter(Wildcard : string): TStringList; overload;
    property CardCount : integer read fVisibleCardCount write fVisibleCardCount;
    property CardLimit : integer read fVisibleCardLimit write fVisibleCardLimit;
    property IsOwnedProperty : boolean read fIsOwnedProperty write fIsOwnedProperty;

  end;

implementation

uses
  dmPropertyHub_U; // Replace with the actual unit name where your data module is

{ TPropertyCard }

procedure TClientPropertyCard.AddListingClick(Sender: TObject);     // stopped here
var
  rListingPrice : real;
  iOwnerID : integer;
begin
  rListingPrice := StrToFloat(InputBox('Listing Price', 'Enter the Listing Price for your Property', ''));

  with dmPropertyHub do
  begin
    dsOwners.DataSet := qryOwners;
    qryOwners.SQL.Clear;
    qryOwners.SQL.Add('SELECT * FROM tblOwners WHERE PropertyID = ' + IntToStr(FPropertyID));
    qryOwners.Open;
    iOwnerID := qryOwners.FieldByName('OwnerID').AsInteger;

    dsListings.DataSet := tblListings;
    tblListings.First;
    tblListings.Insert;
    tblListings['ListingID'] := CreateID('tblListings', qryListings);
    tblListings['PropertyID'] := IntToStr(FPropertyID);
    tblListings['OwnerID'] := iOwnerID;
    tblListings['Price'] := rListingPrice;
    tblListings['ListDate'] := Date;
    tblListings.Post;
  end;
end;

function TClientPropertyCard.CheckID(iID: integer): integer;
var
  sDirectory : string;
  dir : string;

begin
  sDirectory := 'Backups\Clients\';

  for dir in TDirectory.GetDirectories(sDirectory) do
  begin
    if ExtractFileName(dir) = IntToStr(iID) then
    begin
      inc(iID);
      CheckID(iID);
    end;
  end;
  Result := iID;
end;

constructor TClientPropertyCard.Create(AOwner: TWinControl; APropertyID: Integer; AIsOwnedProperty : boolean);
var
  ButtonWidth, ButtonSpacing, TotalWidth, StartPos: Integer;
  CardHeight : integer;

  sProvinces : TStrings;
  iListingCount : integer;
begin
  inherited Create(AOwner);
  fPropertyID := APropertyID;
  CardHeight := 300;
  // Set up the card layout
  Self.Width := AOwner.Width - 30; // Adjust as needed
  Self.BevelOuter := bvNone;
  Self.ParentBackground := False;
  Self.Color := clWhite; // Adjust as needed
  Self.Parent := TWinControl(AOwner);
  Self.Height := CardHeight; // Adjust as needed
  ButtonWidth := 50; // The width of each button panel
  ButtonSpacing := 10; // The space between the buttons

  // Calculate the total width of both buttons including the space between them
  TotalWidth := (ButtonWidth * 2) + ButtonSpacing;

  // Calculate the starting position for the first button so that they are centered
  StartPos := (Self.Width - TotalWidth) div 2;


  // Load property details from the database
  with dmPropertyHub.tblProperties do
  begin
    dmPropertyHub.dsProperties.DataSet := dmPropertyHub.tblProperties;
    Locate('PropertyID', APropertyID, []);
    // Populate card with details from the dataset
  end;

  fpnlPropertyID := TPanel.Create(Self);
  // Create Labels
  flblPropertyStreet := TLabel.Create(Self);
  flblPropertyID := TLabel.Create(Self);
  flblProvince := TLabel.Create(Self);
  flblCategory := TLabel.Create(Self);
  flblNotes := TLabel.Create(Self);
  flblSqrMeters := TLabel.Create(Self);

  // Create LabeledEdits
  flbledtCity := TLabeledEdit.Create(Self);
  flbledtPostalCode := TLabeledEdit.Create(Self);
  flbledtBedrooms := TLabeledEdit.Create(Self);
  flbledtBathrooms := TLabeledEdit.Create(Self);

  // Create Comboboxes
  fcmbxProvince := TComboBox.Create(Self);
  fcmbxCategory := TComboBox.Create(Self);

  // Create SpinEdit
  fsedSqrMeters := TSpinEdit.Create(Self);

  // Create Radiogroup
  frdgType := TRadioGroup.Create(Self);

  // Create Memo
  fmemNotes := TMemo.Create(Self);

  // Create and configure the Listing panel

  with dmPropertyHub do
  begin
    qryListings.SQL.Clear;
    qryListings.SQL.Add('SELECT COUNT(*) as LCount FROM tblListings WHERE PropertyID = ' + IntToStr(FPropertyID));
    qryListings.Open;
    iListingCount := qryListings.FieldByName('LCount').AsInteger;



    if iListingCount > 0 then
    begin
    fViewListingPanel := TPanel.Create(Self);
    with fViewListingPanel do    // Kyk
    begin
      Parent := Self;
      ParentBackground := False;
      Caption := 'View Listing Details';
      BevelInner := bvNone;
      BevelKind := bkNone;
      BevelOuter := bvNone;
      Font.Color := clWhite;
      Width := 200;
      Height := 30;
      Top :=  225;
      Left := 205;
      //Color := clSkyBlue;
      Color := clGreen;
      Font.Name := 'Arail';
      Font.Size := 12;
      Font.Style := [fsBold];
      OnClick := ViewListingClick;
    end;
    end;


  end;

  if AIsOwnedProperty = True then
  begin
  fAddListingPanel := TPanel.Create(Self);
    with fAddListingPanel do    // Kyk
    begin
      Parent := Self;
      ParentBackground := False;
      Caption := 'Create Listing';
      BevelInner := bvNone;
      BevelKind := bkNone;
      BevelOuter := bvNone;
      Font.Color := clWhite;
      Width := 200;
      Height := 30;
      if iListingCount > 0 then
      begin
        Top :=  225 + Height + 10;
      end else
      begin
        Top := 225;
      end;

      Left := 205;
      //Color := clSkyBlue;
      Color := clGreen;
      Font.Name := 'Arail';
      Font.Size := 12;
      Font.Style := [fsBold];
      OnClick := AddListingClick;
    end;




  end;

  with fpnlPropertyID do
  begin
    Parent := Self;
    ParentBackground := False;
    Caption := IntToStr(FPropertyID);
    BevelInner := bvNone;
    BevelKind := bkNone;
    BevelOuter := bvNone;
    Font.Color := clWhite;
    Width := 55;
    Height := 38;
    Top :=  57;
    Left := 31;
    Color := rgb(22, 121, 171);
    Font.Name := 'Arail';
    Font.Size := 12;
    Font.Style := [fsBold];
  end;

  with flblPropertyStreet do
  begin
    Caption := dmPropertyHub.tblProperties['StreetAddress'];
    Font.Name := 'Arial';
    Font.Color := clWhite;
    Font.Size := 14;
    Font.Style := [fsBold];
    Layout := tlCenter;
    Alignment := taCenter;
    Align := alTop;
    Height := 32;
    Parent := Self;
  end;

  with flblPropertyID do
  begin
    Font.Size := 10;
    Top := 35;
    Left := 31;
    Caption := 'PropertyID:';
    Font.Name := 'Arial';
    Font.Color := clWhite;
    Parent := Self;
  end;

  with flblProvince do
  begin
    Font.Size := 10;
    Top := 154;
    Left := 31;
    Caption := 'Province:';
    Font.Name := 'Arial';
    Font.Color := clWhite;
    Parent := Self;
  end;

  with flblCategory do
  begin
    Font.Size := 10;
    Top := 35;
    Left := 214;
    Caption := 'Category:';
    Font.Name := 'Arial';
    Font.Color := clWhite;
    Parent := Self;
  end;

  with flblNotes do
  begin
    Font.Size := 10;
    Top := 35;
    Left := 456;
    Caption := 'Notes:';
    Font.Name := 'Arial';
    Font.Color := clWhite;
    Parent := Self;
  end;

  with flblSqrMeters do
  begin
    Font.Size := 10;
    Top := 210;
    Left := 456;
    Caption := 'Square Meters (Approx.)';
    Font.Name := 'Arial';
    Font.Color := clWhite;
    Parent := Self;
  end;

  with flbledtCity do
  begin
    Font.Size := 10;
    Enabled := False;
    Top := 119;
    Left := 31;
    EditLabel.Caption := 'City:';
    Font.Name := 'Arial';
    EditLabel.Font.Color := clWhite;
    Text := dmPropertyHub.tblProperties['City'];
    Parent := Self;
  end;

  with flbledtPostalCode do
  begin
    Font.Size := 10;
    Enabled := False;
    Top := 235;
    Left := 31;
    EditLabel.Caption := 'Postal Code:';
    Font.Name := 'Arial';
    EditLabel.Font.Color := clWhite;
    Text := dmPropertyHub.tblProperties['PostalCode'];
    Parent := Self;
  end;

  with flbledtBedrooms do
  begin
    Font.Size := 10;
    Enabled := False;
    Top := 176;
    Left := 214;
    Width := 66;
    EditLabel.Caption := 'Bedrooms:';
    Font.Name := 'Arial';
    EditLabel.Font.Color := clWhite;
    Text := dmPropertyHub.tblProperties['Bedrooms'];
    Parent := Self;
  end;

  with flbledtBathrooms do
  begin
    Font.Size := 10;
    Enabled := False;
    Top := 176;
    Left := 330;
    Width := 66;
    EditLabel.Caption := 'Bathrooms:';
    Font.Name := 'Arial';
    EditLabel.Font.Color := clWhite;
    Text := dmPropertyHub.tblProperties['Bathrooms'];
    Parent := Self;
  end;


  with fcmbxProvince do
  begin
    Parent := Self;
    Enabled := False;
    Font.Size := 9;
    Font.Name := 'Arial';
    Top := 176;
    Left := 31;
    Items.Add('Eastern Cape');
    Items.Add('Free State');
    Items.Add('Gauteng');
    Items.Add('KwaZulu-Natal');
    Items.Add('Limpopo');
    Items.Add('Mpumalanga');
    Items.Add('Northern Cape');
    Items.Add('North West');
    Items.Add('Western Cape');
    ItemIndex := Items.IndexOf(dmPropertyHub.tblProperties['Province']);
  end;

  with fcmbxCategory do
  begin
    Parent := Self;
    Enabled := False;
    Font.Size := 9;
    Font.Name := 'Arial';
    Top := 57;
    Left := 214;
    Items.Add('Residential');
    Items.Add('Apartment');
    ItemIndex := Items.IndexOf(dmPropertyHub.tblProperties['Category']);
  end;

  with fsedSqrMeters do
  begin
    Parent := Self;
    Enabled := False;
    Width := 73;
    Font.Size := 9;
    Font.Name := 'Arial';
    Top := 232;
    left := 456;
    Value := dmPropertyHub.tblProperties['SqrMeters'];
    MinValue := 1;
    MaxValue := 10000;
  end;

  with frdgType do
  begin
    Parent := Self;
    Enabled := False;
    ParentBackground := False;
    ParentColor := False;
    Width := 185;
    Height := 51;
    Color := clWhite;
    Top := 95;
    Left := 214;
    Font.Size := 9;
    Font.Name := 'Arial';
    Columns := 3;
    Items.Add('Listing');
    Items.Add('Rental');
    Items.Add('None');
    Caption := 'Type:';
    ItemIndex := Items.IndexOf(dmPropertyHub.tblProperties['Type']);
  end;

  with fMemNotes do
  begin
    Parent := Self;
    Enabled := False;
    Width := 209;
    Height := 144;
    ScrollBars := ssVertical;
    Top := 57;
    Left := 456;
    Font.Size := 9;
    Text := dmPropertyHub.tblProperties['Notes'];
    Font.Name := 'Arial';
  end;
end;



function TClientPropertyCard.CreateID(Table: string; Query: TADOQuery): integer;
var
  MaxID: Integer;
  FieldName : string;

begin
  with Query do
  begin
    SQL.Clear;
    SQL.Add('SELECT TOP 1 * FROM ' + Table);
    Open;
    FieldName := Fields[0].FieldName;
    Close;

    SQL.Clear;
    SQL.Add('SELECT MAX(' + FieldName + ') AS MaxID FROM ' + Table);
    Open;
    try
      if Fields[0].IsNull then
      begin
        MaxID := 0;
      end else
      MaxID := Fields[0].AsInteger;
    finally
      Close;
    end;
  end;

  Result := MaxID + 1;
end;

{ TPropertyCardManager }


constructor TPropertyCardManager.Create(AScrollBox: TScrollBox; AListingDetailsContainer: TWinControl);  // Kyk
begin
  inherited Create;
  fIsOwnedProperty := False;
  FScrollBox := AScrollBox;
  FListingDetailsContainer := AListingDetailsContainer;
  FCards := TList.Create;
  fVisibleCardCount := 0;
  fVisibleCardLimit := 10;
end;

destructor TPropertyCardManager.Destroy;  // Kyk
var
  I: Integer;
begin
  for I := 0 to FCards.Count - 1 do
    TClientPropertyCard(FCards[I]).Free;
    FCards.Free;
  inherited;
end;

function TPropertyCardManager.Filter(Field, Value: string): TStringList; // Kyk
var
  i : integer;
  lstPropertyID : TStringList;
begin
  lstPropertyID := TStringList.Create;
  with dmPropertyHub do
  begin
    dsProperties.DataSet := qryProperties;
    qryProperties.SQL.Clear;
    if Field = 'PropertyID' then
    begin
      qryProperties.SQL.Add('SELECT * FROM tblProperties WHERE ' + Field + ' = ' + Value + ' AND Type = "Listing" ORDER BY PropertyID ASC');
    end else
    begin
      qryProperties.SQL.Add('SELECT * FROM tblProperties WHERE ' + Field + ' LIKE "%' + Value + '%" AND Type = "Listing" ORDER BY PropertyID ASC');
    end;

    qryProperties.Open;

    qryProperties.First;
    // Populate the TStringList with property IDs
    while not qryProperties.Eof do
    begin
      lstPropertyID.Add(IntToStr(qryProperties['PropertyID']));
      qryProperties.Next;
    end;
  end;

  Result := lstPropertyID;
end;

function TPropertyCardManager.Filter(Wildcard: string): TStringList;
var
  i, iCount : integer;
  lstPropertyID : TStringList;
begin
  lstPropertyID := TStringList.Create;
  with dmPropertyHub do
    begin

      dsProperties.DataSet := qryProperties;
      qryProperties.SQL.Clear;
      // NEW
      qryProperties.SQL.Add('SELECT ' + Wildcard + ' FROM tblProperties WHERE Type = "Listing"  ORDER BY PropertyID ASC');
      qryProperties.Open;
      qryProperties.First;
      while not qryProperties.Eof do
      begin
        lstPropertyID.Add(IntToStr(qryProperties['PropertyID']));
        qryProperties.Next;
      end;
  end;
  result := lstPropertyID;

end;

function TPropertyCardManager.GetCard(Index: Integer): TClientPropertyCard;
begin
  Result := TClientPropertyCard(FCards[Index]);
end;

procedure TPropertyCardManager.MoveLastToFirst;
var
  CardHeight: Integer;
  LastCard: TClientPropertyCard;
  i: Integer;
begin
  if FCards.Count = 0 then  // Handle empty list case
    Exit;

  CardHeight := 300; // Or use whatever your card height is

  // Store the last card temporarily
  LastCard := TClientPropertyCard(FCards.Last);

  // Shift all cards one position upwards, starting from the penultimate card
  for i := FCards.Count - 2 downto 0 do
  begin
    TClientPropertyCard(FCards[i]).Top := (i + 1) * CardHeight;
  end;

  // Place the last card at the first position
  LastCard.Top := 0;

  // Move the last card to the beginning of the list
  FCards.Delete(FCards.Count - 1); // Remove from the end
  FCards.Insert(0, LastCard);        // Insert at the beginning
end;

procedure TPropertyCardManager.Add(APropertyID: Integer);  // Kyk
var
  Card: TClientPropertyCard;
  iCardHeight: Integer;
begin

  iCardHeight := 300; // Adjust the card height as needed
  Card := TClientPropertyCard.Create(FScrollBox, APropertyID, FIsOwnedProperty);
  FCards.Add(Card);
  Card.Color := RGB(64, 64, 64);
  Card.BevelInner := bvNone;
  Card.BevelKind := bkFlat;
  Card.BevelOuter := bvNone;
  Card.Width := FScrollBox.ClientWidth; // Make the card the same width as the scrollbox
  Card.Height := iCardHeight;
  Card.Align := alBottom;
  //Card.Top := (FCards.Count - 1) * CardHeight; // Position the card at the correct vertical position
  //Card.Anchors := [akLeft, akTop, akRight]; // Ensure the card stays docked to the top when resized
  Card.FListingDetailsContainer := FListingDetailsContainer;
  //Card.OnClick := Card.ViewListingClick;    // Kyk

end;

procedure TPropertyCardManager.Delete(Index: Integer);
var
  I: Integer;
begin
  try
    TClientPropertyCard(FCards[Index]).Free;
    FCards.Delete(Index);
    // Reposition remaining cards
    for I := Index to FCards.Count - 1 do
      TClientPropertyCard(FCards[I]).Top := I * (TClientPropertyCard(FCards[I]).Height + 5); // Adjust spacing as needed
  except
    //
  end;


end;

procedure TClientPropertyCard.ViewListingClick(Sender: TObject);  // Kyk
var
  i : integer;
begin

  if not Assigned(fListingDetailsManager) then
  begin
    fListingDetailsManager := TListingDetailsManager.Create(FListingDetailsContainer);
  end else
  begin
    fListingDetailsManager.Free;
    fListingDetailsManager := TListingDetailsManager.Create(FListingDetailsContainer);
  end;
  fListingDetailsManager.Add(fPropertyID);
end;

end.
