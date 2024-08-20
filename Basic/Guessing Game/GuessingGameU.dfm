object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 321
  ClientWidth = 678
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 264
    Top = 80
    Width = 202
    Height = 19
    Caption = 'Guess the secret number'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnSubmit: TButton
    Left = 320
    Top = 169
    Width = 75
    Height = 25
    Caption = '&Submit'
    TabOrder = 0
    OnClick = btnSubmitClick
  end
  object edtInput: TEdit
    Left = 296
    Top = 128
    Width = 121
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    TextHint = 'Enter a number'
  end
  object BitBtn1: TBitBtn
    Left = 560
    Top = 241
    Width = 57
    Height = 25
    DoubleBuffered = True
    Kind = bkClose
    ParentDoubleBuffered = False
    TabOrder = 2
  end
end
