object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 331
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnLoad: TButton
    Left = 72
    Top = 288
    Width = 75
    Height = 25
    Caption = 'btnLoad'
    TabOrder = 0
  end
  object btnSave: TButton
    Left = 232
    Top = 288
    Width = 75
    Height = 25
    Caption = 'btnSave'
    TabOrder = 1
  end
  object fodFolder: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 144
    Top = 96
  end
end
