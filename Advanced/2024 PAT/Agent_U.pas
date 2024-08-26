// Jean-Pierre Joubert
// - Last worked on: cmbxClientsSearch, pcClientsTableOnChange
// - pcClients Search button click
unit Agent_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, pngimage, ComCtrls, ToolWin, StdCtrls, Grids, DBGrids,
  Menus, dmPropertyHub_U, PopupPanel, CustomButtons, ADODB, AgentPropertyCard,
  Spin, Client, IOUtils, ListingDetails, Generics.Collections;

type
  TfrmAgent = class(TForm)
    pnlNavBar: TPanel;
    Image1: TImage;
    pnlManageProperties: TPanel;
    imgPropertiesIcon: TImage;
    pnlManageClients: TPanel;
    imgClientsIcon: TImage;
    pnlManageOffers: TPanel;
    imgOffersIcon: TImage;
    imgNotifications: TImage;
    pcAgent: TPageControl;
    tbsDashboard: TTabSheet;
    pnlToDashboard: TPanel;
    pnlDashboard: TPanel;
    pnlActiveListingsWidget: TPanel;
    pnlPendingOffersWidget: TPanel;
    pnlClientsWidget: TPanel;
    pnlPropertyWidget: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblPendingOffersWidgetAmount: TLabel;
    Label7: TLabel;
    lblActiveListingsWidgetAmount: TLabel;
    lblPropertyAmountWidgetAmount: TLabel;
    lblClientAmountWidgetAmount: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    tbsProperties: TTabSheet;
    pnlHeader: TPanel;
    pnlProperties: TPanel;
    dbgPropertiesTable: TDBGrid;
    pnlPropertiesAdd: TPanel;
    lbledtPropertiesAddStreetAddress: TLabeledEdit;
    lbledtPropertiesAddCity: TLabeledEdit;
    lbledtPropertiesAddPostalCode: TLabeledEdit;
    lbledtPropertiesAddBedrooms: TLabeledEdit;
    lbledtPropertiesAddBathrooms: TLabeledEdit;
    cmbxPropertiesAddProvince: TComboBox;
    cmbxPropertiesAddCategory: TComboBox;
    cmbxPropertiesAddType: TComboBox;
    memPropertiesAddNotes: TMemo;
    Label10: TLabel;
    pcPropertiesTable: TPageControl;
    tbsPropertiesTable: TTabSheet;
    tbsListingsTable: TTabSheet;
    Splitter1: TSplitter;
    lbledtPropertiesAddSqrMeters: TLabeledEdit;
    pnlPopupProperties: TPanel;
    pnlPopupClients: TPanel;
    pnlPopupOffers: TPanel;
    tbsClients: TTabSheet;
    tbsOffers: TTabSheet;
    pnlClients: TPanel;
    pcClientsTable: TPageControl;
    splitClients: TSplitter;
    tbsClientsTable: TTabSheet;
    tbsOwnersTable: TTabSheet;
    pnlClientsAdd: TPanel;
    btnClientsAssignProperties: TPanel;
    pcClients: TPageControl;
    tbsClientsDetails: TTabSheet;
    tbsClientsAdd: TTabSheet;
    tbsClientsAssignProperties: TTabSheet;
    gbxClientsAdd: TGroupBox;
    lbledtClientsAddFirstName: TLabeledEdit;
    lbledtClientsAddLastName: TLabeledEdit;
    lbledtClientsEmail: TLabeledEdit;
    lbledtClientsAddPhone: TLabeledEdit;
    dtpClientsAddDateAdded: TDateTimePicker;
    btnClientsAddSave: TPanel;
    rdgClietsAddAssignProp: TRadioGroup;
    dbgClientsClientsTable: TDBGrid;
    dbgClientsOwnersTable: TDBGrid;
    btnClientsDetails: TPanel;
    btnWidgetActiveListToListings: TPanel;
    btnWidgetPendingOffersToOffers: TPanel;
    btnWidgetPropertyAmountToProperties: TPanel;
    btnWidgetClientAmountToClients: TPanel;
    pnlClientsCurrentClient: TPanel;
    btnPropertiesAdd: TPanel;
    pcProperties: TPageControl;
    tbsPropertiesAdd: TTabSheet;
    tbsPropertiesDetails: TTabSheet;
    btnPropertiesDetails: TPanel;
    pnlClientsSearch: TPanel;
    edtClientsSearch: TEdit;
    cmbxClientsSearch: TComboBox;
    Panel2: TPanel;
    edtPropertiesSearch: TEdit;
    cmbxPropertiesSearch: TComboBox;
    btnPropertiesAddPropertyAdd: TPanel;
    pnlClientsNavigation: TPanel;
    pnlPropertiesNavigation: TPanel;
    pnlPropertiesCurrentPage: TPanel;
    dbgListingsTable: TDBGrid;
    pcClientstbsDetails: TPageControl;
    tbsClientsDetailsGeneral: TTabSheet;
    gbxClientsDetailsDetails: TGroupBox;
    lbledtClientsDetailsFirstName: TLabeledEdit;
    lbledtClientsDetailsLastName: TLabeledEdit;
    lbledtClientsDetailsEmail: TLabeledEdit;
    lbledtClientsDetailsPhone: TLabeledEdit;
    dtpClientsDetailsDateAdded: TDateTimePicker;
    btnClientsDetailsConfirms: TPanel;
    btnClientsDetailsEdit: TPanel;
    btnClientsDetailsDelete: TPanel;
    gbxClientsDetailsProperties: TGroupBox;
    Label12: TLabel;
    pnlClientsGeneralPropertyCount: TPanel;
    btnClientsDetailsManageProperties: TPanel;
    tbsClientsDetailsProperties: TTabSheet;
    scrlbClientsPropertiesDetails: TScrollBox;
    Panel3: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    pnlClientsPropertiesCardPropertyID: TPanel;
    lbledtClientsPropertiesCardCity: TLabeledEdit;
    ComboBox1: TComboBox;
    LabeledEdit5: TLabeledEdit;
    ComboBox2: TComboBox;
    RadioGroup1: TRadioGroup;
    LabeledEdit6: TLabeledEdit;
    LabeledEdit7: TLabeledEdit;
    Memo1: TMemo;
    SpinEdit1: TSpinEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    tbsClientsDetailsFinance: TTabSheet;
    pnlClientsCurrentPage: TPanel;
    pnlClientsSearchConfirm: TPanel;
    lblClientsDetailsDateAddedCaption: TLabel;
    lbledtClientsDetailsUsername: TLabeledEdit;
    lbledtClientsDetailsPassword: TLabeledEdit;
    Label11: TLabel;
    lbledtClientsAddPassword: TLabeledEdit;
    lbledtClientsAddUsername: TLabeledEdit;
    pnlOffersContainer: TPanel;
    pcOffersTable: TPageControl;
    tbsOffersTable: TTabSheet;
    dbgOffers: TDBGrid;
    splitOffers: TSplitter;
    pnlClientsDetailsActions: TPanel;
    pnlClientsDetailsRestore: TPanel;
    pnlClientsDetailsBackup: TPanel;
    odRestoreClients: TFileOpenDialog;
    scrlbPropertiesPropertiesDetails: TScrollBox;
    gbxPropertiesClientDetails: TGroupBox;
    pnlOffersSearch: TPanel;
    edtOffersSearch: TEdit;
    cmbxOffersSearch: TComboBox;
    gbxOfferDetails: TGroupBox;
    gbxOfferActions: TGroupBox;
    pnlOffersAccept: TPanel;
    pnlOffersViewMoreDetails: TPanel;
    pnlOffersReject: TPanel;
    pnlPropertyViewOwnerDetails: TPanel;
    pnlClientAssignProperty: TPanel;
    lbClientsUAProperties: TListBox;
    pnlClientUAPropertyDetails: TPanel;
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure pnlManagePropertiesMouseEnter(Sender: TObject);
    procedure pnlManagePropertiesClick(Sender: TObject);
    procedure btnPropertiesAddPropertyAddClick(Sender: TObject);
    function IsMouseOverControl(control: TControl): Boolean;
    procedure pnlNavBarClick(Sender: TObject);
    procedure pnlToDashboardClick(Sender: TObject);
    procedure pnlManagePropertiesMouseLeave(Sender: TObject);
    procedure imgPropertiesIconMouseEnter(Sender: TObject);
    procedure pnlManageClientsMouseEnter(Sender: TObject);
    procedure pnlManageClientsMouseLeave(Sender: TObject);
    procedure pnlManageOffersMouseEnter(Sender: TObject);
    procedure pnlManageOffersMouseLeave(Sender: TObject);
    procedure imgClientsIconMouseEnter(Sender: TObject);
    procedure imgOffersIconMouseEnter(Sender: TObject);
    procedure pnlManageClientsClick(Sender: TObject);
    procedure pnlManageOffersClick(Sender: TObject);
    procedure pnlToDashboardMouseEnter(Sender: TObject);
    procedure pnlToDashboardMouseLeave(Sender: TObject);
    procedure btnClientsAddSaveClick(Sender: TObject);
    procedure pnlClientsAddClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure pcClientsTableChange(Sender: TObject);
    procedure pcPropertiesTableChange(Sender: TObject);
    procedure btnClientsDetailsClick(Sender: TObject);
    procedure btnClientsAssignPropertiesClick(Sender: TObject);
    procedure dbgClientsClientsTableCellClick(Column: TColumn);
    procedure pnlClientsSearchConfirmClick(Sender: TObject);
    procedure edtClientsSearchChange(Sender: TObject);
    procedure btnClientsDetailsManagePropertiesClick(Sender: TObject);
    procedure btnClientsDetailsEditClick(Sender: TObject);
    procedure btnClientsDetailsDeleteClick(Sender: TObject);
    procedure btnClientsDetailsConfirmsClick(Sender: TObject);
    procedure pnlClientsDetailsBackupClick(Sender: TObject);
    procedure pnlClientsDetailsRestoreClick(Sender: TObject);
    procedure edtPropertiesSearchChange(Sender: TObject);
    procedure dbgPropertiesTableCellClick(Column: TColumn);
    procedure btnPropertiesDetailsClick(Sender: TObject);
    procedure btnPropertiesAddClick(Sender: TObject);
    procedure dbgOffersCellClick(Column: TColumn);
    procedure pnlOffersAcceptClick(Sender: TObject);
    procedure pnlOffersRejectClick(Sender: TObject);
    procedure pnlOffersViewMoreDetailsClick(Sender: TObject);
    procedure pnlPropertyViewOwnerDetailsClick(Sender: TObject);
    procedure btnWidgetPendingOffersToOffersClick(Sender: TObject);
    procedure btnWidgetActiveListToListingsClick(Sender: TObject);
    procedure btnWidgetPropertyAmountToPropertiesClick(Sender: TObject);
    procedure btnWidgetClientAmountToClientsClick(Sender: TObject);
    procedure pcAgentChange(Sender: TObject);
    procedure pnlClientAssignPropertyClick(Sender: TObject);
    procedure pnlClientUAPropertyDetailsClick(Sender: TObject);
  private
    { Private declarations }
    tmrHovering : TTimer;
    btmrHoveringEnabled : boolean;
    TempPopup : TPopupMenu;

    //Clients
    iClientID : integer;
    bClientSelected : boolean;

    // Popup Panels
    popupProperties : TPopupPanel;
    popupClients : TPopupPanel;
    popupOffers : TPopupPanel;

    // Property Cards
    fCardManager : TPropertyCardManager;
    fListingManager : TListingDetailsManager;

    // Clients
    iGridClientID : integer;
    iPropertyCount : integer;
    iPhoneCharCount : integer;
    objClient : TClient;

    // Properties
    iGridPropertyID : integer;

    // Offers
    iOfferID : integer;
    iOfferPropertyID : integer;
    iOfferListingID : integer;
    iOfferClientID : integer;
    iOfferOwnerID, iOfferOwnerClientID : integer;
    rOfferPrice : real;

    // Popup Panels Events
    procedure PopupPropertiesMouseLeave(Sender: TObject);
    procedure PopupClientsMouseLeave(Sender: TObject);
    procedure PopupOffersMouseLeave(Sender: TObject);



    // General
    function CreateID(Table : string; Query : TADOQuery): integer;
    function CheckID(iID: integer):integer;

    // Popups
    procedure propOnClick(Sender: TObject);
    procedure clientOnClick(Sender: TObject);
    procedure offerOnClick(Sender: TObject);

  public
    { Public declarations }
  end;

