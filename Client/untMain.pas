unit untMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmMain = class(TForm)
    btnLoad: TButton;
    cmbOstan: TComboBox;
    lbShahrestan: TListBox;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure cmbOstanChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    procedure GetOstanDone(Sender: TObject);
    procedure GetShahrestanDone(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses untDataModule;

procedure TfrmMain.btnLoadClick(Sender: TObject);
var
  aThread : TThread;
begin
  aThread:=TThread.CreateAnonymousThread(procedure
  begin
    frmDataModule.OstanList();
  end);
  aThread.OnTerminate:=GetOstanDone;
  aThread.Start;
end;

procedure TfrmMain.cmbOstanChange(Sender: TObject);
var
  aThread : TThread;
  lId : Int64;

begin
  lbShahrestan.Clear;
  lId:=Int64(cmbOstan.Items.Objects[cmbOstan.ItemIndex]);
  aThread:=TThread.CreateAnonymousThread(procedure
  begin
   frmDataModule.ShahrestanList(0,lId);
  end);
  aThread.OnTerminate:=GetShahrestanDone;
  aThread.Start;
end;

procedure TfrmMain.DBGrid1CellClick(Column: TColumn);
var
  aThread : TThread;
  lId : Int64;

begin
  lbShahrestan.Clear;
  lId:=DataSource1.DataSet.FieldByName('Id').AsLargeInt;
  aThread:=TThread.CreateAnonymousThread(procedure
  begin
   frmDataModule.ShahrestanList(0,lId);
  end);
  aThread.OnTerminate:=GetShahrestanDone;
  aThread.Start;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  cmbOstan.Items.Clear;
end;

procedure TfrmMain.GetOstanDone(Sender: TObject);
begin
  if Sender is TThread then
  begin
    if Assigned(TThread(Sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(Sender).FatalException).Message);
      exit;
    end;
  end;

  cmbOstan.Clear;
  while not frmDataModule.tblOstan.Eof do
  begin
    cmbOstan.Items.AddObject(frmDataModule.tblOstanName.AsWideString,
                           TObject(frmDataModule.tblOstanid.AsLargeInt));
    frmDataModule.tblOstan.Next;
  end;
  if cmbOstan.Items.Count>0 then
  begin
    cmbOstan.ItemIndex:=0;
    cmbOstan.OnChange(nil);
  end;
end;

procedure TfrmMain.GetShahrestanDone(Sender: TObject);
begin
  if Sender is TThread then
  begin
    if Assigned(TThread(Sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(Sender).FatalException).Message);
      exit;
    end;
  end;

  lbShahrestan.Clear;
  while not frmDataModule.tblShahrestan.Eof do
  begin
    lbShahrestan.Items.AddObject(frmDataModule.tblShahrestanName.AsWideString,
                           TObject(frmDataModule.tblShahrestanid.AsString));
    frmDataModule.tblShahrestan.Next;
  end;
end;

end.
