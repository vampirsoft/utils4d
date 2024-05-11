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
  TestFramework;

type
  TXArrayTests = class(TTestCase)
  private const
    TestValue1        = 'test value 1';
    TestValue2        = 'test value 2';
    TestValue3        = 'test value 3';
    TestValueNotFound = 'not found';

  private
    FArray: TXArray<string>;

  strict protected
    procedure SetUp; override;

  published
    procedure add_should_append_item_into_end_of_array_and_return_index_of_item;

    procedure contains_should_return_true_if_array_has_item;
    procedure contains_should_return_false_if_array_has_no_item;

    procedure index_of_should_return_index_of_item_if_array_has_an_item;
    procedure index_of_should_return_neg_one_if_array_has_no_item;

    procedure enumerator_should_each_all_items;

    procedure insert_should_add_item_in_concrate_position;

    procedure delete_should_remove_item_by_index;

    procedure remove_should_remove_item;

    procedure set_item_should_change_item_in_concrate_position;
  end;

implementation

uses
  System.SysUtils(*, System.Generics.Defaults*), System.Generics.Collections;

{ TXArrayTests }

procedure TXArrayTests.add_should_append_item_into_end_of_array_and_return_index_of_item;
begin
  const ActualIndex = FArray.Add(TestValue3);

  CheckEquals(2, ActualIndex);
end;

procedure TXArrayTests.contains_should_return_false_if_array_has_no_item;
begin
  const Actual = FArray.Contains(TestValueNotFound);

  CheckFalse(Actual);
end;

procedure TXArrayTests.contains_should_return_true_if_array_has_item;
begin
  const Actual = FArray.Contains(TestValue2);

  CheckTrue(Actual);
end;

procedure TXArrayTests.delete_should_remove_item_by_index;
begin
  CheckEquals(2, FArray.Count);
  CheckEquals(TestValue2, FArray[0]);

  FArray.Delete(0);

  CheckEquals(1, FArray.Count);
  CheckEquals(TestValue1, FArray[0]);
end;

procedure TXArrayTests.enumerator_should_each_all_items;
begin
  const ActualList = TList<string>.Create;
  try
    for var Item in FArray do
    begin
      ActualList.Add(Item);
    end;

    CheckEquals(string.Join(',', FArray.AsArray), string.Join(',', ActualList.ToArray));
  finally
    FreeAndNil(ActualList);
  end;
end;

procedure TXArrayTests.index_of_should_return_index_of_item_if_array_has_an_item;
begin
  const ActualIndex = FArray.IndexOf(TestValue1);

  CheckEquals(1, ActualIndex);
end;

procedure TXArrayTests.index_of_should_return_neg_one_if_array_has_no_item;
begin
  const ActualIndex = FArray.IndexOf(TestValueNotFound);

  CheckEquals(-1, ActualIndex);
end;

procedure TXArrayTests.insert_should_add_item_in_concrate_position;
begin
  CheckEquals(2, FArray.Count);
  CheckEquals(TestValue1, FArray[1]);

  FArray.Insert(TestValue3, 1);

  CheckEquals(3, FArray.Count);
  CheckEquals(TestValue3, FArray[1]);
end;

procedure TXArrayTests.remove_should_remove_item;
begin
  CheckEquals(2, FArray.Count);
  CheckEquals(TestValue2, FArray[0]);

  FArray.Remove(TestValue2);

  CheckEquals(1, FArray.Count);
  CheckEquals(TestValue1, FArray[0]);
end;

procedure TXArrayTests.SetUp;
begin
  FArray := [TestValue2, TestValue1];
end;

procedure TXArrayTests.set_item_should_change_item_in_concrate_position;
begin
  CheckEquals(TestValue1, FArray[1]);

  FArray[1] := TestValue3;
  
  CheckEquals(TestValue3, FArray[1]);
end;

initialization
  RegisterTest(TXArrayTests.Suite);

end.
