/////////////////////////////////////////////////////////////////////////////////
//*****************************************************************************//
//* Project      : utils4d                                                    *//
//* Latest Source: https://github.com/vampirsoft/utils4d                      *//
//* Unit Name    : Utils.Arrays.Helper.pas                                    *//
//* Author       : Сергей (LordVampir) Дворников                              *//
//* Copyright 2024 LordVampir (https://github.com/vampirsoft)                 *//
//* Licensed under MIT                                                        *//
//*****************************************************************************//
/////////////////////////////////////////////////////////////////////////////////

unit Utils.Arrays.Helper;

{$INCLUDE Common.inc}

interface

uses
  System.Generics.Collections;

type

{ TArrayHelper }

  TArrayHelper = class helper for TArray
  public type
    TBinarySearchComparer<T> = reference to function(const Item: T): Integer;

  public
    class function BinarySearch<T>(const Values: array of T; const Compare: TBinarySearchComparer<T>;
      out FoundIndex: Integer;
      const StartIndex, Count: Integer): Boolean; overload; static;
    class function BinarySearch<T>(const Values: array of T; const Compare: TBinarySearchComparer<T>;
      out FoundIndex: Integer): Boolean; overload; static;
  end;

implementation

{ TArrayHelper }

class function TArrayHelper.BinarySearch<T>(const Values: array of T; const Compare: TBinarySearchComparer<T>;
  out FoundIndex: Integer; const StartIndex, Count: Integer): Boolean;
begin
  if
    (StartIndex < Low(Values)) or
    ((StartIndex > High(Values)) and (Count > 0)) or
    (StartIndex + Count - 1 > High(Values)) or
    (Count < 0) or
    (StartIndex + Count < 0)
  then
  begin
    ErrorArgumentOutOfRange;
  end;

  if Count = 0 then
  begin
    FoundIndex := -1;
    Exit(False);
  end;

  var L := StartIndex;
  var H := StartIndex + Count - 1;
  while L <= H do
  begin
    var Mid := L + (H - L) shr 1;
    const Cmp = Compare(Values[Mid]);
    if Cmp < 0 then
      L := Mid + 1
    else if Cmp > 0 then
      H := Mid - 1
    else
    begin
      repeat
        Dec(Mid);
      until (Mid < StartIndex) or (Compare(Values[Mid]) <> 0);

      FoundIndex := Mid + 1;
      Exit(True);
    end;
  end;

  FoundIndex := -1;
  Result := False;
end;

class function TArrayHelper.BinarySearch<T>(const Values: array of T; const Compare: TBinarySearchComparer<T>;
  out FoundIndex: Integer): Boolean;
begin
  Result := BinarySearch<T>(Values, Compare, FoundIndex, Low(Values), Length(Values));
end;

end.
