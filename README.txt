Atalhos
CRTL + SHIFT + C ( declarar a classe )

CRTL + SHIFT + V ( declarar a variável )

CRTL + SHIFT + A ( implementar as dependências )


Comandos
Assigned(prod1)   -- Verificar se o objeto está criado 
Inc(I);           -- ++1
pred(list.count)  -- retornar o ultimo número

ReportMemoryLeaksOnShutdown := true;  // reportar vazamento de memoria






Delphi: 1995

1#
Delphi é orientado a objetos( tudo é uma classe )


2#
O delphi trabalha com o NOME DOS TIPOS, pode ser igual, mas se o nome for diferente, é diferente.
- Existe exceções{
 Se a class instanciar outra classe( essa você vai instanciar diretamente) então não terá erro, as duas são 
iguais
}

As variáveis são validadas pelo tipo e não pelo nome da classe


Tempo de compilação
Antes de gerar o executável( momento que o sistema faz o teste de sintaxe )

Tempo de execução

--------------------------
3#
Monday, Tuesday , Wednesday, Thursday, Friday, Saturday, Sunday 

January, February, March, April, May, June, July, August, September, October, November, December

Aula perfect para melhorar os sistemas, verificar ela para otimizar.


-------------------------
4# Métodos genéricos


--------
5#
Você pode dizer que é o tipo Tperson, mas só isso não basta para acessar, pois o Tperson precisa ser instanciado

usa-se construct para genéricos 
  TNFe<T : constructor> = class   // diz que o T vai ter um construtor padrão <T : class, constructor> ( poderia ser feito assim, mas não ia aceitar tipos primitivos )
    FGeneric : T;
    constructor Create;
    function GetGeneric : T;
  end;

tipo primitivos x classes 

Obs: é genérico, mas nem tanto assim
-------
6# TList

Obs: A lista vai aumentar sua capacidade de forma binária, 0, 1, 2, 4, 8, 16, 32, 64
Capacity - para verificar

Obs2: A capacity não volta, cuidado se aumentar muito a lista.

Lista tem um evento
OnNotify
- Porém tem que criar uma procedure com as exigências do evento;


  ListNum.OnNotify := Notification;

procedure TForm1.Notification(Sender: TObject; const Item: Integer;
  Action: TCollectionNotification);
begin
 case Action of
  cnAdded : Memo1.Lines.Add('O Item ' + Item.ToString + ' foi adicionado');
  cnRemoved : Memo1.Lines.Add('O Item ' + Item.ToString + ' foi removido');
  cnExtracted : Memo1.Lines.Add('O Item ' + Item.ToString + ' foi extraido');
 end;
end;

O evento foi criado ai

--------
7# TQueue   ( fila )  Não pode percorrer.


enqueue ( enfilerar )

Fila.Dequeue;  -- remover o próximo da lista
fila.Extract;   -- Remove o próximo, porém ele ainda fica na memoria
fila.TrimExcess;  --- Limpa o excesso de memória reservada.
peek ( espiar )   fila.Peek
count ( contar )
capacity ( capacidade )
-------
8# TStack  (pilha)   Não pode percorrer.  
O ultimo que era é o primeiro a sair, o contratrário da fila




Push Remove e retorna o topo.
Pop Remove e retorna o topo.
Extract
peek ( espiar ) 
TrimExcept ( reorganiza a capacidade ) 
count ( contar )
capacity ( capacidade )

--------
09# TDictionary  (Vou usar muito)
List : TDictionary<Key, Value>

Lista : TDictionary<String, TPerson2>

TPerson2 = record
 Nome : string;
 Cpf: string
end;

estrutura básica de um sensor 

procedure KeyNotify (Sender : TObject; const Item: String; Action :TCollectionNotification);

procedure TForm1.KeyNotify(Sender: TObject; const Item: String;
  Action: TCollectionNotification);
begin
 case Action of
  cnAdded : memoAula9.Lines.Add('O Item ' + Item + ' foi adicionado');
  cnRemoved : memoAula9.Lines.Add('O Item ' + Item + ' foi removido');
  cnExtracted : memoAula9.Lines.Add('O Item ' + Item + ' foi extraido');
 end;
end;
-------
10# Interfaces Genericas
"Não programe para uma classe, programe orientado a interface"

<> = genérico
I = interface      
T = class


IQualquer<T> = interface
 ['dsdsds']   // assinatura padrão do sistema 
 function retorn : T;   // só pode vê o que é mais superficial
end;

TQualquer<T> = class(TInterfacedObject, IQualquer<T>)
  function retorn : T;
end;

var
  aux: iQualquer<string>;
begin
  aux := TQualquer<string>.create;       // essa classe que implementa essa interface
end;


-----
#11 - Ponteiros Inteligentes

ReportMemoryLeaksOnShutdown := true;  // reportar vazamento de memoria


  TSmartPoint<T: class> = record
   strict private
      Fvalue: T;
      function GetValue : T;
   public
      constructor Create(aValue: T);
      property Value: T read GetValue;
  end;

  TFreeThevalue = class (TinterfacedObject)
    private
      fObjectToFree: TObject;
    public
      constructor Create(anObjectTofree: Tobject);
      destructor Destroy; override;
  end;


class operator Impricit(smrt: TSmartPoint <T>): T;
class operator Impricit(AValue: T): TSmartPoint <T>;


operator ( operadores de classe )

Result := TSmartPoint <T>.Create(AValue);

Result := smart.Value

































