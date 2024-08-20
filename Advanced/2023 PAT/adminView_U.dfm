object frmAdmin: TfrmAdmin
  Left = 366
  Top = 165
  Caption = 'Admin View'
  ClientHeight = 721
  ClientWidth = 1224
  Color = clBtnFace
  Constraints.MinHeight = 780
  Constraints.MinWidth = 1240
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pcViews: TPageControl
    Left = 161
    Top = 0
    Width = 1063
    Height = 721
    ActivePage = tbsSales
    Align = alClient
    MultiLine = True
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    object tbsCustomers: TTabSheet
      Caption = 'tbsCustomers'
      object Splitter: TSplitter
        Left = 0
        Top = 379
        Width = 1055
        Height = 5
        Cursor = crVSplit
        Align = alBottom
        ExplicitLeft = 2
        ExplicitTop = 236
        ExplicitWidth = 1053
      end
      object gridC: TDBGrid
        Left = 0
        Top = 384
        Width = 1055
        Height = 309
        Align = alBottom
        DataSource = dmCoffeeShop.dsCustomers
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = gridCCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CustomerID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FirstName'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LastName'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DOB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Gender'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Email'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Phone'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Points'
            Visible = True
          end>
      end
      object pnlManageCustomers: TPanel
        Left = 0
        Top = 57
        Width = 1055
        Height = 322
        Align = alClient
        TabOrder = 1
        object gbxCustAdd: TGroupBox
          Left = 12
          Top = 39
          Width = 390
          Height = 248
          Caption = 'Customer Details'
          Color = clSilver
          DoubleBuffered = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 5
          Visible = False
          object Label1: TLabel
            Left = 215
            Top = 78
            Width = 107
            Height = 16
            Caption = 'Customer Points:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Montserrat Medium'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 215
            Top = 132
            Width = 95
            Height = 16
            Caption = 'Select Gender:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Montserrat Medium'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 215
            Top = 26
            Width = 76
            Height = 16
            Caption = 'Select DOB:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Montserrat Medium'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbledtCustFirstName: TLabeledEdit
            Left = 22
            Top = 45
            Width = 121
            Height = 22
            EditLabel.Width = 68
            EditLabel.Height = 16
            EditLabel.Caption = 'First Name'
            EditLabel.Font.Charset = ANSI_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Montserrat Medium'
            EditLabel.Font.Style = [fsBold]
            EditLabel.ParentFont = False
            TabOrder = 0
          end
          object lbledtCustLastName: TLabeledEdit
            Left = 22
            Top = 99
            Width = 121
            Height = 22
            EditLabel.Width = 67
            EditLabel.Height = 16
            EditLabel.Caption = 'Last Name'
            EditLabel.Font.Charset = ANSI_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Montserrat Medium'
            EditLabel.Font.Style = [fsBold]
            EditLabel.ParentFont = False
            TabOrder = 1
          end
          object lbledtCustEmail: TLabeledEdit
            Left = 22
            Top = 152
            Width = 121
            Height = 22
            EditLabel.Width = 36
            EditLabel.Height = 16
            EditLabel.Caption = 'Email'
            EditLabel.Font.Charset = ANSI_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Montserrat Medium'
            EditLabel.Font.Style = [fsBold]
            EditLabel.ParentFont = False
            TabOrder = 2
          end
          object lbledtCustPhone: TLabeledEdit
            Left = 22
            Top = 204
            Width = 121
            Height = 22
            EditLabel.Width = 95
            EditLabel.Height = 16
            EditLabel.Caption = 'Phone Number'
            EditLabel.Font.Charset = ANSI_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Montserrat Medium'
            EditLabel.Font.Style = [fsBold]
            EditLabel.ParentFont = False
            TabOrder = 3
          end
          object dtpCustDOB: TDateTimePicker
            Left = 215
            Top = 45
            Width = 97
            Height = 22
            Date = 45125.000000000000000000
            Time = 45125.000000000000000000
            TabOrder = 4
          end
          object sedCustPoints: TSpinEdit
            Left = 216
            Top = 102
            Width = 75
            Height = 23
            MaxValue = 20
            MinValue = 0
            TabOrder = 5
            Value = 0
          end
          object btnCustAdd: TButton
            Left = 216
            Top = 182
            Width = 130
            Height = 46
            Caption = 'Add'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -29
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageIndex = 0
            ImageMargins.Left = 5
            Images = imgListManage
            ParentFont = False
            TabOrder = 6
            OnClick = btnCustAddClick
          end
          object cmbxCustGender: TComboBox
            Left = 216
            Top = 154
            Width = 145
            Height = 22
            ItemIndex = 0
            TabOrder = 7
            Text = 'Male'
            Items.Strings = (
              'Male'
              'Female')
          end
        end
        object edtSearch: TEdit
          Left = 863
          Top = 6
          Width = 161
          Height = 21
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TextHint = 'Search'
          OnChange = edtSearchChange
        end
        object cmbxSearchFor: TComboBox
          Left = 730
          Top = 6
          Width = 127
          Height = 21
          ItemIndex = 0
          TabOrder = 1
          Text = 'CustomerID'
          Items.Strings = (
            'CustomerID'
            'FirstName'
            'LastName'
            'DOB'
            'Gender'
            'Email'
            'Phone'
            'Points')
        end
        object btnCustShowAdd: TButton
          Left = 12
          Top = 6
          Width = 73
          Height = 27
          Caption = 'Add'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Montserrat'
          Font.Style = []
          ImageIndex = 0
          ImageMargins.Left = 3
          Images = imgListManage
          ParentFont = False
          TabOrder = 2
          OnClick = btnCustShowAddClick
        end
        object btnCustDelete: TButton
          Left = 91
          Top = 6
          Width = 89
          Height = 27
          Caption = 'Delete'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Montserrat'
          Font.Style = []
          ImageIndex = 1
          ImageMargins.Left = 3
          Images = imgListManage
          ParentFont = False
          TabOrder = 3
          OnClick = btnCustDeleteClick
        end
        object btnCustShowEdit: TButton
          Left = 186
          Top = 6
          Width = 89
          Height = 27
          Caption = 'Edit'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Montserrat'
          Font.Style = []
          ImageIndex = 2
          ImageMargins.Left = 3
          Images = imgListManage
          ParentFont = False
          TabOrder = 4
          OnClick = btnCustShowEditClick
        end
        object gbxCustEdit: TGroupBox
          Left = 13
          Top = 39
          Width = 209
          Height = 248
          Caption = 'Edit Customer'
          Color = clSilver
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 6
          Visible = False
          object Label4: TLabel
            Left = 20
            Top = 26
            Width = 160
            Height = 16
            Caption = 'Choose Value to Change:'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Montserrat Medium'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnCustEditConfirm: TBitBtn
            Left = 21
            Top = 180
            Width = 146
            Height = 48
            Caption = 'Confirm'
            DoubleBuffered = True
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -29
            Font.Name = 'Tahoma'
            Font.Style = []
            Kind = bkOK
            ParentDoubleBuffered = False
            ParentFont = False
            TabOrder = 0
            OnClick = btnCustEditConfirmClick
          end
          object lbledtCustEdit: TLabeledEdit
            Left = 20
            Top = 111
            Width = 165
            Height = 22
            EditLabel.Width = 107
            EditLabel.Height = 16
            EditLabel.Caption = 'Enter new value:'
            EditLabel.Font.Charset = ANSI_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'Montserrat Medium'
            EditLabel.Font.Style = [fsBold]
            EditLabel.ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object cmbxCustEdit: TComboBox
            Left = 20
            Top = 50
            Width = 127
            Height = 22
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemIndex = 0
            ParentFont = False
            TabOrder = 2
            Text = 'FirstName'
            Items.Strings = (
              'FirstName'
              'LastName'
              'DOB'
              'Gender'
              'Email'
              'Phone'
              'Points')
          end
        end
        object btnCustRestoreCustomers: TButton
          Left = 336
          Top = 6
          Width = 105
          Height = 27
          Caption = 'Restore Customer'
          TabOrder = 7
          OnClick = btnCustRestoreCustomersClick
        end
        object gbxCustRestore: TGroupBox
          Left = 408
          Top = 39
          Width = 409
          Height = 248
          Caption = 'Restore Customer'
          TabOrder = 8
          Visible = False
          object Label10: TLabel
            Left = 80
            Top = 24
            Width = 245
            Height = 19
            Caption = 'Select a Customer to Restore:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object btnCustRestoreConfirm: TButton
            Left = 56
            Top = 183
            Width = 129
            Height = 34
            Caption = 'Confirm'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnCustRestoreConfirmClick
          end
          object chklbDeletedCustomers: TCheckListBox
            Left = 40
            Top = 57
            Width = 329
            Height = 120
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object btnCustRestoreClose: TButton
            Left = 240
            Top = 183
            Width = 89
            Height = 33
            Caption = 'Close'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            OnClick = btnCustRestoreCloseClick
          end
        end
      end
      object pnlHeader: TPanel
        Left = 0
        Top = 0
        Width = 1055
        Height = 57
        Align = alTop
        Caption = 'Customers'
        Color = clMaroon
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -32
        Font.Name = 'Montserrat'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
    end
    object tbsEmployees: TTabSheet
      Caption = 'tbsEmployees'
      ImageIndex = 1
      object gridE: TDBGrid
        Left = 0
        Top = 393
        Width = 1055
        Height = 300
        Align = alBottom
        DataSource = dmCoffeeShop.dsEmployees
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tbsInventory: TTabSheet
      Caption = 'tbsInventory'
      ImageIndex = 2
      object gridI: TDBGrid
        Left = 0
        Top = 496
        Width = 1055
        Height = 197
        Align = alBottom
        DataSource = dmCoffeeShop.dsInventory
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object pnlManageInventory: TPanel
        Left = 0
        Top = 0
        Width = 1055
        Height = 496
        Align = alClient
        TabOrder = 1
        object btnInvDelete: TButton
          Left = 111
          Top = 6
          Width = 89
          Height = 27
          Caption = 'Delete'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Montserrat'
          Font.Style = []
          ImageIndex = 1
          ImageMargins.Left = 3
          Images = imgListManage
          ParentFont = False
          TabOrder = 0
          OnClick = btnCustDeleteClick
        end
        object btnInvEdit: TButton
          Left = 222
          Top = 6
          Width = 89
          Height = 27
          Caption = 'Edit'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Montserrat'
          Font.Style = []
          ImageIndex = 2
          ImageMargins.Left = 3
          Images = imgListManage
          ParentFont = False
          TabOrder = 1
          OnClick = btnCustShowEditClick
        end
        object btnInvAdd: TButton
          Left = 16
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Add'
          ImageIndex = 0
          ImageMargins.Left = 5
          Images = imgListManage
          TabOrder = 2
        end
        object btnInvCheckLowStock: TButton
          Left = 328
          Top = 5
          Width = 105
          Height = 27
          Caption = 'Check/Add Stock'
          TabOrder = 3
          OnClick = btnInvCheckLowStockClick
        end
        object gbxInvCheckAddStock: TGroupBox
          Left = 16
          Top = 53
          Width = 953
          Height = 386
          Caption = 'Check and Add Stock'
          TabOrder = 4
          Visible = False
          object lblInvAddStock: TLabel
            Left = 566
            Top = 48
            Width = 103
            Height = 23
            Caption = 'Add Stock:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblInvQuantity: TLabel
            Left = 823
            Top = 48
            Width = 90
            Height = 23
            Caption = 'Quantity:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object redInvOutput: TRichEdit
            Left = 27
            Top = 77
            Width = 481
            Height = 226
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object chklbInvAddStock: TCheckListBox
            Left = 566
            Top = 77
            Width = 267
            Height = 226
            OnClickCheck = chklbInvAddStockClickCheck
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 23
            ParentFont = False
            TabOrder = 1
            OnClick = chklbInvAddStockClick
            OnMouseEnter = chklbInvAddStockMouseEnter
          end
          object scrlbAddStockButtons: TScrollBox
            Left = 825
            Top = 77
            Width = 98
            Height = 226
            VertScrollBar.Increment = 20
            VertScrollBar.Tracking = True
            BevelInner = bvNone
            BevelOuter = bvRaised
            BevelKind = bkFlat
            BorderStyle = bsNone
            TabOrder = 2
            OnMouseEnter = scrlbAddStockButtonsMouseEnter
            OnMouseWheelDown = scrlbAddStockButtonsMouseWheelDown
            OnMouseWheelUp = scrlbAddStockButtonsMouseWheelUp
          end
          object btnInvRedOutputClose: TButton
            Left = 222
            Top = 331
            Width = 137
            Height = 40
            Caption = 'Close'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = btnInvRedOutputCloseClick
          end
          object btnInvAddStock: TButton
            Left = 665
            Top = 331
            Width = 137
            Height = 40
            Caption = 'Add Stock'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            OnClick = btnInvAddStockClick
          end
        end
      end
    end
    object tbsOrders: TTabSheet
      Caption = 'tbsOrders'
      ImageIndex = 3
      object pnlManageOrders: TPanel
        Left = 0
        Top = 0
        Width = 1055
        Height = 506
        Align = alClient
        TabOrder = 0
        object btnOrdCreate: TButton
          Left = 18
          Top = 6
          Width = 105
          Height = 27
          Caption = 'New Order'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Montserrat'
          Font.Style = []
          ImageIndex = 0
          ImageMargins.Left = 5
          Images = imgListManage
          ParentFont = False
          TabOrder = 0
          OnClick = btnOrdCreateClick
        end
        object gbxOrdCreate: TGroupBox
          Left = 2
          Top = 55
          Width = 1007
          Height = 362
          Caption = 'Order Details'
          Color = clSilver
          ParentBackground = False
          ParentColor = False
          TabOrder = 1
          Visible = False
          object Label5: TLabel
            Left = 24
            Top = 22
            Width = 71
            Height = 16
            Caption = 'Customer ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 463
            Top = 38
            Width = 80
            Height = 16
            Caption = 'Order Details:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 232
            Top = 119
            Width = 46
            Height = 13
            Caption = 'Quantity:'
          end
          object Label8: TLabel
            Left = 232
            Top = 166
            Width = 106
            Height = 13
            Caption = 'Dicount Points to Use:'
          end
          object Label9: TLabel
            Left = 352
            Top = 166
            Width = 79
            Height = 13
            Caption = 'Points Available:'
          end
          object sedOrdCustId: TSpinEdit
            Left = 24
            Top = 44
            Width = 97
            Height = 22
            MaxValue = 15
            MinValue = 1
            TabOrder = 0
            Value = 1
            OnChange = sedOrdCustIdChange
          end
          object btnOrdAddItems: TButton
            Left = 231
            Top = 239
            Width = 145
            Height = 40
            Caption = 'Add to Order'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageIndex = 0
            ImageMargins.Left = 5
            Images = imgListManage
            ParentFont = False
            TabOrder = 1
            OnClick = btnOrdAddItemsClick
          end
          object lbItems: TListBox
            Left = 24
            Top = 119
            Width = 185
            Height = 163
            ItemHeight = 13
            TabOrder = 2
            OnClick = lbItemsClick
          end
          object cmbxOrdItemCategory: TComboBox
            Left = 24
            Top = 89
            Width = 137
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            Text = 'Select a Category'
            OnChange = cmbxOrdItemCategoryChange
          end
          object cmbxOrdSize: TComboBox
            Left = 232
            Top = 89
            Width = 145
            Height = 24
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Text = 'Select a Size'
          end
          object btnOrdAddCustomer: TButton
            Left = 231
            Top = 31
            Width = 146
            Height = 32
            Caption = 'Add New Customer'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ImageIndex = 0
            ImageMargins.Left = 5
            Images = imgListManage
            ParentFont = False
            TabOrder = 5
            OnClick = btnOrdAddCustomerClick
          end
          object redOrderDetails: TRichEdit
            Left = 463
            Top = 60
            Width = 482
            Height = 141
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 6
          end
          object sedOrdQuantity: TSpinEdit
            Left = 232
            Top = 138
            Width = 71
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 7
            Value = 0
          end
          object redOrderTotal: TRichEdit
            Left = 463
            Top = 201
            Width = 482
            Height = 89
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object sedOrdDiscountPoints: TSpinEdit
            Left = 232
            Top = 185
            Width = 71
            Height = 22
            MaxValue = 20
            MinValue = 0
            TabOrder = 9
            Value = 0
          end
          object pnlOrdDiscountPointsAvailable: TPanel
            Left = 347
            Top = 185
            Width = 84
            Height = 24
            Caption = '0'
            Color = clYellow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 10
          end
          object btnOrdConfirmOrder: TButton
            Left = 640
            Top = 312
            Width = 131
            Height = 33
            Caption = 'Confirm Order'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            OnClick = btnOrdConfirmOrderClick
          end
          object bntOrdReset: TButton
            Left = 325
            Top = 312
            Width = 106
            Height = 33
            Caption = 'Reset Order'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            Images = imgListManage
            ParentFont = False
            TabOrder = 12
            OnClick = bntOrdResetClick
          end
          object btnOrdCancel: TButton
            Left = 172
            Top = 312
            Width = 106
            Height = 33
            Caption = 'Cancel Order'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
            OnClick = btnOrdCancelClick
          end
        end
        object btnOrdDeleteOrder: TButton
          Left = 146
          Top = 6
          Width = 111
          Height = 27
          Caption = 'Delete Order'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Montserrat'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnClick = btnOrdDeleteOrderClick
        end
        object btnOrdViewOrder: TButton
          Left = 280
          Top = 6
          Width = 99
          Height = 27
          Caption = 'View Order'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Montserrat'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnClick = btnOrdViewOrderClick
        end
        object gbxOrdViewOrder: TGroupBox
          Left = 2
          Top = 55
          Width = 1005
          Height = 324
          Caption = 'View Order'
          TabOrder = 4
          Visible = False
          object Label11: TLabel
            Left = 16
            Top = 37
            Width = 170
            Height = 16
            Caption = 'Select Customer or Order:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label12: TLabel
            Left = 424
            Top = 37
            Width = 49
            Height = 16
            Caption = 'Orders:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lbOrdViewOrderSelectCust: TListBox
            Left = 16
            Top = 59
            Width = 281
            Height = 169
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object btnOrdViewOrders: TButton
            Left = 16
            Top = 256
            Width = 105
            Height = 41
            Caption = 'View Orders'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = btnOrdViewOrdersClick
          end
          object redOrdViewOrderOutput: TRichEdit
            Left = 424
            Top = 59
            Width = 465
            Height = 230
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 2
          end
          object btnOrdViewOrderClose: TButton
            Left = 204
            Top = 256
            Width = 93
            Height = 41
            Caption = 'Close'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = btnOrdViewOrderCloseClick
          end
        end
      end
      object pcTableView: TPageControl
        Left = 0
        Top = 506
        Width = 1055
        Height = 187
        ActivePage = tbstblOrders
        Align = alBottom
        TabOrder = 1
        OnChange = pcTableViewChange
        object tbstblOrders: TTabSheet
          Caption = 'Orders'
          object gridO: TDBGrid
            Left = 0
            Top = 0
            Width = 1047
            Height = 159
            Align = alClient
            DataSource = dmCoffeeShop.dsOrders
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
        object tbstblCustomers: TTabSheet
          Caption = 'Customers'
          ImageIndex = 1
        end
      end
    end
    object tbsSales: TTabSheet
      Caption = 'tbsSales'
      ImageIndex = 4
      object gridS: TDBGrid
        Left = 0
        Top = 393
        Width = 1055
        Height = 300
        Align = alBottom
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  object pnlSideBar: TPanel
    Left = 0
    Top = 0
    Width = 161
    Height = 721
    Align = alLeft
    BevelKind = bkTile
    BevelOuter = bvNone
    Color = clSilver
    Ctl3D = True
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 1
    object shpSelected: TShape
      Left = 15
      Top = 177
      Width = 130
      Height = 40
      Brush.Color = clMaroon
    end
    object imgLogo: TImage
      Left = 24
      Top = 0
      Width = 113
      Height = 129
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000001360000
        017D08060000008E2344060000000970485973000012740000127401DE661F78
        000066154944415478DAEC9D0578134D108607DA02055A4A292EC5DDDDDDDDDD
        DDDD5D7EDCDDDDDDDDDDDDAD78F1022D5EE49FD972699246EE629BA4FBC23DDB
        5CEE2E7B97DC77BBB333B311402010089C8C08BC2B201008049646089BC06CD2
        C576CB8B45425C3C7089824B245CDC7071FDB7B8FC5B2242C86F4EFADDFDC125
        1897EFB87CC525089747B7DF061FE37D4E02C746089BC020285A99B0C8864B6A
        5C62408870458610F122D18A8E4B190B7FEC715C5E4388D8D1F219970FB804E0
        F20C97CB287EFEBCAF8DC07E11C226508122960F8BB4B824C625112E4970290D
        F6F93BD983CB0B5C48E05EE2E287CB6D14BCA7BC2B26E08F3DFE60053600452C
        0716F971C9884B1C5CE2E3928777BD2CC0395CDE4088D06D41A13BCCBB4202DB
        23842D9C804256148BF410DAAD2CCCBB4E36E2242E8F71B98ACB2514BA83BC2B
        24B03E42D89C1814B3265894A53F71C9C2BB3E76C20D0811BA3D287233795746
        601D84B03911286425B128002122960C97ACBCEB64E75CC1856C72F771398842
        B79B7785049641089B138082D6178B8A10226A02D33981CB6614B849BC2B2230
        0F216C0E0A8A59072C0A82E8665A83F3B85C849056DC06DE95112847089B03F1
        6F00A01E2EE4109B99777DC20934E8700197F9287267795746200F216C0E000A
        5A0B2C2AE15285775DC239DB70D9850237977745048611C266C7A0A0F5C2A22A
        84F89B09EC874BB81C4681EBC9BB2202DD0861B34350D00661510E977CBCEB22
        30088DAA92C075E75D11812642D8EC0414B32258348210EFFF8CBCEB2350C403
        5CEEE2B21C456E2DEFCA0884B071E79FA0910DAD11EFBA082CC25E5C96A2C0AD
        E65D91F08C10368EA0A84DC7A20D84A4F81138172B50DCC4C38A1342D8388082
        D61F8B1AB864E75D178155B986CB3614B841BC2B12DE10C26643FE8D72D6C425
        37EFBA086C0AF9C1CD43819BCFBB22E105216C360005AD2D8438D686978C1A02
        DD502CEA6214B8F5BC2BE2EC0861B332286AABB0A80BE25A0B425984E2D68277
        259C1971B359897FBE68D54164D810E8E63A2E07840F9C7510C2660550D4D660
        5187773D040E010D30AC44811BC7BB22CE8410360B8282D6058B06B8E4E25D17
        81C33107C5AD1DEF4A380B42D82C000A5A352CE847598A775DEC01970811E0F7
        DFBFBCABE18850BAA4552870537857C4D111C26626286AC3B1E80D2153D20990
        381EEEF026E81BEF6A382A34D7EA0C14B72EBC2BE2C80861330314B5A55834E6
        5D0F7B22AEA73B7CFBF90B02BF07F3AE8AA3436E21CD7957C25111C266022868
        2466AD41A4E20E43E1D4F1E1D8BD97BCABE12C9C8690C0FAD9BC2BE268086153
        088ADA042C3A82E87A862169ACE8E0E91E09AE3D0FE05D156783B2F7B6E65D09
        4742089B0250D428FF7D0DDEF5B0576AE64C0E3BAF3E856FC1BF7857C5195987
        E2265C886422844D06FF9C6D49D0C4A4297A48E6131DB226F181CD971EF3AE8A
        3343892D69D4743CEF8AD83B42D88C80A2B6088BA620AE95416A616BEDD1BB40
        B8F0F81DEFAA383B346A3A0BC5AD13EF8AD833E26635008ADA161013A818856C
        6BA5332686AD971FC3EB40E1E66123D6A3B8D5E65D097B45089B1E50D4B643C8
        24C4022354C9E60B5E5123C3D293F7785725BCB103C5AD12EF4AD82342D87480
        A2B60F4414812C7CA24781EA399261373408F6DF7CCEBB3AE191FD286EA57957
        C2DE10C2A6058A1AE5AC173F14991449131FD2C4F382737E6FE0CAB3F7BCAB13
        5ED983E2568E7725EC09216CFFF817C0DE0CC4C8A76C22BBB94093FCA9D9DF3B
        AE3D05FF0F5F7857293C43594256A3C08DE15D117B40081B3051EB83C5505CA2
        F0AE8B239139512CC89B220EFB7BF189BB10FCFB0FEF2A0900268A899C85B091
        A88DC482E62210334529A46EEE142CD280E242D79C7DC0BB3A825066A2B875E4
        5D099E846B61FB171ED583773D1C91045E51A162165FF6F70BEC82EEC4AEA8C0
        AEA0C963DAF0AE042FC2ADB0A1A84D839098CF707B0DCCA158DA04902A6E0CF6
        F7FDD79FE0F01D7FDE55128425DC6608099737F5BF898AC37553DD1C5C234680
        E685D2AA5E5F7EFA0ECE3F7ACBBB5A02DD2C44716BC9BB12B626DC091B8ADA4C
        2CDAF3AE872323451A489C7AF00A6EBCF8C0BB5A02FD843B710B57C286A23609
        8B6EBCEBE1E848BE6B1227EEBF845BFE1F79574B6098B9286E6D7957C256841B
        6143519B8C4557DEF570069AE44F0591DD5C55AF29B1E49D9742D81C8070D372
        0B17C226463F2D476C8F28502D7B328D7547EFFAC3DD579F78574D208F7091B4
        D2E9854D889A7CDC5C224224D788F0E587FE449199137943DE147135D6091B9B
        C3E1F4E2E6D4C2F66F06A941BCEBE128E4F4F5810B4F0CE7532B9D211124F5F1
        D05877E5E93B382746451D0DCAE9D6817725AC85D30A1B8ADA002C4638F3395A
        12CF286E903B795C3870CB70868EC6F953411435FB1A21FCD81C96D9286E4EE9
        21E094373D8A1A795C935B870BEFBA380A65332602FF4F5FE1DA33FD13B1B8BB
        B940A37F41EFEABCC2FDB65D79C2FB1404A6311DC5AD33EF4A581A671536CA0D
        2FB274C824B66714A8962D19ECBEFE0C9E057CD6BB9D7A1895368B8EDD815F62
        F6774765048ADB60DE95B0244E276C286A07B128CEBB1E8E4485CC892161CCE8
        2C90DDD044C7E913C48482A9E2E97C6FFBD527F0F2E357DEA722308DCB286CD9
        7957C2923895B0892491CA915A6BC4BCA3B70D6E9BC3D70772248DADF3BDABCF
        DEC1593F3180E0C06C4171ABC6BB1296C269840D456D2B169579D7C3D1A89839
        092488190D82B0A5B6DA48EAA10229E3428684DE3ADFFB8CFBAF12A98B1C1DA7
        99BBD429840D456D3D163579D7C3D1F08E1A196AE64ACEFE7E17F41D365D7A64
        707BF58C1EBA10B35439056B51DCEAF2AE84B938BCB0A1A8CDC622DCC4C05992
        12E912428A389EECEF171F3EC3CE6BCF0C6EAF1D23AACD93F741B0F78698D0C5
        095880E2D68A7725CCC1A1850D45AD3F162379D7C311F188EC0AF5F2A652BDA6
        D1501A153544A154F1205D829806B7D97CF911BC0DFCCEFBF404E6331AC5AD3F
        EF4A988AA30B9B70EB3091BCC9E340E6C4B154AF5F7EFC02DBAF1ACE829B2779
        6CC892D8C7E0366FB02BBA05BBA40287E7372E6D51DC16F0AE882938ACB0A1A8
        ADC1C2290C9DB6C63542046840193A5C43FD97E50852BAF85E5028757CA3C73F
        79FF15DCF417B1A34EC06914B6FCBC2B610A0E296C286A63B1E8CDBB1E8E4AEA
        B831A068DA041AEB28F07DE599FB06F74BE0150D2A664962F4F83F7FFD660309
        1FBEFEE47DAA02F3A129FDEAF3AE84521C4ED850D4287097124646E25D1747A5
        52165F88EF1535CC7A637E6C94F9A3698134B23E838472CB253FF8F2F337EFD3
        1598CF54143787CA65E888C276098B6CBCEBE1A850003B05B2EB62C3053F08F8
        F2C3E0FE95B3FA42BC1851410E9FB0C5B6EDCA63F8162CC4CDC1B986C2E650B6
        6C87123614B50D58D4E05D0F47267D022F28984AB79D4C4E5EB52C8963419EE4
        71647FDEFB2FDF61C7D5A7F043889BA3B301C5AD16EF4AC8C561840D456D3C16
        E17E866B732997293124F68EAEF3BDA7EF83608F113FB4C86E2ED0204F4A7075
        8928FB33A915B8E3CA13F8FE4B889B83E3305D528710B67F76B5A920D210994D
        EB22E90CBEBFF4E43DF8614480F2A78C0B19F58456E983C46DF7F5A706B3F30A
        EC9E3FB87447719BCABB22C6701461BB888553651FE041BC18EE50396B5283DB
        1CBFF7126E1B9998850611EAE44A01EE915C4109DF7EFE82BD379EC19B20E1C0
        EBC09C4361CBC3BB12C6B07B6143515B8845B89CCDDAD264F3F5815C7AB27348
        7CFCFA03D69DF7337A2CDF58D1A18CDADCA24A387AC71FEEBE1693BF38304B51
        DC9AF2AE8421EC5AD850D428B3A7DD377B1D8592E91342F2D89E46B73B78EB39
        3C7C1B6474BB4C89BC219FD6C42E72B9FEFC3D9C7EF886F7251198CE441437BB
        B579DBADB0A1A895C362352E31CC3D962084DAB9928357D4C846B7539282286B
        121FC89D2CB6AC6DB5A1F8D403B75E40F0EF3FBC2F8DC034BAA1B84DE15D095D
        D8B3B0894CB816C6D8C0813A67B035750D5B557248132F0614499340D6B6DAD0
        A0C29EEB4FE1B318547044CEA0B0E5E35D095DD8A5B0A1A875C1C22E9F048E0A
        C5853629905AF6F6BFFEFC818D17FCE0D3B76059DBD37C08D42D8D153D8AE2BA
        7DFD190CBBAE3D33EA1C2CB04BECD205C45E854D8C825A184F7737A89B3BA5A2
        7D3EA0D06CBEF408454EFE242D29E3783281533A624AF1A594364924AA74481A
        A2B8ADE45D0975EC4ED850D41661D18C773D9C8D98D12241AD9C2914EFE7FFF1
        0B8B1C5042246C1D521A7143D97675F1EBF71FF6596F8284B83918C751D80AF3
        AE843A76256C286A2DB070C8FC4FF60E4D885C378FB2169B84DFDB20A31329EB
        22998F07144D1B1FDC5CE4FB5507FFA6CC204F44B7D4F11883E2D68F772524EC
        4DD8CE639193773D9C9168915CA0413EF936366D1EBE098483B75F28DECF0305
        B55CC6C4E015CDF868AC044D01B8E1BC1FB3F3091C86EB286C99795742C26E84
        0D458D5A6A2D78D7C39951322AAA0BBFB781CC3D43296E2E11A17CE6C410D753
        5E5610E296FF073871FF95CDAF91C02C96A1B835E15D09C22E84ED5F2CE80CDE
        F570766AE74A015E51CD4B63678EB8511E381F0FF9A3A6342AFB5E74491D096A
        62B746715BC8BB22F6226CA7B1C8CBBB1ECE8EDCC803633C7A1704FB6F2AB7B9
        91CB49B51CC998BD4F0E8FF173F699F03902AE1C43612BC2BB12DC850D458DC2
        32C6F3AE4778C01C475A6DE4A438D2450CF748503D4752D9030ACB4EDE13E98E
        1C8FBE286E637956C01E844D0C18D808F22D6B942F95F907FA07CD45BAFFE60B
        F8A930244A89C01EBDEB0F775F89807907E3240A5B419E15E02A6C286A1DB198
        CEB30EE18DD2191241521F0F8B1DEFE3971FB0F3DA13C5731B54CD9614E278BA
        1BDDEEEEAB8F286E2F6D7E9D0466D30EC56D0EAF0FE7266C286A69B1388E8B8F
        B9C712C82751CC68503EB3F199A69440110ADB1566C895931B8E78F5E92B6CC3
        630B1C0E4AEA5704C5ED1A8F0FE7296C22C28013153227868431A39B7F2035DE
        057D6713B72809BF92D36A7BFFF93B6CBCF888CB7512980DB7A9FBB8081B8A5A
        492CF6F1FAFCF00EB97C54CF910C5C23CA9FB7400E4A071492C7F68092E91319
        DCE6E3D79FB0EEFC432ED74960113AA3B8D9DCDCC44BD8D661E13033DE382314
        EE542A4322F30FA4C5E5A7EFE0FCA3B7B2B625616D5EC8F03CA52F3F7E85ED57
        4557D481398BC26673572E9B0B1B8A5A012C8E829898853B4AA7D2930B65E9A0
        24927230D62D7EF026100E9910CA25B02B6C1E47CA43D8366351D5D69F2BD08D
        391970F5F12DF817AC3FE7276B302157521FC8E6ABFFF3A9F547AD4081437309
        852D872D3FD0A6C286A256058B2DB6FC4C817152C78B010553C6533457A831E4
        C67A52FEB6E2E912EA7D9FBAA1D41D15383CFFA1B80DB2D587D95AD80E6051C2
        969F299087476457289A3621C4F7921FA86E8C95A7EF19F56F8BE3E10E55B327
        D5FBFEA2E377148DB40AEC96CB286C364B1E6B336143516B85C53C5B7D9EC034
        6822649A10D9129C7FF406BB9186E74DF08E1A196AE64AAEF33DB2D391BD4EE0
        348C4671EB6F8B0FB2A5B08940770781D28897C0EE616C0FE391018690937D37
        067E561D3D29CB0FDD79010F5E07F2BE1C02CB711E852DB72D3EC826C22642A7
        1C93BCC9E340E6C4B14CDE9F12452E3A7ED7E03686844D74439D923E286EE3AC
        FD21B612B6B358D844A90596C55C979015A7EFC3D79FFAA7D6D36763BBEDFF01
        8E8B4493CE884DFCDAAC2E6C286A9DB09866EDCF11580F73D21D6DBCE807EF3F
        EB4F16E91B2B3A94C99838CCFA5567EE8BB9469D975E286E13ACF901B6103661
        5B73023227F6C6AEA9F24105635970D3C5F78242A9E36BAC23BB1AD9D7044ECB
        5114B6A2D6FC00AB0A1B8A5A3D2C5659F33304B6A37486C490D44759F0FCEAB3
        0F20E8BBFE49970BA68A07E913C4D4584713B9047C1529C19D9C7A286E6BAC75
        706B0BDB212C8A59F33304B683E60BAD9123199B794A2EF38EDE36F87EE5ACBE
        102F46A8EFDCFDD79FE0F01D7FDEA72AB03E3B50D82A59EBE056133614B5CA58
        6CB5D6F1057C481A2B3A94D66113D3859C9443CD0AA66113BD4808DB5AB8A22A
        8A9B5534C29AC24615AE6CB54B22E046CD9CC9C15BC63CA1379E07C0A987AFF5
        BE9F206634A8A896F4524966108153B01185ADA6350E6C15614351CB83C5696B
        1D5FC0173979D4889D579FC28B8F5FF4BEAFEE274781F36BCE3E846085F32708
        1C9E12286E872C7D506B099BC88EEBE434CA9F0ADCDD5CF5BEFF33F8372C3975
        CFE031EAE64E019EEE21F39C1EBEFD02EEBF115106E190B9286C6D2D7D506B09
        DB0D2C3258FD9208B841492A93199814E6FAF3F770FAE11BBDEF535796BAB4C4
        EBC0AFB0F5B24826194EA121F334286E16CDFF6E716143516B87C52C5B5D1501
        1F3227F286BC29F4FBB5AD39FB00020DB879A8E761A3D4DF94025C106E1980C2
        36CA9207B486B0EDC5A2B4CD2E89800BB13DA340B56CC974BE27272B471DEC86
        D2E4C9171FBF858B4F4422C970CE6114B6E2963CA045850D452D1716E76C7A49
        045C88E2EA028D0BA4D6F9DE860B7E106020DA2071CC68502E7312366DDF7ADC
        5610EEA14C078551DC4E58EA809616B6A95874B6F55511D81ED70811A079E1B4
        61D6CB99A94A9AE7603D76413F882EA82084E9286C16D30E4B0BDB452C6C9625
        53C097D645D28559672C36544A2C4969C3297DB840F00F8B66FDB098B0A1A855
        C36213974B22E04253EC8A529895C48D170170EAC16B83FBD068AA0BFEEA94CC
        3F2A08377444719B6989035952D86892962ADC2E89C0E6A8B7D8E438D8928B47
        79EC86AE3BFF087ECA98C14A10EED88BC256D61207B288B0A1A8D1D45A17B85E
        12814D891ED915EAE74DA57A2DC7C1B65CA64470E5598098754A608862286E47
        CC3D88A5848D9A8FED795F1181ED88EBE90E55B225657FCB71EFA04CB929E37A
        1AEDAA0AC23DB350D83A987B104B09DB352C32F1BE2202DB21CD07FA03BBA0EB
        CEFB6157D470D7B240CAB87052889AC0385750D8B2997B10B3854DA4270A9FE4
        F0F5811C4963C3BE1BCFE0F1FBCF06B7F5891E05FEFCFD6BD0B74D2050A3258A
        DB42730E600961A3F0A976BCAF84C0B654CC9204BEFEF805876424858C153DB2
        C1790F04022DD6A2B0D535E70096103631035538A451BE54B0EE821F7645C5E8
        A6C0E2D053302D8ADB63530F6096B0A1A891A09DE57D1504B6257E8CA81035B2
        0B3C7C13C4BB2A02E7A5310ADB7253773657D82663D195F71510D816B299BDFB
        FC9D773504CECD3414B62EA6EE6CAEB051C07B2EDE57402010381D94F225038A
        DB1B53763659D850D47262719EF7D90B0402A7A5290ADB5253763447D87A6231
        9EF7990B0402A765350A5B7D53763447D8F6605186F7990B0402A7C5E48C1F26
        091B8A1A45195C35757F81402090497914B7DD4A773255D8283F793FDE672C10
        089C9E79286C6D94EE64AAB089D1508140600B4C8A1D552C6C286A85B138CAFB
        6C050241B8A13E8ADB6A253B98226C43B018CAFB4C1D81881122C0E8E625656D
        DB67E1FE30EB68D293671FBEC8DA5F609868915C203E5ECF58D12283A77B64F0
        88EC06D1A3B8C28E2B4F21E0AB661C6B8AF831A175F99C468F19F0F91B8C5D6B
        B1F94704FA998FC2D65AC90EA608DB762C2AF23E5347204A245718D6A898AC6D
        75091B65D0F880379DDF5B11BA640A89624687643ED121010A5A8C7F33CE6BB3
        FBDAD3300F0FB9C246E8FADE0416E7140A5B01253B98226CB7B148AB74BFF088
        5C61FBF0F93B8C597B3CCCFA2269E2B3F0A58D172D3A49B653E319C50DD2C4F3
        82547163608BCCCDE8F6C7EEBD843B2F3F6AAC33F78124B00A5951DCAECADD58
        91B0A1A895C76227EF337414E4DE207E2F0360EEAE8B61D6D3FC00D4EAD876E5
        31BCFAF48DF7E9D83531A346821C49E340F2D81E8AF6BBF0F82D5CD23161F3D8
        16A564ED4F0FA40F226ED6167446619B2E7763A5C2361F8B96BCCFD051F08A16
        19FAD52D6C743B7DC256259B2FC4F58C0A2F3F7E81ED579FF23E1DBBC48B04CD
        3736A488E369D2FED79EBD87337E61C311E50ADBBC5D17E0E14B318DA00D588A
        C2D654EEC64A854DCC1BAA007385AD468E64100BBBA2C48E6B4FC15F0C24A8F0
        C06E66CEA4B15997D31C6EFA07C0C9FB6153960B61B33B8EA3B019BF99FE215B
        D844D0BB72CC15B63AB953A88CDE6F02BFC196CB8F799F1277A24576652DB4B4
        F1BD2C72BCBBAF3EC2D1BB2FC3AC1FDAB028B847366EA313C266530AA3B81D97
        B3A11261A3BC6B93799F992361AEB0D5CA991C62E23124E4CC2FE0ACB8468C00
        D992F840365F1F8B1E579FB0F5A95310BCA3BB1BDD5F089B4D198EC23644CE86
        4A848D1CE4CCCA431EDEF0708F0C03EB9B2E6C55B32585389EA137D7872F3F60
        FD053FDEA7657368DABEDCC9E2B2B94C2D8DBED9EB4557D42ED98CC2565DCE86
        4A848DBAA1F29C7B040C73474569C294045ED134D61DBAFD021E189998D85920
        D78D226912407CAFA856FB8CCB4FDEC2F9C7A68F8A0A61B329E751D864CDAF22
        4BD850D4324348360F8102CC15B6321913816F2C4DF785CFDF8361DDF987F0EB
        CF5FDEA76755B262B73377B2D856FF9C737E6FE0CAB3F761D6CB1536E2E69337
        FF96B7F0FDE72F9B5EA770480114B753C636922B6C94C96314EF337234E40A9B
        FFFB2098BAE54C98F5C5D226D039EA77E5E93B38F7E82DEFD3B30ADE51234391
        B4F121B68771FB96253871FF25DCF237DD41579D6F3F82E1E4AD6770FCC61321
        70D6A32F0ADB58631BC9153672CA2DCFFB8C1C0DB343AA92C6666155BAD870DE
        2F4C8CA3A39313CF357B52EBB7D2D4D971F529F87F343DA44A172470EB8FDD84
        9B4F9DF3E1C399F5286CB58D6D2457D82E6161F6B4F3E10D2541F043961F0EF3
        944F19C7138AA74BA873FBF79FBF3B4DA8154DA85C226D42368A6C6B569EB90F
        5F7E685E7773854DE2C0653FD87FE9A1CDCFC9C9B988C266F4CB912B6CCFB048
        C4FB8C1C11738CD0B13DA240B5ECC9F4EE73F1C93BB8F8D8B15B05B992C5666E
        1C3C08FEFD1B169FB817667DC10C49A052DE3416F98C0BF7FD59EB4D6051F2A2
        B8199CCFD8A8B0A1A835C26219EF337154BA56CD0BF163198F5FDC7EE62E9CB8
        A91936E51A3122342F64F806DB72E931BC0972BC38D2D89E51A0589A842C248A
        17EF82BEC3A64B615BBD95F2A48682197D2DF63942DC2C4E6F1436831349C911
        B6D958B4E57D268E4AADC2192067AA0446B7A32E0B755DB4A99D2B85C19BFF33
        76A3365DF083EFBF7EF33E55D9D06867564EAD34756EF97F8013F75F8559DFA6
        7C0E481EDFDBE8FE24581FF0A19233754288F92FF44D1F276E3C81ED67EF193D
        A640162B50D81A19DA408EB01DC4A238EF3371544A664B0EA5B2A730BA9D3E97
        8F82A9E241FA04310DEEFBFCC367D875ED19EF53350A75AD8BA649A0114DC193
        03B79EEBCC75A7D47C408344D47D35F63D0B9F378B710085CDE0972447D844FE
        353330376921A5E12999DEB879535FEBC35EE0694BD3C79293F7E0A7564B3781
        B70774A9266FC637ED011FDAB735B6F6F4C59852C6DDA99BCF085710F3B98AC2
        96D5D00606854D04BE9B0F7551FAD629246B5B5D4F7477371768943FB5ACFDCF
        3C7C0DD79E07F03E650DE2C5708742A9E2DB4D2B4D42DFA8B2DC81037DC9418D
        899B2E5BAAC02472A0B85DD2F7A63161EB8EC544DE67E0E8C8CD14A1CFCEA61D
        336A8813F75EC12D3BE8EE9020E74D11D7ECB442D6E2F29377705EC788729312
        5921BD0C5FBA5BB8EFD2835774BE67A8D527E649B018CD51D816EB7BD398B0AD
        C1A20EEF337074E4DE2CFAEC6C991279433E1409B95050370577F32263C2982C
        575A2457176E75300685A57DFCFA33CC7A731F4212866CAB34424A030F02B398
        84C2D643DF9BC6848DDADA05799F81A343A3A2343A2A075D8EBAEE6EAED81D4D
        A5E833AF6397F4F4C3D78AF6319714B13D2057B238E0E9CECF85430EFABAA119
        92C486C6A5B2CA3A86B181001A50E85BBBA04E9134D4DA13C8C6600482316113
        03071640899D4D9F0DA662E6246CB6252550A8D0E13BFE613CEB2D8D6FACE890
        DDD7C766F19DE672E6E11BB8F63C6CE0BB5CD71C0A991ABAE288D1EDF4B5DAE4
        EE2F30C8491436BD8D2EBDC286A246D35D0963808590EBA8AB2F203E75DC1850
        34ADF19B4E9B9FC1BF992DE9A6BFE5ED6EC97C3CD848A78F4714F30F6643569E
        BE075F7E86F5FB93DB0D95EB706BC8D6A6AB652E504C4E14B78BBADE30246C9D
        B098C6BBE6CE82126F767D331F35C89B8AA5C636858F5F7EC069BF37F02CC0BC
        0CBC94EC31659C184C6879C4769A8BBE8CB94ACC05CBF65F911DE0AE4F2C8761
        8BED2BB6DC0466D111856DA6AE370C091B4D75D59177CD9D0525FE6CFABCD433
        27F266238DE6F0EAD35778F2FE3313B8802FC6B383504AEED89EEE1017BB99BE
        3ED1D9AC598E8CBE410372D1482123DA406937525F14C3587C78058869FBCC65
        260A9B4E8D32246C6BB1309A1E44201FB2B3190BBD21E8E619B3EE4498AE8A9B
        4B44A89F27054476B34C8AEC6F3F83E175E077F8F4ED07047DFB0541F8B9E4A6
        41996B63448DCC42B962C9A8AFA3F0E85D10ECBFF93CCC7A254EB94A0DFFFA84
        6DFCFA13F02ED0F1627CED8CB5286C3AA72B30246C7BB128CDBBE6CE84DCF02A
        429F3B0119E973DA386799B3B0F1A21FBCFF1CB6952A77D08050EAAA2184CDAA
        EC41612BA7EB0D43C226E610B5304A4647F5B5DA88DAB992636BCAF1EC5B3CB9
        F13C004EE9707F51F29DE88B3630843E611BBDE618B37B0ACC42EF1C083A850D
        458D04ED22082C8E255A07713DDDA14AB6A4BC4FC561A00C28EBCF3F84E0DF7F
        C2BCA7E4FB30251C4A5F40BD183CB0187950DCCE69AFD4276C2DB198CFBBC6CE
        8892410443AD3639593F0421ECB8F614FC3F7C09B35E896DCDD077A10F43DFB5
        70F7B0181D50D86669AFD4276C141FDA9D778D9D15B9830884BE11524A425913
        BBA464E817E8C750D613B923A18429C922F5B9F808075D8B320E85AD8FF64A7D
        C2B6148BC6BC6BECAC28F1992228D58D7F40D8BC613457408D1CC9799F8EDD42
        134C6FBEF8087EFD0D3B55A1D2EF409F6FA13E0C8554898CBA16653A0A5B67ED
        95FA846D1316D578D7D89951D26A7BF83200E6EDD26DF2541A201F5EF8F5E70F
        6CB8E00781DFC2DAB10C898E2E2CD95A239438F80A8CB20085AD95F64A7DC2B6
        0F0BF933C60A14A37426244386EBD2191243529FE8BC4FC9AE3874FB053C7813
        A8F3BDC625B34006DF38B28FA5B4B5662898DE949155814174FAB2E913368A11
        2DC0BBC6CE8EDCDCFA12FABAA4141D50396B52878BD9B416171EBF854B4FDEE9
        7C4F6917D4587A226D8C259A14298B2CCE3114B622DA2BF509DB2D2A78D7D8D9
        51DA6A33945A3A8AAB0B54CB910C3CC2F960C2FDD79F5846135D18131D6D948E
        84524B8D4453DFF1456BCD6AE44371D3C81C1146D850D468E29683BC6B1A5E90
        9B8452E2E69337B0ECC0559DEF79BABB41156CB9B947B24CC895A3F1F85D10EC
        D3113245905DAD0D3E4412C8C8B02221B77545C72E94D197459618424CE66235
        1AA3B02D575FA14BD8443A701BA2D4904D18B2B751F68DF2999384BBC8847BD8
        523B7247BF0875A99A5791A811E46A73F1FE4B9DDD7F825A803952C5C72581D1
        EF4FCC7560557AA0B04D525FA14BD844560F1BA32473AB84A1D64424D788503A
        432248E0A52C31A5A372EED15BB8F2F49DDEF7954417E88346A6D52151B3E6A8
        AA40118350D8FE535FA14BD81661D18C774DC31BA6DC7CC6BA4AC5D226B0DBC9
        542C01B9741CBEEDCFB276E843EEAC53D642889A4D188BC2D6577D852E615B89
        457DDE350D6F5097B46BB57CB27DDB08326E937F9BBEAE129131A137E44FE97C
        7E6E41DF8361CFF5A7F041476E358902286A95398A9AE87EDA8C29286CDDD457
        E812B60D58D4E05DD3F088D2515282C46DC7D97B065B6EF16244C5AE69428862
        A13C6EBCA1B8CF7DB75E8499EC581D4B743F4D85463FB79FBE239C706D4798E8
        035DC2B6158BCABC6B1A5E31B5EB64AC5B4A29C52970DE57A101DD9E08C6AEE7
        A5C7EFE0EAB3F706B73355D4E8FA91BD53C9408E3A721E3202AB300B85AD83FA
        0A5DC2B6038B0ABC6B1A9E31F5C694E39E40334AE54F19CFE1FCDDC88E76EAFE
        4B9D93B0A863EEB523934046DF3828707164B9E1909851CBECD6E337F0F0D507
        91B1830FB351D8DAABAFD0256C229CCA0E501A9520413727D9760CDD60AE1122
        409624B12053426F88E466BF931A133407E859BFB7F0FC83E14968C836D9B864
        56C52E1D84BE0C2A049907624677072F2DDBE7A35721FE68C22FCD2E9887C2D6
        467D852E613B824511B9471458076A39B42D9F53D6947DDAD0147ED4023134A8
        40502856EAB85E2C903E4654FB9AE4989C6DAF3D0F6093CF18C398C7BF21C4A8
        A553B004854DC3934397B05DC2221BEF9A0A425A21E4586ACA0D4B5DA4FD97FD
        E0A4CC51B924DED1D9B47A29E37A723BDFCFDF83E1FEEB8F70F7D52708FC6E3C
        BB2C893FD9234D1D2478890F8039BB2E88EEA3E3B31585ADAAFA0A0D6143512B
        86C521DEB51484A234BE511B722CA51689DCEC14341356B2D81E6CDE505B38F8
        7E0FFEC5A603BC8762F65246EB4C82BA8835B195E61DDDB4D9E785A839153479
        442E14B7EBD20A6D6113E1547608B5DC9A94CC6A52B7548232541CBFF144D18D
        4C110C8963468324F8B989BCA381BB85DC45DE067D836728664F03BEC09B2065
        3335D1B5A0569A92B443DA0851734AAAA2B06D955E680B1BC55B75537C4881D5
        31C7E62641D9410E5C7AC8E21F4D81465229063556B4C8101397E8D88A8CE416
        1122B9B8E0124135DFE937148C9FBFFF40F0AF3FF00D5B641FBFFE608EB494D1
        962669D635A98A9CF39713686E0C6153735A346685D716B6C55834E55D43816E
        2C216E84B902674BA8859633754228903EB1C9DD7109216A4ECD0014B651D20B
        6D615B87452DDE3514E887C4AD4EA18C8A521DE98304EE128ADB857B2F146588
        B505645B2C903189C5A2070CB974089C8291286C03A517DAC226A20E1C044B07
        77539EB790E52D37DB13B5CED2FBC66162668A3F9A2E6874985A6922BCC9E999
        88C2D6537AA12D6CBBB128CBBB860279D0C860A31259CCEEA2A94342E0F7EA03
        733C7D848B315F387391729A9133B2A5C44C820609961EB86277AD5181559881
        C2D6497AA12D6CFBB128C9BB8602F950D7B449C92C264529C84112BA97019FE1
        C5FB40F818F4DD64B14B8E421C1F85CC1B5B6664275492D34C29A2EB19EED088
        3ED016B6C35814E55D438172A86B4A2386D6120A6DC83EF741CD5583BAAF247E
        51DC5CC20C6EC89D94D81250EB6CFDB11B22D429FCB11085ADA5F4425BD88E62
        5198770D05A661AE27BEA3A37446298153B11885ADB9F4425BD8680A9D82BC6B
        28300FB2BDD52A9C5151D24A47C6EF6500AC53105D21704A34E245B5854DCC27
        EAE02467D928A280B74754B39D591D01C9658542C7BEFFF865F5C10E81DDB214
        85ADA9F442089B03415D4D69E450B25B258BE7A5F15A106AFFA316DC475C0282
        BEB2BF85F03935CB51D81A4B2F84B0D9199278D1E861D4C86E4CB8DC23B959DC
        15223C4323BD2470D280C7577CFD125F4B6228704856A0B035925E0861E30C75
        1DA9B54502664DF707817C289F1D091FB5F6A88BEB2746581D8195286C0DA517
        42D8384036B092D95398955F5F603BA885779132130BBF387BC6A0B08951512B
        634EF248015F6E3D7E0B4B0F5EE15D0D816E0C0ADB312C0AF1AEA13343DDCD2E
        D5F2F2AE86C00484B0D935066D6C4740CC77607578CE7929500E754569E2635A
        44724ABB65190A5B13E985B6B01DC4A238EF1A86076C1D0225500605D04B0307
        223388436030F2404CBD6763A8E526770E4B81E5F9F6CFD523E0F3772666F4B7
        8833754816A0B0B5925E88B4457602F9AFA5881793B97F487E6CA235671948B0
        BEFD0C66E245BE6AE4C6F1E1F33778F13E48742D9D87B9286C6DA517DAC22666
        81B7234242A3DC21190A9EFB3FC75D72D6353735B83320B5B488EF3F7EC38B80
        40F6B7245A846879852B0CE663DB8C4555C58714708182DD89286EAE1A6297D0
        DB13A2440E9DE13DA64754BB0A88975A50EAA88B9384BA4811A2852530C02414
        B61ED20B6D615B8B456DDE3514D88E88F40B8810C1ECE3A8F80BF0E7EF5FDEA7
        25087F8C42611B20BD10B3540904026760200ADB48E985B6B04DC1A20BEF1A0A
        04028142BAA2B04D955E680BDB602C86F1AEA140201028A4290ADB52E985B6B0
        B5C6622EEF1A0A04028142CAA2B0ED955E680B1B05C01FE75D4381402050C057
        5C72A2B0DD965684190E4371BB884576DE3515080402996C4651ABAEBE4297B0
        899C6C0281C091D0C8EC41E812B62320327C080402C7416322174297B01DC0A2
        04EF9A0A0402814C6409DB1E2CCAF0AEA9402010C84496B06DC7A222EF9A0A04
        02814C34264B267409DB262CAAF1AEA9402010C84423171BA14BD85662519F77
        4D0502814026B351D8DAABAFD0256CB3B068C7BBA602813D922A556A2858A810
        A4499B1662C6F4C62524755460E02778FAF4295CBC78110E1F3C005FBF7ED5B9
        BFABAB0B64CD961DF2172C048913258698B16282570C2F080E0E8680F701E0E7
        F710CE9C3E05A74F9D823F7FFEF03E5D4741236511A14BD8FA61318A774D0502
        7B225BF6ECD0B57B0F14B04058BB7A153C7CF010DCDCDC50A4B242D3662DC027
        76686AF7C04F9F60C2847170E4D021D5BA08112240A5CA95A179CBD670F6CC69
        D8B57327BCF47F019E286A458B15857AF51A825BA4D08CC98F1F3F82218306C2
        233F3FDEA7EE080C41611BAEBE4297B05106DD1DBC6B2A10D80BDD7AF4826AD5
        ABC31A14B45933A68779DF3B562C98357B2E24489850B52EF86730D4AA5995B5
        C23C3C3C60ECF889D8CA4B07C3060F8463C78E86394696ACD960D2E4A91AE2F6
        E0FE7D68DEB431EFD377045AA1B02D505FA133C3208ADB7D2C52F2AEAD40C09B
        1EBD7A4395AAD5E0C4F163D0BF6F1FBDDBA5C42EEAAC3973214A94D04CC5B56B
        5667ADB7C953A743BAF4E961FAB429B07EED5ABDC7A85CA50AF4ECDD57F5FAA5
        BF3FD4A95583F725B0777EE3520485EDA4FA4A7DC276098B6CBC6BECACC48AE5
        037FF15FC0FBF7BCAB223040CD5AB5A173D76EF0E3C70F6854BF2EBC7AF5CAE0
        F679F3E5876ED85D75778F0A2B572C83B56B56C37FA34643E12245B1EBFA005A
        346B62D46ED6B84953A85DA72E7C0A0A84C913C6C385F3E7795F067B673F8A5A
        69ED95FA848DD42F3FEF1AAB9333572E888E4DFADFC1BF20F8D72FFCB17D879F
        3F7FE2120C7FFFFE8588112342246CC647891C1922458EC2FE7EF7EE1DDCB87E
        5DE338050A1664B6915F780CDAFFFBB790E3FCFEFD1B5C5C5C208A7B14F0F2F2
        C227AF3BFE40A3E0E2CE8E4717EACB972FF0F9F36778F6EC293C78701FBE7DFD
        26BBFE74CCBAF51B40F11225215EBC78B073E776183BCAB14D99D405CB993317
        244F91027C7D7DF1BCE2B3EB47D0CDFD07AFE937FC9E023F7E027FFF17F0E2F9
        73B87EFD1A5CBF7615BE7FFFC1BBFA06A1EF6BCDFA8D10356A54D8BF6F2F8C18
        3654F131F2E4CB0BE3274C667F8F1B3306766CDFCAFBB49C913071A2843E61B3
        BBF9453365CE04DEDEB120468C18903C794A2855A60CB35D68F3FEFD3BD8B963
        3B3C79FC049E3C7902F7EEDED1783F478E9C780C2F88173F2E142D5602D2A64B
        17E6185F51B0F6EFDB038F1EF931F18A1C3912FBECACD9B241C64C99C1D5D595
        3D79E906DDBD6B17FBE1D3A89621264D998AE29C5BF57AF2C409B079D346DE97
        553174FDCB57A808254B95668276E3C6753876F408DCBB73978DE8050505A9B6
        25514899321564CE9215F7290F89122761EBC9FE74F6EC69D8BA65339C3D7386
        F729E9A465EBD6D87A0AF1F9ECDEB5B3492DA719B3E6E0B967612DBE2A15CBEB
        1D291598C55414B6AEDA2BF509DB7A2C6AF2AEB121A83BB768E932D5703B412D
        AF86D46578F952F671B40587E8D6B9135CBC7841E7F6F1E32780F61D3B4291A2
        C554EB9E3D7F66B4DB4076961C3973AA5EB76DD5026EDDBAC5FB32CAC6DBDB1B
        9AB56809E5CA5760ADE3BDBB77C1B2A54BE1E54B7FD9C7285ABC3874C1AE1D7D
        771257AF5E854EEDDBCA3E862DA0F3DBB8792BC4F2F161225CB67409A30F2E6D
        7C7D93C2F255AB43CEF1CA65E8D4A1BDA2FD05B21989C236507BA53E61A3DCE1
        9D79D7D818DD7BF686AAD54283246EDEB801EDDAB452740CBA51FB0D08BD2E1F
        3F7C84CA15CB19DDAF69F316D01C6F7409EACA8E1B3B0676EFD43DA03CFCBF91
        D8422CCEFEA66E70D9522598103B0275EAD6836678BE51A345636E0823860E85
        FBF7EF99742C4F4F4F183B611264C89081BD26334289A285F09AFCE67D9A2AA8
        773073F63CF6F7AD5B37F121D452F1311A356E02ADDA8408F6AA15CB61CEEC59
        BC4FCB59E98BC236567BA53E61A33EEB32DE353646FD860DA16DBB0EAAD7C78F
        1D8301FDFA283A06D9EE264D99A67AAD64887DC0C04150A65C79D56BBA493BB6
        6F835DD4EB61B6EDDDA72F54AC5C45F167F084BA9DFD070D867CF942CCAD674E
        9F86C103FB996D1F23FBDBB4193399932B51BB4635A386795B420F2C7A70115B
        366F864913C6293EC6F499B3980B073174D0203874E800EFD37256EAA1B0ADD1
        5EA94FD832637195778D8D51BD460DE8DABDA7EAF5A103FB61E890C18A8E9129
        73667C3A874EF370F3E64D68D75ADE139A6C481BB0CB123D7A74D53A1AFD6AD6
        248C2D13DAB6EF00F51B34647FEFDCB10DC68E1ECDFBF219C43B96374C9B3E13
        9260978A20511BD0B7371BB8B10409132582858B96B05660FBB6ADC30CF2F064
        C2A429903B4F1EF6F7DC39B361E57265CF78EACAEEDE77900D3E11D48BA0DE84
        C02A644361BBA2BD52EF4CB98E90229CB7B0111D3A76863AF5EA69AC6BD1AC29
        DCBF7757635DC3464DA075DB90AEC9E489E361F3A64DBC2F9F5EA8A53673F61C
        95A83D7FFE1C5AB768C646842D0975713B74EACC3CEC0F1F3AC8FBB4556CD9BE
        93D91489FF860F837D7BF728DA5FDDBE46D4A85A05DEBE7DC3FBB49C9163286A
        3A93E21A12B62360E79974ED41D8B2E7C80153A6CDD058376FCE1C58B17CA9C6
        3AB205924D9068D3B239DCBE7D5BF667D89A71132641DE7CF954AF3BB66B0BD7
        AE59BE014FA3CD6BD66D8455AB5618745CB525D1B005B97B5F68B7B17B974E70
        E1C20545C7A058D2516342BBAFC50A1780DFBF45DCA7155887C25647D71B8684
        8DACE01578D7DC10F6206C51A24486BD070EB3584009726398385ED32E43FE6B
        43878FB0FB8103720EEDD83974CEEC03FBF7C1F0A143ACF6792D5AB6623E8333
        674C33FF60162045CA94B078E972D56B53BAC9356AD6822EDDBAB3BF83837FB1
        C11181550893D543C290B0D1B7DB9077CD0D610FC246ECDEB71F9FF4A176B6A3
        470EC3A001FD35B6219B0DD96EEEDFBBC73CD0ED11EA82AE59BF41E35CC85E48
        76436B9138491268D1A2A5E2EFCD5A48DF93842EB382315AB769070D1B870C0E
        7DFDF205CA962EC9FBB49C95C1286C2374BD6148D8866261BD47B505B017615B
        B771338B2690D0E5A99E3E7D7A98337F21ECDCBE0DC68EB1CF8183F61D3B41DD
        7AA1A9F86CE5634603091495600F482D6B89C60DEA3317172548F1A5C4870F1F
        9873AEC02AE81C11250C091BCD7BA0CC6A6A63EC45D8B6EFDC0D31BCBC54AFD7
        AE5E1DA66B455EF7ABD6AC65AE03E442606F509EB0CD5B77689CC7CCE9D358BC
        6378A262A52AD0BB6F68207AC37A75E1E9D3278A8E3168C85028553A64DA90F7
        EFDF43B5CA22D3BE15205B0E4D92ACD34E10C1D09E286ED4064FCDFB0CF4610F
        C246B6B543478FB33853896158878358177528F6701B0A60EB16CDE1CE1DFB1B
        38C85FA0208C19375E635D93460DC25D3E30F5502AC214619342A908216C56E3
        208A9ADE3EBE31613B8B456EB053EC41D828A3EAC225A123A0342850BD4A2596
        90501D179788B0EFE051285BAAB8ACF09C64C99263B7886259D343ECD83E2C3E
        352020005EBC780EA74F9E8273E7CE583490BC5397AE50AB76E80013C537962E
        518C391DDB1B742D73E5CA03B9F3E68554A95343DCB8F1204AE428F0EDDB57E6
        E84BF1AB870F1E64890A94E01ED51DE6CD5F04BE4993AAD6E912B6489122B178
        E30F1FDE87899848963C39CC5BB00822478ECC5EEB13367252F6F0880E6FDEC8
        7303A116758E9CB9207DFA0CACEB4EA3B7F41DD1F95EBE74D1AC985B0A13CC95
        3B17A448991A62C6F462BFB54F819F983DF8E8E1232CFEDA0ED13B224A181336
        BB9EB1CA1E844DF2C59230E47C4BF1A2DDBA7432783CCA98D1B55B7776E36CC5
        2EEBFB80F778E3C6857CF9F34191A2C5D98F8ED5D384F03143A8B732087B8C8E
        20F7901AB56A43D5AAD5E1ECD9332C85F6DBB7EF584697D469D240E932653592
        1A9CC6F7A74F9902CF9F3FD37BCCD469D2E2752D0A3E3E3E2C0A2576EC381AEF
        9F3C41AD7157D6E2A6C195185E31212A0A2031B07F3F9600A068B162EC019420
        4102C89D272F73DC96F8FEFD3B1EE318EE1B93EDEF85C2E1857F4B09252B962F
        03819F02F5D68F9CBFC9EE992F7F01B872F9127BB051CEB79C28EC545F09BF87
        0FB0A73084256E900BB92A51EBF4FBF76F2CEBCAD72F5F2151E2C42CC1811483
        4DA3BAAB562C83450B17D8DB434E67F0BB8431611B86857D0C57E980B7B09187
        F9AA35EB54995329A960E386F559CB4ADFF686F271D14D3563D66C9605A265F3
        26617C9FC8F173D0B0A1903A551A78FAE43134AC5F0F2CC5B61DBBD94D2771FA
        D449E8D3ABA71947B42C69D3A683C1C386336FFEEE5DBBE8ED229728590A7AF5
        EEC3221A081A951C3962381C3F7E4CE7F614909F32554A36129C216346A856BD
        86EAE1415062033737579649861E36F4E0915C7B060FEC0F470E1F66AD6B7AF8
        C4F4F68682850A43A1C28555FB53ABEAE285F3E0E91903170F14C898E0890227
        51B94239F8F8F1A3CEBAE5CD9B0FFAF4EB0F07F6EF877973678769E9539C73DF
        FE0354F5A1DF5DABE6CD8C3A0393F076EBD193857C91386B67C0F18CE1091327
        4D5585BC11CB972D85F973E770F8E6F5D215856DAABE378D091B456DDB8F4BB8
        16BC85AD7E8306D0B67D47F637F9A7F5EADE4D6F5610398C1C3D96DD14AB56AE
        8039B366EADC86BA4BD367CC42958C002D9B36B5D8B53C7CEC84869DD0946B69
        2D72E5CECDAE0D7501E9BB31E6DC4CE681693367AADC56E8BB193270805E7153
        A71BFE9EAAD508CD5AABDD15A52E648A942950CC52C0E143077446632C5DBE02
        BBA429D8DFBABAA214AE9622454AF0C10799BEA409F4DBEEDCB53B1B451F3F6E
        2CE8433B5E79171E6FCCA8917AB7A7CFA61C7109F161DCAA657378F6F4A9CEED
        12254ACCA227A4DF0425796858AF0EB6185F98F3555A9202286CA7F4BD19C1D8
        DE286E945B279DB1ED78C053D80A172E02C3FE1BC9BE78EA6E505810B5724C85
        4278366DDDCE5A75CB962C8605F3E7E9DD96BA4F94A9D5525D516A059193B13A
        C66E105B410EB3946983BA7F070FEC63DD2D39680F8650CBAD45F3A646DD4A2A
        55AE0ABDFA8426523065F060F0D061AC3B479832784023AA03070F81A0C04096
        1A9C129CEA433D13093B4F6CED57285B4A67A4037DCFD42348953A2D6B7D512B
        CC10DA29BDE6CC9E89DDD2158ACEC54A5C4451CB69680339C24656C93CBCCF44
        173C848D220D1A346C0C8D9A34652244B6AED123FF53FCE3D7463DCB08757F28
        B9A121BA76EB0153264FB4C8752463FCE1639AA27CE8E001183A7890458E6F2A
        747D172D590AC953844CBFD1BB670F665793CBB01123A158F1E2AAD714C8DFBB
        677783FB909D8E4445C21461EBD3B71F54A85499FDAD54D8A825B568E90A2642
        EBD7AD85E953A718DC9EB241EF3B7858A3B5DD005B56BA5A623DB18B5EB94A55
        D682A53A7DFAF4C9E0B1B54788953C58ACCC0E14B64A863690236CE4745595F7
        99E8C29AC2463F2C1A857AFDFA0DB8B9BA305B4CB61C39D88D42B696F3E7CF31
        E3FEA993272C722EDAF185A6666D35953DFB0FA98CE2841C11B036E52A54847E
        FD07A85E972F534A51203E65F85DB24CB38561CCDD86B7B0512B935A9B84DCDF
        C08E5D7B34EC76BA929892BD6CFEC2C5ECEFEBD7AE4187766D8C1EB77ACD9AEC
        012A610FBF897F2C42616B61680339C2D60B0BE509A96C8075852D2ADE58E521
        4E9CB8CC95800CB734ECFDE8B11F5CBB728DB916589254A9D3C0C2C54B54AF29
        3DF9E891C3E1E8912336B9962B57AF81C4497C55AF2D3D38610AF4BDD0F743D0
        B5AF56B992E263CC9EB74095D492D8BE758B419B154F61D38E533D77F62CB6AE
        82C1D5D58D0D68D0422D341737177CD8BAE1E2CADE8B1D278EAAC546EE46756A
        D608E3A23162E42855D667721121570E5737D790E3B8B96A7D862BB860E911DD
        434330376C580FD3264F32E31BB5180351D80CDA498C0A1B81E24616C304BCCF
        461BDE8307968446B6D6ACDB00F113685E664AC13D6BE60C169A634D860E1B0E
        C54B864E7341C662F263539A12DB52508B79D7DE03AA1B96C29A28BC49290D1A
        3582366D43E3A4DFBF4381ACA25F20790A5BDB76EDA17EC3905C7EF460AB5FA7
        2673B1502DF88FFED3C87AE87ADC3802ADFFCBD6D3F7A6ED5B473E6F34EA2DB9
        982C5EB880256A908EF1E7EF1F765CF5CFFAF3E7AFEAB8D2BA1F3FEC26714305
        14B65D8636902B6CD4764F2B675B5BE24CC246903FD58891617DE0C8F04D23A5
        EBD6AEB6DAEC4EDAFE78047557A8DBC20329B656E2FEBD3BD0A25933C5C7D1FE
        7E89AA952BB0898C75C153D8C8B157F2C323970DCAE36609685AC0711342EDB1
        14AB4CA3AD0E8AD1810342AEB0D9650482B3099B744E9DBA74D330064B50F762
        EEECD9B067F72E138E6C18722EA5E9E6D459B97C39CC9DC327573FF9708D9B18
        DAED79F2F831346AA0BC6B2C85B2A963281F1E4F61DB7FE888D1880553D06EB5
        4E1C3F165B6C5B2C726C0E6C4161AB666C23B9C24656C7A6BCCF481B67143622
        1D3EB5BBF5E8A5736A40828CB8C3870EB67846DBD973E733275509CA9CDBA06E
        6D2E1EE734FFEBE8B1A1EE1A9F3E7E844A158C4FB2A38B03878F321F38099A31
        8A668ED2052F6123FFC4BDFB0FA95E93ADAC6431CBE479D5CEDA420F2B7A6839
        28C350D8861ADB48AEB0D1B76477B3BD3AABB049142B5E025AB66AA561D497A0
        1BB36BE78E16CDCC4AA141C3FFD39CC4B97FDFDE70E2F871AB9E2779F37FFCF0
        41232A83BCE2694214752841A72973736A8F1A1ACAB1C64DD8DCA3C2DE039ABE
        F015CB950913736C0ADAE9EBED6810C0148AA1B01D31B6912C612350DC283D48
        46B9DBDB02671736827CCCAA56ABC17C8AD4134012D6E852A8DB796C753DA6CF
        9A03BDBA77D1B01F927BCDE66DDB35B6EBDCB13D5CB97C59E9E161E79E7D1A93
        6B1B8ACFE4D9153D78F898CAC04F58CAE5477D2A4042AEBB871D7209452D879C
        0D9508DB11B0B33910C283B049C48B1F1F46606B4A3D7ECF1A75A5E3CF9A339F
        0DF94B8C1E35526FE88FB9D04CF13366CF61AD316DD66FDACC3277482C5DBC08
        162E98AFF83328AD9414FFE9FFE205D4ADAD7F2E709EC246AE1EE4F22161A9F8
        CCC2458AC27FA34207A51C7866FAAD286CB27C6A9508DB742C3AF23E33759C49
        D828BE91D2EC18B267911D66F69C792A4F7CB9933B2BA55EFD06D0AE43E8574D
        F6AD96CD9BC2EBD7AF2DFE59E45F9532552AA857BB5698F7C839949C44254C71
        F9D01E3C58B37A15CC9A315DEFF63C85AD73D76E50B3566DD56B1A19AD55BD9A
        C1C40972A0A07672F7A0480E09071D409888C2262B33831261AB8EC546B9DBDB
        02671236F223DBBB77AFD1785375A3BAA94EAB72509FE099B873FB36746CDFD6
        A293D04876349A2C85264DD186B2662C5DB152635D974E1DE0F2A54BB23F236B
        B66C306D4688AD8E42891AD5AF6B30909BA7B09123313914AB6329D78CF11327
        439EBC7955AF9F3D7F06CD1A35B4DB4985F45003854DD6BC95B2858DB0B78078
        4B085BE6CC59585748E2EE9D3BD0AA85727F2973A12C0D091226326AFB501F3D
        9313536A2AE430DCBB1FDEA0154285F3FCB973D0BF6F2F8B386A7A7A7AB2101F
        72483E76F4280CECDF57E776EA69B6896B57AF3281958BFAC42AEBD6AC8619D3
        0DCF8655A66C5918302854D81AD5AF074F9E3C56746E7DE8BA550C11364A2554
        B592FCC9DEA6CF9A0D59B26455BDA6C183A62840EFDEBD35EB7AEB9A2672D58A
        E53067361F771E133887A2263B665DA9B051BE6BBB9972C712C2A6ED2F65CC06
        632DA4A73C65D4D865C49E75F0C871660393B3ADB9D0747C348BBD64A32261A1
        4C26E66455A58491D4EA9432476CDBBA0526E80973A2AC270B162D019FD8B155
        EB264F9C009B3719EF3C50F8D1AAB5EB989D8E5A9CF4D030164951A56A55E8D1
        2B34BB872973C0AA477150E6178AE0900BD91CE7CC5FA0E19E423E7CD452D597
        E74F1D4AD24023E5BACE73C8B06150A264698D75D3A64C860DEBD7C9AA1B0DC0
        04050529BA1616642D0A5B5DB91B2B15369A70728A927DAC8925844DDBE39E6C
        5CD5AB54B6793A64290FD8B76FDFA167F72E7A3DFE691061DD864DEC466D8B5D
        6673ED2F7220BF3ABACEE9D2A767AFC9B63779D20493666FA77C60C3468CC256
        4968B6DE39B366C0AA952BF5EE434926274D9DC6B2C912C13F83A17FBFDE46D3
        61376FD1129A366FC1E222A9656B2C9B05A11ED6448CFA6F8462876812264AE1
        2D51BB4635169F29973265CB417F6CC1ABCF554B5D5ACAD17760FF5E9D2E3E14
        375A12BBD1D5ABD760B3D7EB6A65924BC9746CA151A252750E1F3A04B3F13B78
        F5F2A5CEFAD01489CDF03A52589FB16C2356A40F0A9BEC987545C246A0B851BA
        CD344AF7B306E60A1B89C4B4E93359A90EB54A264E1867D3894C1A346A0C6DDA
        B6637F93B8CD9A3115B66FDBA6215CF443A71F3C851B75EED8D1E6E25BB65C79
        A85BAF9E6AF082EC91ABB13B73EAD48930F189DA4849055AB46CAD72BDA0B8CD
        EDDBB6C2EAD52BE1DBD76F06F7A7C195E123474242ECAE13246E73E6CC844D1B
        D687B9D1E93A91432AB53477EFDA0953274F64D7D418E44F377FE1228DF4E094
        0C803209CB4DB048363DEAF2A91BEA4938C68F1DADC8A19AA601EC8DAD78F534
        E3040DE4505A7412219A97C03D8A3B131E6AFD3E7EF408460C1FA2375C8CA06B
        3F6CC47F1A79D6087AA05346905B37AEB374F4BFF1FBA48CC019326682542953
        C2F4695361E78EEDC0895FB8E4476193EDFB628AB091753B3FAF3354C71461EB
        DCAD3BC4C16E0DE59F27C7D7881122C2EF3FBFE12F0A08DD1011F00749EB2246
        8CC0EC1AEFF14742993CC8F0BC60DE3C83F9F3CD85523D376EDA5475F3BEF4F7
        87D3A74EC19B37AF58AEFDECD973B01FDFDCD933B90ED5D3CD4B891429BF3FCD
        A74A371BA5BFA6BA85DC7081408D0D4F0F4F96363D7D860CAAB900287DFA05DC
        F6C891C370FCE811450EC6B47FC3464DD8F72EA5FEA66B44C77A8CDDB53FBF7F
        B3D0308AB97DF3FA0D2C5BB6C4E82CEE3E3EB1A173D7AED81AF400DFA4BED8F2
        89C47E0F7F708940FFF0771031A20B33515057F0E7CFEF70E9E26514E4D01145
        CAF04BF38852DAEF24FF9CA97FFFF9C51E4A21C788C87E5FCF9E3D83401423CA
        D8B169E346A371B8742EADDAB4D198EB4217B7F1BA2F59BC4851A253327B346E
        DC244CD20575284679C7F66DB062F932BDE9CB6DC40914B5424A763045D86808
        B1B5D2FDAC8125BAA2F6088DD466CA94097CE2C4051714D9A0A04078F0F001DE
        50170C4EFCC1039A2F35458AE46C3E863871E332F1A1856E6AB22F7DFFF60DDE
        BE7DCBC2B39E3C79C23CFECD0DD1221B5D9EBCF959CB955ADBEEEEEEF00D3FEB
        DD9B3770FFFE3D96EEC7DAD9506C09B96BD0AC5C647FF3F2F6620FDE0F28B2FE
        FE2F5877DC1C371C0AA1CB88AD321AB8A27C7C34A10BB5D86EDDBC01572F5F86
        E05FBF789F3E311F854D91E698226C64595FCFFB4C096D61DBB7770FB32F0804
        02A7A2210ADB4A253B28163602C5ED0616194CD9D792680BDB666CDE93515B20
        10380DB2C3A8D43155D8C849CE68EA106B4313FCD244BF12CB972D81F973E79A
        71448140606728EE8612A60A9B5D64FB509FFE8EA0495568144C2010380D5551
        D8146B8D49C246A0B8515C4B369E672CF929493469D840D14CD80281C0AEB983
        A26652A49339C246E3DD96C95D6C22DD7BF686AAD5427AC4E4D3458EB53C9222
        0A0402AB700885AD84293B9A236CDDB0E09AAD6EECF809902F7F01F6B7A552BC
        080402BBC124FB1A618EB091EBF2596B9D91ABAB0B787BC78277EFDEE90D1B5A
        B77133731025AFF2C60DEA5A25AD8E4020E0467514B6CDA6EC68B2B011286EE7
        B0C865E9B32167CF29D3A7B32CAAE459DEB347B730335B274A949805381333A6
        4D85756BD758BA1A0281801FA751D44C8E703257D82822B68BA5CF88C29E6AD6
        0C4D3CF8F0C10368D5A2A9463C222542A4848807F6EF634EB9B6080617080436
        63020A5B2F53773657D80A6261F1993E5AB46C054D9A35D758A79E3B8A12E6D1
        FC9B14C746D906C4808140E054D00D9D0F85CD64539759C246A0B89DC0A28025
        CF8A9229F6E937008A1429AA31BF266593F8F2F93304057D42A15BC9E2020502
        81D3711445ADA83907B084B0F5C0C22A714C946490D243D3D4695FBE7C868080
        0FF0F8D143A3297204028143A328F79A2ECC163602C5ED011629785F0D8140E0
        F0DC4251333B0EDD52C246A9548BF3BE220281C0E15981C2D6C8DC83584AD868
        08535EE274814020D08FC9BE6BEA5844D80814B7635828CA72291008046A5C40
        51B3885FAC2585AD031633CC3E90402008AF8C4661EB6F8903594CD8087B4940
        2910081C0E933379E8C2D2C2B6018B1A36BF240281C0D1D981C256C9FCC38460
        6961B38B04940281C0E1A887C266B1806F8B0A1B81E2B60F8B5236BD240281C0
        91B1D8A081843584AD29168B6D7545040281C36311DF35752C2E6C843DA40D17
        08040E434D14B68D963CA0B5846D2A169D6D7249040281236372FA6F43584BD8
        326241AD36376B5F158140E0D0289E0C590E56113602C58DEC6C4DAD794578E1
        E1E101356BD58664C993C3E0810378574736050A1684264D9BB3C49C4F9F3EE1
        5D1DBB26798A1450AE5C0578FBF60DB468D5069E3E790C43070F84172F5ED8AC
        0E89122781868D1AC1B3674F61E5F2E5BC2F89353887A296C71A07B6A6B095C4
        62BFD52E090748D0CA942D07D56BD682448912C1A60D1B60CAE489BCAB6594BC
        F9F243D9B265A178C952101CFC0BCA962C06C1BF7EF1AE96DD42A23673F61C68
        DFA60D9BCE71C0C04150A65C7918F5DF08D8B37B97D53F3F71922450AA5469A8
        53AF01B8BB47C187677F3872F830EFCB620D86A1B00DB5C681AD266C048ADB21
        2C8A59EA78F1E2C707AF185EF0E3E70FF8FDEB37448A1C193C3D3D2072E428F0
        F5CB17F0F37B08414141563B1F4A80F9F3C70F285EA2140C1A3214C68F1D0BDB
        B76DB1E625B408D1A34787CF9F3FC3CE3DFBE0ED9BD7D0B4B14507A09C8EE933
        67C1A74F8130B07F5FF63A468C1890216326387BE614FCFE6DFD14F4D2F7D5BB
        4F5FA858B90AD4AF5B079E3F7B6AFE81ED8BCB286AD9AD75706B0B5B432C2CD6
        868E162D1A24C1A7D9A8B1E3D8442FC78E1E85258B1642D4A851A154993250B1
        52657CA2EE8449E3C7EB6D91D08FB4569D3A70E7F66D3871DCB4ACE6D56BD480
        AEDD7B42BBD62D59565F472052A448B0F7C0213874F0008C1836947775EC166A
        AD2D59B6825DA3FDFBF672ADCBF0FF46429EBCD8DA2E555C56FAFB94A95243C9
        922561FFFE7D6C9E103B67200ADB486B1DDCAAC246A0B8511BBAA8258F397BDE
        02C89021037468D71AAE5FBBAE5A3F71F254C8953B374C9F3605D6AF5DAB735F
        9A4B81E654A02E59A9E2454C9A04A64FDF7E50BE6225F683A3A9FF1C813469D3
        C2FC858B61CEEC99B06AC50ADED5B15B9A356F01CD5AB484AA952B40C0FB00AE
        7559B5763D04067E82B6AD5ACADA7ECAB419903D470EB878E10274EBD2896BDD
        8D7009452D87353FC016C2D6028B05963CE68EDD7B59739D84E5FBF71FAAF592
        68D193565FAB246BB66C3064D808B879E386AAABA1141288A8D1A341833AB5AD
        7DF92C460514E23EFDFA43AF9EDDE0ECE933BCAB63B7CC983507E2C68B0BB5AA
        57E35A0F77F7A8B067FF01D8B97D1B8C1B3B46D63E346B5B83468D61E5F265B0
        7A95C5071A2D497F14B6D1D6FC00AB0B1B81E246779245463F7C7C62C3A6ADDB
        98CD816C0FEA34C7276D537CE2AE5DBD1A66CE98669573717189883FB84370E6
        F4291834C02219566C42976EDDA146CD5A50BD4A6578F7EE2DEFEAD8253449F7
        EE7D07E1FCB9B3D0BF6F1FAE75C9943933CC9C3D970D4ED1209513711E452DB7
        B53FC456C2D6168BD99638164DBD377EE2643872F85018578B81838740E93265
        B18BDA06BBA8D7AC722EE4E2B174F94A58B8603E2C5DBCC8EAD7CE524C9F351B
        92FA26854A15CA71AD07D9FAB264CD8AE2718EF7250943CA94A960D1D265CCB5
        62EE9C595CEB22D9713BB56F0757AF5EE17D692C49171436EBB43AD4B089B011
        286E47B02862EE71A8B94D93252F5AB8800D1C48504B6AC3E66D70EBE64D18D0
        CF7A4F5B124E12D001F8443F7EFC982D2E9D45D8B5773FDCBF770FBA74EAC0B5
        1EADDAB481278F9FC0BEBD7B785F923094AF5011FAF61F00A347FE07BB77EDE4
        5A17B2E356A85419CA9729C546489D048B07BBEBC396C2D60A8B79E61E47F229
        1AD8BF1F1C3B7A44B5BE6EBDFA50A45871E8DDA39B5E970F12A55AB5EBC08B17
        CF61E8E0413AB7295EBC24C44F98000A162A0C8912268443070FC28C695354A3
        ACED3B76629F55B7560DF0F7F7673743C3C64DD8548164D730B715973B4F1E68
        D4A419B8448C083DBA75668313F41975EBD787E3C78EC1FCB97354DB9298D348
        70BC7809205DFAF4AC3579F4C811983D6B3A7CFBFA4DB55DFCF80960ED868DB0
        61FD3A98366532B8B9B941BD060DA15CF9F21033A6371CC7EB386ECC68D53916
        C2736FD4A429730CD5B655922960C4A8D170E2F8D1304EA3D47DCA963D075EC3
        E210D1C505F6EED9C3EC3D44E12245A178C992F85E0958BE6C297CFCF801A247
        8BCEBE2BAA97B5AF15912A751AB60F7DB72953A6846B57AFC2C0017D215AD4E8
        902F7F0168D0B02124C0EF7CC386F5F03120808DA053CBDC3B960FB46DD70E92
        F8FAE2F518860F88BB901EAF77B71EBDE0D5AB973066D448F8F2E58BEA7368C4
        BE68B162EC5A500FC3DFFF050C1B3218FC1E3E546D530CAF030D80152A5C043E
        E0B55881D7447D949EECB85E31BD98AD8FBE2FB21D97AF5009FEFCFD03A3478D
        D0B093BAB9BA32FB72E1A24561C7B66DB06E6D68F69F24497CA175DBB6ACEE43
        060E647E793163C6840E9D3AB3EBF0FEDD5BE8D7A78F4E876D1A88C8962D3BEE
        9B14FEFEF90D070F1C80CC59B2427AACF79CD9333406EE646275DB9A84CD848D
        40713B8F454E738EB160C912489D2A0D33823F7BF294F9B6952D5B1EDEBD7B07
        CB962ED2184C5087EC4BF4E36B833F502FAF9850AC70418DF7C9583B78E85058
        B460019B883972E4486C542A76EC38D00BC5F2EC99901FD2A42953F1479D01CA
        962EC9042E62C4084CE0FAF61FC47E60258B17317966FAA22808D1F0662F8BC2
        9D254B1668D7A615B8478902CD5AB462C2E58AC7AF5DB33ABC7AF9123C6378C2
        F011A36031B65CA5AE4AAB366DA1118AECC103FBF0461AA23A6E61BC79FE1B3D
        06C68E1E05870F1D84A1C34630D10A0E0E869A28F4D43D1C8BC246866AFAEC28
        512243D3E62DF13A7941D1429A73619743E1E887AD1A6D1F3E7A2064C89801A6
        4F9B0A71E3C685797463E2FE552B55800F1F3EA038C482193367E1F795800901
        DD5C71F1BB3B76E4305CB97CD9AAD78A20A3FADB376F584B916C699BB7EE8018
        58BF96CD9BC1A3870F200ED679FCA429CCF17AE2F8B1EC7BFF14F809EB760572
        E6CC890F8FF8500DBB8773E7CC865D3BB6C3F091A3C0374952263EEA2D3C1232
        12B479B81D8DB88F1A339609C8CCE9D360ED9AD56C1B12C40BE7CEB2163F394F
        8F19371E5BB18FA049A386ECFD8828D4E49A73E9E205149DDED0AB771FB874E9
        12AB639BB6EDE0C2F9F3D0BD6BE77FBFDB2828C88DE1F5EB37D00B054AFDBD8C
        9932A1786644414FCD1EEA74DD4F9E380E9DBB76636E3F24AAF4205887F59A31
        5DB37748F66A12431264FA3D2C5EBA02E2C68B078306F483040912C201FC8D29
        1C35B65A94812E6C2D6C74C5A79ABABFF485FFF9F31776EED8C66685A71F5166
        FC616BBB7EA8434FD0BFF8A40BC0A7303D09637AC7849AD5AA865E84081160F2
        D4E970E7CE6D98336BA66A3DFD48E9C93A036F56A93BB075C72E78FEEC192C98
        3F173C3C3C55ADC64953A641CE5CB9A044D1C24C304C8104E1F5EBD7D0B67D07
        A88F2DAA16CD9A42912245F0B3E6E1CD9B157C93FAC2B6AD5BD97598326D3A5C
        BD7285B52824E847BE79DBAE901F7BBDBA2AA74E695085AE51FEFC8560F5EA15
        10F82990BD27B540E97ACE98360DAF4D2CB61F5D279FD8B1A15AE58A1A75ECD1
        AB3754A95A8D09C2BDBB7754EB376DD9065BB66C86654B42325691F73C9D0FDD
        68126BD76F84EF3FBE4393860DCCFE2DC9BD56447D6C89A54F9F51350A1E0F6F
        507A685DB97C0945A08BEA9874CED462AB50B67498CFC99B371F8C9B3809A64F
        9D026E91DC60CBA64D6C22EFE2254AC0E68D9BB0B5F895B558070E1A8202559F
        3D60E977B562D56A88E2EE0EAD5A346342406152ABD6AC858EEDDAC2B56B57D9
        67D048FDA74F9FE0919F1F7B4D93842F5DB1125BB64BE043C007387DEAA42A94
        EBD0D1E3CC07B37DDBD6EC35F9DD912892B3FADEFD87B095BC1B468E18CEDE4B
        952A357B4857AE52057AF6EECB1A039933678515CB97B2163DF9BD2D5AB2947D
        F763478736A4E82135101F8C35AB5561F70CD1BA4D3BEC993436A79BDE11856D
        A6293B9A824D858D40713B8A456153F6A566F58AD56B98532C39C712D2600239
        EB1A73DFA01F1A8D7A5DBD7A19FAF4ECA15A4FB60CB269346E501F1EE38F441F
        D288ECB6AD5BE0F5AB57AC4B254137457C6C81542C5FD6EC6B2475B7E9074AE7
        AAED755EAE7C05660BA211CEF7EFDF69BC3772F4587C1217D608C3A17514273A
        75F2446CB11DC26EE047D5F6D28F5EFDC72D5DA7EB78E3516B559DA5CB57A068
        F9429992C555024E2DD503478EC19B37AFA1250A0CDDA4DA9013F5EE7D07E030
        B61486622BC05218BB567473CF5FB4183A7768CF8424210A57DF0183E03A7643
        972C5E083F7FFE546D4B9119D492D5E53726D9DF268C1BC3444BDB4648AD9A95
        6BD6C1D62D5B98B8D3F976EDD60322E1FA1953A7AA46A2A9F537091FA224567D
        7BF7D2D9BA2F55BA0C8B6C993D73066BED4A615C14F942E275145BB9DA23F2D4
        359E337F213E9867C0AA959AAE1E9DBA74652618AAFBDDBB77E1EE9D9007123D
        00685069C1BCB9D8DB59A2DA7E015E2F8AB068D3AA856A9D748F98384A7B0645
        2D9FC5BE7419F010B6E6582C34655FEA7E0C1F3112766CDBAAF2EDA19B70CDBA
        0DAC4B4AC2F4E4C963BDFBFBFA2685E5F804A527E1FCB97355EB172E5E0AB17C
        7C58B7C910D46D183761229C3B7B16264F9A002F9E3F57BD4737851F3E713BB5
        6F6BF6355AB87831B60663C0FA756BD9A2EB7D1717579DA151D4CDA000FDD1D8
        EDD8BD73075BB76EC326BCF1DC599DA92BAA0EB5E4A845A7FE83955A0C748352
        0B48824461355EEB477E0F55DD268911D8352B52B418F378EFD9BD5B18C195DC
        17E6CD99C35A0C96C2D8B51A377E22E4C8990BC6E34D4DE2C35AFD7BF668D8C4
        08B2A76DDFB58709162509D0A663A7CE50BB6E3D66575CB4707E9856B934A845
        A681B76FDF6137D7130E1D38082F5FFA6B6C47ADE9652B57634B301E1CD8BF0F
        46FD371C7EFDFAADB10D1D878EB71D1FA093268E578571492D2CEDEF85A85AAD
        1A74EFD99B7543D55BC9C4D4E9332145CA942878CB359CB3E901D96FC040E8DF
        B7B7CABEE71DCB1BB66CDB0987C8643168A06A5BC90FB25BE74E7011BBC80A69
        8BC23657E94EE66073612350DC4E605140E97E64402523E9D4C99360E386F5AA
        F5F51B34C02E4947BD3F4A09E949A8DE9A213BD0B69DBBB11577D5A82891FD8A
        EC58649F501F7CA0AECDBA8D9B599DA86EE64003027B0F1C86C74F1E31E3B7B6
        332DD9A6B66CDF09C78F1D650328DAB46DD71EBB5E8D543F700A43A3965220B6
        A2AA55A914E686FC6FD418288C5DB85AD5ABB22E174181FE03060DD6F8C11324
        98249C74430E1F3A44E338D49A183D663C3338FB63B789465FA5E31192FB02B5
        524E9D3C61D635927BAD286901990EFC1E3D84762D5B1A0CFCCF903123CC9E3B
        3FCC68BB04992AD2A54B073367CCD0191F4C2D768AEEA85CA19C468B5817D4F3
        9838650A13B7D3A74FC1C0BE7D34EA4676DC9CB972C36414B5CDD8E595207B62
        7F6CA1929D8B0689D491E24A757DFE0E146C175717E69B77F9D225D5FA4E9DBB
        40AD3A75A1768D6AF00A7B204482040960CDFA8D70E6F469E8DDB3BB6A5BB20B
        E6C993071AD4ABAD345EF6248A5A41253B58025EC2560F8B554AF7936E42BA69
        D4BF208A42D8B0690BB36534C59684BEEEA4F4D4AD57BBA6CA66913A4D5AD6F4
        26BFAA1EDDBA18FCFC61D85A2C86AD46EAF6902D43227F8182CC002C19E0CD41
        F293A36E5D9D9AD5C3FC88A4968F2E7121A86B56B47809FC819765A38459B266
        6341DD5BB76C8689E3C7696C4BC2404FE75BB76F6974CD3B77EB0E357538F3D2
        D39D9EF2FAC2B2A84BDA7FD0202851B234B303B56ED95CF59E74E3A9DF44E622
        F75A510BBB67F7AE068F25893919CB0F1E089B94663B3EFCE8F7D5AE4D6B7870
        FF5E98F70F1EC10700762B4B1493676521BBEF844993594B6ACDEA55306BC674
        D57B24C6F400537FD8101D3A76863AF5F0F75BA796466F81A0966B0C2F4DDB31
        11274E1CD8B0792BB6A0DFE3F75949A3EB4B624D624C2E25EABF898D5BB6B391
        58B2AF52579D1E8ECBB195F9DF886170E9E245A55F533314B625A67FCBA6C145
        D80814377A14298A5B59B9761D244E94182A952F1BC68ED3A66D7B68D0A8117B
        02AADFA4EA4C9B31938D10952B1DFA454ACD7B1A063766D4A6CF8F17373E7659
        CB6BB894346ED2145AB66E03AD5B34670310E620B52A49204928B5916E56FA81
        75EDDC31CCFB6498BE75EB96AAE52AB5B286A2E01C3A744063DB22458BC2E0A1
        23B04BDB009E3D0DB54D5158118986BA119DC49B463D1B356EAA314AAC0D75F5
        A6CE98C5462AD5E32DE72D5804899324D6B8F6E662EC5A51DC30C50FDFBB7F17
        5A366D6AF0582D5BB586C64D9B3123BF6483925045BBA098D44751D18644E0C0
        E1A3CC2C52AE74C930DD5C7D908BD0F2556BE043C07B6858BF9EC667511DA82E
        EAD00015B95A942DA59970961E28140D73EEDC19368AAA0EB9B18C1D3F41E783
        6DDB8EDDF0045BBB9D3AB4D7584FAE39FD070EC687FD19D8BF6F1FE42B901FF6
        ECC25ECD15C5A3D74751D48A2AFE622D004F612B8E0559606565D925DB0419B4
        3F7C08C02749D8E907A9DB41F61F4F4F4FBD4F5DB283D1C85347EC72D20D484F
        2F777C0A93F32AD1A06E6DBD8904A9ABB5073F9F624CA5112989A1C38643B112
        25A17489A2F0E3C74FE62A4225B506DFBF7B17C6DE640869944FBB1B28416E13
        5BB6ED60A3B4641354377ED308D9AC39F3B1D55A5FD52AEAD3AF1F54A858196F
        C8DA78633E536D4B2E0FF3172E613E4FDAA35C743DA8A546364BE9DC2B54A8C4
        0647A8EB42A3656FDEBC616E22F484CF9A2D070B31935A03D5AAD7605D766A35
        92FD886E781ACD7EFCE891462B4E1D6B5CAB848912C1EAB5EB21F86730D4AA59
        D5A07B027D8794AF8E44E3EBD7AF1AEF4923A2EBF15A913B8B2E366ED9CA5C44
        06F6EB0BC78E1DD5B90D992C68A4F9C6F5D0D17BEA05909B4AEF5E3D343E8B06
        A6B4FDF036E3F74EEE2BE4DA42DF1F5D6F6AA5AA6C6F4B17C38279F398D0495D
        5BC97CA2DD7D956C6992F944FACD1224D4D43AA7410BBA660F1EDC97FD9DA841
        CDE706969C524F09DC848D4071A3B425B2022E25C33D090B7DB1BAA854B92AF3
        E5A11F66376CCDDCBE1DDA7A22C1A3E079EAC2D2E869D9F2E561CBC68DEC0730
        74F808288EC244235543060D50F9C251EB28925B24662C259FA05973E6E9F4F9
        A16C23A953A76137729972E5E024DE64F4D4A3D128EA0E366FDA284CD7411F64
        5FC99E2327EB1E68DF60EADB900D46BDEB4BE2316E4288ED9144468252DF142D
        563C4CA404C58E929BC096CD9BC31C9FBA55C13F7F40AD1A210DEA26D89259B8
        601E76D586325300091BE5277BF5D21FB2E5C8016DDB7560C66CC9D5836EA44F
        1F3FAA1C45C954406249D9681BD6ABC3AE0939A726C4D637D94569C4CE5AD78A
        BE33FAEEE873468F1CA1EAAED26829B99E482D553247F8A030E91A4092C4A137
        F604D4AFAD3A920F21B5FC690456EA519080904D8D7CF5E8FB2107E12E9D3AAA
        5A3FD48B983B7B962AFD55C3464D98436DBF3EBDE0E489505B243D44A855484E
        C5145953A1624596C1867EBFF45BFB6FD468661F3C72E810A44D974E35922A7D
        FF35AA5661D75F82AE3FFD6E69C0652BFE06B266CBAA728FA1E89022784CA915
        69223351D43A9A730073E02A6C048A1B75DAF5269C4B9B361DA44B9F8ED9C6C8
        D04F4F95A58B17329F355D4F121A92A7A1797A4A6FD9BC11766CDFCE7E6CD4E2
        DBB27D372BC93E357EEC6855CA21F2559A3C751AF3312223FB83070FF046F9C2
        BE68E9875CBD664D367CAF2B948A46DEF2E6CF0FF7EFDD81C10343D24753CEB7
        4E9D43EC3AE418B9EBDF08A531C8D0FBFCC57383A96AE8469934752A8A750C58
        8A62F2F2853F734A3D8C5D4DEA86AA4336B6B1E3C663CBE917AC5FBF0ECFEF23
        73503E8EE2ABCB56448CC507483E7C909058901F147563A925D57FC020F64020
        978A5123FF632D8FA449933143B8B7772C58BB7A15335CFF0CFE19C6254032AE
        D3315F3C7F0A2B96AF508DD05AF35A51977AECB8096CD4FCF5EB57D8627FC45A
        B92474EA912BBBF7ED87870F1EB2D6BC3634E24B5D3A123D7DE14DE4DE317AEC
        78C8963D3B76453FE3033844A8CE9D3D830F9B754C50E9E149BF4FBA06EBD6AE
        C656971BDCC32EE79933A7353E2B7F8142284495340601A887B10B7B1C51A345
        0BF3FB253FB869D8FDFFF1E3072C59BC4815ED41D0A0D6DF3F7FA04EAD1A1AF5
        95FCE9287DD7CAE54B99284A90A9831EEA6447A648151392B75E4751CBAC7427
        4B620FC246C18B336CF159D415A01F937A974C829AF699326761C3FE2F502828
        6C461D12D51831BC74BA93508B84C2964868D58DB37453912B05F9BDC90DFA26
        633275378CD969C875215BF69CCCB0FB145B1DEACEB2BAEA972153468818C105
        FC1E3ED03048EB825A07D422240768F2FD92CE89A23392F826013F147EF5513C
        BA7669F001E4EAE2CAAE81AEBA4BC1EF3FF1C174F3E6F5302E0ED6BC56D4354B
        973E0344F7F0602150EAA14D04D9BA68A479E7CEED3076D4A830FB939B0BB5E2
        E5749329909ED21E518BEDCEED5B61CE93BE0BB2F37EFFF60DEEE16F4C7BC083
        4625496CD45B5712867EBF742D02DEBF677E6FDAD795BAF881818161F6A18752
        605020DB4F9D1CD80A1E3F69328BDEA0FD962F5D029B366E50E278FE1F0ADB20
        B91B5B03EEC24698EAFEE108900F51CF6E5DC41C0332E075ADA401195DCEADE1
        0DF2F52C58B8305C387F0EAA56AD862DF40AE0E2E2C2064E860D191466604507
        360D9DD287BD089B455388DB0BE44240C1DEFA461005A1F0BC56525481A1D1DE
        F0008552152D5E8C0998D492A401A95EBDFB323F3F32D3346A502F4CAB500D6A
        DA937B87E53CB04DC42E848D407123471E6EC6464B43E12A1464AD6EC711E886
        F7B5A2D155F2F4AF58AE8C552703B267688065FACCD9D0A9433B8D515B8246BE
        C78C9BC8C2170D8DFA225350D4BA19FD301B6037C246A0B85176C84CBCEB6109
        A8496F28BC4B100AEF6B45A395E42EA46FB43D3C20395F37AC5757670A232943
        0C251BD0B63FFFC3E6F1A086B037612357FAA1BCEB21706E12254ACCFCF1366D
        58CF0495A20AC885473D9A24BC21659F5EB5728546861B090A5B4C9D369D46FC
        A8162D50D8EC26A5B45D091B81E246BE148578D743E0BC501A23F2BD3B74603F
        8BC5A4F8E35E3DBADA64CE507B855ACDD366CE62A15C94CF8F5231D1E82BCDD9
        9B276F1E889F20212C983B47DFC0CE011435CB859458007B14361A48204F4F57
        DE75113827E4654F697828089DDC5F284A45DB2D233C42BE78349042FE869459
        F9735020DCBB7F0F8E1E3EAC372207A170856A286CBB78D75F1DBB133602C56D
        32165DCD3E904020B0364350D486F3AE843676296C8425A7EC13080456E1348A
        5A7EDE95D0853D0B1BC5B690153322EFBA08048230501842375BA6FB5682DD0A
        1B21BAA40281DD320145AD17EF4AE8C3AE858D4071A3A97DEAF2AE87402050B1
        1645CDAEEF49BB1736C2991C77050207E71A8A5A16DE953086A3081BA55CE867
        F681040281B97447619BCCBB12C67008612350DCC8B7AD29EF7A0804E1983928
        6AED7857420E0E236C048A1BCDE0928D773D04827088DDBA76E8C2D1848D6692
        A766B0700111086C078565344661533CB31C2F1C4AD80814379A8EA8AFD90712
        0804721987A2D687772594E070C246A0B8D18CB6CDCD3E90402030C602143587
        CBE7E490C246A0B8D10C187979D7432070622EA0A8E5E25D0953706461A3595E
        69924791054420B00E6D51D8E6F2AE842938ACB011286E13B1E8CEBB1E028113
        321945CD61EF2D87163602C58D8270DBF3AE8740E04438A45D4D1D87173602C5
        8D66C569CCBB1E028113B01A45AD3EEF4A988B53081B81E2B6068B3ABCEB2110
        3830761FDC2E17A7113602C56D0B165578D74320704036A1A8D5E05D094BE154
        C246A0B85DC6222BEF7A08040EC4151435A70A55744661EB8905452708371081
        401E7D50D8C6F1AE8425713A6123C4FCA402816CEC3A13AEA938A5B011286E63
        B070A8F83681C0C6384C1A22A538ADB011C2815720D0CB3C14B536BC2B612D9C
        5AD80831218C40108625286ACD7857C29A38BDB011286E53B0E8C2BB1E02811D
        E0F4A246840B612384B80904B00A45AD01EF4AD88270236C841037413866058A
        5A23DE95B015E14AD80814B70958F4E05D0F81C086AC44516BC8BB12B624DC09
        1B81E236168BDEBCEB2110D880A5286A4D7957C2D6844B6123C4DC09827040B8
        EA7EAA136E858D40711B8945FFFFDB3B93101FC3388E3F92830B4992643D3938
        9025D99525D96632510E9A90A414719128A931CC853113CA7A5126144696ECB2
        6F0707FB4559228A42968CEFCFF3DA6A8C59FEFFFFF77D9EF7FBA96FCFDCE63B
        73F8F4BCEFFB2CEC1E42E481ED90DA3C76091699169B01B9ADC2B09ADD43881C
        12ED8E82C69279B11990DB720C65EC1E42E48075905AE65FB1486C09909BED4E
        B02D58BA8C5984885D6ABC0652D3D38793D8FE02729B8BC1DE4BE85A3F11125F
        9025905A35BB485A90D8EA0182DB89A194DD43884660F7EB6E84D4F6B28BA409
        89ED1F406E9B312C60F710A201AA20B445EC126944626B001D7B24524C19A4B6
        825D22AD486CFF0172B3D345A33A365904CD376431A4B6895D24CD486C8D0072
        9B8FC156700F67771199E63D320752AB6117493B125B13D0067A41E400B21652
        BBC12E1202125B1381DCEC9D5B85D37A3751183E38BF3EAD9C5D242424B66600
        B9CDC2608FA7A3D85D44D49C717E29C7417691D090D85A0004671F15A2BBBA4C
        D0B10F04E5FAEAD97C24B61602B92DC45089B466771151601F0896426A5BD945
        424662CB0190DB54E71F4D27B1BB88A039EAFC4CED3CBB48E8486C3944A78488
        6662B3B46510DA1676915890D8720CE456E4FC56AC09EC2E22084E20EB21B553
        EC223121B1E589645988496E04BB8B4825EF9015105A15BB488C486C792639A1
        D7A28F0BC2F8EAFCBBB40A48ED02BB4CAC486C050072B34B6A6723E3D95D0495
        D3C866086D1FBB48EC486C050482B3CB9A672043D95D4441B9896CD3C781C221
        B11180E056622846FAB3BB88BCF211D900A1E926B40223B11149AEFFB38B37B4
        EF342EECA8EEE34835A4768C5D268B486C6420B7C918ECAE8522761791130E21
        9B20B493EC225946624B09105C89F317C968FD5B78D80CADD6F9199AD6A3A500
        892D6524278798E48AD95DC47FB18B54CE213510DA6D7619F11B892DA5407076
        5AEF74E7BFA00E66F711BFB0D999C9AC12323BCC2E23EA47620B0048AED4F90D
        F625EC2E19C616D6DA29B63B20B4E3EC32A26124B68080E0466398E6FC36AD01
        EC3E19E116623B0476EB71331C24B64081E4EC72199BC5CD647789903A643FB2
        0B323BC22E239A8EC41638109CBD7F1BE3FC31E513D97D02C66466EFCEECB48D
        5A08ED0EBB90683E125B44407263318C448620E3D87D02C1AEB2BB845C85CCAE
        B0CB88DC20B1450A2437C879C1D98CAEB7D3FED49FD8128D7BCE5F947219327B
        C42E24728FC49611203A935C4FC484D7D765E7A4115B307B1FB98B5C87C8AEB2
        0B89FC23B16514886E20863E888D3D5C3C5BBA6C2BD363E767659720B26BEC42
        A2F0486CE207109D2D1FE98C74423A225D91EE2E9D6BE7EC45FF1EE439F236C9
        2BE4214476935D4EF091D844834078FD30F442BA21ED90B649DA3B2FC12979FA
        D5679197C81BE435F2C279913D439E42604FD8FF1B915E2436D12220BE6118BA
        382FB90ECE4BAF8DF34731595A25F9F3E7BA247631B0ADE8FF8C7C4A6233AF07
        10D745F6DF26C2456213424487C42684880E894D08111DDF01E054C2F413BD67
        380000000049454E44AE426082}
      Stretch = True
    end
    object btnOrders: TButton
      Left = 16
      Top = 383
      Width = 123
      Height = 41
      Caption = 'Orders'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 3
      Images = imglistSidebar
      ParentFont = False
      Style = bsCommandLink
      TabOrder = 1
      OnClick = btnOrdersClick
    end
    object btnCustomers: TButton
      Left = 16
      Top = 178
      Width = 130
      Height = 40
      Caption = 'Customers'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 0
      Images = imglistSidebar
      ParentFont = False
      Style = bsCommandLink
      TabOrder = 2
      OnClick = btnCustomersClick
    end
    object btnInventory: TButton
      Left = 15
      Top = 280
      Width = 130
      Height = 40
      Caption = 'Inventory'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 2
      Images = imglistSidebar
      ParentFont = False
      Style = bsCommandLink
      TabOrder = 0
      OnClick = btnInventoryClick
    end
  end
  object mmTop: TMainMenu
    Left = 17
    Top = 8
    object miFile: TMenuItem
      Caption = 'File'
      object miLogout: TMenuItem
        Caption = 'Sign Out'
        OnClick = miLogoutClick
      end
    end
    object miHelp: TMenuItem
      Caption = 'Help'
      object miSearchSyntax: TMenuItem
        Caption = 'Search Syntax'
        OnClick = miSearchSyntaxClick
      end
    end
    object miView: TMenuItem
      Caption = 'View'
      object miBussinessPerformance: TMenuItem
        Caption = 'Bussiness Performance'
      end
    end
  end
  object imglistSidebar: TImageList
    ColorDepth = cd32Bit
    BlendColor = clBtnFace
    DrawingStyle = dsSelected
    Height = 32
    Width = 32
    Left = 96
    Top = 128
    Bitmap = {
      494C010105006800700120002000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000004000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000001C0000
      00FF28C7FFFF28C7FFFF28C7FFFF28C7FFFF28C7FFFF28C7FFFF28C7FFFF28C7
      FFFF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF0000000000000000000000000000000000000030000000FF28C7
      FFFF27C1F7FF000000FF000000FF000000FF000000FF000000FF000000FF28C7
      FFFF28C7FFFF000000FF00000000000000000000000000000000000000000000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF28C7FFFF0000
      00FF000000FF6FD7FCFF6FD7FCFF6FD7FCFF6FD7FCFF6FD7FCFF6FD7FCFF0000
      00FF000000FF28C7FFFF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF000000000000000000000000000000FF28C7FFFF1E96C0FF0000
      00FF6FD7FCFF6FD7FCFF6FD7FCFF000000FF6FD7FCFF6FD7FCFF6FD7FCFF6FD7
      FCFF000000FF28C7FFFF28C7FFFF000000FF0000000000000000000000000000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF000000000000000000000000000000FF28C7FFFF000000FF6FD7
      FCFF6FD7FCFF6FD7FCFF000000FF000000FF000000FF000000FF6FD7FCFF6FD7
      FCFF6FD7FCFF000000FF28C7FFFF000000FF0000000000000000000000000000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF000000000000000000000000000000FF28C7FFFF000000FF6FD7
      FCFF6FD7FCFF020405FF6CD2F6FF6FD7FCFF6FD7FCFF000000FF6FD7FCFF6FD7
      FCFF6FD7FCFF000000FF28C7FFFF000000FF0000000000000000000000000000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF0000000000000000000000B51A85AAFF0E495EFF417D94FF6FD7
      FCFF6FD7FCFF6FD7FCFF6FD7FCFF6FD7FCFF6DD3F7FF000000FF6FD7FCFF6FD7
      FCFF6FD7FCFF000000FF28C7FFFF000000FF0000000000000000000000000000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF0000000000000000000000C81E97C2FF0A3544FF4A8FA8FF6FD7
      FCFF6FD7FCFF6FD7FCFF000000FF000000FF010304FF6FD7FCFF6FD7FCFF6FD7
      FCFF6FD7FCFF000000FF28C7FFFF000000FF0000000000000000000000000000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF000000000000000000000000000000FF28C7FFFF000000FF6FD7
      FCFF6FD7FCFF020405FF6CD2F6FF6FD7FCFF6FD7FCFF6FD7FCFF6FD7FCFF6FD7
      FCFF6FD7FCFF000000FF28C7FFFF000000FF0000000000000000000000000000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF000000000000000000000000000000FF28C7FFFF000000FF6FD7
      FCFF6FD7FCFF6FD7FCFF000000FF6FD7FCFF6DD3F7FF000000FF6FD7FCFF6FD7
      FCFF6FD7FCFF000000FF28C7FFFF000000FF0000000000000000000000000000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF000000000000000000000000000000FF28C7FFFF082834FF0000
      00FF6FD7FCFF6FD7FCFF6FD7FCFF000000FF010304FF6FD7FCFF6FD7FCFF6FD7
      FCFF000000FF27C2F8FF28C7FFFF000000FF0000000000000000000000000000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000000000
      0000000000FF000000000000009F000000FF00000000000000FF28C7FFFF0000
      00FF000000FF6FD7FCFF6FD7FCFF000000FF6FD7FCFF6FD7FCFF6FD7FCFF0000
      00FF000000FF28C7FFFF000000FF00000000000000FF00000000000000000000
      00FF000000000000009F000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      0000000000FF00000000000000FF0000000000000000000000FA000000FF28C7
      FFFF0A3544FF000000FF000000FF498EA7FF407D93FF000000FF000000FF20A2
      D0FF28C7FFFF000000FF000000520000000000000000000000FF000000000000
      00FF00000000000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000FF000000FF00000000000000000000000000000000000000F60000
      00FF28C7FFFF000000FF000000FF000000FF000000FF000000FF28C7FFFF28C7
      FFFF000000FF0000006400000000000000000000000000000000000000FF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000FF0000006000000000000000000000000000000000000000000000
      0000000000FF99B1CCFFB4D0F0FF000000FFB4D0F0FF000000FF000000FF0000
      00FF000000000000000000000000000000000000000000000000000000FF0000
      00FF000000600000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF0000000000000000000000000000000000000000000000000000
      00FF000000FF000000FFB4D0F0FFB4D0F0FF000000FFB4D0F0FF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      00FFB4D0F0FFB4D0F0FF000000FF99B1CCFF000000FFB4D0F0FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000DA99B1CCFFB4D0
      F0FF000000FFB4D0F0FF000000FF181C21FF000000FF000000FFB4D0F0FFB4D0
      F0FF000000FF000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FFB4D0
      F0FFB4D0F0FF000000FF000000FFB4D0F0FF000000FFB4D0F0FF93AAC4FF0000
      00FFB4D0F0FF000000FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000FF000000FFB4D0F0FFB4D0F0FF0000
      00FF99B1CCFF000000FFB4D0F0FFB4D0F0FFB4D0F0FF000000FF000000FFB4D0
      F0FFB4D0F0FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF67778AFFB4D0F0FF000000FFB4D0F0FF0000
      00FF181C21FFB4D0F0FFB4D0F0FFB4D0F0FFB4D0F0FFB4D0F0FFB4D0F0FFB4D0
      F0FF000000FFB4D0F0FFB4D0F0FF0A0B0DFF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000FF0000
      00FF000000FF6D82FFFF000000FFB4D0F0FFB4D0F0FFB4D0F0FF000000FF0000
      00FFB4D0F0FFB4D0F0FFB4D0F0FFB4D0F0FFB4D0F0FFB4D0F0FF292F37FF0000
      00FFB4D0F0FFB4D0F0FFB4D0F0FF000000FF7EDDB4FF7EDDB4FF000000FF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF272E5CFF6D82
      FFFF6D82FFFF6D82FFFF1F2549FF131619FFB4D0F0FFB4D0F0FFB4D0F0FFB4D0
      F0FF000000FF000000FF000000FFB4D0F0FFB4D0F0FF000000FF000000FFB4D0
      F0FFB4D0F0FFB4D0F0FFB4D0F0FF000000FF7EDDB4FF7EDDB4FF7EDDB4FF7EDD
      B4FF7EDDB4FF000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF6D82FFFF6D82FFFF6D82
      FFFF6D82FFFF6D82FFFF6D82FFFF000000FFB4D0F0FFB4D0F0FFB4D0F0FF252B
      32FF5F6E80FFB4D0F0FFB4D0F0FF000000FF000000FF000000FFB4D0F0FFB4D0
      F0FFB4D0F0FFB4D0F0FF000000FF7EDDB4FF7EDDB4FF7EDDB4FF7EDDB4FF7EDD
      B4FF7EDDB4FF7EDDB4FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF6D82FFFF6D82FFFF6D82
      FFFF6D82FFFF6D82FFFF6D82FFFF000000FFB4D0F0FFB4D0F0FFB4D0F0FFB4D0
      F0FF000000FF000000FFB4D0F0FFB4D0F0FFB4D0F0FFB4D0F0FFB4D0F0FFB4D0
      F0FFB4D0F0FF000000FF7EDDB4FF7EDDB4FF7EDDB4FF7EDDB4FF7EDDB4FF7EDD
      B4FF7EDDB4FF7EDDB4FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF6D82FFFF6D82FFFF6D82
      FFFF6D82FFFF6D82FFFF6D82FFFF000000FFB4D0F0FFB4D0F0FFB4D0F0FFB4D0
      F0FFB4D0F0FFB4D0F0FF000000FF000000FFA4BDDAFF000000FF000000FF0000
      00FF000000FF000000FF000000FF7EDDB4FF7EDDB4FF7EDDB4FF7EDDB4FF7EDD
      B4FF7EDDB4FF7EDDB4FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF6D82FFFF6D82FFFF6D82
      FFFF6D82FFFF6D82FFFF000000FF000000FF000000FF000000FF000000FF0000
      00FFAFCAE9FF000000FF000000FF000000FF000000FF00000000000000000000
      0000000000000000000000000000000000FF000000FF7EDDB4FF7EDDB4FF7EDD
      B4FF7EDDB4FF7EDDB4FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF6D82FFFF6D82FFFF6D82
      FFFF6D82FFFF000000FF000000FF000000000000000000000000000000000000
      0000000000F90000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000FF000000FF7EDD
      B4FF7EDDB4FF7EDDB4FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF6D82FFFF6D82FFFF0000
      00FF000000FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000350000
      00FF0C1612FF7EDDB4FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF000000FF000000FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000035405C618CA9
      F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003E41EBFF3E41
      EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41
      EBFF3E41EBFF2D30C7FF2D30C7FF00000000000000002FB0F7FF2FB0F7FF2FB0
      F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2DA7EBFFA9CCF7FFA9CC
      F7FFA9CCF7FF000000000000000000000000000000FFE5DCD8FFF8EAE4FF0000
      00FFF8EAE4FFF8EAE4FFF8EAE4FF000000FF03030FFF000000FFF8EAE4FFF8EA
      E4FFF8EAE4FF000000FFF8EAE4FF7B7471FFE5DCD8FFF8EAE4FF000000FFF8EA
      E4FFF8EAE4FFF8EAE4FF000000FF3131CDFF000000FFF8EAE4FFF8EAE4FFF8EA
      E4FF000000FFF8EAE4FFF8EAE4FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000364267FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008CA9F2FF8CA9
      F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9
      F2FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000065CC08FF65CC08FF65CC08FF65CC08FF65CC08FF0000
      00000000000000000000000000000000000000000000000000003E41EBFF3E41
      EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41
      EBFF3E41EBFF2D30C7FF2D30C7FF00000000000000002FB0F7FF2FB0F7FF2FB0
      F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2DA7EBFFA9CCF7FFA9CC
      F7FFA9CCF7FF000000000000000000000000000000FFE5DCD8FFF8EAE4FF0000
      00FFF8EAE4FFF8EAE4FF000000FF3939EDFF4F4FFFFF000000FFF8EAE4FFF8EA
      E4FFF8EAE4FF000000FFF8EAE4FF7B7471FFE5DCD8FFF8EAE4FF000000FFF8EA
      E4FFF8EAE4FFF8EAE4FF000000FF4F4FFFFF4F4FFFFF000000FFF8EAE4FFF8EA
      E4FF000000FFF8EAE4FFF8EAE4FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005671
      93FF567193FF364267FF364267FF364267FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008CA9F2FF8CA9F2FF8CA9
      F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9
      F2FF6073A5AE0000000000000000000000000000000000000000000000000000
      00000A15001C65CC08FF65CC08FF65CC08FF65CC08FF65CC08FF65CC08FF65CC
      08FF65CC08FF00000000000000000000000000000000000000003E41EBFF3E41
      EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41
      EBFF3E41EBFF2D30C7FF2D30C7FF00000000000000002FB0F7FF2FB0F7FF2FB0
      F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2DA7EBFFA9CCF7FFA9CC
      F7FFA9CCF7FF000000000000000000000000000000FFE5DCD8FFF8EAE4FF0000
      00FFF8EAE4FFF8EAE4FF000000FF3939EDFF4F4FFFFF000000FFF8EAE4FFF8EA
      E4FFF8EAE4FF000000FFF8EAE4FF7B7471FFE5DCD8FFF8EAE4FF000000FFF8EA
      E4FFF8EAE4FFF8EAE4FF000000FF4F4FFFFF4F4FFFFF000000FFF8EAE4FFF8EA
      E4FF000000FFF8EAE4FFF8EAE4FF000000FF0000000000000000000000000000
      00000000000000000000000000000000000000000000567193FF567193FF5671
      93FF567193FF364267FF364267FF364267FF364267FF364267FF000000000000
      000000000000000000000000000000000000A9BC56FFA9BC56FFA9BC56FFA9BC
      56FFA6B854FA0000000000000000000000008CA9F2FF8CA9F2FF8CA9F2FF8CA9
      F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9
      F2FF414141FF414141FF414141FF414141FF414141FF414141FF414141FF4141
      41FF65CC08FF65CC08FF65CC08FF65CC08FF65CC08FF65CC08FF65CC08FF65CC
      08FF65CC08FF3B780497000000000000000000000000000000003E41EBFF3E41
      EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41
      EBFF3E41EBFF2D30C7FF2D30C7FF00000000000000002FB0F7FF2FB0F7FF2FB0
      F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2DA7EBFFA9CCF7FFA9CC
      F7FFA9CCF7FF000000000000000000000000000000FFE5DCD8FFF8EAE4FF0000
      00FFF8EAE4FFF8EAE4FF000000FF3939EDFF4F4FFFFF000000FFF8EAE4FFF8EA
      E4FFF8EAE4FF000000FFF8EAE4FF7B7471FFE5DCD8FFF8EAE4FF000000FFF8EA
      E4FFF8EAE4FFF8EAE4FF000000FF3939EDFF4F4FFFFF000000FFF8EAE4FFF8EA
      E4FF000000FFF8EAE4FFF8EAE4FF000000FF0000000000000000000000000000
      0000000000000000000000000000567193FF567193FF567193FF567193FF5671
      93FF567193FF364267FF364267FF364267FF364267FF364267FF364267FF3642
      67FF000000000000000000000000A9BC56FFA9BC56FFA9BC56FFA9BC56FFA9BC
      56FFA9BC56FFA9BC56FF00000000000000008CA9F2FF8CA9F2FF8CA9F2FF8CA9
      F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FFABC5FFFF4141
      41FF424242FFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFF65CC
      08FF65CC08FF65CC08FF65CC08FFFFFFFFFFFFFFFFFF65CC08FF65CC08FF65CC
      08FF65CC08FF65CC08FF000000000000000000000000000000003E41EBFF3E41
      EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41
      EBFF2E30C9FF2D30C7FF2D30C7FF00000000000000002FB0F7FF2FB0F7FF2FB0
      F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2DA7EBFFA9CCF7FFA9CC
      F7FFA9CCF7FF000000000000000000000000000000FFE5DCD8FFF8EAE4FF0000
      00FFF8EAE4FFF8EAE4FFCBC0BBFF3737E6FF4F4FFFFF000000FFF8EAE4FFF8EA
      E4FFF8EAE4FF000000FFF8EAE4FF7B7471FFE5DCD8FFF8EAE4FF000000FFF8EA
      E4FFF8EAE4FFF8EAE4FF000000FF3939EDFF000000FFF8EAE4FFF8EAE4FFF8EA
      E4FF000000FFF8EAE4FFF8EAE4FF3E3B39400000000000000000000000000000
      000000000000567193FF567193FF567193FF567193FF567193FF567193FF5671
      93FF567193FF364267FF364267FF364267FF364267FF364267FF364267FF3642
      67FF364267FF364267FFA9BC56FFA9BC56FFA9BC56FFA9BC56FFA9BC56FFA9BC
      56FFA9BC56FFA9BC56FFA9BC56FF000000008CA9F2FF8CA9F2FF8CA9F2FF8CA9
      F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FFABC5FFFFABC5FFFF4141
      41FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65CC
      08FF65CC08FF65CC08FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65CC08FF65CC
      08FF65CC08FF65CC08FF00000000000000000000000000000000000000003E41
      EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41
      EBFF2D30C7FF2D30C7FF2D30C7FF2FB0F7FF000000002FB0F7FF2FB0F7FF2FB0
      F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2DA7EBFFA9CCF7FFA9CC
      F7FFA9CCF7FF000000000000000000000000000000FFE5DCD8FFF8EAE4FF0000
      00FFF8EAE4FFF8EAE4FFF8EAE4FF000000FF4F4FFFFF000000FFF8EAE4FFF8EA
      E4FFF8EAE4FF000000FFF8EAE4FF7B7471FFE5DCD8FFF8EAE4FF000000FFF8EA
      E4FFF8EAE4FFF8EAE4FF000000FF3939EDFF000000FFF8EAE4FFF8EAE4FFF8EA
      E4FF000000FFF8EAE4FFF8EAE4FF000000FF0000000000000000000000005671
      93FF567193FF567193FF567193FF567193FF567193FF567193FF567193FF5671
      93FF567193FF364267FF364267FF364267FF364267FF364267FF364267FF3642
      67FF364267FF364267FFA9BC56FFA9BC56FFA9BC56FFA8BB55FFA9BC56FFA9BC
      56FFA9BC56FFA9BC56FFA9BC56FF000000008CA9F2FF8CA9F2FF8CA9F2FF8CA9
      F2FF8CA9F2FF8CA9F2FF8CA9F2FF8CA9F2FFABC5FFFFABC5FFFFABC5FFFF4141
      41FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF65CC
      08FF65CC08FFFFFFFFFFFFFFFFFF65CC08FF65CC08FFFFFFFFFFFFFFFFFF65CC
      08FF65CC08FF65CC08FF00000000000000000000000000000000000000003E41
      EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41
      EBFF2D30C7FF2D30C7FF2D30C7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0
      F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2DA7EBFF2FB0F7FF2FB0
      F7FF2FB0F7FF000000000000000000000000000000FFE5DCD8FFF8EAE4FF0000
      00FFF8EAE4FFF8EAE4FFF8EAE4FF000000FF3939EDFF000000FFF8EAE4FFF8EA
      E4FFF8EAE4FF000000FFF8EAE4FF7B7471FFE5DCD8FFF8EAE4FF000000FFF8EA
      E4FFF8EAE4FFF8EAE4FF000000FF3939EDFF000000FFF8EAE4FFF8EAE4FFF8EA
      E4FF000000FFF8EAE4FFF8EAE4FF000000FF000000004A617EDB567193FF5671
      93FF567193FF567193FF567193FF567193FF567193FF567193FF567193FF5671
      93FF567193FF364267FF364267FF364267FF364267FF364267FF364267FF3642
      67FF364267FF75855EFFA9BC56FFA9BC56FFA8BA55FF8E993BFF8E993BFFA9BC
      56FFA9BC56FFA9BC56FFA9BC56FF000000008CA9F2FF8CA9F2FF8CA9F2FF8CA9
      F2FF8CA9F2FF8CA9F2FF8CA9F2FFABC5FFFFABC5FFFFABC5FFFFABC5FFFF4141
      41FFFFFFFFFFFFFFFFFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFF65CC
      08FF65CC08FFFFFFFFFF65CC08FF65CC08FF65CC08FF65CC08FFFFFFFFFFFFFF
      FFFF82D535FF65CC08FF00000000000000000000000000000000000000003E41
      EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF3E41
      EBFF2D30C7FF2D30C7FF2D30C7FF2FB0F7FF2FB0F7FF2DA7EBFF2FB0F7FF2FB0
      F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2DA7EBFF2FB0F7FF2FB0
      F7FF2FB0F7FF000000000000000000000000000000FFE5DCD8FFF8EAE4FFF8EA
      E4FFF8EAE4FFF8EAE4FFF8EAE4FF000000FF000000FFF8EAE4FFF8EAE4FFF8EA
      E4FFF8EAE4FFF8EAE4FFF8EAE4FF5F5A58FFE5DCD8FFF8EAE4FFF8EAE4FFF8EA
      E4FFF8EAE4FFF8EAE4FFF8EAE4FF000000FF000000FFF8EAE4FFF8EAE4FFF8EA
      E4FFF8EAE4FFF8EAE4FFF8EAE4FF000000FF567193FF567193FF567193FF5671
      93FF567193FF567193FF567193FF567193FF567193FF567193FF567193FF5671
      93FF567193FF364267FF364267FF364267FF364267FF364267FF364267FF3642
      67FF364267FF80925CFFA9BC56FFA9BC56FF8E993BFFA9BC56FFA9BC56FF8E99
      3BFFA9BC56FFA9BC56FFA9BC56FF00000000000000008CA9F2FF8CA9F2FF8CA9
      F2FF8CA9F2FF8CA9F2FF9EBAFAFFABC5FFFFABC5FFFFABC5FFFFABC5FFFF4141
      41FFFFFFFFFFAE6BADFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFF65CC
      08FF65CC08FF65CC08FF65CC08FF65CC08FF65CC08FF65CC08FF65CC08FFFFFF
      FFFFFFFFFFFF65CC08FF00000000000000000000000000000000000000003E41
      EBFF565456FF3E41EBFF3E41EBFF3E41EBFF3E41EBFF565456FF3E41EBFF3E41
      EBFF2D30C7FF2D30C7FF2D30C7FF2FB0F7FF2FB0F7FF2DA7EBFF2FB0F7FF2FB0
      F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2DA7EBFF2FB0F7FF2FB0
      F7FF2FB0F7FF000000000000000000000000000000FFE5DCD8FFF8EAE4FFF8EA
      E4FFF8EAE4FFF8EAE4FF000000FF000000FF3939EDFF000000FF000000FFF8EA
      E4FFF8EAE4FFF8EAE4FFF8EAE4FF000000FF000000FFF8EAE4FFF8EAE4FFF8EA
      E4FFF8EAE4FF000000FF000000FF2929DBFF000000FF000000FFF8EAE4FFF8EA
      E4FFF8EAE4FFF8EAE4FFF8EAE4FF000000FF567193FF567193FF567193FF5671
      93FF567193FF567193FF567193FF567193FF567193FF567193FF567193FF5671
      93FF567193FF364267FF364267FF364267FF364267FF364267FF364267FF3642
      67FF364267FF364267FFA9BC56FFA9BC56FFA9BC56FFA9BC56FFA9BC56FFA9BC
      56FF8E993BFFA9BC56FFA9BC56FF00000000000000008CA9F2FF8CA9F2FF8CA9
      F2FF8CA9F2FF8CA9F2FFABC5FFFFABC5FFFFABC5FFFFABC5FFFFABC5FFFF4141
      41FFFFFFFFFFF0E4F0FFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6A
      ACFF65CC08FF65CC08FF65CC08FF65CC08FF65CC08FF65CC08FF65CC08FF65CC
      08FF65CC08FF65CC08FF00000000000000000000000000000000000000003E41
      EBFF58554EFF3E41EBFF3E41EBFF3E41EBFF3E41EBFF58554EFF3E41EBFF3E41
      EBFF2D30C7FF2D30C7FF2FA9F4FF2FB0F7FF2FB0F7FF2DA7EBFF2FB0F7FF2FB0
      F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2DA7EBFF2FB0F7FF2FB0
      F7FF2FB0F7FF00000000000000000000000000000000000000FFF8EAE4FFF8EA
      E4FFF8EAE4FF000000FFE5DCD8FF000000FF000000FFE5DCD8FF000000FFF8EA
      E4FFF8EAE4FFF8EAE4FF000000FF000000FF000000FF000000FFF8EAE4FFF8EA
      E4FFF8EAE4FF000000FFE5DCD8FF000000FF000000FFE5DCD8FF000000FFF8EA
      E4FFF8EAE4FFF8EAE4FF000000FF00000000567193FF567193FF567193FF5671
      93FF567193FF567193FF567193FF567193FF567193FF567193FF567193FF5671
      93FF567193FF364267FF364267FF364267FF364267FF364267FF364267FF3642
      67FF364267FF364267FFA9BC56FFA9BC56FFA9BC56FFA9BC56FFA9BC56FFA9BC
      56FFA9BC56FFA9BC56FFA9BC56FF0000000000000000000000008CA9F2FF8CA9
      F2FF8CA9F2FF8CA9F2FFABC5FFFFABC5FFFFABC5FFFFABC5FFFFABC5FFFF4141
      41FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF78D227FF65CC08FF65CC08FF65CC08FF65CC08FF65CC08FF65CC08FF65CC
      08FF65CC08FF0000000000000000000000000000000000000000000000000000
      000058554EFF0000000000000000000000000000000058554EFFA9CCF7FFA9CC
      F7FF00000000000000002790C9D12FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0
      F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0
      F7FF2FB0F7FF0000000000000000000000000000000000000000000000FF0000
      00FF000000FF000000FFE5DCD8FF000000FF000000FF242222FFE5DCD8FF0000
      00FF000000FF000000FF000000FF3939EDFF4F4FFFFF000000FF000000FF0000
      00FF000000FFE5DCD8FF000000FF000000FF000000FFE5DCD8FF000000FF0000
      00FF000000FF000000FF0000000000000000567193FF567193FF567193FF5671
      93FF567193FF567193FF567193FF567193FF567193FF567193FF567193FF5671
      93FF567193FF364267FF364267FF364267FF364267FF364267FF364267FF3642
      67FF364267FF364267FF364267FFA9BC56FFA9BC56FFA9BC56FFA9BC56FFA9BC
      56FFA9BC56FFA9BC56FF00000000000000000000000000000000000000000000
      00008CA9F2FF8CA9F2FFABC5FFFFABC5FFFFABC5FFFFABC5FFFFABC5FFFF4141
      41FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF65CC08FF65CC08FF65CC08FF65CC08FF65CC08FF4388
      05AA000000000000000000000000000000000000000000000000000000000000
      000058554EFF0000000000000000000000000000000058554EFFA9CCF7FFA9CC
      F7FF0000000000000000000000002FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0
      F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0
      F7FF2FB0F7FF0000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF6F97E5FF78A4F0FF000000FF000000FF0000
      00FFF8EAE4FFF8EAE4FFB3A9A5FF3939EDFF02020AFFF8EAE4FFF8EAE4FFF8EA
      E4FF000000FF000000FF000000FF78A4F0FF78A4F0FF000000FF000000FF0000
      000000000000000000000000000000000000567193FF567193FF567193FF5671
      93FF567193FF567193FF567193FF567193FF567193FF567193FF567193FF5671
      93FF567193FF364267FF364267FF364267FF364267FF364267FF364267FF3642
      67FF364267FF364267FF364267FF364267FFA9BC56FFA9BC56FFA9BC56FFA9BC
      56FFA9BC56FF0000000000000000000000000000000000000000000000000000
      0000000000008CA9F2FFABC5FFFFABC5FFFFABC5FFFFABC5FFFFABC5FFFF4141
      41FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFA4B1F3FFA0AEF2FFA0AEF2FFA0AEF2FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000058554EFF00000000000000000000000089A5C9CF58554EFFA9CCF7FF2026
      2D300000000000000000000000001E6B989D2FB0F7FF2FB0F7FF2FB0F7FF2FB0
      F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FB0
      F7FF2FB0F7FF0000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FFF8EAE4FFF8EA
      E4FFF8EAE4FFF8EAE4FFF8EAE4FF000000FF000000FFF8EAE4FFF8EAE4FFF8EA
      E4FFF8EAE4FFF8EAE4FF000000FF000000FF000000FF000000FF000000000000
      000000000000000000000000000000000000567193FF567193FF567193FF5671
      93FF567193FF567193FF567193FF567193FF1CD4FFFF567193FF567193FF5671
      93FF567193FF364267FF364267FF364267FF364267FF364267FF364267FF3642
      67FF364267FF364267FF364267FF364267FF364267FF364267FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000ABC5FFFFABC5FFFFABC5FFFFABC5FFFFABC5FFFF4141
      41FFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6A
      ACFFAD6AACFFAD6AACFFA0AEF2FFA0AEF2FFABC5FFFFA0AEF2FFA0AEF2FF636C
      969F000000000000000000000000000000000000000000000000000000000000
      00000000000058554EFFA9CCF7FFA9CCF7FFA9CCF7FF58554EFFA9CCF7FF0000
      000000000000000000004265ADFF4265ADFF4265ADFF2FB0F7FF2FB0F7FF2FB0
      F7FF9FC3EDFFA2C4EDFFA2C4EDFF2FB0F7FF2FB0F7FF2FB0F7FF2FB0F7FF2FAF
      F5FF4265ADFF4265ADFF00000000000000000000000000000000000000000000
      000000000000000000FF000000FF78A4F0FF78A4F0FF78A4F0FF000000FFF8EA
      E4FFF8EAE4FFF8EAE4FFF8EAE4FF000000FF000000FFF8EAE4FFF8EAE4FFF8EA
      E4FFF8EAE4FF000000FF6F97E5FF78A4F0FF78A4F0FF000000FF0000002E0000
      000000000000000000000000000000000000567193FF567193FF567193FF5671
      93FF567193FF567193FF1CD4FFFF1CD4FFFF1CD4FFFF567193FF567193FF5671
      93FF567193FF364267FF364267FF364267FF364267FF364267FF364267FF3642
      67FF364267FF364267FF364267FF364267FF364267FF364267FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ABC5FFFFABC5FFFFABC5FFFFABC5FFFF4141
      41FFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6A
      ACFFAD6AACFFAD6AACFFA97DC0FFABC5FFFFABC5FFFFABC5FFFFABC5FFFFA0AE
      F2FF000000000000000000000000000000000000000000000000000000000000
      00000000000058554EFFA9CCF7FF5C5B57FF58554EFF75808AFD000000000000
      000000000000000000004265ADFF4265ADFF4265ADFF4265ADFF4265ADFF4265
      ADFFA2C4EDFFA2C4EDFFA2C4EDFF4265ADFF4265ADFF4265ADFF4265ADFF4265
      ADFF4265ADFF4265ADFF00000000000000000000000000000000000000000000
      000000000000000000FF6F97E5FF78A4F0FF78A4F0FF78A4F0FF030507FFF7E9
      E3FFF8EAE4FF000000FF000000FF000000FF000000FF000000FF000000FFF8EA
      E4FF000000FF6F97E5FF78A4F0FF78A4F0FF78A4F0FF78A4F0FF000000FF0000
      000000000000000000000000000000000000567193FF567193FF567193FF5671
      93FF567193FF1CD4FFFF1CD4FFFF1CD4FFFF1CD4FFFF567193FF567193FF5671
      93FF567193FF44567BFF364267FF364267FF364267FF364267FF364267FF3642
      67FF364267FF364267FF364267FF364267FF364267FF364267FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ABC5FFFFABC5FFFFABC5FFFFABC5FFFF4141
      41FFAD6AACFFAD6AACFF983D91FF983D91FF983D91FF983D91FF983D91FF983D
      91FF983D91FF983D91FF983D91FFAD6AACFFABC5FFFFABC5FFFFABC5FFFFABC5
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000008DAACED5A9CCF7FF2A333E400000000000000000000000000000
      000000000000000000004265ADFF4265ADFF4265ADFF4265ADFF4265ADFF4265
      ADFFA2C4EDFFA2C4EDFFA2C4EDFF4265ADFF4265ADFF4265ADFF4265ADFF4265
      ADFF4265ADFF4265ADFF00000000000000000000000000000000000000000000
      0000000000FF000000FF78A4F0FF78A4F0FF78A4F0FF78A4F0FF78A4F0FF0000
      00FF000000FF000000FFE5DCD8FF000000FF000000FFE5DCD8FF000000FF0000
      00FF000000FF6F97E5FF78A4F0FF78A4F0FF78A4F0FF78A4F0FF000000FF0000
      00FF00000000000000000000000000000000567193FF567193FF567193FF5671
      93FF567193FF1CD4FFFF1CD4FFFF1CD4FFFF1CD4FFFF567193FF567193FF4456
      7BFF44567BFF44567BFF44567BFF44567BFF364267FF364267FF364267FF3642
      67FF364267FF364267FF364267FF364267FF364267FF364267FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ABC5FFFFABC5FFFFABC5FFFFABC5FFFF4141
      41FFAD6AACFFAD6AACFFAD6AACFF4545DBFF4545DBFF4545DBFF4545DBFF4545
      DBFF4545DBFF4545DBFFA0AEF2FFA0AEF2FFA0AEF2FFA0AEF2FF91A4DADD0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004265ADFF4265ADFF4265ADFF4265ADFF4265ADFFA9CC
      F7FFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FF4265ADFF4265ADFF4265
      ADFF4265ADFF4265ADFF00000000000000000000000000000000000000000000
      00FF6F97E5FF000000FF78A4F0FF78A4F0FF78A4F0FF78A4F0FF78A4F0FF0000
      00FF000000FFD1C9C5FF000000FF000000FF000000FF000000FF7A7573FF0000
      00FF000000FF6F97E5FF78A4F0FF78A4F0FF78A4F0FF78A4F0FF000000FF6F97
      E5FF000000FF000000000000000000000000567193FF567193FF567193FF5671
      93FF567193FF1CD4FFFF1CD4FFFF1CD4FFFF1CD4FFFF44567BFF44567BFF4456
      7BFF44567BFF44567BFF44567BFF44567BFF44567BFF44567BFF364267FF3642
      67FF364267FF364267FF364267FF364267FF364267FF364267FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008095C1C1ABC5FFFFABC5FFFFABC5FFFF4141
      41FFAD6AACFFAD6AACFFAD6AACFF5052EEFF5052EEFF5052EEFF5052EEFF5052
      EEFF4545DBFF4545DBFFA0AEF2FFA1B1F4FFABC5FFFFA0AFF3FFA0AEF2FFA0AE
      F2FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000006080F164265ADFF4265ADFF5174B8FFA9CC
      F7FFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FF4265ADFF4265ADFF4265
      ADFF000000000000000000000000000000000000000000000000000000000000
      0000000000FF000000FF78A4F0FF78A4F0FF78A4F0FF78A4F0FF78A4F0FF0000
      00FF000000FF000000F6000000FF7099E7FF78A4F0FF000000FF0000009C0000
      00FF000000FF6F97E5FF78A4F0FF78A4F0FF78A4F0FF78A4F0FF000000FF0000
      00FF00000000000000000000000000000000567193FF567193FF567193FF5671
      93FF567193FF1CD4FFFF1CD4FFFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF4456
      7BFF44567BFF44567BFF44567BFF44567BFF44567BFF44567BFF44567BFF4456
      7BFF364267FF364267FF364267FF364267FF364267FF364267FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABC5FFFFABC5FFFFABC5FFFF4141
      41FFAD6AACFFAD6AACFFAD6AACFF5052EEFF5052EEFF5052EEFF5052EEFF5052
      EEFF5052EEFF4545DBFFAD6AACFFABC5FFFFABC5FFFFABC5FFFFABC5FFFFA0AE
      F2FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004265ADFF4265ADFFA9CCF7FFA9CC
      F7FFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FF4265ADFF4265
      ADFF000000000000000000000000000000000000000000000000000000000000
      0000000000FF000000FF000000FF000000FF000000FF78A4F0FF000000FF1814
      14FF000000FF00000000000000FF000000FF000000FF000000FF000000000000
      00FF473C3AFF000000FF000000FF000000FF000000FF78A4F0FF000000FF0000
      00FF00000000000000000000000000000000567193FF567193FF567193FF5671
      93FF567193FF09AFEAFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF09AF
      EAFF09AFEAFF44567BFF44567BFF44567BFF44567BFF44567BFF44567BFF4456
      7BFF44567BFF44567BFF364267FF364267FF364267FF364267FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000ABC5FFFFABC5FFFFABC5FFFF4141
      41FFAD6AACFFAD6AACFF5052EEFF5052EEFF0FC1FEFF0FC1FEFF0FC1FEFF0FC1
      FEFF0FC1FEFF4545DBFFAD6AACFFAD6AACFFABC5FFFFABC5FFFFABC5FFFFABC5
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A2C4EDFFA2C4EDFFA9CCF7FFA9CC
      F7FFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FFA2C4EDFFA2C4
      EDFF000000000000000000000000000000000000000000000000000000000000
      0000000000FF87736FFF87736FFF87736FFF87736FFF000000FF000000FF8773
      6FFF000000FF000000FF6F97E5FF78A4F0FF78A4F0FF78A4F0FF000000FF0000
      00FF6D5C5AFF87736FFF87736FFF87736FFF87736FFF000000FF87736FFF0000
      00FF00000000000000000000000000000000567193FF567193FF567193FF4456
      7BFF44567BFF44567BFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF09AF
      EAFF09AFEAFF09AFEAFF09AFEAFF44567BFF44567BFF44567BFF44567BFF4456
      7BFF44567BFF44567BFF44567BFF44567BFF364267FF364267FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006E7EA4A4ABC5FFFFABC5FFFFABC5FFFF4141
      41FFAD6AACFFAD6AACFF5052EEFF5052EEFF0FC1FEFF0FC1FEFF0FC1FEFF0FC1
      FEFF0FC1FEFF4545DBFFAD6AACFFAD6AACFFAD6AACFF414141FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A2C4EDFFA2C4EDFFA9CCF7FF5C5B
      57FFA9CCF7FFA9CCF7FFA9CCF7FF5C5B57FFA9CCF7FFA9CCF7FFA2C4EDFFA2C4
      EDFF000000000000000000000000000000000000000000000000000000000000
      0000000000FF6D5C5AFF87736FFF87736FFF87736FFF87736FFF87736FFF0000
      00FF00000000233049FF78A4F0FF78A4F0FF78A4F0FF78A4F0FF000000FF0000
      0033000000FF87736FFF87736FFF87736FFF87736FFF87736FFF87736FFF0000
      00FF00000000000000000000000000000000567193FF465A7EFF44567BFF4456
      7BFF44567BFF44567BFF44567BFF44567BFF09AFEAFF09AFEAFF09AFEAFF09AF
      EAFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF44567BFF44567BFF4456
      7BFF44567BFF44567BFF44567BFF44567BFF44567BFF405074FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ABC5FFFFABC5FFFFABC5FFFFABC5FFFF4141
      41FFAD6AACFFAD6AACFF5052EEFF5052EEFF5052EEFF5052EEFF5052EEFF5052
      EEFF5052EEFF4545DBFF4545DBFFAD6AACFFAD6AACFF414141FFABC5FFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A2C4EDFFA2C4EDFFA9CCF7FFA9CC
      F7FFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FFA2C4EDFFA2C4
      EDFF000000000000000000000000000000000000000000000000000000000000
      000000000016000000FF87736FFF87736FFF87736FFF87736FFF84706CFF0000
      00FF000000FF6F97E5FF78A4F0FF78A4F0FF78A4F0FF78A4F0FF000000FF0000
      00FF000000FF6D5C5AFF87736FFF87736FFF87736FFF87736FFF000000FF0000
      0000000000000000000000000000000000000000000044567BFF44567BFF4456
      7BFF44567BFF44567BFF44567BFF44567BFF44567BFF44567BFF09AFEAFF09AF
      EAFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF4456
      7BFF44567BFF44567BFF44567BFF44567BFF44567BFF44567BFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ABC5FFFFABC5FFFFABC5FFFFABC5FFFF4141
      41FFAD6AACFFAD6AACFF5052EEFF5052EEFF5052EEFF5052EEFF5052EEFF5052
      EEFF5052EEFF4545DBFF4545DBFFAD6AACFFAD6AACFF414141FFABC5FFFFABC5
      FFFF060609090000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004265ADFF4A6DB2FFA9CCF7FFA9CC
      F7FFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FF4265ADFF4265
      ADFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000002D000000FF6D5C5AFF87736FFF000000FF000000FF0000
      00FF000000FF6F97E5FF78A4F0FF78A4F0FF78A4F0FF78A4F0FF000000FF6F97
      E5FF000000FF000000FF000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000004456
      7BFF44567BFF44567BFF44567BFF44567BFF44567BFF44567BFF44567BFF4456
      7BFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF09AF
      EAFF169BD2FF44567BFF44567BFF44567BFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ABC5FFFFABC5FFFFABC5FFFFABC5FFFF4141
      41FFAD6AACFFAD6AACFF5052EEFF5052EEFF3DD2FFFF3993FCFF3DD2FFFF3DD2
      FFFF3993FCFF494AE3FF4545DBFFAD6AACFFAD6AACFF414141FFABC5FFFFABC5
      FFFFABC5FFFFABC5FFFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004265ADFF4265ADFF4265ADFF4265
      ADFF4265ADFFA9CCF7FFA9CCF7FFA9CCF7FFA9CCF7FF4265ADFF4265ADFF4265
      ADFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF000000FF000000FF000000FF78A4F0FF78A4F0FF78A4F0FF000000FF0000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000044567BFF44567BFF44567BFF44567BFF44567BFF44567BFF4456
      7BFF44567BFF44567BFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF09AFEAFF09AF
      EAFF09AFEAFF09AFEAFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ABC5FFFFABC5FFFFABC5FFFFABC5FFFF4141
      41FFAD6AACFFAD6AACFF3BB3FEFF3BB3FEFF3DD2FFFF3993FCFF3DD2FFFF3DD2
      FFFF3993FCFF3DD2FFFF3DD2FFFFAD6AACFFAD6AACFF414141FFABC5FFFFABC5
      FFFFABC5FFFFABC5FFFFABC5FFFFABC5FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004265ADFF4265ADFF4265ADFF4265
      ADFF4265ADFF4265ADFF4265ADFF4265ADFF4265ADFF4265ADFF4265ADFF4265
      ADFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00FF6D5C5AFF87736FFF87736FFF000000FF000000FF000000FF000000FF1C18
      17FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000044567BFF44567BFF44567BFF44567BFF4456
      7BFF44567BFF44567BFF44567BFF43567CFF09AFEAFF09AFEAFF09AFEAFF09AF
      EAFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000ABC5FFFFABC5FFFFABC5FFFFABC5FFFFABC5FFFF4141
      41FFAD6AACFFAD6AACFF3BB3FEFF3BB3FEFF3DD2FFFF3993FCFF3DD2FFFF3DD2
      FFFF3993FCFF3DD2FFFF3DD2FFFFAD6AACFFAD6AACFF414141FFABC5FFFFABC5
      FFFFABC5FFFFABC5FFFFABC5FFFFABC5FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004265ADFF4265ADFF4265
      ADFF4265ADFF4265ADFF4265ADFF4265ADFF4265ADFF4265ADFF4265ADFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000171313FF87736FFF87736FFF87736FFF87736FFF584B49FF87736FFF0000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000044567BFF44567BFF4456
      7BFF44567BFF44567BFF44567BFF44567BFF44567BFF0CAAE4FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000ABC5FFFFABC5FFFFABC5FFFFABC5FFFFABC5FFFF4141
      41FFAD6AACFFAD6AACFF3BB3FEFF3BB3FEFF3DD2FFFF3993FCFF3DD2FFFF3DD2
      FFFF3993FCFF3DD2FFFF3DD2FFFFAD6AACFFAD6AACFF414141FF00000000ABC5
      FFFFABC5FFFFABC5FFFFABC5FFFFABC5FFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003A5998E04265ADFF4265
      ADFF4265ADFF4265ADFF4265ADFF4265ADFF4265ADFF4265ADFF060910180000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000FF6D5C5AFF87736FFF87736FFF87736FFF87736FFF87736FFF0000
      00FF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004456
      7BFF44567BFF44567BFF44567BFF44567BFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A2BBF2F2ABC5FFFFABC5FFFFABC5FFFF010101014141
      41FFAD6AACFFAD6AACFF3BB3FEFF3BB3FEFF9383C0FF3993FCFF3DD2FFFFAD6A
      ACFF3993FCFF528AEBFF769ED5FFAD6AACFFAD6AACFF414141FF000000000000
      0000ABC5FFFFABC5FFFFABC5FFFF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004265
      ADFF4265ADFF4265ADFF4265ADFF4265ADFF4265ADFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF73615FFF87736FFF87736FFF87736FFF000000FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003D4E6DD644567BFF13192443000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004141
      41FFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6A
      ACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFF414141FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002D4576AF283D6A9C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000FF000000FF000000FF000000FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004141
      41FFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6A
      ACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFFAD6AACFF414141FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004141
      41FF414141FF414141FF414141FF414141FF414141FF414141FF414141FF4141
      41FF414141FF414141FF414141FF414141FF414141FF00000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000400000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object imgListManage: TImageList
    ColorDepth = cd24Bit
    BlendColor = clBtnFace
    DrawingStyle = dsSelected
    Left = 832
    Top = 32
    Bitmap = {
      494C010103000800FC0010001000FFFFFFFF1910FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000100000000100180000000000000C
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF0500FC0500FC0500FC0500FC0500FC0500FC0500FC
      0500FC0500FC0500FCFFFFFFFFFFFFFFFFFF660D34D1B6C2FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF0500FC0500FC0500FC0500FC0500FC0500FC0500FC
      0500FC0500FC0500FCFFFFFFFFFFFFFFFFFF9F3E37660D34660D346AD0FF6AD0
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF0500FC0500FC0500FCFFFFFF0500FC0500FCFFFFFF
      0500FC0500FC0500FCFFFFFFFFFFFFFFFFFFFFFFFF9F3E376AD0FF6AD0FF6AD0
      FF279AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF0500FC0500FC0500FCFFFFFF0500FC0500FCFFFFFF
      0500FC0500FC0500FCFFFFFFFFFFFFFFFFFFFFFFFFB5E7FFB5E7FF6AD0FF279A
      FF279AFF279AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF0500FC0500FC0500FCFFFFFF0500FC0500FCFFFFFF
      0500FC0500FC0500FCFFFFFFFFFFFFFFFFFFFFFFFFB5E7FFB5E7FF20B8FF279A
      FF279AFF279AFF279AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF0500FC0500FC0500FCFFFFFF0500FC0500FCFFFFFF
      0500FC0500FC0500FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF20B8FF20B8FF20B8
      FF279AFF279AFF279AFF279AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF0500FC0500FC0500FCFFFFFF0500FC0500FCFFFFFF
      0500FC0500FC0500FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58CAFF20B8FF20B8
      FF20B8FF279AFF279AFF279AFF279AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000050AF4C50AF4C50AF4C50AF4C50AF
      4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50
      AF4CFFFFFFFFFFFFFFFFFF0500FC0500FC0500FCFFFFFF0500FC0500FCFFFFFF
      0500FC0500FC0500FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58CAFF20B8
      FF20B8FF20B8FF279AFF279AFF279AFF279AFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000050AF4C50AF4C50AF4C50AF4C50AF
      4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50AF4C50
      AF4CFFFFFFFFFFFFFFFFFF0500FC0500FC0500FCFFFFFF0500FC0500FCFFFFFF
      0500FC0500FC0500FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF58CA
      FF20B8FF20B8FF20B8FF279AFF279AFF279AFF279AFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF0500FC0500FC0500FC0500FC0500FC0500FC0500FC
      0500FC0500FC0500FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FF58CAFF20B8FF20B8FF20B8FF279AFF279AFF279AFF279AFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFF0500FC0500FC0500FC0500FC0500FC0500FC0500FC
      0500FC0500FC0500FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF58CAFF20B8FF20B8FF20B8FF279AFF279AFF279AFF4532CCFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFCDCCFECDCCFECDCCFECDCCFECDCCFECDCCFECDCCFECDCCFE
      CDCCFECDCCFECDCCFECDCCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF58CAFF20B8FF20B8FF20B8FF279AFF4532CC4532CC4532CCFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF0500FC0500FC0500FC0500FC0500FC0500FC0500FC0500FC
      0500FC0500FC0500FC0500FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF58CAFF20B8FF20B8FF3A3EFF4532CC4532CC4532CC4C
      3ACE000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF0500FC0500FC0500FC0500FC0500FC0500FC0500FC0500FC
      0500FC0500FC0500FC0500FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF58CAFF3A3EFF3A3EFF3A3EFF4532CC4C3ACEFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0500FC0500FC0500FC0500FC0500FC
      0500FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E71FF3A3EFF3A3EFF4246FFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFF50AF4C50AF4CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0500FC0500FC0500FC0500FC0500FC
      0500FCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6E71FF4246FFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end
