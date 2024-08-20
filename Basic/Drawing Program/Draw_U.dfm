object frmDraw: TfrmDraw
  Left = 0
  Top = 0
  Caption = 'Draw'
  ClientHeight = 709
  ClientWidth = 1136
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 24
    Top = 62
    Width = 1097
    Height = 639
    OnMouseDown = Image1MouseDown
    OnMouseMove = Image1MouseMove
    OnMouseUp = Image1MouseUp
  end
  object edtHor: TEdit
    Left = 56
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '0'
  end
  object edtVer: TEdit
    Left = 248
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0'
  end
  object btnClear: TButton
    Left = 448
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 2
    OnClick = btnClearClick
  end
  object btnSaveDrawing: TButton
    Left = 560
    Top = 8
    Width = 81
    Height = 25
    Caption = 'Save Drawing'
    TabOrder = 3
    OnClick = btnSaveDrawingClick
  end
  object sdDrawing: TSaveDialog
    Left = 664
  end
end
