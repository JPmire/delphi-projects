unit Main_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, RibbonLunaStyleActnCtrls, Ribbon,
  pngimage, Menus, Grids, DBGrids, dmCoffeeShop_U, FileCtrl, ValEdit, ADODB,
  ScreenTips, DB, frmHelp_SearchSyntax_U, ImgList, dblookup, DBCtrls, Spin,
  Buttons, Math, CheckLst, jpeg;

type
  TfrmAdmin = class(TForm)
    pnlSideBar: TPanel;
    pcViews: TPageControl;
    tbsCustomers: TTabSheet;
    btnCustomers: TButton;
    btnInventory: TButton;
    btnOrders: TButton;
    imgLogo: TImage;
    tbsInventory: TTabSheet;
    tbsOrders: TTabSheet;
    pnlHeader: TPanel;
    mmTop: TMainMenu;
    shpSelected: TShape;
    gridC: TDBGrid;
    Splitter: TSplitter;
    gridI: TDBGrid;
    gridO: TDBGrid;
    pnlManageCustomers: TPanel;
    edtSearch: TEdit;
    cmbxSearchFor: TComboBox;
    miFile: TMenuItem;
    miLogout: TMenuItem;
    imglistSidebar: TImageList;
    btnCustShowAdd: TButton;
    btnCustDelete: TButton;
    btnCustShowEdit: TButton;
    gbxCustAdd: TGroupBox;
    lbledtCustFirstName: TLabeledEdit;
    lbledtCustLastName: TLabeledEdit;
    lbledtCustEmail: TLabeledEdit;
    lbledtCustPhone: TLabeledEdit;
    dtpCustDOB: TDateTimePicker;
    sedCustPoints: TSpinEdit;
    Label1: TLabel;
    btnCustAdd: TButton;
    cmbxCustGender: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    imgListManage: TImageList;
    cmbxCustEdit: TComboBox;
    lbledtCustEdit: TLabeledEdit;
    btnCustEditConfirm: TBitBtn;
    gbxCustEdit: TGroupBox;
    Label4: TLabel;
    pnlManageInventory: TPanel;
    btnOrdCreate: TButton;
    pnlManageOrders: TPanel;
    gbxOrdCreate: TGroupBox;
    pcTableView: TPageControl;
    tbstblOrders: TTabSheet;
    tbstblCustomers: TTabSheet;
    Label5: TLabel;
    btnOrdAddItems: TButton;
    lbItems: TListBox;
    cmbxOrdItemCategory: TComboBox;
    cmbxOrdSize: TComboBox;
    btnOrdAddCustomer: TButton;
    Label6: TLabel;
    redOrderDetails: TRichEdit;
    sedOrdQuantity: TSpinEdit;
    Label7: TLabel;
    sedOrdDiscountPoints: TSpinEdit;
    redOrderTotal: TRichEdit;
    Label8: TLabel;
    pnlOrdDiscountPointsAvailable: TPanel;
    Label9: TLabel;
    btnOrdConfirmOrder: TButton;
    bntOrdReset: TButton;
    btnOrdCancel: TButton;
    btnInvAdd: TButton;
    btnOrdDeleteOrder: TButton;
    btnInvCheckLowStock: TButton;
    redInvOutput: TRichEdit;
    btnInvRedOutputClose: TButton;
    lblInvAddStock: TLabel;
    chklbInvAddStock: TCheckListBox;
    btnOrdViewOrder: TButton;
    scrlbAddStockButtons: TScrollBox;
    btnInvAddStock: TButton;
    lblInvQuantity: TLabel;
    btnCustRestoreCustomers: TButton;
    gbxCustRestore: TGroupBox;
    Label10: TLabel;
    btnCustRestoreConfirm: TButton;
    chklbDeletedCustomers: TCheckListBox;
    btnCustRestoreClose: TButton;
    gbxInvCheckAddStock: TGroupBox;
    gbxOrdViewOrder: TGroupBox;
    Label11: TLabel;
    lbOrdViewOrderSelectCust: TListBox;
    btnOrdViewOrders: TButton;
    redOrdViewOrderOutput: TRichEdit;
    Label12: TLabel;
    btnOrdViewOrderClose: TButton;
    lbledtInvAddProductName: TLabeledEdit;
    cmbxInvAddCategory: TComboBox;
    cmbxInvAddSize: TComboBox;
    lbledtInvAddPrice: TLabeledEdit;
    sedInvAddStock: TSpinEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    btnInvAddConfirm: TButton;
    edtOrdCustID: TEdit;
    spnbtnOrdCustID: TSpinButton;
    gbxInvAdd: TGroupBox;
    btnInvDelete: TButton;
    gbxInvEdit: TGroupBox;
    Label16: TLabel;
    cmbxInvEdit: TComboBox;
    edtInvEditValue: TEdit;
    Label17: TLabel;
    btnInvEditConfirm: TButton;
    btnInvEdit: TButton;
    imgBackground: TImage;
    Image1: TImage;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure btnCustomersClick(Sender: TObject);
    procedure btnInventoryClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure miSearchSyntaxClick(Sender: TObject);
    procedure btnOrdersClick(Sender: TObject);
    procedure miLogoutClick(Sender: TObject);
    procedure btnCustAddClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCustShowAddClick(Sender: TObject);
    procedure btnCustDeleteClick(Sender: TObject);
    procedure btnCustShowEditClick(Sender: TObject);
    procedure btnCustEditConfirmClick(Sender: TObject);
    procedure pcTableViewChange(Sender: TObject);
    procedure gridCCellClick(Column: TColumn);
    procedure btnOrdCreateClick(Sender: TObject);
    procedure cmbxOrdItemCategoryChange(Sender: TObject);
    procedure lbItemsClick(Sender: TObject);
    procedure btnOrdAddItemsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sedOrdCustIdChange(Sender: TObject);
    procedure btnOrdAddCustomerClick(Sender: TObject);
    procedure btnOrdConfirmOrderClick(Sender: TObject);
    procedure bntOrdResetClick(Sender: TObject);
    procedure btnOrdCancelClick(Sender: TObject);
    procedure btnOrdDeleteOrderClick(Sender: TObject);
    procedure btnInvCheckLowStockClick(Sender: TObject);
    procedure btnInvRedOutputCloseClick(Sender: TObject);
    procedure chklbInvAddStockClickCheck(Sender: TObject);
    procedure btnInvAddStockClick(Sender: TObject);
    procedure scrlbAddStockButtonsMouseWheelDown(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure scrlbAddStockButtonsMouseWheelUp(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure scrlbAddStockButtonsMouseEnter(Sender: TObject);
    procedure chklbInvAddStockMouseEnter(Sender: TObject);
    procedure chklbInvAddStockClick(Sender: TObject);
    procedure btnCustRestoreCustomersClick(Sender: TObject);
    procedure btnCustRestoreConfirmClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnCustRestoreCloseClick(Sender: TObject);
    procedure btnOrdViewOrderClick(Sender: TObject);
    procedure btnOrdViewOrdersClick(Sender: TObject);
    procedure btnOrdViewOrderCloseClick(Sender: TObject);
    procedure btnInvAddConfirmClick(Sender: TObject);
    procedure edtOrdCustIDChange(Sender: TObject);
    procedure spnbtnOrdCustIDUpClick(Sender: TObject);
    procedure spnbtnOrdCustIDDownClick(Sender: TObject);
    procedure btnInvAddClick(Sender: TObject);
    procedure btnInvDeleteClick(Sender: TObject);
    procedure btnInvEditConfirmClick(Sender: TObject);
    procedure btnInvEditClick(Sender: TObject);
  private
    { Private declarations }
    iLength : integer;
    bFound : boolean; // *****NEW*****
    iLowStockLength, iAddSpinEditLength : integer;
    rOrdPriceTotal, rOrdPriceDiscount, rOrdPriceSubTotal : real;
    bDisplaysName : Boolean;
    iOrdCustID, iOrdDiscountPointsUsed : integer;
    iOrdViewOrderCustID : integer; // *****NEW*****

    arrOrdCustID : array of integer;

    procedure SwitchPage(TabSheet : TTabSheet; PageTitle : String;
              Button : TButton);
    procedure ExecuteSQL(Query : TADOQuery; SQLStatement : string);
    procedure AlignManageButtons(PanelManage : TPanel);
    procedure UpdateSearchBar(Table : TADOTable; ManagePanel : TPanel);
    procedure RestoreGrid(Grid : TDBGrid; Datasource : TDataSource);
    function  CalculateDiscount(totalCost : Real; discountPoints : integer): Double;
    procedure AddToOrderArray(ProductID, Quantity, DiscountPointsUsed : integer;
              Price : real;
              ProductName, ProductSize, Category : string);
    procedure ResetOrder;
    procedure DecreaseQuantity;
    procedure ValidateComponents(Owner : TWinControl);
    procedure AddToLowStockArray(ProductID, Quantity : integer; ProductName,
                Category, ProductSize : string);
    procedure AddToAddSpinEditArray(ProductID, Quantity : integer; ProductName,
                Category, ProductSize : string);
    procedure UpdateDeletedCustomersRead;
    procedure UpdateDeletedCustomersWrite;
    function DiscountPointsGained(PaidAmount : real): integer; // *****NEW*****

  public
    { Public declarations }
  end;

type tOrder = record
  ProductID, Quantity, DiscountPointsUsed : integer;
  Price : real;
  ProductName, Category, ProductSize : string;
end;

type tLowStock = record
  ProductID, Quantity : integer;
  ProductName, Category, ProductSize : string;
  SpinEdit : TSpinEdit;
end;

type tAddSpinEdit = record
  ProductID, Quantity : integer;
  ProductName, Category, ProductSize : string;
  SpinEdit : TSpinEdit;
  IDLabel : TLabel;
end;

type tDeletedCustomers = record
  CustomerID, Points : integer;
  FirstName, LastName, Gender, Email, Phone : string;
  DOB : TDateTime;
end;

var
  frmAdmin: TfrmAdmin;
  arrOrder : array of tOrder;
  arrLowStock : array of tLowStock;
  arrAddSpinEdit : array of tAddSpinEdit;
  arrDeletedCustomers : array of tDeletedCustomers;

implementation

uses Login_U;

{$R *.dfm}

procedure TfrmAdmin.AddToAddSpinEditArray(ProductID, Quantity: integer;
  ProductName, Category, ProductSize: string);
var
  i : integer;
begin
      inc(iAddSpinEditLength);
      setLength(arrAddSpinEdit, iAddSpinEditLength);

      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].ProductID := ProductID;
      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].ProductSize := ProductSize;
      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].Quantity := Quantity;
      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].ProductName := ProductName;
      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].Category := Category;




