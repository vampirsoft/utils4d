/////////////////////////////////////////////////////////////////////////////////
//*****************************************************************************//
//* Project      : utils4d                                                    *//
//* Latest Source: https://github.com/vampirsoft/utils4d                      *//
//* Unit Name    : Utils.Arrays.Helper.Tests                                  *//
//* Author       : Сергей (LordVampir) Дворников                              *//
//* Copyright 2024 LordVampir (https://github.com/vampirsoft)                 *//
//* Licensed under MIT                                                        *//
//*****************************************************************************//
/////////////////////////////////////////////////////////////////////////////////

unit Utils.Arrays.Helper.Tests;

{$INCLUDE Common.Tests.inc}

interface

uses
  TestFramework,
  System.Generics.Collections,
  Utils.Arrays.Helper;

type

{ TArrayHelperTests }

  TArrayHelperTests = class(TTestCase)
  private const
    TestValue1        = 'test value 1';
    TestValue2        = 'test value 2';
    TestValue3        = 'test value 3';
    TestValueNotFound = 'not found';
    
  private
    FArray: TArray<string>;

  protected
    procedure SetUp; override;
    procedure TearDown; override;

  published
    procedure binary_search_should_return_index_of_item_in_sorted_array;
    procedure binary_search_should_not_return_index_of_item_in_sorted_array_if_item_not_found;
  end;

implementation

uses
  System.Generics.Defaults;

{ TArrayHelperTests }

procedure TArrayHelperTests.binary_search_should_not_return_index_of_item_in_sorted_array_if_item_not_found;
var
  ActualIndex: Integer;

begin
  TArray.Sort<string>(FArray);

  const ActualResult = TArray.BinarySearch<string>(
    FArray,
    function(const Item: string): Integer
    begin    
      Result := TComparer<string>.Default.Compare(Item, TestValueNotFound);
    end,
    ActualIndex
  );

  CheckEquals(False, ActualResult);
  CheckEquals(   -1, ActualIndex);
end;

procedure TArrayHelperTests.binary_search_should_return_index_of_item_in_sorted_array;
var
  ActualIndex: Integer;

begin
  TArray.Sort<string>(FArray);

  const ActualResult = TArray.BinarySearch<string>(
    FArray,
    function(const Item: string): Integer
    begin    
      Result := TComparer<string>.Default.Compare(Item, TestValue2);
    end,
    ActualIndex
  );

  CheckEquals(True, ActualResult);
  CheckEquals(   1, ActualIndex);
end;

procedure TArrayHelperTests.SetUp;
begin
  FArray := [TestValue3, TestValue1, TestValue2];
end;

procedure TArrayHelperTests.TearDown;
begin

end;

initialization
  RegisterTest(TArrayHelperTests.Suite);
  
end.
