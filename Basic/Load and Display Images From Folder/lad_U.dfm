object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 361
  ClientWidth = 446
  Color = clInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 76
    Top = 65
    Width = 297
    Height = 224
    Center = True
    Stretch = True
    Transparent = True
  end
  object Label1: TLabel
    Left = 96
    Top = 8
    Width = 269
    Height = 25
    Caption = 'Image Loader and Viewer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnLoadNext: TButton
    Left = 184
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Load Next'
    TabOrder = 0
    OnClick = btnLoadNextClick
  end
end
