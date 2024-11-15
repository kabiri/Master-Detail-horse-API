object frmDataModule: TfrmDataModule
  Height = 196
  Width = 311
  object tblOstan: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 40
    Top = 24
    object tblOstanid: TLargeintField
      FieldName = 'id'
    end
    object tblOstanName: TWideStringField
      FieldName = 'Name'
      Size = 255
    end
  end
  object tblShahrestan: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 160
    Top = 24
    object tblShahrestanId: TLargeintField
      FieldName = 'Id'
    end
    object tblShahrestanName: TWideStringField
      FieldName = 'Name'
      Size = 255
    end
  end
end
