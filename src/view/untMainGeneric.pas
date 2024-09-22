unit untMainGeneric;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox, FMX.Edit;

type

// <T>  significa Type( CRTL + SHIFT + C para gerar os c�digo de baixo )   // Voc� especifica o nome     1 - 2
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


  // aula 4
  TProduct = class
  private
    FDescription: String;
    procedure SetDescription(const Value: String);
  published
    constructor Create;
    property Description : String read FDescription write SetDescription;
  end;

  TUtils = class
    class function IIF<T>(Condition : Boolean; T1, T2 :T): T;
  end;



  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
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

  // 1# Voc� que define o tipo da vari�vel
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

procedure TForm1.Button5Click(Sender: TObject);
var
  aux: String;
begin
 aux := TUtils.IIF<string>(Edit1.Text <> '', Edit1.Text, 'Orange');
 ShowMessage(aux);
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  prod1, prod2, prod3 : TProduct;
begin
  prod1 := TProduct.Create;
  prod2 := TProduct.Create;
  prod2.SetDescription('New Product');

  ShowMessage(prod1.FDescription + ' ' + prod2.FDescription);

  prod3 := TUtils.IIF<TProduct>(Assigned(prod1), prod1, TProduct.Create);
  ShowMessage(prod3.Description);
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
    Pos := GetEnumValue(TypeInfo(T), Aux);  // retorna -1 quando n�o tiver registro
    if Pos <> -1 then Value.add(Aux);
    Inc(I);   // I := I + 1;
  until Pos < 0;

end;

{ TUtils }   // aula 4

class function TUtils.IIF<T>(Condition: Boolean; T1, T2: T): T;
begin
 if Condition then
  Result := T1
 else
  Result := T2;
end;

{ TProduct }

constructor TProduct.Create;
begin
  Description := 'Product generic';
end;

procedure TProduct.SetDescription(const Value: String);
begin
  FDescription := Value;
end;

end.
