/////////////////////////////////////////////////////////////////////////////////
//*****************************************************************************//
//* Project      : utils4d                                                    *//
//* Latest Source: https://github.com/vampirsoft/utils4d                      *//
//* Unit Name    : utils4d.dpr                                                *//
//* Author       : Сергей (LordVampir) Дворников                              *//
//* Copyright 2024 LordVampir (https://github.com/vampirsoft)                 *//
//* Licensed under MIT                                                        *//
//*****************************************************************************//
/////////////////////////////////////////////////////////////////////////////////

program utils4d;

{$INCLUDE Utils4D.Tests.inc}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitXTestRunner in '..\sources\DUnitXTestRunner.pas',
  Utils.ExtArray in '..\..\sources\Utils.ExtArray.pas',
  Utils.Arrays.Helper in '..\..\sources\Utils.Arrays.Helper.pas',
  Utils.ExtArray.Tests in '..\sources\Utils.ExtArray.Tests.pas',
  Utils.Arrays.Helper.Tests in '..\sources\Utils.Arrays.Helper.Tests.pas';

{$R *.RES}

begin
  RunRegisteredTests;
end.
