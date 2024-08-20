object frmPingPong: TfrmPingPong
  Left = 0
  Top = 0
  Caption = 'Ping Pong'
  ClientHeight = 610
  ClientWidth = 818
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object shpPlayerPlatform: TShape
    Left = 272
    Top = 528
    Width = 113
    Height = 9
    Brush.Color = clLime
    Enabled = False
  end
  object shpEnemyPlatform: TShape
    Left = 272
    Top = 32
    Width = 113
    Height = 9
    Brush.Color = clRed
  end
  object shpEnemyPoint: TShape
    Left = 656
    Top = 8
    Width = 17
    Height = 16
    Visible = False
  end
  object shpPlayerPoint: TShape
    Left = 656
    Top = 572
    Width = 17
    Height = 16
    Visible = False
  end
  object Label1: TLabel
    Left = 182
    Top = 565
    Width = 60
    Height = 23
    Caption = 'Score:'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 400
    Top = 565
    Width = 105
    Height = 23
    Caption = 'HighScore:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object shpBall: TShape
    Left = 307
    Top = 200
    Width = 25
    Height = 25
    Brush.Color = clYellow
    Shape = stCircle
  end
  object btnStart: TButton
    Left = 288
    Top = 264
    Width = 97
    Height = 49
    Caption = 'Start'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = btnStartClick
  end
  object bmbQuit: TBitBtn
    Left = 455
    Top = 264
    Width = 97
    Height = 49
    Caption = '&Quit'
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    Kind = bkIgnore
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 1
    OnClick = bmbQuitClick
  end
  object pnlScore: TPanel
    Left = 248
    Top = 556
    Width = 89
    Height = 41
    Caption = '0'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  object pnlHighScore: TPanel
    Left = 511
    Top = 556
    Width = 89
    Height = 41
    Caption = '0'
    Color = clSkyBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
  end
  object pnlLost: TPanel
    Left = -24
    Top = 603
    Width = 825
    Height = 617
    Color = clAppWorkSpace
    ParentBackground = False
    TabOrder = 4
    Visible = False
    object pnlLoseDesign: TPanel
      Left = 32
      Top = 23
      Width = 753
      Height = 543
      TabOrder = 0
      object Label4: TLabel
        Left = 121
        Top = 190
        Width = 129
        Height = 45
        Caption = 'Score:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Swis721 Blk BT'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 392
        Top = 190
        Width = 234
        Height = 45
        Caption = 'High Score:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Swis721 Blk BT'
        Font.Style = []
        ParentFont = False
      end
      object lblLost: TLabel
        Left = 217
        Top = 54
        Width = 303
        Height = 77
        Caption = 'You Lost'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -64
        Font.Name = 'Swis721 Blk BT'
        Font.Style = []
        ParentFont = False
      end
      object bmbMainMenu2: TBitBtn
        Left = 427
        Top = 380
        Width = 117
        Height = 40
        Caption = '&Quit'
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = bkIgnore
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 0
        OnClick = bmbMainMenu2Click
      end
      object bmbRetry: TBitBtn
        Left = 212
        Top = 380
        Width = 117
        Height = 40
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = []
        Kind = bkRetry
        ParentDoubleBuffered = False
        ParentFont = False
        TabOrder = 1
        OnClick = bmbRetryClick
      end
      object pnlLostHighScore: TPanel
        Left = 464
        Top = 267
        Width = 119
        Height = 46
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
      end
      object pnlLostScore: TPanel
        Left = 131
        Top = 267
        Width = 119
        Height = 46
        Caption = '0'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -37
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  object tmrBallMove: TTimer
    Enabled = False
    Interval = 20
    OnTimer = tmrBallMoveTimer
    Left = 640
    Top = 240
  end
  object tmrEnemyPlatformMove: TTimer
    Enabled = False
    Interval = 1
    OnTimer = tmrEnemyPlatformMoveTimer
    Left = 640
    Top = 168
  end
end
