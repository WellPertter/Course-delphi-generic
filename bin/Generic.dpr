program Generic;

uses
  System.StartUpCopy,
  FMX.Forms,
  untMainGeneric in '..\src\view\untMainGeneric.pas' {Form1},
  SmartPoint in '..\src\view\SmartPoint.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
