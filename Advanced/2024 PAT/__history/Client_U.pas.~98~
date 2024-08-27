unit Client_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, CustomButtons, ComCtrls, StdCtrls, Client, ColoredListBox,
  Grids, DBGrids, Menus, ClientPropertyCard, ListingDetails, dmPropertyHub_U;

type
  TfrmClient = class(TForm)
    pnlNavBar: TPanel;
    Image1: TImage;
    pnlViewProperties: TPanel;
    imgPropertiesIcon: TImage;
    pnlViewOffers: TPanel;
    imgOffersIcon: TImage;
    pnlProfile: TPanel;
    pnlHeader: TPanel;
    pcClient: TPageControl;
    tbsProperties: TTabSheet;
    tbsOffers: TTabSheet;
    pnlProperties: TPanel;
    pnlOffers: TPanel;
    lbOffers: TListBox;
    lblOfferInstruction: TLabel;
    dbgListings: TDBGrid;
    gbxPropertyDetails: TGroupBox;
    gbxListingDetails: TGroupBox;
    popmProfile: TPopupMenu;
    piLogout: TMenuItem;
    piResetPassword: TMenuItem;
    scrlbPropertyDetails: TScrollBox;
    pnlFilterShowResults: TPanel;
    cmbxCustomFilter: TComboBox;
    edtFilterValue: TEdit;
    pnlFilterContainer: TPanel;
    pnlViewAllProperties: TPanel;
    shpFilterDivider: TShape;
    Label1: TLabel;
    pnlViewMoreContainer: TPanel;
    pnlViewMore: TPanel;
    Shape1: TShape;
    splitOfferDivider: TSplitter;
    pnlViewOwnedProperties: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure pnlProfileClick(Sender: TObject);
    procedure pnlViewPropertiesClick(Sender: TObject);
    procedure pnlViewAllPropertiesClick(Sender: TObject);
    procedure pnlViewMoreClick(Sender: TObject);
    procedure pcClientChange(Sender: TObject);
    procedure pnlFilterShowResultsClick(Sender: TObject);
    procedure piLogoutClick(Sender: TObject);
    procedure lbOffersClick(Sender: TObject);
    procedure pnlViewOffersClick(Sender: TObject);
    procedure pnlViewPropertiesMouseEnter(Sender: TObject);
    procedure pnlViewPropertiesMouseLeave(Sender: TObject);
    procedure pnlViewOffersMouseEnter(Sender: TObject);
    procedure pnlViewOffersMouseLeave(Sender: TObject);
    procedure pnlViewOwnedPropertiesClick(Sender: TObject);
  private
    { Private declarations }
    objClient : TClient;
    objPropertyManager : TPropertyCardManager;
    listPropertyID : TStringList;
    iPanelLimit, iPanelAmount : integer;
    procedure GetOfferDetails;

    procedure ViewFilters(PropertyIDList : TStringList; Limit : integer; VisiblePanels : integer);
  public
    { Public declarations }
    iClientID : integer;
  end;

const
  PANEL_LIMIT = 10;

var
  frmClient: TfrmClient;

implementation

{$R *.dfm}

procedure TfrmClient.FormActivate(Sender: TObject);
var
  i : integer;
begin
  pcClient.OnChange(Self);
  pcClient.TabIndex := 0;
  objClient := TClient.Create(iClientID);
  objPropertyManager := TPropertyCardManager.Create(scrlbPropertyDetails, gbxListingDetails);
  pnlNavBar.Color := RGB(0, 42, 102);
  pnlViewProperties.ParentBackground := True;
  pnlViewOffers.ParentBackground := True;
  pnlHeader.Color := RGB(70, 130, 180);
  pnlHeader.Font.Color := clYellow;
  pnlProperties.Color := RGB(173,216,230);
  pnlOffers.Color := RGB(70, 130, 180);

  iPanelLimit := 0;
  iPanelAmount := 0;


end;

procedure TfrmClient.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  i: Integer;
  tempClientCard : TClientPropertyCard;
begin
  for i := 0 to objPropertyManager.CardCount - 1 do
  begin
    if Assigned(TClientPropertyCard(objPropertyManager.Cards[i]).ListingManager) then
    begin
      tempClientCard := objPropertyManager.Cards[i] as TClientPropertyCard;
      tempClientCard.ListingManager.Destroy;
    end;
  end;

  objPropertyManager.Free;
  objClient.Free;
  pnlViewMoreContainer.Visible := False;
  Application.MainForm.Show;

end;

procedure TfrmClient.FormCreate(Sender: TObject);
var
  pnlMyProfile : TCustomButtons;
