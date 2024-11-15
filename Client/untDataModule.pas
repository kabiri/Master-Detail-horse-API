unit untDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmDataModule = class(TDataModule)
    tblOstan: TFDMemTable;
    tblShahrestan: TFDMemTable;
    tblOstanid: TLargeintField;
    tblOstanName: TWideStringField;
    tblShahrestanId: TLargeintField;
    tblShahrestanName: TWideStringField;
  private
    { Private declarations }
  public
    procedure OstanList(id: Int64=0);
    function OstanCount(id : Int64) : Int64;
    procedure ShahrestanList(id: Int64=0;OstanId: Int64=0);
    function ShahrestanCount(id : Int64) : Int64;
    { Public declarations }
  end;

var
  frmDataModule: TfrmDataModule;

implementation

uses
  System.JSON,
  DataSet.Serialize,
  DataSet.Serialize.Adapter.RESTRequest4D,
  RESTRequest4D;

const
  BaseURL = 'http://127.0.0.1:8080';

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TfrmDataModule }

function TfrmDataModule.OstanCount(id: Int64): Int64;
var
  res: IResponse;
begin
  if tblOstan.Active then
    tblOstan.EmptyDataSet;
  try
    res := TRequest.New.BaseURL(BaseURL)
      .Resource('Ostan/Count')
      .ResourceSuffix(Id.ToString)
      .Accept('Application/json')
      .AcceptEncoding('gzip')
      .AcceptCharset('utf-8')
      .Adapters(TDataSetSerializeAdapter.New(tblOstan))
      .Get;

    if res.StatusCode = 204 then
    begin
      raise Exception.Create('Is empty');
      exit;
    end;
    if res.StatusCode <> 200 then
      raise Exception.Create(res.Content);

    var JSON: TJSONObject;
    JSON := TJSONObject.ParseJSONValue(res.Content) as TJSONObject;
    Result:=JSON.GetValue<Integer>('RecCount'.ToLower);
    JSON.Free;
  finally
  end;
end;

procedure TfrmDataModule.OstanList(id: Int64);
var
  res: IResponse;
begin
  if tblOstan.Active then
    tblOstan.EmptyDataSet;
  try
    res := TRequest.New.BaseURL(BaseURL)
      .Resource('Ostan')
      .ResourceSuffix(Id.ToString)
      .Accept('Application/json')
      .AcceptEncoding('gzip')
      .AcceptCharset('utf-8')
      .Adapters(TDataSetSerializeAdapter.New(tblOstan))
      .Get;

    if res.StatusCode = 204 then
    begin
      raise Exception.Create('Is empty');
      exit;
    end;
    if res.StatusCode <> 200 then
      raise Exception.Create(res.Content);
  finally
  end;
end;

function TfrmDataModule.ShahrestanCount(id: Int64): Int64;
var
  res: IResponse;
begin
  if tblShahrestan.Active then
    tblShahrestan.EmptyDataSet;
  try
    res := TRequest.New.BaseURL(BaseURL)
      .Resource('Shahrestan/Count')
      .ResourceSuffix(Id.ToString)
      .Accept('Application/json')
      .AcceptEncoding('gzip')
      .AcceptCharset('utf-8')
      .Adapters(TDataSetSerializeAdapter.New(tblShahrestan))
      .Get;

    if res.StatusCode = 204 then
    begin
      raise Exception.Create('Is empty');
      exit;
    end;
    if res.StatusCode <> 200 then
      raise Exception.Create(res.Content);

    var JSON: TJSONObject;
    JSON := TJSONObject.ParseJSONValue(res.Content) as TJSONObject;
    Result:=JSON.GetValue<Integer>('RecCount'.ToLower);
    JSON.Free;
  finally
  end;
end;

procedure TfrmDataModule.ShahrestanList(id: Int64;OstanId: Int64);
var
  res: IResponse;
begin
  if tblShahrestan.Active then
    tblShahrestan.EmptyDataSet;
  try
    res := TRequest.New.BaseURL(BaseURL)
      .Resource('Shahrestan')
      .ResourceSuffix(Id.ToString)
      .Accept('Application/json')
      .AcceptEncoding('gzip')
      .AcceptCharset('utf-8')
      .AddHeader('OstanId',OstanId.ToString)
      .Adapters(TDataSetSerializeAdapter.New(tblShahrestan))
      .Get;

    if res.StatusCode = 204 then
    begin
      raise Exception.Create('Is empty');
      exit;
    end;
    if res.StatusCode <> 200 then
      raise Exception.Create(res.Content);
  finally
  end;
end;

end.
