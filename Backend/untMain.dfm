object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Server'
  ClientHeight = 189
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object btnStart: TButton
    Left = 248
    Top = 152
    Width = 101
    Height = 29
    Caption = 'Start'
    TabOrder = 0
    OnClick = btnStartClick
  end
  object mmoLog: TMemo
    Left = 8
    Top = 8
    Width = 341
    Height = 129
    TabOrder = 1
  end
end
