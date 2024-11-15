unit Controller.Common;

interface

uses System.JSON, System.SysUtils;

function CreateJsonObj(pairName: string; value: string): TJSONObject; overload;
function CreateJsonObj(pairName: string; value: integer): TJSONObject; overload;
function CreateJsonObj(pairName: string; value: Int64): TJSONObject; overload;
function CreateJsonObj(pairName: string; value: double): TJSONObject; overload;
function CreateJsonObj(pairName: string; value: Boolean): TJSONObject; overload;
function CreateJsonObjStr(pairName: string; value: string): string; overload;
function CreateJsonObjStr(pairName: string; value: integer): string; overload;
function CreateJsonObjStr(pairName: string; value: double): string; overload;
function ParseBody(body: string): TJsonValue;

implementation

function CreateJsonObj(pairName: string; value: string): TJSONObject;
begin
  Result := TJSONObject.Create(TJSONPair.Create(pairName, value));
end;

function CreateJsonObj(pairName: string; value: integer): TJSONObject;
begin
  Result := TJSONObject.Create(TJSONPair.Create(pairName, TJSONNumber.Create(value)));
end;

function CreateJsonObj(pairName: string; value: Int64): TJSONObject;
begin
  Result := TJSONObject.Create(TJSONPair.Create(pairName, TJSONNumber.Create(value)));
end;

function CreateJsonObj(pairName: string; value: double): TJSONObject;
begin
  Result := TJSONObject.Create(TJSONPair.Create(pairName, TJSONNumber.Create(value)));
end;

function CreateJsonObj(pairName: string; value: Boolean): TJSONObject;
begin
  Result := TJSONObject.Create(TJSONPair.Create(pairName, TJSONBool.Create(value)));
end;

function CreateJsonObjStr(pairName: string; value: string): string;
var
    json: TJSONObject;
begin
    try
        json := TJSONObject.Create;
        json.AddPair(pairname, value);
        Result := json.ToJSON;
    finally
        json.free;
    end;
end;

function CreateJsonObjStr(pairName: string; value: integer): string;
var
    json: TJSONObject;
begin
    try
        json := TJSONObject.Create;
        json.AddPair(pairname, TJSONNumber.Create(value));
        Result := json.ToJSON;
    finally
        json.free;
    end;
end;

function CreateJsonObjStr(pairName: string; value: double): string;
var
    json: TJSONObject;
begin
    try
        json := TJSONObject.Create;
        json.AddPair(pairname, TJSONNumber.Create(value));
        Result := json.ToJSON;
    finally
        json.free;
    end;
end;

function ParseBody(body: string): TJsonValue;
begin
  Result := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(body), 0) as TJsonValue;
end;

end.