begin
  pnlMyProfile := TCustomButtons.Create(pnlProfile);

  with pnlMyProfile do
  begin
    Color := RGB(70, 130, 180);
    BorderRadius := 50;
    Click.Color := RGB(60, 120, 170);
  end;
end;

procedure TfrmClient.GetOfferDetails;
var
  sStreet, sStatus : string;
  dtOfferDate : TDateTime;
  iListingID : integer;
  iPropertyID : integer;
begin
  with dmPropertyHub do
  begin
    lbOffers.Clear;
    dsOffers.DataSet := qryOffers;
    dsProperties.DataSet := qryProperties;
    dsListings.DataSet := qryListings;

    qryOffers.SQL.Clear;
    qryOffers.SQL.Add('SELECT * FROM tblOffers WHERE ClientID = ' + IntToStr(iClientID));
    qryOffers.Open;

    qryOffers.First;
    while not qryOffers.Eof do
    begin
      iListingID := qryOffers['ListingID'];

      qryListings.SQL.Clear;
      qryListings.SQL.Add('SELECT * FROM tblListings WHERE ListingID = ' + IntToStr(iListingID));
      qryListings.Open;


      iPropertyID := qryListings.FieldByName('PropertyID').AsInteger;

      qryProperties.SQL.Clear;
      qryProperties.SQL.Add('SELECT * FROM tblProperties WHERE PropertyID = ' + IntToStr(iPropertyID)); // Continue Here
      qryProperties.Open;

      sStreet := qryProperties.FieldByName('StreetAddress').AsString;
      dtOfferDate := qryOffers['OfferDate'];
      sStatus := qryOffers['OfferStatus'];

      lbOffers.Items.Add('[' + IntToStr(iPropertyID) + ']:  ' + sStreet + ' | Status: ' + sStatus + ' | Offer Date: ' + DateToStr(dtOfferDate));
      if sStatus = 'Pending' then
        lbOffers.SetItemColor(lbOffers.Count - 1, clYellow)
      else if sStatus = 'Rejected' then
        lbOffers.SetItemColor(lbOffers.Count - 1, clRed)
      else if sStatus = 'Accepted' then
        lbOffers.SetItemColor(lbOffers.Count - 1, clGreen);

        qryOffers.Next
    end;
  end;
end;

procedure TfrmClient.lbOffersClick(Sender: TObject);
var
  sLine : string;
  iPos : integer;
  iPropertyID : integer;
begin
  sLine := lbOffers.Items[lbOffers.ItemIndex];
  iPos := pos(']', sLine);
  iPropertyID := StrToInt(Copy(sLine, 2, iPos - 2));

  if not Assigned(objPropertyManager) then
  begin
    objPropertyManager := TPropertyCardManager.Create(scrlbPropertyDetails, gbxListingDetails);
  end else
  begin
    objPropertyManager.Free;
    objPropertyManager := TPropertyCardManager.Create(scrlbPropertyDetails, gbxListingDetails);
    iPanelLimit := 0;
    iPanelAmount := 0;
  end;
  listPropertyID := objPropertyManager.Filter('PropertyID', IntToStr(iPropertyID));
  ViewFilters(listPropertyID, PANEL_LIMIT, 0);
  pnlViewMore.OnClick(self);

  objPropertyManager.Cards[0].ViewListingClick(Self);

  tbsProperties.Show;





end;

procedure TfrmClient.pcClientChange(Sender: TObject);
begin

  if pcClient.TabIndex = 1 then
  begin
    GetOfferDetails;
  end;
end;

procedure TfrmClient.piLogoutClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmClient.pnlFilterShowResultsClick(Sender: TObject);
begin
  if not Assigned(objPropertyManager) then
  begin
    objPropertyManager := TPropertyCardManager.Create(scrlbPropertyDetails, gbxListingDetails);
  end else
  begin
    objPropertyManager.Free;
    objPropertyManager := TPropertyCardManager.Create(scrlbPropertyDetails, gbxListingDetails);
    iPanelLimit := 0;
    iPanelAmount := 0;
  end;

  listPropertyID := objPropertyManager.Filter(cmbxCustomFilter.Text, edtFilterValue.Text);
  ViewFilters(listPropertyID, PANEL_LIMIT, 0);
  if pnlViewMoreContainer.Visible = True then
    pnlViewMore.OnClick(Self);
end;

procedure TfrmClient.pnlProfileClick(Sender: TObject);
var
  i : integer;
  tempImage : TImage;
  xpos, ypos : integer;
  pos : TPoint;
begin
  pos.X := pnlProfile.Left;
  pos.Y := pnlProfile.Top;

  Pos := ClientToScreen(pos);

  popmProfile.Popup(Pos.X - (pnlProfile.Width div 2), Pos.Y + pnlProfile.Height + 10);

end;

