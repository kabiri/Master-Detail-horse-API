unit DAC.Ostan;

interface

uses
  FireDAC.Comp.Client, FireDAC.DApt,
  Data.DB, System.JSON, System.SysUtils,
  DataSet.Serialize, DAC.Connection;

type
  TOstan = class
  private
    FConnection : TFDConnection;
    FID: Integer;
    FName: string;
  public
    Error : Int16;

    constructor Create;
    destructor Destroy;

    procedure Add;
    procedure Edit;
    procedure Delete;
    function GetList(Search : string) : TJSONArray;
    function GetCount(Search : string) : TJSONObject;

    property ID: Integer read FID write FID;
    property Name: string read FName write FName;
  end;

implementation

{ TOstan }

procedure TOstan.Add;
begin

end;

constructor TOstan.Create;
begin
  FConnection:=TConnection.CreateConnection;
end;

procedure TOstan.Delete;
begin

end;

destructor TOstan.Destroy;
begin
  if Assigned(FConnection) then
    FreeAndNil(FConnection);
end;

procedure TOstan.Edit;
begin

end;

function TOstan.GetCount(Search: string): TJSONObject;
var
  qryCount : TFDQuery;
begin
  qryCount:=TFDQuery.Create(nil);
  try
    try
      qryCount.Connection:=FConnection;
      qryCount.SQL.Add('Select count(Id) as RecCount from ostan');
      qryCount.SQL.Add('where Id>0');

      if not Search.IsEmpty then
      begin
        qryCount.SQL.Add('and Name like N'+QuotedStr('%'+Search+'%'));
        qryCount.SQL.Add('and Name like '+QuotedStr('%'+Search+'%'));
      end;
      qryCount.Open;
      Result:=qryCount.ToJSONObject();
    except on E: Exception do
      raise Exception.Create(E.Message);
    end;
  finally
    qryCount.Free;
  end;
end;

function TOstan.GetList(Search: string): TJSONArray;
var
  qryList : TFDQuery;
begin
  qryList:=TFDQuery.Create(nil);
  try
    try
      qryList.Connection:=FConnection;
      qryList.SQL.Add('Select * from ostan');
      qryList.SQL.Add('where Id>0');

      if Id>0 then
      begin
        qryList.SQL.Add('and id=:Id');
        qryList.ParamByName('Id').Value:=Id;
      end;

      if not Search.IsEmpty then
      begin
        qryList.SQL.Add('and Name like N'+QuotedStr('%'+Search+'%'));
        qryList.SQL.Add('and Name like '+QuotedStr('%'+Search+'%'));
      end;
      qryList.Open();
      Result:=qryList.ToJSONArray();
    except on E: Exception do
      raise Exception.Create(E.Message);
    end;
  finally
    qryList.Free;
  end;
end;

end.
