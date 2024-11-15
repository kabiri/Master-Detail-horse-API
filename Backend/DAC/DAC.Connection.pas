unit DAC.Connection;

interface

uses System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.ConsoleUI.Wait,
  Data.DB, FireDAC.Comp.Client,

  // -- SQLServer --
  FireDAC.Phys.MSSQLWrapper,
  FireDAC.Phys.MSSQLDef,
  FireDAC.Phys.MSSQL,

  {
  // -- SQLITE --
  FireDAC.Phys.SQLiteWrapper.Stat,
  FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.SQLite,
  }

  {
  // -- FIREBIRD --
  FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FB,
  }

  System.IniFiles;

type
    TDataSetOperation = (List,Add,Edit,Delete,AdvancedEdit);
    TConnection = class
    private

    public
      class procedure LoadConfig(Connection: TFDConnection);
      class function CreateConnection: TFDConnection;
    end;

implementation

var
 ConnectionString : string;

{ TConnection }

class procedure TConnection.LoadConfig(Connection: TFDConnection);
var
  qry: TFDQuery;
begin
  try
    if ConnectionString<>'' then
    begin
     Connection.ConnectionString:=ConnectionString;
     Exit;
    end;

    {$ifdef DEBUG}
    var DBServer:='.';
    var DBUserName:='sa';
    var DBPassword:='4235';
    {$else}
    var Server:='.';
    var UserName:='sa';
    var Password:='';
    {$endif}

    Connection.DriverName := 'MSSQL';
    with Connection.Params do
    begin
        Clear;
        Add('DriverID=' + 'MSSQL');
        Add('Database=Iran');
        Add('User_Name=' + DBUserName);
        Add('Password=' + DBPassword);
        Add('Server=' + DBServer);
    end;
    ConnectionString:=Connection.ConnectionString;
  finally
  end;
end;

class function TConnection.CreateConnection: TFDConnection;
var
    Conn: TFDConnection;
begin
    Conn := TFDConnection.Create(nil);
    LoadConfig(Conn);
    Result := Conn;
end;

initialization
  ConnectionString:='';

end.
