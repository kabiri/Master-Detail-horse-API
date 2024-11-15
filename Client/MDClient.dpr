program MDClient;

uses
  Vcl.Forms,
  untMain in 'untMain.pas' {Form1},
  untDataModule in 'untDataModule.pas' {frmDataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmDataModule, frmDataModule);
  Application.Run;
end.
