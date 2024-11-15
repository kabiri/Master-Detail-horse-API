object frmMain: TfrmMain
  Left = 0
  Top = 0
  BiDiMode = bdRightToLeft
  Caption = 'Client'
  ClientHeight = 497
  ClientWidth = 898
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  ParentBiDiMode = False
  OnCreate = FormCreate
  DesignSize = (
    898
    497)
  TextHeight = 15
  object btnLoad: TButton
    Left = 518
    Top = 8
    Width = 96
    Height = 29
    Anchors = [akTop, akRight]
    Caption = 'Load'
    TabOrder = 0
    OnClick = btnLoadClick
    ExplicitLeft = 1
  end
  object cmbOstan: TComboBox
    Left = 625
    Top = 11
    Width = 265
    Height = 23
    Style = csDropDownList
    Anchors = [akTop, akRight]
    DropDownCount = 20
    TabOrder = 1
    OnChange = cmbOstanChange
    ExplicitLeft = 538
  end
  object lbShahrestan: TListBox
    Left = 625
    Top = 40
    Width = 265
    Height = 449
    Anchors = [akTop, akRight, akBottom]
    ItemHeight = 15
    TabOrder = 2
    ExplicitLeft = 538
    ExplicitHeight = 326
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 43
    Width = 611
    Height = 120
    Anchors = [akLeft, akTop, akRight]
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 169
    Width = 611
    Height = 320
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource2
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = frmDataModule.tblOstan
    Left = 72
    Top = 48
  end
  object DataSource2: TDataSource
    DataSet = frmDataModule.tblShahrestan
    Left = 200
    Top = 48
  end
end
