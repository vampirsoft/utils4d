/////////////////////////////////////////////////////////////////////////////////
//*****************************************************************************//
//* Project      : utils4d                                                    *//
//* Latest Source: https://github.com/vampirsoft/utils4d                      *//
//* Unit Name    : Utils.ExtArray.pas                                         *//
//* Author       : Сергей (LordVampir) Дворников                              *//
//* Copyright 2024 LordVampir (https://github.com/vampirsoft)                 *//
//* Licensed under MIT                                                        *//
//*****************************************************************************//
/////////////////////////////////////////////////////////////////////////////////

unit Utils.ExtArray;

{$INCLUDE Common.inc}

interface

uses
  System.Generics.Collections;

type

{ TXArray<T> }

  TXArray<T> = record
  type
    TEnumerator = class(System.Generics.Collections.TEnumerator<T>)
    strict private
      FArray: ^TArray<T>;
      FIndex: Integer;

    strict protected
      function DoGetCurrent: T; override;
      function DoMoveNext: Boolean; override;

    public
      constructor Create(var Arr: TArray<T>);
    end;

  strict private type
    ArrayOfT = array of T;
    PArrayOfT = ^ArrayOfT;

  strict private
    FArray: TArray<T>;

  strict private
    function GetItem(Index: Integer): T; inline;
    function GetCount: Integer; inline;
    function GetCapacity: Integer; inline;
    function GetPArray: PArrayOfT; inline;
    procedure SetItem(Index: Integer; const Value: T); inline;
    procedure SetCapacity(const Value: Integer);

  public
    function Add(const Item: T): Integer;
    function Contains(const Item : T): Boolean;
    function IndexOf(const Item : T): Integer;
    function GetEnumerator: TEnumerator<T>; inline;
    procedure Insert(const Item: T; const Index: Integer); inline;
    procedure Delete(const Index: Integer); inline;
    procedure Remove(const Item: T); inline;

  public
    class operator Implicit(const Value: TXArray<T>) : TArray<T>; inline;
    class operator Implicit(const Value: TArray<T>) : TXArray<T>; inline;

  public
    property Items[Index: Integer]: T read GetItem write SetItem; default;
    property Count: Integer read GetCount;
    property Capacity: Integer read GetCapacity write SetCapacity;
    property AsArray: TArray<T> read FArray;
    property PArray: PArrayOfT read GetPArray;
  end;

implementation

uses
  System.Generics.Defaults;

{ TXArray<T> }

function TXArray<T>.Add(const Item: T): Integer;
begin
  SetLength(FArray, Length(FArray) + 1);
  Result := High(FArray);
  FArray[Result] := Item;
end;

function TXArray<T>.Contains(const Item: T): Boolean;
begin
  const Comparer = TEqualityComparer<T>.Default;
  for var Index := Low(FArray) to High(FArray) do
  begin    
    if Comparer.Equals(FArray[Index], Item) then Exit(True);
  end;

  Result := False;
end;

procedure TXArray<T>.Delete(const Index: Integer);
begin
  System.Delete(FArray, Index, 1);
end;

function TXArray<T>.GetCapacity: Integer;
begin
  Result := Length(FArray);
end;

function TXArray<T>.GetCount: Integer;
begin
  Result := Length(FArray);
end;

function TXArray<T>.GetEnumerator: TEnumerator<T>;
begin
  Result := TEnumerator.Create(FArray);
end;

function TXArray<T>.GetItem(Index: Integer): T;
begin
  Result := FArray[Index];
end;

function TXArray<T>.GetPArray: PArrayOfT;
begin
  Pointer(Result) := FArray;
end;

class operator TXArray<T>.Implicit(const Value: TArray<T>): TXArray<T>;
begin
  Result.FArray := Value;
end;

class operator TXArray<T>.Implicit(const Value: TXArray<T>): TArray<T>;
begin
  Result := Value.FArray;
end;

function TXArray<T>.IndexOf(const Item: T): Integer;
begin
  const Comparer = TEqualityComparer<T>.Default;
  for Result := Low(FArray) to High(FArray) do
  begin
    if Comparer.Equals(FArray[Result], Item) then Exit;
  end;

  Result := -1;
end;

procedure TXArray<T>.Insert(const Item: T; const Index: Integer);
begin
  System.Insert(Item, FArray, Index);
end;

procedure TXArray<T>.Remove(const Item: T);
begin
  const Index = IndexOf(Item);
  if Index > -1 then Delete(Index);
end;

procedure TXArray<T>.SetCapacity(const Value: Integer);
begin
  if Value = High(FArray) then Exit;

  if Value < 0 then SetLength(FArray, 1)
  else SetLength(FArray, Value);
end;

procedure TXArray<T>.SetItem(Index: Integer; const Value: T);
begin
  FArray[Index] := Value;
end;

{ TXArray<T>.TEnumerator }

constructor TXArray<T>.TEnumerator.Create(var Arr: TArray<T>);
begin
  FIndex := -1;
  FArray := @Arr;
end;

function TXArray<T>.TEnumerator.DoGetCurrent: T;
begin
  Result := TArray<T>(FArray^)[FIndex];
end;

function TXArray<T>.TEnumerator.DoMoveNext: Boolean;
begin
  Inc(FIndex);
  Result := FIndex < Length(TArray<T>(FArray^));
end;

end.
