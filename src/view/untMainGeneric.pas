unit untMainGeneric;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox;

type

// <T>  significa Type( CRTL + SHIFT + C para gerar os código de baixo )   // Você especifica o nome     1 - 2
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

  TMyGeneric = array [0..9] of string;

  TMyGenericArray<T> = class
    TArray : array [0..9] of T;
  end;

  TMyGenericA = TMyGenericArray<string>;



  // aula 3

  TDays = (Monday, Tuesday , Wednesday, Thursday, Friday, Saturday, Sunday);
  TMonth = (January, February, March, April, May, June, July, August, September, October, November, December);

  TEnumUtils<T> = class
    class procedure EnumToList(Value: TStrings);      // pode acessar diretamente sem precisar construir a classe

  end;



  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  System.TypInfo;

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
  aux1: TMyGeneric;
  aux2: TMyGeneric;
  aux3: array [0..9] of string;
  aux4: array [0..9] of string;
begin

  // 1# Você que define o tipo da variável
  {KV := TKeyValue<TButton>.Create;
  try
    KV.Key   := 'F1';
    KV.Value := Sender as TButton;

    ShowMessage(KV.Key + ' ' + KV.Value.Name);
  finally
    KV.Free;
  end;
  KV := TKeyValue<Integer>.Create;
  try
    KV.Key   := 'F1';
    KV.Value := 100;

    ShowMessage(KV.Key + ' ' + KV.Value.ToString);
  finally
    KV.Free;
  end;        }


  // 2#
  aux1 := aux2;
  //aux1 := aux3; // tipos diferentes, mesmo parecendo igual



end;


// aula 2
procedure TForm1.Button2Click(Sender: TObject);
var
  aux1: TMyGenericArray<string>;
  aux2: TMyGenericArray<string>;
  aux3: TMyGenericA;
  aux4: TMyGenericA;
begin
  aux1 := aux3;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  TEnumUtils<TDays>.EnumToList(ComboBox1.Items);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  TEnumUtils<TMonth>.EnumToList(ComboBox1.Items);
end;

{ TEnumUtils<T> }

class procedure TEnumUtils<T>.EnumToList(Value: TStrings);
var
  Aux: string;
  I, Pos: Integer;
begin
  Value.Clear;
  I := 0;

  repeat
    Aux := GetEnumName(TypeInfo(T), I);
    Pos := GetEnumValue(TypeInfo(T), Aux);  // retorna -1 quando não tiver registro
    if Pos <> -1 then Value.add(Aux);
    Inc(I);   // I := I + 1;
  until Pos < 0;

end;

end.
