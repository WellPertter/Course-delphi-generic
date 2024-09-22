unit untMainGeneric;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListBox, FMX.Edit, System.Generics.Collections,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, FMX.TabControl;

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

  // aula 5
  TPerson = class
  private
    Fname: string;
    procedure Setname(const Value: string);
  published
    property name: string read Fname write Setname;
  end;

  TNFe<T : constructor> = class    // diz que o T vai ter um construtor padr�o
    FGeneric : T;
    constructor Create;
    function GetGeneric : T;
  end;

  TTest <T : IInterface> = class // aceita qualquer interface, mas s� interface.    <T : TComponent>

  end;


  // Aula 06 Tlist
  // TList<type>  - � gen�rioc e j� est� dispon�vel




  TForm1 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ComboBox1: TComboBox;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    edtAula6: TEdit;
    Memo1: TMemo;
    Button13: TButton;
    Button14: TButton;
    edtaula7: TEdit;
    memoaula7: TMemo;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    TabItem3: TTabItem;
    Button21: TButton;
    Button22: TButton;
    memoAula8: TMemo;
    Button23: TButton;
    Button24: TButton;
    edtStack: TEdit;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
  private
    { Private declarations }


    ListNum : TList<Integer>;

    // aula 7
    Fila: TQueue<String>;

    // aula 8
    pilha: TStack<string>;


    procedure Notification (Sender : TObject; const Item: Integer; Action :TCollectionNotification);


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

procedure TForm1.Button10Click(Sender: TObject);
begin
  ListNum.Delete(Pred(ListNum.Count));
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(ListNum.Capacity.ToString);
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(ListNum.Count.ToString);
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  ListNum.OnNotify := Notification;
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  Fila.Enqueue(edtaula7.Text);
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  Fila.Dequeue;
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  fila.Extract;
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  memoaula7.Lines.Add(fila.Peek);
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  fila.TrimExcess;
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  memoaula7.Lines.Add(Fila.Count.ToString);
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
procedure TForm1.Button20Click(Sender: TObject);
begin
  memoaula7.Lines.Add(Fila.Capacity.ToString);
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  pilha.Push(edtStack.Text);
end;

procedure TForm1.Button22Click(Sender: TObject);
begin
  pilha.Pop;
end;

procedure TForm1.Button23Click(Sender: TObject);
begin
  memoAula8.Lines.Add(pilha.Peek);
end;

procedure TForm1.Button24Click(Sender: TObject);
begin
  pilha.Extract;
end;

procedure TForm1.Button25Click(Sender: TObject);
begin
  pilha.TrimExcess;
end;

procedure TForm1.Button26Click(Sender: TObject);
begin
  memoAula8.Lines.Add(pilha.Count.ToString);
end;

procedure TForm1.Button27Click(Sender: TObject);
begin
  memoAula8.Lines.Add(pilha.Capacity.ToString);
end;

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

procedure TForm1.Button7Click(Sender: TObject);
var
  NFe2: TNFe<String>;
  NFe: TNFe<TPerson>;
begin
  NFe := TNFe<TPerson>.Create;
  try
    NFe.FGeneric.name := 'Arthur';
    ShowMessage(NFe.FGeneric.name);
  finally
    NFe.Free;
  end;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
 ListNum.Add(StrToInt(edtAula6.Text));
 edtAula6.Text := '';
end;

procedure TForm1.Button9Click(Sender: TObject);
var
  I: Integer;
begin
  Memo1.Lines.Clear;
  for I := 0 to Pred(ListNum.Count) do
    Memo1.Lines.Add(ListNum[I].ToString);

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // aula 6
  ListNum := TList<Integer>.Create;

  // aula 7
  Fila    := TQueue<String>.Create;

  // Aula 8
  pilha   := TStack<string>.Create;
end;

procedure TForm1.Notification(Sender: TObject; const Item: Integer;
  Action: TCollectionNotification);
begin
 case Action of
  cnAdded : Memo1.Lines.Add('O Item ' + Item.ToString + ' foi adicionado');
  cnRemoved : Memo1.Lines.Add('O Item ' + Item.ToString + ' foi removido');
  cnExtracted : Memo1.Lines.Add('O Item ' + Item.ToString + ' foi extraido');
 end;
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

{ TPerson }

procedure TPerson.Setname(const Value: string);
begin
  Fname := Value;
end;

{ TNFe<T> }

constructor TNFe<T>.Create;
begin
  FGeneric := T.Create;
end;

function TNFe<T>.GetGeneric: T;
begin
  Result := FGeneric;
end;

end.
