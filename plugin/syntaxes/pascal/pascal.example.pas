program DelphiDemo;

{$APPTYPE CONSOLE}

uses
  SysUtils;

type
  // Interface demonstration
  IMessageProcessor = interface
    ['{EAEF1568-E510-4A83-9C22-DBF209B54BBA}']
    procedure ProcessMessage(const Msg: string);
  end;

  // Class demonstration
  TConsoleLogger = class(TInterfacedObject, IMessageProcessor)
  public
    procedure ProcessMessage(const Msg: string);
  end;

  // Generics demonstration
  TStorage<T> = class
  private
    FValue: T;
  public
    procedure SetValue(const NewValue: T);
    function GetValue: T;
    property Value: T read GetValue write SetValue;
  end;

// Implementation of TConsoleLogger's method
procedure TConsoleLogger.ProcessMessage(const Msg: string);
begin
  WriteLn(Msg);
end;

// Implementation of TStorage's methods
procedure TStorage<T>.SetValue(const NewValue: T);
begin
  FValue := NewValue;
end;

function TStorage<T>.GetValue: T;
begin
  Result := FValue;
end;

// Procedure to demonstrate exception handling
procedure DemoException;
begin
  try
    raise Exception.Create('This is a demo exception');
  except
    on E: Exception do
    begin
      WriteLn('Exception caught: ', E.Message);
    end;
  end;
end;

// Main program block
var
  NumStorage: TStorage<Integer>;
  StrStorage: TStorage<String>;
  Logger: IMessageProcessor;
  I: Integer;
begin
  // Demonstrating variable initialization and loops
  NumStorage := TStorage<Integer>.Create;
  StrStorage := TStorage<String>.Create;
  Logger := TConsoleLogger.Create;

  NumStorage.Value := 2024;
  StrStorage.Value := 'Hello, Delphi World!';

  Logger.ProcessMessage('Number stored: ' + IntToStr(NumStorage.Value));
  Logger.ProcessMessage('String stored: ' + StrStorage.Value);

  // Control structures demo
  if NumStorage.Value > 2023 then
    Logger.ProcessMessage('The future is now.');

  for I := 1 to 5 do
    Logger.ProcessMessage('Counting... ' + IntToStr(I));

  I := 0;
  repeat
    Inc(I);
    Logger.ProcessMessage('Repeating until 3: ' + IntToStr(I));
  until I = 3;

  // Exception handling demo
  DemoException;

  // Prevent immediate console close in some environments
  WriteLn('Press <Enter> to exit...');
  ReadLn;
end.
