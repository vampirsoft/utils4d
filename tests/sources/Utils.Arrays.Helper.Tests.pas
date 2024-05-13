/////////////////////////////////////////////////////////////////////////////////
//*****************************************************************************//
//* Project      : utils4d                                                    *//
//* Latest Source: https://github.com/vampirsoft/utils4d                      *//
//* Unit Name    : Utils.Arrays.Helper.Tests.pas                              *//
//* Author       : Сергей (LordVampir) Дворников                              *//
//* Copyright 2024 LordVampir (https://github.com/vampirsoft)                 *//
//* Licensed under MIT                                                        *//
//*****************************************************************************//
/////////////////////////////////////////////////////////////////////////////////

unit Utils.Arrays.Helper.Tests;

{$INCLUDE Common.Tests.inc}

interface

uses
  DUnitX.TestFramework,
  System.Generics.Collections,
  Utils.Arrays.Helper;

type

{ TArrayHelperTests }

  [TestFixture]
  TArrayHelperTests = class
  strict private const
    TestValue1        = 'test value 1';
    TestValue2        = 'test value 2';
    TestValue3        = 'test value 3';
    TestValueNotFound = 'not found';

  strict private
    FArray: TArray<string>;

  public
    [Setup]
    procedure SetUp;

    [Test]
    procedure binary_search_should_return_index_of_item_in_sorted_array;
    [Test]
    procedure binary_search_should_not_return_index_of_item_in_sorted_array_if_item_not_found;

    [Test]
    procedure search_should_return_index_of_item_in_array;
    [Test]
    procedure search_should_not_return_index_of_item_in_array_if_item_not_found;
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

  const Comparer = TComparer<string>.Default;
  const ActualResult = TArray.BinarySearch<string>(
    FArray,
    function(const Item: string): Integer
    begin
      Result := Comparer.Compare(Item, TestValueNotFound);
    end,
    ActualIndex
  );

  Assert.isFalse(ActualResult);
  Assert.AreEqual(-1, ActualIndex);
end;

procedure TArrayHelperTests.binary_search_should_return_index_of_item_in_sorted_array;
var
  ActualIndex: Integer;

begin
  TArray.Sort<string>(FArray);

  const Comparer = TComparer<string>.Default;
  const ActualResult = TArray.BinarySearch<string>(
    FArray,
    function(const Item: string): Integer
    begin
      Result := Comparer.Compare(Item, TestValue2);
    end,
    ActualIndex
  );

  Assert.IsTrue(ActualResult);
  Assert.AreEqual(1, ActualIndex);
end;

procedure TArrayHelperTests.search_should_not_return_index_of_item_in_array_if_item_not_found;
var
  ActualIndex: Integer;

begin
  const Comparer = TEqualityComparer<string>.Default;
  const ActualResult = TArray.Search<string>(
    FArray,
    function(const Item: string): Boolean
    begin
      Result := Comparer.Equals(Item, TestValueNotFound);
    end,
    ActualIndex
  );

  Assert.IsFalse(ActualResult);
  Assert.AreEqual(-1, ActualIndex);
end;

procedure TArrayHelperTests.search_should_return_index_of_item_in_array;
var
  ActualIndex: Integer;

begin
  const Comparer = TEqualityComparer<string>.Default;
  const ActualResult = TArray.Search<string>(
    FArray,
    function(const Item: string): Boolean
    begin
      Result := Comparer.Equals(Item, TestValue2);
    end,
    ActualIndex
  );

  Assert.IsTrue(ActualResult);
  Assert.AreEqual(2, ActualIndex);
end;

procedure TArrayHelperTests.SetUp;
begin
  FArray := [TestValue3, TestValue1, TestValue2];
end;

initialization
  TDUnitX.RegisterTestFixture(TArrayHelperTests);

end.
