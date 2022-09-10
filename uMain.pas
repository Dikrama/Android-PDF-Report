unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  System.Net.URLClient, System.Net.HttpClient, System.Net.HttpClientComponent,
  FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls, System.IOUtils;

type
  TForm8 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    FHttp: TNetHTTPClient;
    procedure Button1Click(Sender: TObject);
    procedure FHttpRequestCompleted(const Sender: TObject;
      const AResponse: IHTTPResponse);
  private
    { Private declarations }
  public
    { Public declarations }
    strm : TBytesStream;
  end;

var
  Form8: TForm8;

implementation

{$R *.fmx}

procedure TForm8.Button1Click(Sender: TObject);
begin
strm := TBytesStream.Create;
fhttp.Get('https://8e24-114-141-51-52.ap.ngrok.io/',strm)
end;

procedure TForm8.FHttpRequestCompleted(const Sender: TObject;
  const AResponse: IHTTPResponse);
begin
  try
    strm.SaveToFile(TPath.Combine(TPath.GetSharedDownloadsPath,'report.pdf'));
    memo1.Lines.Add('file downloaded on : '+
    TPath.Combine(TPath.GetSharedDownloadsPath,'report.pdf'));

  finally
    strm.Free;
  end;
end;

end.
