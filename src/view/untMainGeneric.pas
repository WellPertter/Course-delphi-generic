unit untMainGeneric;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type

// <T>  significa Type( CRTL + SHIFT + C para gerar os c�digo de baixo )   // Voc� especifica o nome
  TKeyValue<T> = class
  private
    FKey: String;
    FValue: T;
    procedure SetKey(const Value: String);
    procedure SetValue(const Value: T);
  published
    property Key: String read FKey write SetKey;
    property Value: T read FValue write SetValue;
  end;



  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

{ TKeyValue<T> }

procedure TKeyValue<T>.SetKey(const Value: String);
begin
  FKey := Value;
end;

procedure TKeyValue<T>.SetValue(const Value: T);
begin
  FValue := Value;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  KV : TKeyValue<Integer>;
begin

  // Voc� que define o tipo da vari�vel
  {KV := TKeyValue<TButton>.Create;
  try
    KV.Key   := 'F1';
    KV.Value := Sender as TButton;

    ShowMessage(KV.Key + ' ' + KV.Value.Name);
  finally
    KV.Free;
  end;   }
  KV := TKeyValue<Integer>.Create;
  try
    KV.Key   := 'F1';
    KV.Value := 100;

    ShowMessage(KV.Key + ' ' + KV.Value.ToString);
  finally
    KV.Free;
  end;
end;

end.
