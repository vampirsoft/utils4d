/////////////////////////////////////////////////////////////////////////////////
//*****************************************************************************//
//* Project      : utils4d                                                    *//
//* Latest Source: https://github.com/vampirsoft/utils4d                      *//
//* Unit Name    : Utils.ExtArray.Tests.pas                                   *//
//* Author       : Сергей (LordVampir) Дворников                              *//
//* Copyright 2024 LordVampir (https://github.com/vampirsoft)                 *//
//* Licensed under MIT                                                        *//
//*****************************************************************************//
/////////////////////////////////////////////////////////////////////////////////

unit Utils.ExtArray.Tests;

{$INCLUDE Common.Tests.inc}

interface

uses
  {$IFDEF USE_QUICK_LIB}Quick.Arrays{$ELSE}Utils.ExtArray{$ENDIF},
  DUnitX.TestFramework,
  DUnitX.DUnitCompatibility;

type

{ TXArrayTests }

  [TestFixture]
  TXArrayTests = class
  strict private const
    TestValue1        = 'test value 1';
    TestValue2        = 'test value 2';
    TestValue3        = 'test value 3';
    TestValueNotFound = 'not found';

  strict private
    FArray: TXArray<string>;

  public
    [Setup]
    procedure SetUp;

    [Test]
    procedure add_should_append_item_into_end_of_array_and_return_index_of_item;

    [Test]
    procedure contains_should_return_true_if_array_has_item;
    [Test]
    procedure contains_should_return_false_if_array_has_no_item;

    [Test]
    procedure index_of_should_return_index_of_item_if_array_has_an_item;
    [Test]
    procedure index_of_should_return_neg_one_if_array_has_no_item;

    [Test]
    procedure enumerator_should_each_all_items;

    [Test]
    procedure insert_should_add_item_in_concrate_position;

    [Test]
    procedure delete_should_remove_item_by_index;

    [Test]
    procedure remove_should_remove_item;

    [Test]
    procedure set_item_should_change_item_in_concrate_position;
  end;

implementation

uses
  System.SysUtils, System.Generics.Collections;

{ TXArrayTests }

procedure TXArrayTests.add_should_append_item_into_end_of_array_and_return_index_of_item;
begin
  const ActualIndex = FArray.Add(TestValue3);

  Assert.AreEqual(2, ActualIndex);
end;

procedure TXArrayTests.contains_should_return_false_if_array_has_no_item;
begin
  const Actual = FArray.Contains(TestValueNotFound);

  Assert.IsFalse(Actual);
end;

procedure TXArrayTests.contains_should_return_true_if_array_has_item;
begin
  const Actual = FArray.Contains(TestValue2);

  Assert.IsTrue(Actual);
end;

procedure TXArrayTests.delete_should_remove_item_by_index;
begin
  Assert.AreEqual(2, FArray.Count);
  Assert.AreEqual(TestValue2, FArray[0]);

  FArray.Delete(0);

  Assert.AreEqual(1, FArray.Count);
  Assert.AreEqual(TestValue1, FArray[0]);
end;

procedure TXArrayTests.enumerator_should_each_all_items;
begin
  const ActualList = TList<string>.Create;
  try
    for var Item in FArray do
    begin
      ActualList.Add(Item);
    end;

    Assert.AreEqual(string.Join(',', FArray.AsArray), string.Join(',', ActualList.ToArray));
  finally
    FreeAndNil(ActualList);
  end;
end;

procedure TXArrayTests.index_of_should_return_index_of_item_if_array_has_an_item;
begin
  const ActualIndex = FArray.IndexOf(TestValue1);

  Assert.AreEqual(1, ActualIndex);
end;

procedure TXArrayTests.index_of_should_return_neg_one_if_array_has_no_item;
begin
  const ActualIndex = FArray.IndexOf(TestValueNotFound);

  Assert.AreEqual(-1, ActualIndex);
end;

procedure TXArrayTests.insert_should_add_item_in_concrate_position;
begin
  Assert.AreEqual(2, FArray.Count);
  Assert.AreEqual(TestValue1, FArray[1]);

  FArray.Insert(TestValue3, 1);

  Assert.AreEqual(3, FArray.Count);
  Assert.AreEqual(TestValue3, FArray[1]);
end;

procedure TXArrayTests.remove_should_remove_item;
begin
  Assert.AreEqual(2, FArray.Count);
  Assert.AreEqual(TestValue2, FArray[0]);

  FArray.Remove(TestValue2);

  Assert.AreEqual(1, FArray.Count);
  Assert.AreEqual(TestValue1, FArray[0]);
end;

procedure TXArrayTests.SetUp;
begin
  FArray := [TestValue2, TestValue1];
end;

procedure TXArrayTests.set_item_should_change_item_in_concrate_position;
begin
  Assert.AreEqual(TestValue1, FArray[1]);

  FArray[1] := TestValue3;
  
  Assert.AreEqual(TestValue3, FArray[1]);
end;

initialization
  TDUnitX.RegisterTestFixture(TXArrayTests);

end.
