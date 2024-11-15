unit untMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    btnStart: TButton;
    mmoLog: TMemo;
    procedure btnStartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  Horse,
  Horse.Core,
  Horse.Jhonson,
  Horse.Compression,
  Controller.Ostan,
  Controller.Shahrestan;

{$R *.dfm}

procedure TfrmMain.btnStartClick(Sender: TObject);
begin
  THorse.Listen(8080,procedure
  begin
    mmoLog.Lines.Add('Start at port : '+THorse.Port.ToString);
  end);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  THorse.use(Compression());
  THorse.Use(Jhonson);

  THorse.Get('Ping',procedure (Req : THorseRequest;Res : THorseResponse)
  begin
    Res.Send('Pong').Status(THTTPStatus.OK);
  end);

  Controller.Ostan.RegisterRoute;
  Controller.Shahrestan.RegisterRoute;
end;

end.
