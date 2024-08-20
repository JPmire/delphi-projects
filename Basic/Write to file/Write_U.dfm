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
  object Name: TLabel
    Left = 168
    Top = 51
    Width = 31
    Height = 13
    Caption = 'Name:'
  end
  object edtName: TEdit
    Left = 216
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btnLogOn: TButton
    Left = 232
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Log On'
    TabOrder = 1
    OnClick = btnLogOnClick
  end
end
