unit Controller.Ostan;

interface

uses
  Horse,
  System.JSON,
  System.SysUtils,
  Controller.Common;

Const
  Route = 'Ostan';

procedure RegisterRoute;
procedure getList(aReq : THorseRequest; aRes : THorseResponse; aNext : TNextProc);
procedure getCount(aReq : THorseRequest; aRes : THorseResponse; aNext : TNextProc);
procedure Add(aReq : THorseRequest; aRes : THorseResponse; aNext : TNextProc);
procedure Edit(aReq : THorseRequest; aRes : THorseResponse; aNext : TNextProc);
procedure Delete(aReq : THorseRequest; aRes : THorseResponse; aNext : TNextProc);

implementation

uses
  DAC.Ostan;

procedure RegisterRoute;
begin
  THorse.Get('/'+Route+'/:Id',getList);
  THorse.Get('/'+Route+'/Count',getCount);
  THorse.Post('/'+Route,Add);
  THorse.Put('/'+Route+'/:Id',Edit);
  THorse.Delete('/'+Route+'/:Id',Delete);
end;

procedure getList(aReq : THorseRequest; aRes : THorseResponse; aNext : TNextProc);
var
  Search : string;
  lOstan : TOstan;
  JSON: TJSONArray;
  lStartId: Integer;
  lCount: Integer;
begin
  lOstan:=TOstan.Create;
  try
    try
      lOstan.Id:=aReq.Params['Id'].ToInt64;
    except
      lOstan.Id:=0;
    end;

    try
      Search:=aReq.Query.Items['Search'];
    except
      Search:='';
    end;

    try
      JSON:=lOstan.GetList(Search);
      if JSON.Count=0 then
      begin
        aRes.Send(CreateJsonObj('ErrorCode',10)).Status(THTTPStatus.NoContent);
      end
      else
      begin
        aRes.Send(JSON).Status(THTTPStatus.OK);
      end;
    except on E : Exception do
      aRes.Send(CreateJsonObj('Code',lOstan.Error)
               .AddPair('Message',E.Message))
          .Status(THTTPStatus.InternalServerError);
    end;
  finally
    lOstan.Free;
  end;
end;

procedure getCount(aReq : THorseRequest; aRes : THorseResponse; aNext : TNextProc);
var
  Search : string;
  lOstan : TOstan;
  JSON: TJSONObject;
begin
  lOstan:=TOstan.Create;
  try
    try
      lOstan.Id:=aReq.Headers['Id'].ToInt64;
    except
      lOstan.Id:=0;
    end;

    try
      Search:=aReq.Query.Items['Search'];
    except
      Search:='';
    end;

    JSON:=lOstan.GetCount(Search);
    if JSON.Count=0 then
    begin
      aRes.Send(CreateJsonObj('ErrorCode',10)).Status(THTTPStatus.NoContent);
    end
    else
    begin
      aRes.Send(JSON).Status(THTTPStatus.OK);
    end;
  finally
    lOstan.Free;
  end;
end;

procedure Add(aReq : THorseRequest; aRes : THorseResponse; aNext : TNextProc);
begin
end;

procedure Edit(aReq : THorseRequest; aRes : THorseResponse; aNext : TNextProc);
begin
end;

procedure Delete(aReq : THorseRequest; aRes : THorseResponse; aNext : TNextProc);
begin
end;

end.