procedure TfrmClient.pnlViewAllPropertiesClick(Sender: TObject);
begin
  if not Assigned(objPropertyManager) then
  begin
    objPropertyManager := TPropertyCardManager.Create(scrlbPropertyDetails, gbxListingDetails);
  end else
  begin
    objPropertyManager.Free;
    objPropertyManager := TPropertyCardManager.Create(scrlbPropertyDetails, gbxListingDetails);
    iPanelLimit := 0;
    iPanelAmount := 0;
  end;

  listPropertyID := objPropertyManager.Filter('*');
  ViewFilters(listPropertyID, PANEL_LIMIT, 0);
  if pnlViewMoreContainer.Visible = True then
    pnlViewMore.OnClick(Self);
end;

procedure TfrmClient.pnlViewMoreClick(Sender: TObject);
begin
  pnlViewMoreContainer.Visible := False;
  iPanelLimit := iPanelLimit + PANEL_LIMIT;
  ViewFilters(listPropertyID, iPanelLimit, iPanelAmount);
  pnlViewMoreContainer.Top := 0;

end;

procedure TfrmClient.pnlViewOffersClick(Sender: TObject);
begin
  tbsOffers.Show;
  GetOfferDetails;
end;

procedure TfrmClient.pnlViewOffersMouseEnter(Sender: TObject);
begin
  pnlViewOffers.Font.Color := clYellow;
end;

procedure TfrmClient.pnlViewOffersMouseLeave(Sender: TObject);
begin
  pnlViewOffers.Font.Color := clWhite;
end;

procedure TfrmClient.pnlViewOwnedPropertiesClick(Sender: TObject);
var
  i, iCount : integer;
begin
  if not Assigned(objPropertyManager) then
  begin
    objPropertyManager := TPropertyCardManager.Create(scrlbPropertyDetails, gbxListingDetails);

  end else
  begin
    objPropertyManager.Free;
    objPropertyManager := TPropertyCardManager.Create(scrlbPropertyDetails, gbxListingDetails);
    iPanelLimit := 0;
    iPanelAmount := 0;
  end;

  objPropertyManager.IsOwnedProperty := True;


  if not Assigned(listPropertyID) then
  begin
    listPropertyID := TStringList.Create;
  end else
  begin
    listPropertyID.Free;
    listPropertyID := TStringList.Create;
  end;
  with dmPropertyHub do
    begin

      dsOwners.DataSet := qryOwners;
      qryOwners.SQL.Clear;
      qryOwners.SQL.Add('SELECT * FROM tblOwners WHERE ClientID = ' + IntToStr(iClientID) + ' ORDER BY PropertyID ASC');
      qryOwners.Open;
      qryOwners.First;
      while not qryOwners.Eof do
      begin
        listPropertyID.Add(IntToStr(qryOwners['PropertyID']));
        qryOwners.Next;
      end;
    end;

  ViewFilters(listPropertyID, PANEL_LIMIT, 0);
  if pnlViewMoreContainer.Visible = True then
    pnlViewMore.OnClick(Self);
end;

procedure TfrmClient.pnlViewPropertiesClick(Sender: TObject);
begin
//  if not Assigned(objPropertyManager) then
//  begin
//    objPropertyManager := TPropertyCardManager.Create(scrlbPropertyDetails, gbxListingDetails);
//  end else
//  begin
//    objPropertyManager.Free;
//    objPropertyManager := TPropertyCardManager.Create(scrlbPropertyDetails, gbxListingDetails);
//  end;
//
//  objPropertyManager.Filter('City', 'Vanderbijlpark');
  tbsProperties.Show;
  pcClient.OnChange(self);
end;

procedure TfrmClient.pnlViewPropertiesMouseEnter(Sender: TObject);
begin
 pnlViewProperties.Font.Color := clYellow;
end;

procedure TfrmClient.pnlViewPropertiesMouseLeave(Sender: TObject);
begin
  pnlViewProperties.Font.Color := clWhite;
end;

procedure TfrmClient.ViewFilters(PropertyIDList: TStringList; Limit,
  VisiblePanels: integer);
var
  i : integer;
begin
  for i := VisiblePanels to Limit - 1 do
  begin
    if iPanelAmount = PropertyIDList.Count then
    begin
      exit;
      pnlViewMoreContainer.Visible := False;
    end;

    inc(iPanelAmount);
    objPropertyManager.CardCount := objPropertyManager.CardCount + 1;
    objPropertyManager.Add(StrToInt(PropertyIDList[i]));
  end;

  if iPanelAmount < PropertyIDList.Count then
  begin
    pnlViewMoreContainer.Visible := True;
  end else
  begin
    pnlViewMoreContainer.Visible := False;
  end;

end;

end.