end;

procedure TfrmAdmin.AddToLowStockArray(ProductID, Quantity: integer;
  ProductName, Category, ProductSize: string);
begin
  inc(iLowStockLength);
  SetLength(arrLowStock, iLowStockLength);
  arrLowStock[Length(arrLowStock) - 1].ProductID := ProductID;
  arrLowStock[Length(arrLowStock) - 1].ProductSize := ProductSize;
  arrLowStock[Length(arrLowStock) - 1].Quantity := Quantity;
  arrLowStock[Length(arrLowStock) - 1].ProductName := ProductName;
  arrLowStock[Length(arrLowStock) - 1].Category := Category;


end;

procedure TfrmAdmin.AddToOrderArray(ProductID, Quantity, DiscountPointsUsed : integer;
  Price : real;
  ProductName, ProductSize, Category: string);
begin

  inc(iLength);
  SetLength(arrOrder, iLength);
  arrOrder[Length(arrOrder) - 1].ProductID := ProductID;
  arrOrder[Length(arrOrder) - 1].ProductSize := ProductSize;
  arrOrder[Length(arrOrder) - 1].Quantity := Quantity;
  arrOrder[Length(arrOrder) - 1].DiscountPointsUsed := DiscountPointsUsed;
  arrOrder[Length(arrOrder) - 1].Price := Price;
  arrOrder[Length(arrOrder) - 1].ProductName := ProductName;
  arrOrder[Length(arrOrder) - 1].Category := Category;

end;

procedure TfrmAdmin.AlignManageButtons(PanelManage: TPanel);
var
  i: Integer;
  CurrentButton : TButton;
begin
  for i := 0 to PanelManage.ControlCount - 1 do
  begin
    if (PanelManage.Controls[i] is TButton) then
    begin
      CurrentButton := PanelManage.Controls[i] as TButton;
      if CurrentButton.Caption = 'Add' then
      begin
        CurrentButton.Left := btnCustShowAdd.Left;
        CurrentButton.Top := btnCustShowAdd.Top;
      end;

      if CurrentButton.Caption = 'Delete' then
      begin
        CurrentButton.Left := btnCustDelete.Left;
        CurrentButton.Top := btnCustDelete.Top;
      end;

      if CurrentButton.Caption = 'Edit' then
      begin
        CurrentButton.Left := btnCustShowEdit.Left;
        CurrentButton.Top := btnCustShowEdit.Top;
      end;
    end;
  end;
end;

procedure TfrmAdmin.bntOrdResetClick(Sender: TObject);
begin
  ResetOrder;
end;

procedure TfrmAdmin.btnOrdViewOrderCloseClick(Sender: TObject);  // *****NEW*****
begin
  redOrdViewOrderOutput.Clear;
  gbxOrdViewOrder.Visible := False;
end;

procedure TfrmAdmin.btnCustAddClick(Sender: TObject);
var
  currentEdit : TLabeledEdit;
  i, iLastID : integer;
begin

  for i := 0 to gbxCustAdd.ControlCount - 1 do
  begin
    if (gbxCustAdd.Controls[i] is TLabeledEdit) then
    begin
      currentEdit := gbxCustAdd.Controls[i] as TLabeledEdit;
      if currentEdit.Text = '' then
      begin
        ShowMessage('Make sure to provide all the information');
        exit;
      end;
    end;
  end;


  with dmCoffeeShop do
  begin
    dsCustomers.DataSet := tblCustomers;
    tblCustomers.Open;
    tblCustomers.Last;
    iLastID := tblCustomers['CustomerID'];
    tblCustomers.Insert;
    tblCustomers['CustomerID'] := iLastID + 1;
    tblCustomers['FirstName'] := lbledtCustFirstName.Text;
    tblCustomers['LastName'] := lbledtCustLastName.Text;
    tblCustomers['DOB'] := dtpCustDOB.Date;
    tblCustomers['Gender'] := cmbxCustGender.Items[cmbxCustGender.ItemIndex];
    tblCustomers['Email'] :=  lbledtCustEmail.Text;
    tblCustomers['Phone'] :=  lbledtCustPhone.Text;
    tblCustomers['Points'] := sedCustPoints.Value;
    tblCustomers.Post;
    ExecuteSQL(dmCoffeeShop.qryCustomers,'SELECT * FROM tblCustomers');
  end;

  if gbxCustAdd.Parent = pnlManageOrders then
  begin
    gbxCustAdd.Visible := False;
    ShowMessage('Customer Created');
    gbxCustAdd.Parent := pnlManageCustomers;
  end;
end;

procedure TfrmAdmin.btnCustEditConfirmClick(Sender: TObject);
var
  sCustEdit, sPoints : string;
  iPoints, iError : integer;
begin
  sCustEdit := cmbxCustEdit.Items[cmbxCustEdit.ItemIndex];


  with dmCoffeeShop do
  begin
    dsCustomers.DataSet := tblCustomers;

    if cmbxCustEdit.Text = 'Points' then                     // *****NEW***** START
    begin
      sPoints := lbledtCustEdit.Text;
      val(sPoints, iPoints, iError);
      if iError > 0 then
      begin
        ShowMessage('Enter a valid number');
        exit;
      end else begin
        if iPoints > 20 then
        begin
          ShowMessage('Max Points is 20 for each Customer');
          exit;
        end;
      end;
    end;                                                       // // *****NEW***** END


    if (MessageDlg('Are you sure you want to change the '
    + sCustEdit + ' of ' + tblCustomers['FirstName'] +
    ' ' + tblCustomers['LastName'], mtWarning, [mbYes, mbNo], 0)) = mrYes then
    begin
      tblCustomers.Open;
      tblCustomers.Edit;
      tblCustomers[sCustEdit] := lbledtCustEdit.Text;
      tblCustomers.Post;
    end;
  end;
end;

procedure TfrmAdmin.btnCustomersClick(Sender: TObject);
begin
  gridC.Parent := pcViews.Pages[0];
  gridC.Align := alBottom;
  gridC.Height := 330;
  RestoreGrid(gridC, dmCoffeeShop.dsCustomers);
  SwitchPage(tbsCustomers, 'Customers', btnCustomers);
  UpdateSearchBar(dmCoffeeShop.tblCustomers, pnlManageCustomers);

end;

procedure TfrmAdmin.btnCustRestoreCloseClick(Sender: TObject);   // *****NEW*****
begin
  gbxCustRestore.Visible := False;
end;

procedure TfrmAdmin.btnCustRestoreConfirmClick(Sender: TObject);
var
  j, i: integer;
  tFile : TextFile;
