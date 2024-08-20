unit Home_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, RibbonLunaStyleActnCtrls, Ribbon,
  pngimage, Menus, Grids, DBGrids, dmCoffeeShop_U, FileCtrl, ValEdit, ADODB,
  ScreenTips, frmHelp_SearchSyntax_U, ImgList, dblookup, DBCtrls, Spin;

type
  TfrmHome = class(TForm)
    pnlSideBar: TPanel;
    pcViews: TPageControl;
    tbsCustomers: TTabSheet;
    tbsEmployees: TTabSheet;
    btnSales: TButton;
    btnEmployees: TButton;
    btnCustomers: TButton;
    btnInventory: TButton;
    btnOrders: TButton;
    imgLogo: TImage;
    tbsInventory: TTabSheet;
    tbsOrders: TTabSheet;
    tbsSales: TTabSheet;
    pnlHeader: TPanel;
    mmTop: TMainMenu;
    shpSelected: TShape;
    gridC: TDBGrid;
    Splitter: TSplitter;
    gridE: TDBGrid;
    gridI: TDBGrid;
    gridO: TDBGrid;
    gridS: TDBGrid;
    pnlManageCustomers: TPanel;
    edtSearch: TEdit;
    cmbxSearchFor: TComboBox;
    miFile: TMenuItem;
    miExit: TMenuItem;
    miHelp: TMenuItem;
    miSearchSyntax: TMenuItem;
    imglistIcons: TImageList;
    btnShowAddCust: TButton;
    btnShowDeleteCust: TButton;
    btnShowEditCust: TButton;
    gbxCustomerAdd: TGroupBox;
    miView: TMenuItem;
    miBussinessPerformance: TMenuItem;
    lbledtCustFirstName: TLabeledEdit;
    lbledtCustLastName: TLabeledEdit;
    lbledtCustEmail: TLabeledEdit;
    lbledtCustPhone: TLabeledEdit;
    dtpCustDOB: TDateTimePicker;
    sedCustPoints: TSpinEdit;
    Label1: TLabel;
    btnAddCust: TButton;
    cmbxCustGender: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnEmployeesClick(Sender: TObject);
    procedure btnCustomersClick(Sender: TObject);
    procedure btnInventoryClick(Sender: TObject);
    procedure edtSearchChange(Sender: TObject);
    procedure miSearchSyntaxClick(Sender: TObject);
    procedure btnOrdersClick(Sender: TObject);
    procedure btnSalesClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure btnAddCustClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    procedure SwitchPage(TabSheet : TTabSheet; PageTitle : String; Button : TButton);
    procedure ExecuteSQL(adoQuery : TADOQuery; sqlStatement : string);

  public
    { Public declarations }
  end;

var
  frmHome: TfrmHome;

implementation

{$R *.dfm}

procedure TfrmHome.btnAddCustClick(Sender: TObject);
var
  currentEdit : TLabeledEdit;
  i : integer;
begin

  for i := 0 to gbxCustomerAdd.ControlCount - 1 do
  begin
    if (gbxCustomerAdd.Controls[i] is TLabeledEdit) then
    begin
      currentEdit := gbxCustomerAdd.Controls[i] as TLabeledEdit;
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
    tblCustomers.Insert;
    tblCustomers['FirstName'] := lbledtCustFirstName.Text;
    tblCustomers['LastName'] := lbledtCustLastName.Text;
    tblCustomers['DOB'] := dtpCustDOB.Date;
    tblCustomers['Gender'] := cmbxCustGender.Items[cmbxCustGender.ItemIndex];
    tblCustomers['Email'] :=  lbledtCustEmail.Text;
    tblCustomers['Phone'] :=  lbledtCustPhone.Text;
    tblCustomers['Points'] := sedCustPoints.Value;
    tblCustomers.Post;
    dsCustomers.DataSet := qryCustomers;
    ExecuteSQL(qryCustomers, 'SELECT * FROM tblCustomers');
  end;
end;

procedure TfrmHome.btnCustomersClick(Sender: TObject);
begin
  SwitchPage(tbsCustomers, 'Customers', btnCustomers);
end;

procedure TfrmHome.btnEmployeesClick(Sender: TObject);
begin
  SwitchPage(tbsEmployees, 'Employees', btnEmployees);
end;

procedure TfrmHome.btnInventoryClick(Sender: TObject);
begin
  SwitchPage(tbsInventory, 'Inventory', btnInventory);
end;


procedure TfrmHome.btnOrdersClick(Sender: TObject);
begin
  SwitchPage(tbsOrders, 'Orders', btnOrders);
end;

procedure TfrmHome.btnSalesClick(Sender: TObject);
begin
  SwitchPage(tbsSales, 'Sales', btnSales);
end;

procedure TfrmHome.edtSearchChange(Sender: TObject);
begin
  if edtSearch.Text = '' then
  begin
    ExecuteSQL(dmCoffeeShop.qryCustomers, 'SELECT * FROM tblCustomers');
  end else if (cmbxSearchFor.Text = 'CustomerID') or (cmbxSearchFor.Text = 'Points') then
  begin
    ExecuteSQL(dmCoffeeShop.qryCustomers, 'SELECT * FROM tblCustomers ' +
    'WHERE ' + cmbxSearchFor.Text + ' = ' + edtSearch.Text);
  end else
  begin
      ExecuteSQL(dmCoffeeShop.qryCustomers, 'SELECT * FROM tblCustomers ' +
  'WHERE ' + cmbxSearchFor.Text + ' LIKE ' + '"%' + edtSearch.Text + '%"');
  end;
end;


procedure TfrmHome.ExecuteSQL(adoQuery: TADOQuery; sqlStatement : string);
begin
  // Close existing query
  AdoQuery.Close;

  // Clear SQL
  AdoQuery.SQL.Clear;

  // Build new SQL
  AdoQuery.SQL.Add(sqlStatement);

  // Execute new query
  AdoQuery.Open;
end;

procedure TfrmHome.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Application.Terminate;
end;

procedure TfrmHome.FormCreate(Sender: TObject);
var
  Tab : TTabSheet;
  i: Integer;
  btnSide : TButton;
begin
  shpSelected.Brush.Color := RGB(252, 163, 17);

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
  pnlHeader.Color := RGB(252, 163, 17);
  tbsCustomers.Show;

end;


procedure TfrmHome.miExitClick(Sender: TObject);
begin
  if (MessageDlg('Are you sure?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    Application.Terminate;
  end;
end;

procedure TfrmHome.miSearchSyntaxClick(Sender: TObject);
begin
  frmSearchSyntax.Show;
end;

procedure TfrmHome.SwitchPage(TabSheet: TTabSheet; PageTitle : String; Button : TButton);
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

end.
