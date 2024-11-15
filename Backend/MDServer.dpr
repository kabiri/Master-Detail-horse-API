program MDServer;

uses
  Vcl.Forms,
  untMain in 'untMain.pas' {frmMain},
  Controller.Common in 'Controller\Controller.Common.pas',
  DAC.Connection in 'DAC\DAC.Connection.pas',
  DAC.Shahrestan in 'DAC\DAC.Shahrestan.pas',
  DAC.Ostan in 'DAC\DAC.Ostan.pas',
  Controller.Ostan in 'Controller\Controller.Ostan.pas',
  Controller.Shahrestan in 'Controller\Controller.Shahrestan.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