var
  frmAgent: TfrmAgent;

implementation

{$R *.dfm}

procedure TfrmAgent.btnClientsAddSaveClick(Sender: TObject);
var
  sFirstName, sLastName, sEmail, sPhone, sUsername, sPassword : string;
  dDateAdded : TDateTime;
  sSQL : string;
  iID : integer;
  bValidID : boolean;

  sDirectory : string;
  SearchRec : TSearchRec;
  FileExt : string;
  dir : string;
  sAssignProperty : string;
  i : integer;

begin
  if rdgClietsAddAssignProp.ItemIndex <> -1 then
  begin
    sAssignProperty := rdgClietsAddAssignProp.Items[rdgClietsAddAssignProp.ItemIndex];
  end else
  begin
    ShowMessage('Specify if you want to ' + #9 + 'assign Properties to this client');
    exit;
  end;
  

  iID := CreateID('tblClients', dmPropertyHub.qryClients);
  iID := CheckID(iID);

  sFirstName := lbledtClientsAddFirstName.Text;
  sLastName := lbledtClientsAddLastName.Text;
  sEmail := lbledtClientsEmail.Text;
  sPhone := lbledtClientsAddPhone.Text;
  sUsername := lbledtClientsAddUsername.Text;
  sPassword := lbledtClientsAddPassword.Text;
  dDateAdded := Date;

  sSQL := 'INSERT INTO tblClients ' +
          'VALUES (' + IntToStr(iID) + ',"' + sFirstName + '","' + sLastName + '","' +
          sEmail + '","' + sPhone + '",#' + DateToStr(dDateAdded) + '#,"' + sUsername + '","' + sPassword + '")';

  with dmPropertyHub do
  begin
    qryClients.SQL.Clear;
    qryClients.SQL.Add(sSQL);
    qryClients.ExecSQL;

    qryClients.SQL.Clear;
    qryClients.SQL.Add('SELECT * FROM tblClients ORDER BY ClientID ASC');;
    qryClients.Open;
  end;

  MessageDlg('Client Added', mtInformation, [mbOK], 0);

  if sAssignProperty = 'Yes' then
  begin

    if not Assigned(fCardManager) then
    begin
      fCardManager := TPropertyCardManager.Create(scrlbClientsPropertiesDetails);
    end else
    begin
      fCardManager.Free;
      fCardManager := TPropertyCardManager.Create(scrlbClientsPropertiesDetails);
    end;

    with dmPropertyHub do
    begin
      iID := dbgClientsClientsTable.Columns[0].Field.Value;

      dsOwners.DataSet := qryOwners;
      qryOwners.SQL.Clear;
      qryOwners.SQL.Add('SELECT COUNT(*) as PropertyCount FROM tblOwners WHERE (ClientID = ' + IntToStr(iID) + ')' );
      qryOwners.Open;
      iPropertyCount := qryOwners.FieldByName('PropertyCount').AsInteger;

    end;
    //ShowMessage(IntToStr(iPropertyCount));
    with dmPropertyHub do
    begin
      dsProperties.DataSet := tblProperties;
      dsOwners.DataSet := tblOwners;
      tblOwners.Open;
      tblOwners.First;
      while not tblOwners.Eof do
      begin
        if tblOwners['ClientID'] = iID then
        begin
          fCardManager.Add(tblOwners['PropertyID']);
          fCardManager.MoveLastToFirst;
        end;
        tblOwners.Next;
      end;

      // Adding information to gui components (CLIENT)
  //    dsClients.DataSet := tblClients;
  //    tblClients.Open;
  //    tblClients.Active := True;
      tblClients.Locate('ClientID', iID, []);
      pnlClientsCurrentClient.Caption := tblClients['FirstName'] + ' ' + tblClients['LastName'];
      lbledtClientsDetailsFirstName.Text := tblClients['FirstName'];
      lbledtClientsDetailsLastName.Text := tblClients['LastName'];
      lbledtClientsDetailsEmail.Text := tblClients['Email'];
      lbledtClientsDetailsPhone.Text := tblClients['Phone'];
      dtpClientsDetailsDateAdded.Date := tblClients['DateAdded'];
      lbledtClientsDetailsUsername.Text := tblClients['Username'];
      lbledtClientsDetailsPassword.Text := tblClients['UserPassword'];
      pnlClientsGeneralPropertyCount.Caption := IntToStr(iPropertyCount);
      dsClients.DataSet := qryClients;


    objClient := TClient.Create(iID);
    dsClients.DataSet := qryClients;
  end;


//  for i := 1 to iPropertyCount do
//  begin
//    fCardManager.Add();
//    fCardManager.MoveLastToFirst;
//  end;
    pnlClientAssignProperty.OnClick(self);
  end;
  

end;

procedure TfrmAgent.btnClientsAssignPropertiesClick(Sender: TObject);
var
  lstUAProperties : TStringList;
  i: integer;
begin
  with dmPropertyHub do
  begin
    qryProperties.SQL.Clear;

      
    lstUAProperties := TStringList.Create;

    lstUAProperties.Clear;
    dsProperties.DataSet := tblProperties;
    dsOwners.DataSet := tblOwners;

    tblProperties.First;
    while not tblProperties.Eof do
    begin
      tblOwners.First;
      if tblOwners.Locate('PropertyID', tblProperties['PropertyID'], []) = False then
      begin
        lstUAProperties.Add(IntToStr(tblProperties['PropertyID']));
      end;    
      tblProperties.Next;
    end;
    
    for i := 0 to lstUAProperties.Count - 1 do
    begin
      tblProperties.Locate('PropertyID', StrToInt(lstUAProperties[i]), []);
      lbClientsUAProperties.Items.Add(IntToStr(tblProperties['PropertyID']) + ' | ' + tblProperties['StreetAddress'] + ' | ' + tblProperties['Province']);
    end;
 
    
  end;


  
  tbsClientsAssignProperties.Show;
  pnlClientsCurrentPage.Caption := 'Assign Properties';
end;

procedure TfrmAgent.btnClientsDetailsClick(Sender: TObject);
begin
  tbsClientsDetails.Show;
  pnlClientsCurrentPage.Caption := 'Details';
end;

procedure TfrmAgent.btnClientsDetailsConfirmsClick(Sender: TObject);
var
  sFirstName, sLastName, sEmail, sPhone, sUsername, sPassword: string;
  dDateAdded : TDateTime;
  sSQL : string;
begin
  sFirstName := lbledtClientsDetailsFirstName.Text;
  sLastName := lbledtClientsDetailsLastName.Text;
  sEmail := lbledtClientsDetailsEmail.Text;
  sPhone := lbledtClientsDetailsPhone.Text;
  sUsername := lbledtClientsDetailsUsername.Text;
  sPassword := lbledtClientsDetailsPassword.Text;
  dDateAdded := Date;

  sSQL := 'UPDATE tblClients ' +
          'SET FirstName = "' + sFirstName
          + '", LastName = "' + sLastName
          + '", Email = "' + sEmail
          + '", Phone = "' + sPhone
          + '", DateAdded = #' + DateToStr(dDateAdded)
          + '#, Username = "' + sUsername
          + '", UserPassword = "' + sPassword
          + '" WHERE ClientID = ' + IntToStr(iGridClientID);

  if MessageDlg('Are you sure you want to confirm any changes?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with dmPropertyHub do
    begin
      dsClients.DataSet := qryClients;
      qryClients.SQL.Clear;
      qryClients.SQL.Add(sSQL);
      qryClients.ExecSQL;

      qryClients.SQL.Clear;
      qryClients.SQL.Add('SELECT * FROM tblClients ORDER BY ClientID ASC');
      qryClients.Open;
    end;
  end;
end;

procedure TfrmAgent.btnClientsDetailsDeleteClick(Sender: TObject);
begin
  with dmPropertyHub do
  begin
    dsClients.DataSet :=tblClients;
    if MessageDlg('Are you sure you want to delete ' + tblClients['FirstName'] + '?' + #13 + 'You will lose all associated information with the client', mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      dsClients.DataSet := qryClients;
      qryClients.SQL.Clear;
      qryClients.SQL.Add('DELETE FROM tblClients WHERE ClientID = ' + IntToStr(iGridClientID));
      qryClients.ExecSQL;

      qryClients.SQL.Clear;
      qryClients.SQL.Add('SELECT * FROM tblClients ORDER BY ClientID ASC');
      qryClients.Open;
      ShowMessage('Successfully Deleted');
    end;

  end;
end;

procedure TfrmAgent.btnClientsDetailsEditClick(Sender: TObject);
begin
  lbledtClientsDetailsFirstName.Enabled := True;
  lbledtClientsDetailsLastName.Enabled := True;
  lbledtClientsDetailsPhone.Enabled := True;
  lbledtClientsDetailsEmail.Enabled := True;
  lbledtClientsDetailsUsername.Enabled := True;
  lbledtClientsDetailsPassword.Enabled := True;
end;

procedure TfrmAgent.btnClientsDetailsManagePropertiesClick(Sender: TObject);
begin
  tbsClientsDetailsProperties.Show;
  pnlClientsCurrentPage.Caption := 'Details';
end;

procedure TfrmAgent.btnPropertiesAddClick(Sender: TObject);
begin
  tbsPropertiesAdd.Show;
  pnlPropertiesCurrentPage.Caption := 'Add';
end;

procedure TfrmAgent.btnPropertiesAddPropertyAddClick(Sender: TObject);
var
  iPropertyID, iArea : integer;
  sStreetAddress, sCity, sProvince, sPostalCode, sCategory : string;
  rBedrooms, rBathrooms : real;
  sType : string;
  sSQL : string;
begin
  with dmPropertyHub do
  begin
    qryProperties.SQL.Clear;
    qryProperties.SQL.Add('SELECT COUNT(*) AS RecordCount FROM tblProperties');
    qryProperties.Open;
    iPropertyID := CreateID('tblProperties', qryProperties);

    dsProperties.DataSet := qryProperties;

    sStreetAddress := lbledtPropertiesAddStreetAddress.Text;
    sCity := lbledtPropertiesAddCity.Text;
    sProvince := cmbxPropertiesAddProvince.Text;
    sPostalCode := lbledtPropertiesAddPostalCode.Text;
    sCategory := cmbxPropertiesAddCategory.Text;
    rBedrooms := StrToFloat(lbledtPropertiesAddBedrooms.Text);
    rBathrooms := StrToFloat(lbledtPropertiesAddBathrooms.Text);
    sType := cmbxPropertiesAddType.Text;
    iArea := StrToInt(lbledtPropertiesAddSqrMeters.Text);
    sSQL := 'INSERT INTO tblProperties VALUES (' +
            IntToStr(iPropertyID) + ',"' + sStreetAddress + '","' +
            sCity + '","' + sProvince + '","''' +
            sPostalCode + '","' + sCategory + '","' +
            sType + '",' + FloatToStr(rBedrooms) + ',' +
            FloatToStr(rBathrooms) + ',"' + memPropertiesAddNotes.Text + '",' +
            IntToStr(iArea) + ')';

    qryProperties.SQL.Clear;
    qryProperties.SQL.Add(sSQL);
    qryProperties.ExecSQL;
    qryProperties.SQL.Clear;
    qryProperties.SQL.Add('SELECT * FROM tblProperties');
    qryProperties.Open;
    //dsProperties.DataSet := tblProperties;
  end;
end;

procedure TfrmAgent.btnPropertiesDetailsClick(Sender: TObject);
begin
  tbsPropertiesDetails.Show;
  pnlPropertiesCurrentPage.Caption := 'Details';
end;

procedure TfrmAgent.btnWidgetActiveListToListingsClick(Sender: TObject);
begin
  pnlManageProperties.OnClick(self);
end;

procedure TfrmAgent.btnWidgetClientAmountToClientsClick(Sender: TObject);
begin
  pnlManageClients.OnClick(self);
end;

procedure TfrmAgent.btnWidgetPendingOffersToOffersClick(Sender: TObject);
begin
  pnlManageOffers.OnClick(self);
end;

procedure TfrmAgent.btnWidgetPropertyAmountToPropertiesClick(Sender: TObject);
begin
  pnlManageProperties.OnClick(self);
end;

procedure TfrmAgent.Button1Click(Sender: TObject);
var
  i : integer;
begin
  fCardManager := TPropertyCardManager.Create(scrlbClientsPropertiesDetails);
  for i := 1 to 5 do
  begin
    fCardManager.Add(i);
    fCardManager.MoveLastToFirst;
  end;
end;

procedure TfrmAgent.Button2Click(Sender: TObject);
begin
  fCardManager.Delete(1);
end;

function TfrmAgent.CheckID(iID: integer):integer;
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

procedure TfrmAgent.clientOnClick(Sender: TObject);
var
  tempPanel : TPanel;
begin
  tempPanel := Sender as TPanel;

  pnlManageClients.OnMouseEnter(self);
  pnlManageClients.OnMouseLeave(self);
  pnlManageClients.OnClick(Self);
  if tempPanel.Caption = 'Add' then
  begin 
    tbsClientsAdd.Show;
  end else if tempPanel.Caption = 'Details' then
  begin
    tbsClientsDetails.Show;
  end;
end;

function TfrmAgent.CreateID(Table: string; Query : TADOQuery): integer;
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

procedure TfrmAgent.dbgClientsClientsTableCellClick(Column: TColumn);
var
  i : integer;


begin
  if not Assigned(fCardManager) then
  begin
    fCardManager := TPropertyCardManager.Create(scrlbClientsPropertiesDetails);
  end else
  begin
    fCardManager.Free;
    fCardManager := TPropertyCardManager.Create(scrlbClientsPropertiesDetails);
  end;

  with dmPropertyHub do
  begin
    iGridClientID := dbgClientsClientsTable.Columns[0].Field.Value;

    dsOwners.DataSet := qryOwners;
    qryOwners.SQL.Clear;
    qryOwners.SQL.Add('SELECT COUNT(*) as PropertyCount FROM tblOwners WHERE (ClientID = ' + IntToStr(iGridClientID) + ')' );
    qryOwners.Open;
    iPropertyCount := qryOwners.FieldByName('PropertyCount').AsInteger;

  end;
  //ShowMessage(IntToStr(iPropertyCount));
  with dmPropertyHub do
  begin
    dsProperties.DataSet := tblProperties;
    dsOwners.DataSet := tblOwners;
    tblOwners.Open;
    tblOwners.First;
    while not tblOwners.Eof do
    begin
      if tblOwners['ClientID'] = iGridClientID then
      begin
        fCardManager.Add(tblOwners['PropertyID']);
        fCardManager.MoveLastToFirst;
      end;
      tblOwners.Next;
    end;

    // Adding information to gui components (CLIENT)
//    dsClients.DataSet := tblClients;
//    tblClients.Open;
//    tblClients.Active := True;
    tblClients.Locate('ClientID', iGridClientID, []);
    pnlClientsCurrentClient.Caption := tblClients['FirstName'] + ' ' + tblClients['LastName'];
    lbledtClientsDetailsFirstName.Text := tblClients['FirstName'];
    lbledtClientsDetailsLastName.Text := tblClients['LastName'];
    lbledtClientsDetailsEmail.Text := tblClients['Email'];
    lbledtClientsDetailsPhone.Text := tblClients['Phone'];
    dtpClientsDetailsDateAdded.Date := tblClients['DateAdded'];
    lbledtClientsDetailsUsername.Text := tblClients['Username'];
    lbledtClientsDetailsPassword.Text := tblClients['UserPassword'];
    pnlClientsGeneralPropertyCount.Caption := IntToStr(iPropertyCount);
    dsClients.DataSet := qryClients;


    objClient := TClient.Create(iGridClientID);
    dsClients.DataSet := qryClients;
  end;


//  for i := 1 to iPropertyCount do
//  begin
//    fCardManager.Add();
//    fCardManager.MoveLastToFirst;
//  end;
end;

procedure TfrmAgent.dbgOffersCellClick(Column: TColumn);
var
  objListingDetails : TListingDetailsManager;
  
  Card : TList;
  TempEdit : TEdit;
  TempPanel : TPanel;
  i : Integer;
  lblOfferPrice : TLabel;
begin
  with dmPropertyHub do
  begin
    iOfferID := dbgOffers.Columns[0].Field.Value;
    iOfferListingID := dbgOffers.Columns[1].Field.Value;
    iOfferClientID := dbgOffers.Columns[2].Field.Value;
    rOfferPrice := dbgOffers.Columns[3].Field.Value;

    dsListings.DataSet := qryListings;
    qryListings.SQL.Clear;
    qryListings.SQL.Add('SELECT * FROM tblListings WHERE ListingID = ' + IntToStr(iOfferListingID));
    qryListings.Open;
    iOfferPropertyID := qryListings.FieldByName('PropertyID').AsInteger;
    iOfferOwnerID := qryListings.FieldByName('OwnerID').AsInteger;

    dsOwners.DataSet := qryOwners;
    qryOwners.SQL.Clear;
    qryOwners.SQL.Add('SELECT * FROM tblOwners WHERE OwnerID = ' + IntToStr(iOfferOwnerID));
    qryOwners.Open;
    iOfferOwnerClientID := qryOwners.FieldByName('ClientID').AsInteger;
  end;

  // If Offer is not accepted yet
  objListingDetails := TListingDetailsManager.Create(gbxOfferDetails);
  objListingDetails.Add(iOfferPropertyID);
  Card := objListingDetails.Cards;

  lblOfferPrice := TLabel.Create(Self);
  with lblOfferPrice do
  begin
    Left := 100;
    top := 240;
    Width := 249;
    Height := 33;
    Caption := 'Offer Amount: ' + FloatToStrF(rOfferPrice, ffCurrency, 10, 2);
    Font.Charset := DEFAULT_CHARSET;
    Font.Color := clNavy;
    Font.Size := 18;
    Font.Name := 'Arial';
    Font.Style := [fsBold];
    ParentColor := False;
    ParentFont := False;
    Parent := TListingDetails(Card[0]);
  end;

  for i := 0 to TListingDetails(Card[0]).ControlCount - 1 do
  begin
    if TListingDetails(Card[0]).Controls[i] is TEdit then
    begin
      TempEdit := TListingDetails(Card[0]).Controls[i] as TEdit;
    end else if TListingDetails(Card[0]).Controls[i] is TPanel then
    begin
      TempPanel := TListingDetails(Card[0]).Controls[i] as TPanel;
    end;
  end;

  TempEdit.Free;
  TempPanel.Free;

  gbxOfferActions.Enabled := True;


end;

procedure TfrmAgent.dbgPropertiesTableCellClick(Column: TColumn);
var
  i : integer;


begin

  with dmPropertyHub do
  begin
    dsOwners.DataSet := qryOwners;
    qryOwners.SQL.Clear;
    qryOwners.SQL.Add('SELECT * FROM tblOwners WHERE PropertyID = ' + IntToStr(dbgPropertiesTable.Columns[0].Field.Value));
    qryOwners.Open;
    iOfferOwnerClientID := qryOwners.FieldByName('ClientID').AsInteger;
  end;

  if not Assigned(fCardManager) then
  begin
    fCardManager := TPropertyCardManager.Create(scrlbPropertiesPropertiesDetails);
  end else
  begin
    fCardManager.Free;
    fCardManager := TPropertyCardManager.Create(scrlbPropertiesPropertiesDetails);
  end;


  with dmPropertyHub do
  begin
    iGridPropertyID := dbgPropertiesTable.Columns[0].Field.Value;
  end;
  with dmPropertyHub do
  begin
    fCardManager.Add(iGridPropertyID);
    fCardManager.MoveLastToFirst;
  end;

  pnlPropertyViewOwnerDetails.Visible := True;
end;

procedure TfrmAgent.edtClientsSearchChange(Sender: TObject);
var
 sSQL : string;
begin

  if pcClientsTable.TabIndex = 0 then
  begin
    if edtClientsSearch.Text = '' then
    begin
      with dmPropertyHub do
      begin
        dsClients.DataSet := qryClients;
        qryClients.SQL.Clear;
        qryClients.SQL.Add('SELECT * FROM tblClients');
        qryClients.Open;
      end; // if ''
    end else
    begin
    dmPropertyHub.dsClients.DataSet := dmPropertyHub.qryClients;
      case cmbxClientsSearch.ItemIndex of
        0 : begin
              sSQL := 'SELECT * FROM tblClients WHERE ClientID LIKE "%' + edtClientsSearch.Text + '%"';

            end;
        1 : begin
              sSQL := 'SELECT * FROM tblClients WHERE LCASE(FirstName) LIKE "%' + LowerCase(edtClientsSearch.Text) + '%"';
            end;
        2 : begin
             sSQL := 'SELECT * FROM tblClients WHERE LCASE(LastName) LIKE "%' + LowerCase(edtClientsSearch.Text) + '%"';
            end;
        3 : begin
             sSQL := 'SELECT * FROM tblClients WHERE LCASE(Email) LIKE "%' + LowerCase(edtClientsSearch.Text) + '%"';
            end;
        4 : begin
             sSQL := 'SELECT * FROM tblClients WHERE LCASE(Phone) LIKE "%' + LowerCase(edtClientsSearch.Text) + '%"';
             iPhoneCharCount := Length(edtClientsSearch.Text);
             if (iPhoneCharCount = 3) OR (iPhoneCharCount = 7) then
             begin
              // Simulate Key Press
               keybd_event(VK_SUBTRACT, 0, 0, 0);
               // Release the key
               keybd_event(VK_SUBTRACT, 0, KEYEVENTF_KEYUP, 0);
             end;
            end;
        5 : begin
             sSQL := 'SELECT * FROM tblClients WHERE DateAdded = ';   // dynamic
            end;
        6 : begin
              sSQL := 'SELECT * FROM tblClients WHERE LCASE(Username) LIKE "%' + LowerCase(edtClientsSearch.Text) + '%"';
            end;
        7 : begin
              sSQL := 'SELECT * FROM tblClients WHERE LCASE(UserPassword) LIKE "%' + LowerCase(edtClientsSearch.Text) + '%"';
            end;
      end;
      dmPropertyHub.qryClients.SQL.Clear;
      dmPropertyHub.qryClients.SQL.Add(sSQL);
      dmPropertyHub.qryClients.Open;
    end; //width
  end else if pcClientsTable.TabIndex = 1 then
  begin
if edtClientsSearch.Text = '' then
    begin
      with dmPropertyHub do
      begin
        dsOwners.DataSet := qryOwners;
        qryOwners.SQL.Clear;
        qryOwners.SQL.Add('SELECT * FROM tblOwners');
        qryOwners.Open;
      end; // if ''
    end else
    begin
    dmPropertyHub.dsOwners.DataSet := dmPropertyHub.qryOwners;
      case cmbxClientsSearch.ItemIndex of
        0 : begin
              sSQL := 'SELECT * FROM tblOwners WHERE OwnerID LIKE "%' + LowerCase(edtClientsSearch.Text) + '%"';
            end;
        1 : begin
             sSQL := 'SELECT * FROM tblOwners WHERE ClientID LIKE "%' + LowerCase(edtClientsSearch.Text) + '%"';
            end;
        2 : begin
             sSQL := 'SELECT * FROM tblOwners WHERE PropertyID LIKE "%' + LowerCase(edtClientsSearch.Text) + '%"';
            end;
        3 : begin
             sSQL := 'SELECT * FROM tblOwners WHERE OwnStartDate LIKE "%' + LowerCase(edtClientsSearch.Text) + '%"';
            end;
        4 : begin
             sSQL := 'SELECT * FROM tblOwners WHERE OwnEndDate LIKE "%' + LowerCase(edtClientsSearch.Text) + '%"';
            end;
      end;
      dmPropertyHub.qryOwners.SQL.Clear;
      dmPropertyHub.qryOwners.SQL.Add(sSQL);
      dmPropertyHub.qryOwners.Open;
    end; //width
  end;


//  if edtClientsSearch.Text = '' then
//  begin
//
//  end;
end;

procedure TfrmAgent.edtPropertiesSearchChange(Sender: TObject);
var
 sSQL : string;
begin
  if pcPropertiesTable.TabIndex = 0 then
  begin
    if edtPropertiesSearch.Text = '' then
    begin
      with dmPropertyHub do
      begin
        dsProperties.DataSet := qryProperties;
        qryProperties.SQL.Clear;
        qryProperties.SQL.Add('SELECT * FROM tblProperties');
        qryProperties.Open;
      end; // if ''
    end else
    begin
    dmPropertyHub.dsProperties.DataSet := dmPropertyHub.qryProperties;
      case cmbxPropertiesSearch.ItemIndex of
        0 : begin
              sSQL := 'SELECT * FROM tblProperties WHERE PropertyID LIKE "%' + edtPropertiesSearch.Text + '%"';

            end;
        1 : begin
              sSQL := 'SELECT * FROM tblProperties WHERE LCASE(StreetAddress) LIKE "%' + LowerCase(edtPropertiesSearch.Text) + '%"';
            end;
        2 : begin
             sSQL := 'SELECT * FROM tblProperties WHERE LCASE(City) LIKE "%' + LowerCase(edtPropertiesSearch.Text) + '%"';
            end;
        3 : begin
             sSQL := 'SELECT * FROM tblProperties WHERE LCASE(Province) LIKE "%' + LowerCase(edtPropertiesSearch.Text) + '%"';
            end;
        4 : begin
             sSQL := 'SELECT * FROM tblProperties WHERE LCASE(PostalCode) LIKE "%' + LowerCase(edtPropertiesSearch.Text) + '%"';
            end;
        5 : begin
             sSQL := 'SELECT * FROM tblProperties WHERE LCASE(Category) LIKE "%' + LowerCase(edtPropertiesSearch.Text) + '%"';
            end;
        6 : begin
              sSQL := 'SELECT * FROM tblProperties WHERE LCASE(Type) LIKE "%' + LowerCase(edtPropertiesSearch.Text) + '%"';
            end;
        7 : begin
              sSQL := 'SELECT * FROM tblProperties WHERE Bedrooms LIKE "%' + edtPropertiesSearch.Text + '%"';
            end;
        8 : begin
              sSQL := 'SELECT * FROM tblProperties WHERE Bathrooms LIKE "%' + edtPropertiesSearch.Text + '%"';
            end;
        9 : begin
              sSQL := 'SELECT * FROM tblProperties WHERE Notes LIKE "%' + LowerCase(edtPropertiesSearch.Text) + '%"';
            end;
        10 : begin
              sSQL := 'SELECT * FROM tblProperties WHERE SqrMeters LIKE "%' + edtPropertiesSearch.Text + '%"';
            end;
      end;
      dmPropertyHub.qryProperties.SQL.Clear;
      dmPropertyHub.qryProperties.SQL.Add(sSQL);
      dmPropertyHub.qryProperties.Open;
    end; //width
  end else if pcPropertiesTable.TabIndex = 1 then
  begin
if edtPropertiesSearch.Text = '' then
    begin
      with dmPropertyHub do
      begin
        dsListings.DataSet := qryListings;
        qryListings.SQL.Clear;
        qryListings.SQL.Add('SELECT * FROM tblListings');
        qryListings.Open;
      end; // if ''
    end else
    begin
    dmPropertyHub.dsListings.DataSet := dmPropertyHub.qryListings;
      case cmbxPropertiesSearch.ItemIndex of
        0 : begin
              sSQL := 'SELECT * FROM tblListings WHERE ListingID LIKE "%' + edtPropertiesSearch.Text + '%"';
            end;
        1 : begin
             sSQL := 'SELECT * FROM tblListings WHERE PropertyID LIKE "%' + edtPropertiesSearch.Text + '%"';
            end;
        2 : begin
             sSQL := 'SELECT * FROM tblListings WHERE OwnerID LIKE "%' + edtPropertiesSearch.Text + '%"';
            end;
        3 : begin
             sSQL := 'SELECT * FROM tblListings WHERE Price LIKE "%' + edtPropertiesSearch.Text + '%"';
            end;
        4 : begin
             sSQL := 'SELECT * FROM tblListings WHERE ListDate LIKE "%' + LowerCase(edtPropertiesSearch.Text) + '%"';
            end;
        5 : begin
             sSQL := 'SELECT * FROM tblListings WHERE SaleStatus LIKE "%' + LowerCase(edtPropertiesSearch.Text) + '%"';
            end;
      end;
      dmPropertyHub.qryListings.SQL.Clear;
      dmPropertyHub.qryListings.SQL.Add(sSQL);
      dmPropertyHub.qryListings.Open;
    end; //width
  end;
end;

procedure TfrmAgent.FormActivate(Sender: TObject);
var
  i: Integer;
begin
  // Design
  pnlNavBar.Color := RGB(0, 42, 102);
  pnlManageProperties.ParentBackground := True;
  pnlManageClients.ParentBackground := True;
  pnlManageOffers.ParentBackground := True;
  pnlToDashboard.ParentBackground := True;
  pnlDashboard.Color := RGB(173,216,230);
  pnlActiveListingsWidget.Color := rgb(35, 40, 45);
  pnlPendingOffersWidget.Color := rgb(35, 40, 45);
  pnlPropertyWidget.Color := rgb(35, 40, 45);
  pnlClientsWidget.Color := rgb(35, 40, 45);
  pnlHeader.Color := RGB(70, 130, 180);
  pnlHeader.Font.Color := clYellow;
  pnlProperties.Color := pnlDashboard.Color;
  pnlClients.Color := pnlDashboard.Color;
  pnlPopupProperties.Color := clWhite;
  pnlPopupClients.Color := clWhite;
  pnlPopupOffers.Color := clWhite;

  pnlPopupProperties.Visible := False;
  pnlPopupClients.Visible := False;
  pnlPopupOffers.Visible := False;

  // Clients Details
  gbxClientsAdd.Color := rgb(100, 100, 100);
  gbxClientsDetailsDetails.Color := rgb(100, 100, 100);
  gbxClientsDetailsProperties.Color := rgb(100, 100, 100);
  pnlClientsDetailsActions.Color := rgb(100, 100, 100);

  for i := 0 to pcAgent.PageCount - 1 do
  begin
    pcAgent.Pages[i].TabVisible := False;
  end;

  pnlManageProperties.OnMouseEnter(self);
  pnlManageProperties.OnMouseLeave(self);
  pnlManageProperties.onclick(self);


  pnlManageOffers.OnMouseEnter(self);
  pnlManageOffers.OnMouseLeave(self);
  pnlManageOffers.onclick(self);

  pnlManageClients.OnMouseEnter(self);
  pnlManageClients.OnMouseLeave(self);
  pnlManageClients.onclick(self);

  pnlToDashboard.OnClick(self);



  bClientSelected := False;
end;

procedure TfrmAgent.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Self.Hide;
  Application.MainForm.Show;
end;

procedure TfrmAgent.imgPropertiesIconMouseEnter(Sender: TObject);
begin
  pnlManageProperties.OnMouseEnter(nil);
end;

procedure TfrmAgent.imgClientsIconMouseEnter(Sender: TObject);
begin
  pnlManageClients.OnMouseEnter(nil);
end;

procedure TfrmAgent.imgOffersIconMouseEnter(Sender: TObject);
begin
  pnlManageOffers.OnMouseEnter(nil);
end;

function TfrmAgent.IsMouseOverControl(control: TControl): Boolean;
var
  p: TPoint;
  r: TRect;
begin
  p := control.ScreenToClient(Mouse.CursorPos);
  r := Rect(0, 0, control.Width, control.Height);
  Result := PtInRect(r, p);
end;

procedure TfrmAgent.offerOnClick(Sender: TObject);
var
  tempPanel : TPanel;
begin
  tempPanel := Sender as TPanel;

  if tempPanel.Caption = 'View Offers' then
  begin 
    tbsOffers.Show;
  end;
  
end;

procedure TfrmAgent.pcAgentChange(Sender: TObject);
var
  iPendingOffers, iActiveListings, iPropertyAmount, iClientAmount : integer;
begin
  if pcAgent.ActivePageIndex = 0 then
  begin
    with dmPropertyHub do
    begin
      iPendingOffers := 0;
      iActiveListings := 0;
      iPropertyAmount := 0;
      iClientAmount := 0;

      dsOffers.DataSet := qryOffers;
      dsListings.DataSet := qryListings;
      dsProperties.DataSet := qryProperties;
      dsClients.DataSet := qryClients;

      qryOffers.SQL.Clear;
      qryOffers.SQL.Add('SELECT COUNT(*) AS OfferCount FROM tblOffers');
      qryOffers.Open;

      qryListings.SQL.Clear;
      qryListings.SQL.Add('SELECT COUNT(*) AS ListingCount FROM tblListings');
      qryListings.Open;

      qryProperties.SQL.Clear;
      qryProperties.SQL.Add('SELECT COUNT(*) AS PropertyCount FROM tblProperties');
      qryProperties.Open;

      qryClients.SQL.Clear;
      qryClients.SQL.Add('SELECT COUNT(*) AS ClientCount FROM tblClients');
      qryClients.Open;


      iPendingOffers := qryOffers.FieldByName('OfferCount').AsInteger;
      iActiveListings := qryListings.FieldByName('ListingCount').AsInteger;
      iPropertyAmount := qryProperties.FieldByName('PropertyCount').AsInteger;
      iClientAmount := qryClients.FieldByName('ClientCount').AsInteger;
    end;
  end;

  lblPendingOffersWidgetAmount.Caption := IntToStr(iPendingOffers);
  lblActiveListingsWidgetAmount.Caption := IntToStr(iActiveListings);
  lblPropertyAmountWidgetAmount.Caption := IntToStr(iPropertyAmount);
  lblClientAmountWidgetAmount.Caption := IntToStr(iClientAmount);


end;

procedure TfrmAgent.pcClientsTableChange(Sender: TObject);
var
  i : integer;
begin
  with dmPropertyHub do
  begin
    cmbxClientsSearch.Clear;
    if pcClientsTable.ActivePageIndex = 0 then
    begin
      dsClients.DataSet := tblClients;
      iPhoneCharCount := 0;
      for i := 0 to tblClients.FieldCount - 1 do
      begin
        cmbxClientsSearch.Items.Add(tblClients.Fields[i].FieldName);
      end;
    end else if pcClientsTable.ActivePageIndex = 1 then
    begin
      dsOwners.DataSet := tblOwners;
      for i := 0 to tblOwners.FieldCount - 1 do
      begin
        cmbxClientsSearch.Items.Add(tblOwners.Fields[i].FieldName);
      end;
    end;
    cmbxClientsSearch.ItemIndex := 0;
    dsClients.DataSet := qryClients;
    dsOwners.DataSet := qryOwners;

  end;
  edtClientsSearch.Clear;
end;

procedure TfrmAgent.pcPropertiesTableChange(Sender: TObject);
var
  i : integer;
begin
  with dmPropertyHub do
  begin
    cmbxPropertiesSearch.Clear;
    if pcPropertiesTable.ActivePageIndex = 0 then
    begin
      dsProperties.DataSet := tblProperties;
      for i := 0 to tblProperties.FieldCount - 1 do
      begin
        cmbxPropertiesSearch.Items.Add(tblProperties.Fields[i].FieldName);
      end;
    end else if pcPropertiesTable.ActivePageIndex = 1 then
    begin
      dsOwners.DataSet := tblListings;
      for i := 0 to tblListings.FieldCount - 1 do
      begin
        cmbxPropertiesSearch.Items.Add(tblListings.Fields[i].FieldName);
      end;

    end;

    cmbxPropertiesSearch.ItemIndex := 0;

  end;
end;

procedure TfrmAgent.pnlClientAssignPropertyClick(Sender: TObject);
var
  iUAPropertyID : integer;
  sLine : string;
  iPos : integer;
  iOwnerID : integer;
begin
  sLine := lbClientsUAProperties.Items[lbClientsUAProperties.ItemIndex];
  iPos := pos(' ', sLine);
  iUAPropertyID := StrToInt(copy(sLine, 1, iPos - 1)); 
  if iGridClientID <> 0 then
  begin  
    with dmPropertyHub do
    begin
      iOwnerID := CreateID('tblOwners', qryOwners);
      dsOwners.DataSet := tblOwners;
      tblOwners.Insert;
      tblOwners['OwnerID'] := iOwnerID;
      tblOwners['ClientID'] := iGridClientID;
      tblOwners['PropertyID'] := iUAPropertyID;
      tblOwners['OwnStartDate'] := Date;
      tblOwners.Post;
    end;

    ShowMessage('Property Successfully Assigned'); 
    pnlClientAssignProperty.OnClick(Self); 
  end else
  begin
    ShowMessage('Please select a Client from the Grid');
    exit;  
  end;
  
  



end;

procedure TfrmAgent.pnlClientsAddClick(Sender: TObject);
begin
  tbsClientsAdd.Show;
  pnlClientsCurrentPage.Caption := 'Add';
  //gbxClientsAdd.Visible := True;
end;

procedure TfrmAgent.pnlClientsDetailsBackupClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to Backup this Client with their Properties', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    objClient.BackupAll;
  end;
end;

procedure TfrmAgent.pnlClientsDetailsRestoreClick(Sender: TObject); // NEW
var
  iID : integer;
begin

  iID := StrToInt(InputBox('ClientID', 'Enter the ClientID to Restore', ''));

  if Assigned(objClient) then
  begin
    objClient.Free;
    objClient := TClient.Create(iID);
  end else
  begin
    objClient := TClient.Create(iID);
  end;

  objClient.RestoreClient(iID);



end;

procedure TfrmAgent.pnlClientsSearchConfirmClick(Sender: TObject);      // Client Table Search
//var
  //sSQL : string;
begin
//  if pcClientsTable.TabIndex = 0 then
//  begin
//    with dmPropertyHub do
//    begin
//      dsClients.DataSet := qryClients;
//      case cmbxClientsSearch.ItemIndex of
//        0 : begin
//              sSQL := 'SELECT * FROM tblClients WHERE ClientID =' + edtClientsSearch.Text;
//
//            end;
//        1 : begin
//              sSQL := 'SELECT * FROM tblClients WHERE LCASE(FirstName) LIKE "%' + LowerCase(edtClientsSearch.Text) + '%"';
//            end;
//        2 : begin
//             sSQL := 'SELECT * FROM tblClients WHERE LCASE(LastName) LIKE "%' + LowerCase(edtClientsSearch.Text) + '%"';
//            end;
//        3 : begin
//             sSQL := 'SELECT * FROM tblClients WHERE LCASE(Email) LIKE "%' + LowerCase(edtClientsSearch.Text) + '%"';
//            end;
//        4 : begin
//             sSQL := 'SELECT * FROM tblClients WHERE LCASE(Phone) LIKE "%' + LowerCase(edtClientsSearch.Text) + '%"';
//            end;
//        5 : begin
//             sSQL := 'SELECT * FROM tblClients WHERE DateAdded = ';   // dynamic
//            end;
//      end;
//      qryClients.SQL.Clear;
//      qryClients.SQL.Add(sSQL);
//      qryClients.Open;
//    end;
//  end else if pcClientsTable.TabIndex = 1 then
//  begin
//
//  end;

end;

procedure TfrmAgent.pnlClientUAPropertyDetailsClick(Sender: TObject);
var
  i : integer;
  iPos : integer;
  sline : string;
  iUAPropertyID : integer;
begin
  sLine := lbClientsUAProperties.Items[lbClientsUAProperties.ItemIndex];
  iPos := pos(' ', sLine);
  iUAPropertyID := StrToInt(copy(sLine, 1, iPos - 1)); 
  with dmPropertyHub do
  begin
    dsOwners.DataSet := qryOwners;
    qryOwners.SQL.Clear;
    qryOwners.SQL.Add('SELECT * FROM tblOwners WHERE PropertyID = ' + IntToStr(iUAPropertyID));
    qryOwners.Open;
    iOfferOwnerClientID := qryOwners.FieldByName('ClientID').AsInteger;
  end;

  if not Assigned(fCardManager) then
  begin
    fCardManager := TPropertyCardManager.Create(scrlbPropertiesPropertiesDetails);
  end else
  begin
    fCardManager.Free;
    fCardManager := TPropertyCardManager.Create(scrlbPropertiesPropertiesDetails);
  end;


  with dmPropertyHub do
  begin
    iGridPropertyID := iUAPropertyID;
  end;
  with dmPropertyHub do
  begin
    fCardManager.Add(iGridPropertyID);
    fCardManager.MoveLastToFirst;
  end;
  pnlPropertyViewOwnerDetails.Visible := False;
  tbsPropertiesDetails.Show;
end;

procedure TfrmAgent.pnlManageClientsClick(Sender: TObject);
begin
  if bClientSelected = False then
  begin
    //
  end;
  popupClients.Close;
  pnlHeader.Caption := 'Clients';
  pcClientsTable.OnChange(Self);
  with dmPropertyHub do
  begin
    dsClients.DataSet := qryClients;
    //qryClients.Close;
    qryClients.SQL.Clear;
    qryClients.SQL.Add('SELECT * FROM tblClients ORDER BY ClientID ASC');
    qryClients.Open;

    dsOwners.DataSet := qryOwners;
    //qryOwners.Close;
    qryOwners.SQL.Clear;
    qryOwners.SQL.Add('SELECT * FROM tblOwners ORDER BY OwnerID ASC');
    qryOwners.Open;
  end;

  tbsClients.Show;
end;

procedure TfrmAgent.pnlManageClientsMouseEnter(Sender: TObject);
var                                                                    // Just popup the popupmenu with all the items invisible at 0, 0
  Point : TPoint;
  i : integer;
  popupCustomButton : TCustomButtons;
  lstClientButtons : TList<TPanel>;
begin
  pnlManageClients.Font.Color := clYellow;
  Point.X := pnlManageClients.Left;
  Point.Y := pnlManageClients.Top + pnlManageClients.Height;

  if NOT Assigned(popupClients) then
  begin
    popupClients := TPopupPanel.Create(pnlPopupClients);
    with popupClients do
    begin
      Add('Add');
      Add('Details');
      // Add('Reports');
    end;

    lstClientButtons := popupClients.Buttons;

    for i := 0 to lstClientButtons.Count - 1 do
    begin
      lstClientButtons[i].OnClick := clientOnclick;
    end;

    for i := 0 to popupClients.Count - 1 do
    begin
      popupCustomButton := TCustomButtons.Create(popupClients.GetPanel(i));
      with popupCustomButton do
      begin
        //Hover.HorizontalGradient(RGB(135, 206, 235), RGB(192, 192, 192) );
        Hover.Color := RGB(135, 206, 235);
        Click.Color := RGB(125, 195, 225);
      end;
      popupClients.GetPanel(i).OnMouseLeave := PopupClientsMouseLeave;
      popupClients.GetPanel(i).BevelInner := bvNone;
      popupClients.GetPanel(i).BevelKind := bkNone;
      popupClients.GetPanel(i).BevelOuter := bvNone;
      popupClients.GetPanel(i).Font.Style := [fsBold];
    end;
  end;

    popupClients.Popup(pnlPopupClients.Left, pnlPopupClients.Top);
    pnlPopupClients.OnMouseLeave := popupClientsMouseLeave;
end;

procedure TfrmAgent.pnlManageClientsMouseLeave(Sender: TObject);
var
  i: Integer;
begin
  pnlManageClients.Font.Color := clWhite;
  if IsMouseOverControl(pnlPopupClients) = False then
  begin
    if popupClients.Count > 0 then
    begin
        popupClients.Close;
    end;

  end;
end;

procedure TfrmAgent.pnlManageOffersClick(Sender: TObject);
var
  sSQL : string;
begin
  tbsOffers.Show;
  popupOffers.Close;
  pnlHeader.Caption := 'Offers';

  sSQL := 'SELECT * FROM tblOffers ORDER BY OfferID';

  with dmPropertyHub do
  begin
    qryOffers.SQL.Clear;
    qryOffers.SQL.Add(sSQL);
    qryOffers.Open;
  end;
  pcPropertiesTable.OnChange(Self);

end;

procedure TfrmAgent.pnlManageOffersMouseEnter(Sender: TObject);
var
  Point : TPoint;
  i : integer;
  popupCustomButton : TCustomButtons;
  lstOfferButtons : TList<TPanel>;
begin
  pnlManageOffers.Font.Color := clYellow;
  Point.X := pnlManageOffers.Left;
  Point.Y := pnlManageoffers.Top + pnlManageoffers.Height;

  if NOT Assigned(popupoffers) then
  begin
    popupoffers := TPopupPanel.Create(pnlPopupoffers);
    with popupoffers do
    begin
      Add('View Offers');
    end;

    lstOfferButtons := popupOffers.Buttons;

    for i := 0 to lstOfferButtons.Count - 1 do
    begin
      lstOfferButtons[i].OnClick := offerOnclick;
    end;

    for i := 0 to popupoffers.Count - 1 do
    begin
      popupCustomButton := TCustomButtons.Create(popupoffers.GetPanel(i));
      with popupCustomButton do
      begin
        //Hover.HorizontalGradient(RGB(135, 206, 235), RGB(192, 192, 192) );
        Hover.Color := RGB(135, 206, 235);
        Click.Color := RGB(125, 195, 225);
      end;
      popupoffers.GetPanel(i).OnMouseLeave := PopupOffersMouseLeave;
      popupoffers.GetPanel(i).BevelInner := bvNone;
      popupoffers.GetPanel(i).BevelKind := bkNone;
      popupoffers.GetPanel(i).BevelOuter := bvNone;
      popupoffers.GetPanel(i).Font.Style := [fsBold];
    end;
  end;

    popupoffers.Popup(pnlPopupoffers.Left, pnlPopupoffers.Top);
    pnlPopupoffers.OnMouseLeave := PopupOffersMouseLeave;

end;

procedure TfrmAgent.pnlManageOffersMouseLeave(Sender: TObject);
var
  i: Integer;
begin
  pnlManageOffers.Font.Color := clWhite;
  if IsMouseOverControl(pnlPopupOffers) = False then
  begin
    if popupOffers.Count > 0 then
    begin
        popupOffers.Close;
    end;

  end;
end;

procedure TfrmAgent.pnlManagePropertiesClick(Sender: TObject);
var
  sSQL : string;
begin
  tbsProperties.Show;
  popupProperties.Close;
  pnlHeader.Caption := 'Properties';
  sSQL := 'SELECT * FROM tblProperties ORDER BY PropertyID';
  with dmPropertyHub do
  begin
    qryProperties.SQL.Clear;
    qryProperties.SQL.Add(sSQL);
    qryProperties.Open;
  end;
  sSQL := 'SELECT * FROM tblListings ORDER BY ListingID';
  with dmPropertyHub do
  begin
    qryListings.SQL.Clear;
    qryListings.SQL.Add(sSQL);
    qryListings.Open;
  end;
  pcPropertiesTable.OnChange(Self);
end;

procedure TfrmAgent.pnlManagePropertiesMouseEnter(Sender: TObject);
var
  Point : TPoint;
  i : integer;
  popupCustomButton : TCustomButtons;
  lstPropButtons : TList<TPanel>;
begin
  pnlManageProperties.Font.Color := clYellow;
  Point.X := pnlManageProperties.Left;
  Point.Y := pnlManageProperties.Top + pnlManageProperties.Height;

  if NOT Assigned(popupProperties) then
  begin
    popupProperties := TPopupPanel.Create(pnlPopupProperties);
    with popupProperties do
    begin
      Add('Add');
      Add('Details');
    end;

    lstPropButtons := popupProperties.Buttons;

    for i := 0 to lstPropButtons.Count - 1 do
    begin
      lstPropButtons[i].OnClick := propOnclick;
    end;


    for i := 0 to popupProperties.Count - 1 do
    begin
      popupCustomButton := TCustomButtons.Create(popupProperties.GetPanel(i));
      with popupCustomButton do
      begin
        //Hover.HorizontalGradient(RGB(135, 206, 235), RGB(192, 192, 192) );
        Hover.Color := RGB(135, 206, 235);
        Click.Color := RGB(125, 195, 225);
      end;
      popupProperties.GetPanel(i).OnMouseLeave := popupPropertiesMouseLeave;
      popupProperties.GetPanel(i).BevelInner := bvNone;
      popupProperties.GetPanel(i).BevelKind := bkNone;
      popupProperties.GetPanel(i).BevelOuter := bvNone;
      popupProperties.GetPanel(i).Font.Style := [fsBold];
    end;
  end;

    popupProperties.Popup(pnlPopupProperties.Left, pnlpopupProperties.Top);
    pnlPopupProperties.OnMouseLeave := PopupPropertiesMouseLeave;



end;

procedure TfrmAgent.pnlManagePropertiesMouseLeave(Sender: TObject);
var
  i: Integer;
begin
  pnlManageProperties.Font.Color := clWhite;
  if IsMouseOverControl(pnlPopupProperties) = False then
  begin
    if popupProperties.Count > 0 then
    begin
        popupProperties.Close;
    end;

  end;

end;

procedure TfrmAgent.pnlNavBarClick(Sender: TObject);
begin
 //
end;

procedure TfrmAgent.pnlOffersAcceptClick(Sender: TObject);
var
  iOwnerID : integer;
  iSaleID : integer;

  iOwnerClientID : integer;
  iListingOwnerID : integer;
begin
  with dmPropertyHub do
  begin
    dsOffers.DataSet := qryOffers;
    qryOffers.SQL.Clear;
    qryOffers.SQL.Add('UPDATE tblOffers SET OfferStatus = "Accepted" WHERE OfferID = ' + IntToStr(iOfferID));
    qryOffers.ExecSQL;

    qryOffers.SQL.Clear;
    qryOffers.SQL.Add('SELECT * FROM tblOffers');
    qryOffers.Open;

    dsListings.DataSet := qryListings;
    qryListings.SQL.Clear;
    qryListings.SQL.Add('SELECT * FROM tblListings WHERE ListingID = ' + IntToStr(iOfferListingID));
    qryListings.Open;

    iListingOwnerID := qryListings.FieldByName('OwnerID').AsInteger;

    dsOwners.DataSet := qryOwners;
    qryOwners.SQL.Clear;
    qryOwners.SQL.Add('SELECT * FROM tblOwners WHERE OwnerID = ' + IntToStr(iListingOwnerID));
    qryOwners.Open;

    iOwnerClientID := qryOwners.FieldByName('ClientID').AsInteger;
    

    qryListings.SQL.Clear;
    qryListings.SQL.Add('DELETE FROM tblListings WHERE ListingID = ' + IntToStr(iOfferListingID));
    qryListings.ExecSQL;

    iOwnerID := CreateID('tblOwners', qryOwners);
    dsOwners.DataSet := tblOwners;
    tblOwners.Insert;
    tblOwners['OwnerID'] := iOwnerID;
    tblOwners['ClientID'] := iOfferClientID;
    tblOwners['PropertyID'] := iOfferPropertyID;
    tblOwners['OwnStartDate'] := Date;
    tblOwners.Post;

    dsProperties.DataSet := qryProperties;
    qryProperties.SQL.Clear;
    qryProperties.SQL.Add('UPDATE tblProperties SET Type = "None" WHERE PropertyID = ' + IntToStr(iOfferPropertyID));
    qryProperties.ExecSQL;

    // Adding to Sales
    iSaleID := CreateID('tblSales', qrySales);
    dsSales.DataSet := qrySales;
    qrySales.SQL.Clear;
    qrySales.SQL.Add('INSERT INTO tblSales VALUES (' + IntToStr(iSaleID) + ',' + IntToStr(iOwnerClientID) + ',' + IntToStr(iOfferPropertyID) + ',' + IntToStr(iOfferClientID) + 
    ',' + FloatToStr(rOfferPrice) + ',#' + DateToStr(Date) + '#)');
    qrySales.ExecSQL;

  end;
end;

procedure TfrmAgent.pnlOffersRejectClick(Sender: TObject);
begin
  with dmPropertyHub do
  begin
    dsOffers.DataSet := qryOffers;
    qryOffers.SQL.Clear;
    qryOffers.SQL.Add('UPDATE tblOffers SET OfferStatus = "Rejected" WHERE OfferID = ' + IntToStr(iOfferID));
    qryOffers.ExecSQL;

    qryOffers.SQL.Clear;
    qryOffers.SQL.Add('SELECT * FROM tblOffers');
    qryOffers.Open;
  end;
end;

procedure TfrmAgent.pnlOffersViewMoreDetailsClick(Sender: TObject);
var
  i : integer;
begin
  tbsPropertiesDetails.Show;
  if not Assigned(fCardManager) then
  begin
    fCardManager := TPropertyCardManager.Create(scrlbPropertiesPropertiesDetails);
  end else
  begin
    fCardManager.Free;
    fCardManager := TPropertyCardManager.Create(scrlbPropertiesPropertiesDetails);
  end;

  if not Assigned(fListingManager) then
  begin
    fListingManager := TListingDetailsManager.Create(gbxPropertiesClientDetails);
  end else
  begin
    fListingManager.Free;
    fListingManager := TListingDetailsManager.Create(gbxPropertiesClientDetails);
  end;

  with dmPropertyHub do
  begin
    fCardManager.Add(iOfferPropertyID);
    fCardManager.MoveLastToFirst;
  end;


end;

procedure TfrmAgent.pnlPropertyViewOwnerDetailsClick(Sender: TObject);
begin

  if not Assigned(fCardManager) then
  begin
    fCardManager := TPropertyCardManager.Create(scrlbClientsPropertiesDetails);
  end else
  begin
    fCardManager.Free;
    fCardManager := TPropertyCardManager.Create(scrlbClientsPropertiesDetails);
  end;

  with dmPropertyHub do
  begin
    dsOwners.DataSet := qryOwners;
    qryOwners.SQL.Clear;
    qryOwners.SQL.Add('SELECT COUNT(*) as PropertyCount FROM tblOwners WHERE (ClientID = ' + IntToStr(iOfferOwnerClientID) + ')' );
    qryOwners.Open;
    iPropertyCount := qryOwners.FieldByName('PropertyCount').AsInteger;

  end;
  //ShowMessage(IntToStr(iPropertyCount));
  with dmPropertyHub do
  begin
    dsProperties.DataSet := tblProperties;
    dsOwners.DataSet := tblOwners;
    tblOwners.Open;
    tblOwners.First;
    while not tblOwners.Eof do
    begin
      if tblOwners['ClientID'] = iOfferOwnerClientID then
      begin
        fCardManager.Add(tblOwners['PropertyID']);
        fCardManager.MoveLastToFirst;
      end;
      tblOwners.Next;
    end;

    // Adding information to gui components (CLIENT)
//    dsClients.DataSet := tblClients;
//    tblClients.Open;
//    tblClients.Active := True;
    tblClients.Locate('ClientID', iOfferOwnerClientID, []);
    pnlClientsCurrentClient.Caption := tblClients['FirstName'] + ' ' + tblClients['LastName'];
    lbledtClientsDetailsFirstName.Text := tblClients['FirstName'];
    lbledtClientsDetailsLastName.Text := tblClients['LastName'];
    lbledtClientsDetailsEmail.Text := tblClients['Email'];
    lbledtClientsDetailsPhone.Text := tblClients['Phone'];
    dtpClientsDetailsDateAdded.Date := tblClients['DateAdded'];
    lbledtClientsDetailsUsername.Text := tblClients['Username'];
    lbledtClientsDetailsPassword.Text := tblClients['UserPassword'];
    pnlClientsGeneralPropertyCount.Caption := IntToStr(iPropertyCount);
    dsClients.DataSet := qryClients;


    objClient := TClient.Create(iOfferOwnerClientID);
    dsClients.DataSet := qryClients;
  end;
  tbsClientsDetails.Show;
end;

procedure TfrmAgent.pnlToDashboardClick(Sender: TObject);
begin
  pcAgent.ActivePageIndex := 0;
  pcAgent.OnChange(self);
  pnlHeader.Caption := 'Dashboard';
end;

procedure TfrmAgent.pnlToDashboardMouseEnter(Sender: TObject);
begin
  pnlToDashboard.Font.Color := clYellow;
end;

procedure TfrmAgent.pnlToDashboardMouseLeave(Sender: TObject);
begin
  pnlToDashboard.Font.Color := clWhite;
end;

procedure TfrmAgent.PopupClientsMouseLeave(Sender: TObject);
var
  i: Integer;
begin
  if IsMouseOverControl(pnlPopupClients) = False then
  begin
    if (IsMouseOverControl(pnlManageClients) = False) then
    begin
      popupClients.Close;
    end;

  end
end;

procedure TfrmAgent.PopupOffersMouseLeave(Sender: TObject);
var
  i: Integer;
begin
  if IsMouseOverControl(pnlPopupOffers) = False then
  begin
    if (IsMouseOverControl(pnlManageOffers) = False) then
    begin
      popupOffers.Close;
    end;

  end;
end;

procedure TfrmAgent.PopupPropertiesMouseLeave(Sender: TObject);
var
  i: Integer;
begin
  if IsMouseOverControl(pnlPopupProperties) = False then
  begin
    if (IsMouseOverControl(pnlManageProperties) = False) then
    begin
      popupProperties.Close;
    end;

  end;

end;

procedure TfrmAgent.propOnClick(Sender: TObject);
var
  tempPanel : TPanel;
begin
  tempPanel := Sender as TPanel;

  pnlManageProperties.OnMouseEnter(self);
  pnlManageProperties.OnMouseLeave(self);
  pnlManageProperties.OnClick(Self);
  
  if tempPanel.Caption = 'Add' then
  begin 
    tbsPropertiesAdd.Show;
  end else if tempPanel.Caption = 'Details' then
  begin
    pnlManageOffers.OnMouseEnter(self);
    pnlManageOffers.OnMouseLeave(self);
    pnlManageOffers.OnClick(Self);
    tbsPropertiesDetails.Show;
  end;
end;

end.
