object frmPingPong: TfrmPingPong
  Left = 0
  Top = 0
  Caption = 'Ping Pong'
  ClientHeight = 605
  ClientWidth = 843
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnMouseMove = FormMouseMove
  PixelsPerInch = 96
  TextHeight = 13
  object shpPlayerPlatform: TShape
    Left = 272
    Top = 528
    Width = 97
    Height = 9
    Brush.Color = clLime
    Enabled = False
  end
  object shpEnemyPlatform: TShape
    Left = 272
    Top = 32
    Width = 97
    Height = 9
    Brush.Color = clRed
  end
  object shpBall: TShape
    Left = 304
    Top = 160
    Width = 25
    Height = 17
    Brush.Color = clBlue
    Shape = stCircle
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