begin
if MessageDlg('Are you sure you want to restore these Customers?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
  for i := 0 to Length(arrDeletedCustomers) - 1 do
  begin
    if chklbDeletedCustomers.Checked[i] = True then
    begin
      with dmCoffeeShop do
      begin
        tblCustomers.Insert;
        tblCustomers['CustomerID'] := arrDeletedCustomers[i].CustomerID;
        tblCustomers['FirstName'] := arrDeletedCustomers[i].FirstName;
        tblCustomers['LastName'] := arrDeletedCustomers[i].LastName;
        tblCustomers['DOB'] := arrDeletedCustomers[i].DOB;
        tblCustomers['Gender'] := arrDeletedCustomers[i].Gender;
        tblCustomers['Email'] := arrDeletedCustomers[i].Email;
        tblCustomers['Phone'] := arrDeletedCustomers[i].Phone;
        tblCustomers['Points'] := arrDeletedCustomers[i].Points;
        tblCustomers.Post;

      end;
    end;

  end;
end;
  UpdateDeletedCustomersWrite;
  UpdateDeletedCustomersRead;

  with dmCoffeeShop do
  begin
    qryCustomers.Active := False;
    tblCustomers.Active := False;
    tblCustomers.Active := True;
  end;

end;

procedure TfrmAdmin.btnCustRestoreCustomersClick(Sender: TObject);
begin
  gbxCustRestore.Visible := True;
  UpdateDeletedCustomersRead;
end;



procedure TfrmAdmin.btnInvAddClick(Sender: TObject);
begin
  gbxInvEdit.Visible := False;
  gbxInvAdd.Visible := True;
  gbxInvCheckAddStock.Visible := False;
end;

procedure TfrmAdmin.btnInvAddConfirmClick(Sender: TObject);
var
  sProductName, sCategory, sSize : string;
  iAmount, iProductID : integer;
  rPrice : real;
begin
  sProductName := lbledtInvAddProductName.Text;
  sCategory := cmbxInvAddCategory.Text;
  sSize := cmbxInvAddSize.Text;
  rPrice := StrToFloat(lbledtInvAddPrice.Text);
  iAmount := sedInvAddStock.Value;

  if MessageDlg('Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with dmCoffeeShop do
    begin
      tblInventory.Last;
      iProductID := tblInventory['ProductID'] + 1;
      tblInventory.Open;
      tblInventory.Insert;
      tblInventory['ProductID'] := iProductID;
      tblInventory['ProductName'] := sProductName;
      tblInventory['Category'] := sCategory;
      tblInventory['Size'] := sSize;
      tblInventory['Price'] := rPrice;
      tblInventory['QuantityInStock'] := iAmount;
      tblInventory.Post;
    end;
  end;

end;

procedure TfrmAdmin.btnInvAddStockClick(Sender: TObject);
var
  i, iIncreasedValue : integer;
begin
if MessageDlg('Are you sure, stock will be increased?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
  for i := 0 to Length(arrAddSpinEdit) - 1 do
  begin
      with dmCoffeeShop do
      begin
        iIncreasedValue := arrAddSpinEdit[i].SpinEdit.Value;
        tblInventory.Locate('ProductID', arrLowStock[i].ProductID, []);
        tblInventory.Edit;
        tblInventory['QuantityInStock'] := tblInventory['QuantityInStock'] + iIncreasedValue;
        tblInventory.Post;
      end;
  end;
end;

end;

procedure TfrmAdmin.btnInvCheckLowStockClick(Sender: TObject);
var
  iProductID, iQuantity : integer;
  sProductSize, sProductName, sCategory : string;
  SpinEdit : TSpinEdit;
  iSpinEditTop : integer;
  i: integer;
begin
  iLowStockLength := 0;
  iAddSpinEditLength := 0;
  iSpinEditTop := 0;
  gbxInvEdit.Visible := False;
  gbxInvAdd.Visible := False;
  gbxInvCheckAddStock.Visible := True;
  with dmCoffeeShop do
  begin
    tblInventory.Open;
    tblInventory.First;
    redInvOutput.Paragraph.Alignment := taCenter;
    redInvOutput.Font.Size := 15;
    redInvOutput.SelAttributes.Style := [fsBold];
    redInvOutput.Lines.Add('Stock Check:');
    redInvOutput.Paragraph.Alignment := taLeftJustify;
    redInvOutput.SelAttributes.Size := 12;
    redInvOutput.Lines.Add('The following Stock is low');
    redInvOutput.Lines.Add('');
    redInvOutput.SelAttributes.Size := 12;
    redInvOutput.SelAttributes.Style := [fsBold];
    redInvOutput.Lines.Add('Name' + #9 + 'Size' + #9 + 'Quantity Available');

    while not tblInventory.Eof do
    begin
      if tblInventory['QuantityInStock'] <= 50 then
      begin
        iProductID := tblInventory['ProductID'];
        iQuantity := tblInventory['QuantityInStock'];
        sProductSize := tblInventory['Size'];
        sProductName := tblInventory['ProductName'];
        sCategory := tblInventory['Category'];
        AddToLowStockArray(iProductID, iQuantity, sProductName, sCategory, sProductSize);
        chklbInvAddStock.Items.Add(IntToStr(tblInventory['ProductID']) + '    ' + tblInventory['ProductName'] + '    ' + tblInventory['Size']);
        redInvOutput.SelAttributes.Size := 12;
        redInvOutput.Lines.Add(IntToStr(tblInventory['ProductID']) + ' ' + tblInventory['ProductName'] + #9 + tblInventory['Size'] + #9 + IntToStr(tblInventory['QuantityInStock']));
      end;

      tblInventory.Next;
    end;
  end;

end;

procedure TfrmAdmin.btnInvDeleteClick(Sender: TObject);
begin
  with dmCoffeeShop do
  begin
    tblInventory.Open;
    if MessageDlg('Are you sure you want to delete ' + '"' + tblInventory['ProductID'] +
                  ' ' + tblInventory['ProductName'] +
                  ' ' + tblInventory['Size'] + '"', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      tblInventory.Delete;
    end;
  end;

end;

procedure TfrmAdmin.btnInvEditClick(Sender: TObject);
begin
  gbxInvEdit.Visible := True;
  gbxInvAdd.Visible := False;
  gbxInvCheckAddStock.Visible := False;
end;

procedure TfrmAdmin.btnInvEditConfirmClick(Sender: TObject);
var
  sFieldName, sValue : string;
begin
  sFieldName := cmbxInvEdit.Items[cmbxInvEdit.ItemIndex];
  sValue := edtInvEditValue.Text;
  with dmCoffeeShop do
  begin
    tblInventory.Open;
    tblInventory.First;
    tblInventory.Edit;
    if sFieldName = 'Price' then
    begin
      tblInventory[sFieldName] := StrToFloat(sValue);
    end else if sFieldName = 'QuantityInStock' then
    begin
      tblInventory[sFieldName] := StrToInt(sValue);
    end else
    begin
      tblInventory[sFieldName] := sValue;
    end;


  end;
end;

procedure TfrmAdmin.btnInventoryClick(Sender: TObject);
begin
  SwitchPage(tbsInventory, 'Inventory', btnInventory);
  AlignManageButtons(pnlManageInventory);
  UpdateSearchBar(dmCoffeeShop.tblInventory, pnlManageInventory);

  // *****NEW*****
  redInvOutput.Paragraph.TabCount := 4;
  redInvOutput.Paragraph.Tab[1] := 100;
  redInvOutput.Paragraph.Tab[2] := 200;
  redInvOutput.Paragraph.Tab[3] := 300;


end;


procedure TfrmAdmin.btnInvRedOutputCloseClick(Sender: TObject);
begin
  redInvOutput.Clear;
  gbxInvCheckAddStock.Visible := False;    // *****NEW*****
end;

procedure TfrmAdmin.btnOrdAddCustomerClick(Sender: TObject);
var
  sAdminUsername, sAdminPassword : string;
  sUserName, sPassword : string;
begin
  sUserName := InputBox('Admin', 'Enter the Admin Username:','');
  if sUserName = frmLogin.ADMIN_USERNAME then
  begin
    sPassword := InputBox('Admin','Enter the Admin Password:','');
    if sPassword = frmLogin.ADMIN_PASSWORD then
    begin
      gbxOrdCreate.Visible := False;
      gbxCustAdd.Visible := True;
      gbxCustAdd.Parent := pnlManageOrders;
    end else
    begin
      ShowMessage('Incorrect Password');
    end;

  end else
  begin
    ShowMessage('Incorrect Username');
    exit;
  end;

end;

procedure TfrmAdmin.btnOrdAddItemsClick(Sender: TObject);
var

  iOrdProductID, iOrdProductQuantity : integer;
  rOrdProductPrice : real;
  sOrdProductCategory, sOrdProductSize, sOrdProductName : string;

begin
  bFound := False;

  //Validation
  iOrdCustId := StrToInt(edtOrdCustID.Text);

  ValidateComponents(gbxOrdCreate);

  with dmCoffeeShop do
  begin

    tblCustomers.Open;
    tblCustomers.First;
    while not tblCustomers.Eof do
    begin
      if tblCustomers['CustomerID'] = iOrdCustId then
      begin
        bFound := True;
        if bDisplaysName = False then
        begin
          bDisplaysName := True;
          redOrderDetails.Paragraph.Alignment := taLeftJustify;
          redOrderDetails.Lines.Add('');
          redOrderDetails.Lines.Add('Name & Surname: ' +
                                    tblCustomers['FirstName'] + ' '
                                    + tblCustomers['LastName']);
          redOrderDetails.Lines.Add('');
          redOrderDetails.SelAttributes.Style := [fsBold];
          redOrderDetails.Lines.Add('Product' + #9 + 'Category' + #9 +
                                    'Size' + #9 + 'Price' + #9 + 'Quantity');
        end;

      end;
      tblCustomers.Next;
    end;

  end;

  if bFound = True then
  begin
    iOrdProductQuantity := sedOrdQuantity.Value;
    sOrdProductCategory := cmbxOrdItemCategory.Items[cmbxOrdItemCategory.ItemIndex];
    sOrdProductSize := cmbxOrdSize.Items[cmbxOrdSize.ItemIndex];
    sOrdProductName := lbItems.Items[lbItems.ItemIndex];
    iOrdDiscountPointsUsed := sedOrdDiscountPoints.Value;
    with dmCoffeeShop do
    begin
      tblInventory.Open;
      tblInventory.First;
      while not tblInventory.Eof do
      begin
        if (tblInventory['ProductName'] = sOrdProductName) and
           (tblInventory['Category'] = sOrdProductCategory) and
           (tblInventory['Size'] = sOrdProductSize) then
        begin
          iOrdProductID := tblInventory['ProductID'];
          rOrdProductPrice := tblInventory['Price'];
        end;
        tblInventory.Next;
      end;
    end;
    rOrdProductPrice := rOrdProductPrice * iOrdProductQuantity; // *****NEW*****
    AddToOrderArray(iOrdProductID, iOrdProductQuantity, iOrdDiscountPointsUsed,
                    rOrdProductPrice,sOrdProductName, sOrdProductSize, sOrdProductCategory);
    redOrderDetails.Lines.Add(arrOrder[iLength - 1].ProductName + #9 +
                              arrOrder[iLength - 1].Category + #9 +
                              arrOrder[iLength - 1].ProductSize + #9 +
                              FloatToStrF(arrOrder[iLength - 1].Price, ffCurrency, 10, 2) + #9 +
                              IntToStr(arrOrder[iLength - 1].Quantity) + #9);

    rOrdPriceSubTotal := rOrdPriceSubTotal + rOrdProductPrice;
    rOrdPriceDiscount := CalculateDiscount(rOrdPriceSubTotal, iOrdDiscountPointsUsed);
    rOrdPriceTotal := rOrdPriceSubTotal - rOrdPriceDiscount;
    redOrderTotal.Clear;
    redOrderTotal.Lines.Add('Sub-Total:' + #9 + FloatToStrF(rOrdPriceSubTotal, ffCurrency, 10, 2));
    redOrderTotal.Lines.Add('Discount:' + #9 + FloatToStrF(rOrdPriceDiscount, ffCurrency, 10, 2));
    redOrderTotal.Lines.Add('Total:' + #9 + FloatToStrF(rOrdPriceTotal, ffCurrency, 10, 2));




  end else
  begin
    ShowMessage('Customer not Found');
    exit;

  end;
end;

procedure TfrmAdmin.btnOrdCancelClick(Sender: TObject); // Printed
begin
  if (MessageDlg('Are you sure you want to cancel this order?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    ResetOrder;
    gbxOrdCreate.Visible := False;
  end;
end;

procedure TfrmAdmin.btnOrdConfirmOrderClick(Sender: TObject);  // Printed
var
  sItemsOrderedID, sItemsOrderedQuantity : string;
  i, iLength, iOrdOrderID : Integer;
  iAddedDiscountPoints : integer;   // *****NEW*****
begin
  iLength := Length(arrOrder);
  iOrdCustID :=  StrToInt(edtOrdCustID.Text); // *****NEW*****
  sItemsOrderedID := '';
  sItemsOrderedQuantity := '';
  for i := 0 to iLength - 1 do
  begin
    if (i < iLength - 1) then
    begin
      sItemsOrderedID := sItemsOrderedID + IntToStr(arrOrder[i].ProductID) + ',';
      sItemsOrderedQuantity := sItemsOrderedQuantity + IntToStr(arrOrder[i].Quantity) + ',';
    end else
    begin
      sItemsOrderedID := sItemsOrderedID + IntToStr(arrOrder[i].ProductID);
      sItemsOrderedQuantity := sItemsOrderedQuantity + IntToStr(arrOrder[i].Quantity);
    end;
  end;



  if (MessageDlg('Are you sure you want to confirm this order?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    with dmCoffeeShop do
    begin
      if tblOrders.RecordCount = 0 then
      begin
        iOrdOrderID := 1;
      end else
      begin
        tblOrders.Last;
        iOrdOrderID := tblOrders['OrderID'] + 1;
      end;

      tblOrders.Open;
      tblOrders.Insert;
      tblOrders['OrderID'] := iOrdOrderID;
      tblOrders['CustomerID'] := iOrdCustID;
      tblOrders['OrderDate'] := Date;
      tblOrders['OrderSubTotal'] := rOrdPriceSubTotal;
      tblOrders['ItemsOrderedID'] := sItemsOrderedID;
      tblOrders['ItemsOrderedQuantity'] := sItemsOrderedQuantity;
      tblOrders['PointsUsed'] := iOrdDiscountPointsUsed;
      tblOrders['Discount'] := rOrdPriceDiscount;
      tblOrders['OrderTotal'] := rOrdPriceTotal;
      tblOrders.Post;
      DecreaseQuantity;




      iAddedDiscountPoints := DiscountPointsGained(rOrdPriceTotal); // *****NEW***** START
      tblCustomers.Open;
      tblCustomers.Locate('CustomerID', iOrdCustID, []);
      tblCustomers.Edit;
      tblCustomers['Points'] := tblCustomers['Points'] - iOrdDiscountPointsUsed;
      if tblCustomers['Points'] + iAddedDiscountPoints <= 20 then
      begin
        tblCustomers['Points'] := tblCustomers['Points'] + iAddedDiscountPoints;
      end else if tblCustomers['Points'] + iAddedDiscountPoints > 20 then
      begin
        tblCustomers['Points'] := 20
      end;
      tblCustomers.Post;                                        // *****NEW***** END

    end;

  end;

end;

procedure TfrmAdmin.btnOrdCreateClick(Sender: TObject);  // Printed
var
  arrCategories : array of string;
  iCategoryLength : integer;
  sCurrentCategory : string;
  i: Integer;
begin
  iLength := 0; // Length used in the "AddToOrderArray" procedure
  with dmCoffeeShop do
  begin
    tblCustomers.Last;                                     // *****NEW*****
    //sedOrdCustId.MaxValue := tblCustomers['CustomerID'];   // *****NEW*****
  end;

  gbxOrdViewOrder.Visible := False; // *****NEW*****

  redOrderDetails.Clear;
  redOrderTotal.Clear;
  SetLength(arrOrder, 0);
  iCategoryLength := 1;
  rOrdPriceTotal := 0;
  rOrdPriceSubTotal := 0;
  rOrdPriceDiscount := 0;
  SetLength(arrCategories, iCategoryLength);
  with dmCoffeeShop do
  begin
    tblCustomers.First;
    pnlOrdDiscountPointsAvailable.Caption := IntToStr(tblCustomers['Points']); // *****NEW*****
    tblInventory.Open;
    tblInventory.First;
    sCurrentCategory := '';

    while not tblInventory.Eof do
    begin
      if (tblInventory['Category'] <> sCurrentCategory) then
      begin
        sCurrentCategory := tblInventory['Category'];
        arrCategories[iCategoryLength - 1] := sCurrentCategory;

        inc(iCategoryLength);
        SetLength(arrCategories, iCategoryLength);

      end;
      tblInventory.Next;

    end;
    dec(iCategoryLength);
    SetLength(arrCategories, iCategoryLength);
  end;
  bDisplaysName := False;

  redOrderDetails.Paragraph.Alignment := taCenter;
  redOrderDetails.Font.Size := 10;
  redOrderDetails.SelAttributes.Style := [fsBold];
  redOrderDetails.Lines.Add('JP''s Coffee');


  for i := 0 to Length(arrCategories) - 1 do
  begin
    cmbxOrdItemCategory.Items.Add(arrCategories[i]);
  end;

  gbxOrdCreate.Visible := True;
end;

procedure TfrmAdmin.btnOrdDeleteOrderClick(Sender: TObject);
var
  sName : string;
begin
  with dmCoffeeShop do
  begin
    if MessageDlg('Order ' + IntToStr(tblOrders['OrderID']) + ' will be deleted, are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      tblOrders.Delete;
    end;
  end;

end;

procedure TfrmAdmin.btnOrdersClick(Sender: TObject);
begin
  SwitchPage(tbsOrders, 'Orders', btnOrders);
  UpdateSearchBar(dmCoffeeShop.tblOrders, pnlManageOrders);
  pcTableView.TabIndex := 0;
end;

procedure TfrmAdmin.btnOrdViewOrderClick(Sender: TObject); // *****NEW*****
var
  iLength : integer;
begin
  gbxOrdViewOrder.Visible := True;
  gbxOrdCreate.Visible := False;
  lbOrdViewOrderSelectCust.Clear;
  redOrdViewOrderOutput.Width := redOrderDetails.Width;
  redOrdViewOrderOutput.Paragraph.TabCount := 6;
  redOrdViewOrderOutput.Paragraph.Tab[0] := 0;
  redOrdViewOrderOutput.Paragraph.Tab[1] := 70;
  redOrdViewOrderOutput.Paragraph.Tab[2] := 145;
  redOrdViewOrderOutput.Paragraph.Tab[3] := 220;
  redOrdViewOrderOutput.Paragraph.Tab[4] := 295;
  redOrdViewOrderOutput.Paragraph.Tab[5] := 365;

  with dmCoffeeShop do
  begin
    tblCustomers.Open;
    tblCustomers.First;
    iLength := 0;
    while not tblCustomers.Eof do
    begin
      inc(iLength);
      SetLength(arrOrdCustID, iLength);
      arrOrdCustID[iLength - 1] := tblCustomers['CustomerID'];
      lbOrdViewOrderSelectCust.Items.Add(IntToStr(tblCustomers['CustomerID'])
                                        + '   ' + tblCustomers['FirstName']
                                        + ' ' + tblCustomers['LastName']
                                        + '   ' + tblCustomers['Phone']);
      tblCustomers.Next;
    end;
  end;
end;

procedure TfrmAdmin.btnOrdViewOrdersClick(Sender: TObject);  // *****NEW*****

type tViewOrder = record
  ItemsOrderedID : integer;
  ItemsOrderedQuantity : integer;

end;
var
  iIndex, i, j : integer;
  iCustomerID, iPos1, iPos2, iArrayLength : integer;
  sFirstName, sLastName, sItemsOrderedID, sItemsOrderedQuantity : string;
  arrItemsOrdered : array of tViewOrder;
  bFinishedID, bFinishedQuantity : boolean;

  iCommasID, iCommasQuantity : integer;


begin
  with dmCoffeeShop do
  begin                // With
    redOrdViewOrderOutput.Clear;
    tblOrders.Open;
    tblOrders.First;
    iIndex := lbOrdViewOrderSelectCust.ItemIndex;
    iCustomerID := arrOrdCustID[iIndex];

    tblCustomers.Locate('CustomerID', iCustomerID, []);
    sFirstName := tblCustomers['FirstName'];
    sLastName := tblCustomers['LastName'];
    redOrdViewOrderOutput.SelAttributes.Style := [fsBold];
    redOrdViewOrderOutput.SelAttributes.Size := 12;
    redOrdViewOrderOutput.Paragraph.Alignment := taCenter;
    redOrdViewOrderOutput.SelAttributes.Color := rgb(150, 105, 25);

    redOrdViewOrderOutput.Lines.Add('Orders For: ' + sFirstName + ' ' + sLastName);


    tblOrders.Locate('CustomerID', iCustomerID, []);


    tblOrders.First;
    while not tblOrders.Eof do
    begin
      if tblOrders['CustomerID'] = iCustomerID then
      begin
        redOrdViewOrderOutput.Lines.Add('');
        redOrdViewOrderOutput.SelAttributes.Style := [fsBold];
        redOrdViewOrderOutput.Lines.Add('Order Date:    ' +DateToStr(tblOrders['OrderDate']));
        redOrdViewOrderOutput.Lines.Add('');

    redOrdViewOrderOutput.SelAttributes.Style := [fsBold];
    redOrdViewOrderOutput.Lines.Add('Product' + #9 + 'Category' + #9 +
                                    'Size' + #9 + 'Price' + #9 + 'Quantity');

    sItemsOrderedID := tblOrders['ItemsOrderedID'];
    sItemsOrderedQuantity := tblOrders['ItemsOrderedQuantity'];

    bFinishedID := False;
    bFinishedQuantity := False;
    iArrayLength := 0;
    while (bFinishedID = False) OR (bFinishedQuantity = False) do
    begin

      iCommasID := 0;
      iCommasQuantity := 0;
      for i := 1 to Length(sItemsOrderedID) do
      begin
        if sItemsOrderedID[i] = ',' then
        begin
          inc(iCommasID);
        end;
      end;

      for j := 1 to Length(sItemsOrderedQuantity) do
      begin
        if sItemsOrderedQuantity[j] = ',' then
        begin
          inc(iCommasQuantity);
        end;
      end;

      if iCommasID > 0 then
      begin
        iPos1 := pos(',', sItemsOrderedID);
      end;

      if iCommasQuantity > 0 then
      begin
        iPos2 := pos(',', sItemsOrderedQuantity);
      end;

      inc(iArrayLength);
      SetLength(arrItemsOrdered, iArrayLength);



      if (iCommasID > 0) and (bFinishedID = False) then
      begin
        arrItemsOrdered[iArrayLength - 1].ItemsOrderedID :=
        StrToInt(copy(sItemsOrderedID, 1, iPos1 - 1));
        Delete(sItemsOrderedID, 1, iPos1);
      end else if (iCommasID = 0) and  (bFinishedID = False) then
      begin
        arrItemsOrdered[iArrayLength - 1].ItemsOrderedID :=
        StrToInt(copy(sItemsOrderedID, 1, Length(sItemsOrderedID)));
        bFinishedID := True;
      end;

      if (iCommasQuantity > 0) and (bFinishedQuantity = False) then
      begin
        arrItemsOrdered[iArrayLength - 1].ItemsOrderedQuantity :=
        StrToInt(copy(sItemsOrderedQuantity, 1, iPos2 - 1));
        Delete(sItemsOrderedQuantity, 1, iPos2);
      end else if (iCommasQuantity = 0) and (bFinishedQuantity = False) then

      begin

        arrItemsOrdered[iArrayLength - 1].ItemsOrderedQuantity :=
        StrToInt(copy(sItemsOrderedQuantity, 1, Length(sItemsOrderedQuantity)));
        bFinishedQuantity := True;
      end;




    end;    // While bFinisesed ....

    for i := 0 to Length(arrItemsOrdered) - 1 do
      begin
        tblInventory.Locate('ProductID', arrItemsOrdered[i].ItemsOrderedID, []);
        redOrdViewOrderOutput.Lines.Add(tblInventory['ProductName'] + #9 +
                              tblInventory['Category'] + #9 +
                              tblInventory['Size'] + #9 +
                              FloatToStrF(tblInventory['Price'], ffCurrency, 10, 2) + #9 +
                              IntToStr(arrItemsOrdered[i].ItemsOrderedQuantity) + #9);
      end;

      redOrdViewOrderOutput.Lines.Add('');
      redOrdViewOrderOutput.Paragraph.Alignment := taLeftJustify;
      redOrdViewOrderOutput.Lines.Add('Sub-Total:' + #9 + FloatToStrF(tblOrders['OrderSubTotal'], ffCurrency, 10, 2)); // *****NEW*****
      redOrdViewOrderOutput.Lines.Add('Discount:' + #9 + FloatToStrF(tblOrders['Discount'], ffCurrency, 10, 2)); // *****NEW*****
      redOrdViewOrderOutput.Lines.Add('Total:' + #9 + FloatToStrF(tblOrders['OrderTotal'], ffCurrency, 10, 2)); // *****NEW*****
      redOrdViewOrderOutput.Lines.Add('_______________________________________');
      redOrdViewOrderOutput.Lines.Add('');




  end;   // if

      tblOrders.Next;
      end; // while not tlbOrders.Eof

    end;  // With

end;


procedure TfrmAdmin.Button1Click(Sender: TObject);
begin
  if (tbstblOrders.Visible = True) then
  begin
    Showmessage('Orders');
  end else if (tbstblCustomers.Visible = True) then
  begin
    ShowMessage('Customers');
  end;


end;

function TfrmAdmin.CalculateDiscount(totalCost: Real; discountPoints: integer): Double;
var
  discountRate: real; // The percentage of discount based on the points
begin
  if (discountPoints < 0) or (discountPoints > 20) then
  raise Exception.Create('Invalid discount points');

  discountRate := 0.01 * discountPoints;

  result := totalCost * discountRate;
end;

procedure TfrmAdmin.chklbInvAddStockClick(Sender: TObject);
var
  i: Integer;
  lblID : TLabel;
begin

  for i := 0 to Length(arrAddSpinEdit) - 1 do
  begin
    arrAddSpinEdit[i].SpinEdit.Destroy;
    arrAddSpinEdit[i].IDLabel.Destroy;
  end;



  iAddSpinEditLength := 0;
  SetLength(arrAddSpinEdit, iAddSpinEditLength);
  for i := 0 to Length(arrLowStock) - 1 do
  begin
    if chklbInvAddStock.Checked[i] = True then
    begin
      AddToAddSpinEditArray(arrLowStock[i].ProductID, arrLowStock[i].Quantity, arrLowStock[i].ProductName,
                        arrLowStock[i].Category, arrLowStock[i].ProductSize);
      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].SpinEdit := TSpinEdit.Create(scrlbAddStockButtons);
      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].SpinEdit.Parent := scrlbAddStockButtons;
      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].SpinEdit.Left := 0;
      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].SpinEdit.Top := (iAddSpinEditLength - 1) *
                                    (arrAddSpinEdit[Length(arrAddSpinEdit) - 1].SpinEdit.Height + 1) + 2;
      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].SpinEdit.Width := 50;
      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].SpinEdit.Height := 10;

      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].IDLabel := TLabel.Create(scrlbAddStockButtons);
      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].IDLabel.Parent := scrlbAddStockButtons;
      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].IDLabel.Left := arrAddSpinEdit[Length(arrAddSpinEdit) - 1].SpinEdit.Width + 5;
      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].IDLabel.Top := (iAddSpinEditLength - 1) *
                    (arrAddSpinEdit[Length(arrAddSpinEdit) - 1].SpinEdit.Height + 1) + 2;
      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].IDLabel.Font.Size := 10;
      arrAddSpinEdit[Length(arrAddSpinEdit) - 1].IDLabel.Caption := IntToStr(arrLowStock[i].ProductID);

    end;
  end;

end;

procedure TfrmAdmin.chklbInvAddStockClickCheck(Sender: TObject);
begin
  scrlbAddStockButtons.VertScrollBar.Position := chklbInvAddStock.TopIndex;
end;

procedure TfrmAdmin.chklbInvAddStockMouseEnter(Sender: TObject);
begin
  scrlbAddStockButtons.SetFocus;
end;

procedure TfrmAdmin.cmbxOrdItemCategoryChange(Sender: TObject);
var
  sSelectedCategory : string;
  sProductName : string;
begin
  lbItems.Clear;
  cmbxOrdSize.Clear;
  cmbxOrdSize.Text := 'Select a Size';
  sProductName := '';
  sSelectedCategory := cmbxOrdItemCategory.Items[cmbxOrdItemCategory.ItemIndex];
  with dmCoffeeShop do
  begin
    tblInventory.Open;
    tblInventory.First;
    while not tblInventory.eof do
    begin
      if tblInventory['Category'] = sSelectedCategory  then
      begin
        if tblInventory['ProductName'] <> sProductName then
        begin
          sProductName := tblInventory['ProductName'];
          lbItems.Items.Add(tblInventory['ProductName']);
        end;
      end;
      tblInventory.Next;
    end;

  end;
end;



procedure TfrmAdmin.DecreaseQuantity;
var
  iQuantity, i : integer;
  iNewQuantity : integer;
begin
  iQuantity := 0;
  iNewQuantity := 0;
  with dmCoffeeShop do
  begin
    tblInventory.Open;
    tblInventory.First;
    while not tblInventory.Eof do
    begin

    for i := 0 to Length(arrOrder) - 1 do
    begin
      if tblInventory['ProductID'] = arrOrder[i].ProductID then
      begin
        iQuantity := tblInventory['QuantityInStock'];
        iNewQuantity := iQuantity - arrOrder[i].Quantity;
        tblInventory.Edit;
        tblInventory['QuantityInStock'] := iNewQuantity;
        tblInventory.Post;

      end;
    end;
    tblInventory.Next;
    end;

  end;

end;

function TfrmAdmin.DiscountPointsGained(PaidAmount: real): integer;  // *****NEW*****
var
 iBaseDiscountPoints, iDiscountPoints : integer;
begin

// Calculate the base number of discount points to be awarded, based on the paid amount.
 ibaseDiscountPoints := Round(PaidAmount / 10);

// Apply a logarithmic function to the base number of discount points, to reduce the number of discount points awarded for large orders.
 idiscountPoints := Trunc(Ln(1 + ibaseDiscountPoints));

// Limit the number of discount points to 20.
 if idiscountPoints > 20 then
 begin

idiscountPoints := 20;
 end;

result := iDiscountPoints;
end;

procedure TfrmAdmin.btnCustShowAddClick(Sender: TObject);
begin
  gbxCustAdd.Visible := True;
  gbxCustEdit.Visible := False;
  gridC.Height := 330;
end;

procedure TfrmAdmin.btnCustDeleteClick(Sender: TObject);
var
  tFile : TextFile;
begin
  with dmCoffeeShop do
  begin
    dsCustomers.DataSet := tblCustomers;
    if (MessageDlg('Are you sure you want to remove '
        + tblCustomers['FirstName'] +
        ' ' + tblCustomers['LastName'], mtWarning, [mbYes, mbNo], 0)) = mrYes then
    begin
      tblCustomers.Open;
      AssignFile(tFile, 'TextFile/Deleted Customers.txt');
      Append(tFile);
      Writeln(tFile, IntToStr(tblCustomers['CustomerID']) + '#' + tblCustomers['FirstName']
                   + '#' + tblCustomers['LastName'] + '#' + DateToStr(tblCustomers['DOB'])
                    + '#' + tblCustomers['Gender'] + '#' + tblCustomers['Email']
                     + '#' + tblCustomers['Phone'] + '#' + IntToStr(tblCustomers['Points']));
      CloseFile(tFile);

      tblCustomers.Delete;
    end;
  end;
end;

procedure TfrmAdmin.btnCustShowEditClick(Sender: TObject);
begin
  gbxCustEdit.Visible := True;
  gbxCustAdd.Visible := False;
end;

procedure TfrmAdmin.edtOrdCustIDChange(Sender: TObject);
var
  iOrdCustomerID : integer;
begin
  if edtOrdCustID.Text = '' then
  begin
    iOrdCustomerID := 1;
  end else
  begin
    iOrdCustomerID := StrToInt(edtOrdCustID.Text);
  end;

  with dmCoffeeShop do
  begin
    tblCustomers.Open;
    tblCustomers.First;
    while not tblCustomers.Eof do
    begin
      if (iOrdCustomerID = tblCustomers['CustomerID']) then
      begin
        pnlOrdDiscountPointsAvailable.Caption := IntToStr(tblCustomers['Points']);
        sedOrdDiscountPoints.MaxValue := tblCustomers['Points'];
        sedOrdDiscountPoints.Value := 0;
        exit;
      end;

      tblCustomers.Next;
    end;
  end;
end;

procedure TfrmAdmin.edtSearchChange(Sender: TObject);        // *****NEW*****
begin
  if (edtSearch.Parent = pnlManageCustomers) OR ((edtSearch.Parent = pnlManageOrders)
  AND (tbstblCustomers.Visible = True)) then      // *****NEW*****
  begin
    dmCoffeeShop.dsCustomers.DataSet := dmCoffeeShop.qryCustomers;


    if edtSearch.Text = '' then
      begin
        ExecuteSQL(dmCoffeeShop.qryCustomers, 'SELECT * FROM tblCustomers');
      end else
      if (cmbxSearchFor.Text = 'CustomerID') or (cmbxSearchFor.Text = 'Points')
      then
      begin
        ExecuteSQL(dmCoffeeShop.qryCustomers, 'SELECT * FROM tblCustomers ' +
                  'WHERE ' + cmbxSearchFor.Text + ' LIKE ' + '"'
                  + edtSearch.Text +'%"');
      end else if (cmbxSearchFor.Text = 'Gender') then
        begin
          ExecuteSQL(dmCoffeeShop.qryCustomers, 'SELECT * FROM tblCustomers ' +     // *****NEW*****
                    'WHERE ' + cmbxSearchFor.Text + ' = ' + '"'
                    + edtSearch.Text + '"');
        end
      else
      begin
        ExecuteSQL(dmCoffeeShop.qryCustomers, 'SELECT * FROM tblCustomers ' +
        'WHERE ' + cmbxSearchFor.Text + ' LIKE ' + '"%'
        + edtSearch.Text + '%"');
      end;
    end


    else if (edtSearch.Parent = pnlManageInventory) then
    begin
      dmCoffeeShop.dsInventory.DataSet := dmCoffeeShop.qryInventory;
      if edtSearch.Text = '' then
      begin
        ExecuteSQL(dmCoffeeShop.qryInventory, 'SELECT * FROM tblInventory');
      end else
      if (cmbxSearchFor.Text = 'ProductID') or
        (cmbxSearchFor.Text = 'QuantityInStock') or
        (cmbxSearchFor.Text = 'Price') then
      begin
        ExecuteSQL(dmCoffeeShop.qryInventory,'SELECT * FROM tblInventory ' +
                  'WHERE ' + cmbxSearchFor.Text + ' LIKE ' + '"' + edtSearch.Text + '"');
      end else
      begin
        ExecuteSQL(dmCoffeeShop.qryInventory, 'SELECT * FROM tblInventory ' +
        'WHERE ' + cmbxSearchFor.Text + ' LIKE ' + '"%'
        + edtSearch.Text + '%"');
      end;
    end

    else if (edtSearch.Parent = pnlManageOrders) and (tbstblOrders.Visible = True) then    // *****NEW*****
    begin
      dmCoffeeShop.dsOrders.DataSet := dmCoffeeShop.qryOrders;
      if (cmbxSearchFor.Text = 'OrderID') or (cmbxSearchFor.Text = 'PointsUsed')
      then
      begin
        ExecuteSQL(dmCoffeeShop.qryOrders, 'SELECT * FROM tblOrders ' +
                  'WHERE ' + cmbxSearchFor.Text + ' LIKE ' + '"'
                  + edtSearch.Text +'%"');
      end
      else
      begin
        ExecuteSQL(dmCoffeeShop.qryOrders, 'SELECT * FROM tblOrders ' +
                    'WHERE ' + cmbxSearchFor.Text + ' LIKE ' + '"%'
                    + edtSearch.Text + '%"');
      end;
    end;




end;


procedure TfrmAdmin.ExecuteSQL(Query: TADOQuery; sqlStatement : string);
begin
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add(sqlStatement);
  Query.Open;
end;

procedure TfrmAdmin.FormActivate(Sender: TObject);
begin
  redOrderDetails.Paragraph.TabCount := 6;
  redOrderDetails.Paragraph.Tab[0] := 0;
  redOrderDetails.Paragraph.Tab[1] := 70;
  redOrderDetails.Paragraph.Tab[2] := 145;
  redOrderDetails.Paragraph.Tab[3] := 220;
  redOrderDetails.Paragraph.Tab[4] := 295;
  redOrderDetails.Paragraph.Tab[5] := 365;
end;

procedure TfrmAdmin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Application.Terminate;
end;

procedure TfrmAdmin.FormCreate(Sender: TObject);
var
  Tab : TTabSheet;
  i: Integer;
  btnSide : TButton;
begin
  shpSelected.Brush.Color := RGB(166, 123, 91);
  pnlHeader.Color := RGB(166, 123, 91);
  shpSelected.Left := btnCustomers.Left + (btnCustomers.Width - shpSelected.Width) div 2;
  shpSelected.Top := btnCustomers.Top + (btnCustomers.Height - shpSelected.Height) div 2;

  for i := 0 to pcViews.ControlCount - 1 do
  begin
    if (pcViews.Controls[i] is TTabSheet) then
    begin
      Tab := pcViews.Controls[i] as TTabSheet;
      Tab.TabVisible := False;
    end;
  end;
  tbsCustomers.Show;

end;


procedure TfrmAdmin.gridCCellClick(Column: TColumn);
var
  iCustId : integer;
begin
  if GridC.Parent = tbstblCustomers then
  begin
    iCustId := GridC.Fields[0].AsInteger;
    edtOrdCustID.Text := intToStr(iCustId);
  end;

end;

procedure TfrmAdmin.lbItemsClick(Sender: TObject);
begin
  cmbxOrdSize.Clear;
  cmbxOrdSize.Text := 'Select a Size';
  with dmCoffeeShop do
  begin
    tblInventory.Open;
    tblInventory.First;
    while not tblInventory.Eof do
    begin
      if tblInventory['ProductName'] = lbItems.Items[lbItems.ItemIndex] then
      begin
        cmbxOrdSize.Items.Add(tblInventory['Size']);
      end;
    tblInventory.Next;
    end;
  end;
end;

procedure TfrmAdmin.miLogoutClick(Sender: TObject);
begin
  if (MessageDlg('Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
  then
  begin
    Self.Hide;
    Application.MainForm.Show;

  end;
end;

procedure TfrmAdmin.miSearchSyntaxClick(Sender: TObject);
begin
  frmSearchSyntax.Show;
end;

procedure TfrmAdmin.pcTableViewChange(Sender: TObject);
var
  i: integer;
  iCount : integer;
begin
  gridC.Parent := pcTableView.Pages[1];
  gridC.Align := alClient;
  with dmCoffeeShop do
  begin
    for i := gridC.Columns.Count - 1 downto 0 do
    begin
      if not (i in [0, 1, 2, 7]) then
      begin
        gridC.Columns.Delete(i);
      end;
    end;

  if (pcTableView.TabIndex = 0) then
  begin
    UpdateSearchBar(dmCoffeeShop.tblOrders, pnlManageOrders);
  end else
  begin
    cmbxSearchFor.Items.Clear;
    for i := 0 to tblCustomers.FieldCount - 1 do
    begin
      if (i in [0, 1, 2, 7]) then
      begin
        cmbxSearchFor.Items.Add(tblCustomers.Fields[i].FieldName);
      end;

    end;
    cmbxSearchFor.Parent := pnlManageOrders;
    edtSearch.Parent := pnlManageOrders;
    edtSearch.Text := '';
    cmbxSearchFor.ItemIndex := 0;
  end;


  end;



end;

procedure TfrmAdmin.ResetOrder;
begin
  bFound := False;  // *****NEW*****
  bDisplaysName := False;  // *****NEW*****
  rOrdPriceTotal := 0; // *****NEW*****
  rOrdPriceDiscount := 0; // *****NEW*****
  rOrdPriceSubTotal := 0; // *****NEW*****
  redOrderDetails.Clear;
  redOrderDetails.Paragraph.Alignment := taCenter;
  redOrderDetails.Font.Size := 10;
  redOrderDetails.SelAttributes.Style := [fsBold];
  redOrderDetails.Lines.Add('JP''s Coffee');
  redOrderTotal.Clear;
  SetLength(arrOrder, 0);   // *****NEW*****
  edtOrdCustID.Enabled := True;
  cmbxOrdItemCategory.ItemIndex := -1;
  cmbxOrdItemCategory.Text := 'Select a Category';
  lbItems.Clear;
  cmbxOrdSize.ItemIndex := -1;
  cmbxOrdSize.Text := 'Select a Size';
  sedOrdQuantity.Value := 0;
  sedOrdDiscountPoints.Enabled := True;
  sedOrdDiscountPoints.Value := 0;
end;

procedure TfrmAdmin.RestoreGrid(Grid: TDBGrid; Datasource: TDataSource);
var
  col: TColumn;
  i : integer;
begin
  for i := Grid.Columns.Count - 1 downto 0 do
  begin
    Grid.Columns.Delete(i);
  end;
  for i := 0 to Datasource.DataSet.FieldCount - 1 do
  begin
    col := GridC.Columns.Add;
    col.FieldName := Datasource.DataSet.Fields[i].FieldName;
    col.Title.Caption := Datasource.DataSet.Fields[i].DisplayLabel;
    col.Visible := True;
  end;
end;

procedure TfrmAdmin.scrlbAddStockButtonsMouseEnter(Sender: TObject);
begin
  scrlbAddStockButtons.SetFocus;
end;

procedure TfrmAdmin.scrlbAddStockButtonsMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  scrlbAddStockButtons.VertScrollBar.Position := scrlbAddStockButtons.VertScrollBar.Position + 180;
end;

procedure TfrmAdmin.scrlbAddStockButtonsMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  scrlbAddStockButtons.VertScrollBar.Position := scrlbAddStockButtons.VertScrollBar.Position - 180;
end;

procedure TfrmAdmin.sedOrdCustIdChange(Sender: TObject);
var
  iOrdCustomerID : integer;
begin
  iOrdCustomerID := StrToInt(edtOrdCustID.Text);
  ShowMessage('test');
  with dmCoffeeShop do
  begin
    tblCustomers.Open;
    tblCustomers.First;
    while not tblCustomers.Eof do
    begin
      if (iOrdCustomerID = tblCustomers['CustomerID']) then
      begin
        pnlOrdDiscountPointsAvailable.Caption := IntToStr(tblCustomers['Points']);
        sedOrdDiscountPoints.MaxValue := tblCustomers['Points'];
        sedOrdDiscountPoints.Value := 0;
        exit;
      end;

      tblCustomers.Next;
    end;
  end;
end;

procedure TfrmAdmin.spnbtnOrdCustIDDownClick(Sender: TObject);
begin
  if edtOrdCustID.Text = '' then
  begin
    edtOrdCustID.Text := '1';
  end else
  begin
    if edtOrdCustID.Text <> '1' then
    begin
      edtOrdCustID.Text := IntToStr(StrToInt(edtOrdCustID.Text) - 1);
    end;
  end;
end;

procedure TfrmAdmin.spnbtnOrdCustIDUpClick(Sender: TObject);
begin
  if edtOrdCustID.Text = '' then
  begin
    edtOrdCustID.Text := '1';
  end else
  begin
    edtOrdCustID.Text := IntToStr(StrToInt(edtOrdCustID.Text) + 1);
  end;

end;

procedure TfrmAdmin.SwitchPage(TabSheet: TTabSheet; PageTitle : String;
                                Button : TButton);
var
  btnCurrent : TButton;
  i: Integer;
begin
  TabSheet.Show;
  shpSelected.Left := Button.Left + (Button.Width - shpSelected.Width) div 2;
  shpSelected.Top := Button.Top + (Button.Height - shpSelected.Height) div 2;
  pnlHeader.Caption := PageTitle;
  pnlHeader.Parent := TabSheet;
  pnlHeader.Show;
  Splitter.Parent := TabSheet;

  for i := 0 to pnlSideBar.ControlCount - 1 do
  begin
    if (pnlSideBar.Controls[i] is TButton) then
    begin
      btnCurrent := pnlSideBar.Controls[i] as TButton;
      btnCurrent.Style := bsPushButton;
      btnCurrent.Style := bsCommandLink;
      btnCurrent.Width := 130;
      btnCurrent.Height := 40;
    end;
  end;

end;

procedure TfrmAdmin.UpdateDeletedCustomersRead;
var
  iCustomerID, iPoints, iDeletedCustomersLength, iPos : integer;
  sFirstName, sLastName, sGender, sEmail, sPhone, sLine: string;
  dDOB : TDateTime;
  tFile : TextFile;
begin
  AssignFile(tFile, 'TextFile/Deleted Customers.txt');
  Reset(tFile);
  iDeletedCustomersLength := 0;
  SetLength(arrDeletedCustomers, iDeletedCustomersLength);
  chklbDeletedCustomers.Clear;
  while not Eof(tFile) do
  begin
    Readln(tFile, sLine);

    iPos := pos('#', sLine);
    iCustomerID := StrToInt(copy(sLine, 1, iPos - 1));
    Delete(sLine, 1, iPos);

    iPos := pos('#', sLine);
    sFirstName := copy(sLine, 1, iPos - 1);
    Delete(sLine, 1, iPos);

    iPos := pos('#', sLine);
    sLastName := copy(sLine, 1, iPos - 1);
    Delete(sLine, 1, iPos);

    iPos := pos('#', sLine);
    dDOB := StrToDate(copy(sLine, 1, iPos - 1));
    Delete(sLine, 1, iPos);

    iPos := pos('#', sLine);
    sGender := copy(sLine, 1, iPos - 1);
    Delete(sLine, 1, iPos);

    iPos := pos('#', sLine);
    sEmail := copy(sLine, 1, iPos - 1);
    Delete(sLine, 1, iPos);

    iPos := pos('#', sLine);
    sPhone := copy(sLine, 1, iPos - 1);
    Delete(sLine, 1, iPos);

    iPos := pos('#', sLine);
    iPoints := StrToInt(copy(sLine, 1, Length(sLine)));


    inc(iDeletedCustomersLength);
    SetLength(arrDeletedCustomers, iDeletedCustomersLength);

    arrDeletedCustomers[iDeletedCustomersLength - 1].CustomerID := iCustomerID;
    arrDeletedCustomers[iDeletedCustomersLength - 1].FirstName := sFirstName;
    arrDeletedCustomers[iDeletedCustomersLength - 1].LastName := sLastName;
    arrDeletedCustomers[iDeletedCustomersLength - 1].DOB := dDOB;
    arrDeletedCustomers[iDeletedCustomersLength - 1].Gender := sGender;
    arrDeletedCustomers[iDeletedCustomersLength - 1].Email := sEmail;
    arrDeletedCustomers[iDeletedCustomersLength - 1].Phone := sPhone;
    arrDeletedCustomers[iDeletedCustomersLength - 1].Points := iPoints;


    chklbDeletedCustomers.Items.Add(IntToStr(arrDeletedCustomers[iDeletedCustomersLength - 1].CustomerID)
                                + '   ' + arrDeletedCustomers[iDeletedCustomersLength - 1].FirstName
                                + '   ' + arrDeletedCustomers[iDeletedCustomersLength - 1].LastName
                                + '   ' + arrDeletedCustomers[iDeletedCustomersLength - 1].Phone);


  end;

  CloseFile(tFile);
end;

procedure TfrmAdmin.UpdateDeletedCustomersWrite;
var
  iCustomerID, iPoints, iDeletedCustomersLength, iPos : integer;
  sFirstName, sLastName, sGender, sEmail, sPhone, sLine: string;
  dDOB : TDateTime;
  tFile : TextFile;
  i, iTempLength: Integer;

  arrTemp : array of tDeletedCustomers;
begin
  iTempLength := 0;
  SetLength(arrTemp, iTempLength);
  for i := 0 to chklbDeletedCustomers.Count - 1 do
  begin
    if chklbDeletedCustomers.Checked[i] = False then
    begin
      inc(iTempLength);
      SetLength(arrTemp, iTempLength);
      arrTemp[iTempLength - 1].CustomerID := arrDeletedCustomers[i].CustomerID;
      arrTemp[iTempLength - 1].FirstName := arrDeletedCustomers[i].FirstName;
      arrTemp[iTempLength - 1].LastName := arrDeletedCustomers[i].LastName;
      arrTemp[iTempLength - 1].DOB := arrDeletedCustomers[i].DOB;
      arrTemp[iTempLength - 1].Gender := arrDeletedCustomers[i].Gender;
      arrTemp[iTempLength - 1].Email := arrDeletedCustomers[i].Email;
      arrTemp[iTempLength - 1].Phone := arrDeletedCustomers[i].Phone;
      arrTemp[iTempLength - 1].Points := arrDeletedCustomers[i].Points;
    end;
  end;



  iDeletedCustomersLength := 0;
  SetLength(arrDeletedCustomers, iDeletedCustomersLength);

  for i := 0 to Length(arrTemp) - 1 do
  begin
    inc(iDeletedCustomersLength);
    Setlength(arrDeletedCustomers, iDeletedCustomersLength);
    arrDeletedCustomers[i].CustomerID := arrTemp[i].CustomerID;
    arrDeletedCustomers[i].FirstName := arrTemp[i].FirstName;
    arrDeletedCustomers[i].LastName := arrTemp[i].LastName;
    arrDeletedCustomers[i].DOB := arrTemp[i].DOB;
    arrDeletedCustomers[i].Gender := arrTemp[i].Gender;
    arrDeletedCustomers[i].Email := arrTemp[i].Email;
    arrDeletedCustomers[i].Phone := arrTemp[i].Phone;
    arrDeletedCustomers[i].Points := arrTemp[i].Points;
  end;



  AssignFile(tFile, 'TextFile/Deleted Customers.txt');
  Rewrite(tFile);
  for i := 0 to Length(arrDeletedCustomers) - 1 do
  begin
    Writeln(tFile, IntToStr(arrDeletedCustomers[i].CustomerID) + '#' + arrDeletedCustomers[i].FirstName
                   + '#' + arrDeletedCustomers[i].LastName + '#' + DateToStr(arrDeletedCustomers[i].DOB)
                   + '#' + arrDeletedCustomers[i].Gender + '#' + arrDeletedCustomers[i].Email
                   + '#' + arrDeletedCustomers[i].Phone + '#' + IntToStr(arrDeletedCustomers[i].Points));

    chklbDeletedCustomers.Items.Add(IntToStr(arrDeletedCustomers[i].CustomerID)
                                + '   ' + arrDeletedCustomers[i].FirstName
                                + '   ' + arrDeletedCustomers[i].LastName
                                + '   ' + arrDeletedCustomers[i].Phone);
  end;


  CloseFile(tFile);
end;

procedure TfrmAdmin.UpdateSearchBar(Table: TADOTable; ManagePanel : TPanel);
var
  i : integer;
begin
  cmbxSearchFor.Items.Clear;
  for i := 0 to Table.FieldCount - 1 do
  begin
    cmbxSearchFor.Items.Add(Table.Fields[i].FieldName);
  end;
  cmbxSearchFor.Parent := ManagePanel;
  edtSearch.Parent := ManagePanel;
  edtSearch.Text := '';
  cmbxSearchFor.ItemIndex := 0;
end;

procedure TfrmAdmin.ValidateComponents(Owner: TWinControl);
var
  SpinEdit : TSpinEdit;
  ComboBox : TComboBox;
  i: Integer;

begin
  for i := 0 to Owner.ControlCount - 1 do
  begin
    if Owner.Controls[i] is TComboBox then
    begin
      ComboBox := Owner.Controls[i] as TComboBox;
      if ComboBox.ItemIndex = -1 then
      begin
        if ComboBox.Name = 'cmbxOrdItemCategory' then
        begin
          ShowMessage('Please select a category');
          Abort; // Abort is used to exit nested procedures
        end else if ComboBox.Name = 'cmbxOrdSize'  then
        begin
          ShowMessage('Please select a size');
          Abort; // Abort is used to exit nested procedures
        end else
        begin
          ShowMessage('Make sure you selected all the values');
        end;
      end;

    end else if Owner.Controls[i] is TSpinEdit then
    begin
      SpinEdit := Owner.Controls[i] as TSpinEdit;
      if SpinEdit.Name = 'sedOrdQuantity' then
      begin
        if SpinEdit.Value <= 0 then
        begin
          ShowMessage('Please select a Quantity');
          Abort;
        end;
      end else if SpinEdit.Value < 0 then
      begin
        ShowMessage('Make sure the values are not lower than 0');
        Abort;
      end;
    end;

  end;
end;
end.
