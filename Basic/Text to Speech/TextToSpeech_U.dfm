object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 259
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 200
    Top = 56
    Width = 122
    Height = 19
    Caption = 'Type anything:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnTextToSpeech: TButton
    Left = 224
    Top = 149
    Width = 65
    Height = 25
    Caption = 'Talk'
    TabOrder = 0
    OnClick = btnTextToSpeechClick
  end
  object edtUserText: TEdit
    Left = 200
    Top = 98
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'edtUserText'
  end
end
