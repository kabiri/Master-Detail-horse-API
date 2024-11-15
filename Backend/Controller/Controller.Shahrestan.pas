unit Controller.Shahrestan;

interface


uses
  Horse,
  System.JSON,
  System.SysUtils,
  Controller.Common;

Const
  Route = 'Shahrestan';

procedure RegisterRoute;
procedure getList(aReq : THorseRequest; aRes : THorseResponse; aNext : TNextProc);
procedure getCount(aReq : THorseRequest; aRes : THorseResponse; aNext : TNextProc);
procedure Add(aReq : THorseRequest; aRes : THorseResponse; aNext : TNextProc);
procedure Edit(aReq : THorseRequest; aRes : THorseResponse; aNext : TNextProc);
procedure Delete(aReq : THorseRequest; aRes : THorseResponse; aNext : TNextProc);

implementation

uses
  DAC.Shahrestan;

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
  lShahrestan : TShahrestan;
  JSON: TJSONArray;
  lStartId: Integer;
  lCount: Integer;
begin
  lShahrestan:=TShahrestan.Create;
  try
    try
      lShahrestan.Id:=aReq.Params['Id'].ToInt64;
    except
      lShahrestan.Id:=0;
    end;

    try
      Search:=aReq.Query.Items['Search'];
    except
      Search:='';
    end;

    try
      lShahrestan.OstanId:=aReq.Headers['OstanId'].ToInteger;
    except
      lShahrestan.OstanId:=0;
    end;

    try
      JSON:=lShahrestan.GetList(Search);
      if JSON.Count=0 then
      begin
        aRes.Send(CreateJsonObj('ErrorCode',10)).Status(THTTPStatus.NoContent);
      end
      else
      begin
        aRes.Send(JSON).Status(THTTPStatus.OK);
      end;
    except on E : Exception do
      aRes.Send(CreateJsonObj('Code',lShahrestan.Error)
               .AddPair('Message',E.Message))
          .Status(THTTPStatus.InternalServerError);
    end;
  finally
    lShahrestan.Free;
  end;
end;

procedure getCount(aReq : THorseRequest; aRes : THorseResponse; aNext : TNextProc);
var
  Search : string;
  lShahrestan : TShahrestan;
  JSON: TJSONObject;
begin
  lShahrestan:=TShahrestan.Create;
  try
    try
      lShahrestan.Id:=aReq.Headers['Id'].ToInt64;
    except
      lShahrestan.Id:=0;
    end;

    try
      Search:=aReq.Query.Items['Search'];
    except
      Search:='';
    end;

    try
      lShahrestan.OstanId:=aReq.Headers['OstanId'].ToInteger;
    except
      lShahrestan.OstanId:=0;
    end;

    JSON:=lShahrestan.GetCount(Search);
    if JSON.Count=0 then
    begin
      aRes.Send(CreateJsonObj('ErrorCode',10)).Status(THTTPStatus.NoContent);
    end
    else
    begin
      aRes.Send(JSON).Status(THTTPStatus.OK);
    end;
  finally
    lShahrestan.Free;
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
