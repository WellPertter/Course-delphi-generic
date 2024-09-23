unit SmartPoint;

interface

type
  TSmartPoint<T: class, constructor> = record
   strict private
      Fvalue: T;
      FFreeTheValue : IInterface;
      function GetValue : T;
   public
    class operator Implicit(smart: TSmartPoint <T>): T;
    class operator Implicit(AValue: T): TSmartPoint <T>;


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

implementation

{ TSmartPoint<T> }

constructor TSmartPoint<T>.Create(aValue: T);
begin
  Fvalue        := aValue;
  FFreeThevalue := TFreeThevalue.Create(Fvalue);
end;

function TSmartPoint<T>.GetValue: T;
begin
  if not Assigned(FFreeTheValue) then
    self := TSmartPoint<T>.Create(T.Create);

  Result := Fvalue;
end;

class operator TSmartPoint<T>.Implicit(AValue: T): TSmartPoint<T>;
begin
  Result := TSmartPoint <T>.Create(AValue);
end;

class operator TSmartPoint<T>.Implicit(smart: TSmartPoint<T>): T;
begin
  Result := smart.Value
end;

{ TFreeThevalue }

constructor TFreeThevalue.Create(anObjectTofree: Tobject);
begin
  fObjectToFree :=  anObjectTofree;
end;

destructor TFreeThevalue.Destroy;
begin
  fObjectToFree.Free;
  inherited;
end;

end.
