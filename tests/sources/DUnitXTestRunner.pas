/////////////////////////////////////////////////////////////////////////////////
//*****************************************************************************//
//* Project      : utils4d                                                    *//
//* Latest Source: https://github.com/vampirsoft/utils4d                      *//
//* Unit Name    : DUnitXTestRunner.pas                                       *//
//* Author       : Сергей (LordVampir) Дворников                              *//
//* Copyright 2024 LordVampir (https://github.com/vampirsoft)                 *//
//* Licensed under MIT                                                        *//
//*****************************************************************************//
/////////////////////////////////////////////////////////////////////////////////

unit DUnitXTestRunner;

{$INCLUDE Common.Tests.inc}

interface

procedure RunRegisteredTests;

implementation

uses
  System.SysUtils,
{$IFDEF CONSOLE_TESTRUNNER}
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
{$ENDIF CONSOLE_TESTRUNNER}
{$IFDEF USE_VCL_TESTRUNNER}
  Vcl.Forms,
  DUnitX.Loggers.GUI.VCL,
{$ENDIF USE_VCL_TESTRUNNER}
{$IFDEF USE_MOBILE_TESTRUNNER}
  FMX.Forms,
  DUNitX.Loggers.MobileGUI,
{$ENDIF USE_MOBILE_TESTRUNNER}
  DUnitX.TestFramework;

procedure RunRegisteredTests;
begin
  ReportMemoryLeaksOnShutdown := True;

{$IFDEF CONSOLE_TESTRUNNER}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    const Runner = TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    Runner.UseRTTI := True;
    //When true, Assertions must be made during tests;
    Runner.FailsOnNoAsserts := False;

    //tell the runner how we will log things
    //Log to the console window if desired
    if TDUnitX.Options.ConsoleMode <> TDunitXConsoleMode.Off then
    begin
      const Logger = TDUnitXConsoleLogger.Create(TDUnitX.Options.ConsoleMode = TDunitXConsoleMode.Quiet);
      Runner.AddLogger(Logger);
    end;
    //Generate an NUnit compatible XML File
    const NUnitLogger = TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    Runner.AddLogger(NUnitLogger);

    //Run tests
    const Results = Runner.Execute;
    if not Results.AllPassed then System.ExitCode := EXIT_ERRORS;

    //We don't want this happening when running under CI.
    TDUnitX.Options.ExitBehavior := TDUnitXExitBehavior.Pause;
    System.Write('Done... press <Enter> key to quit.');
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
  System.Readln;
{$ENDIF CONSOLE_TESTRUNNER}
{$IFDEF USE_VCL_TESTRUNNER}
  Application.Initialize;
  Application.CreateForm(TGUIVCLTestRunner, GUIVCLTestRunner);
  Application.Run;
{$ENDIF USE_VCL_TESTRUNNER}
{$IFDEF USE_MOBILE_TESTRUNNER}
  Application.Initialize;
  Application.CreateForm(TMobileGUITestRunner, MobileGUITestRunner);
  Application.Run;
{$ENDIF USE_MOBILE_TESTRUNNER}
end;

end.
