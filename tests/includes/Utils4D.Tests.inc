/////////////////////////////////////////////////////////////////////////////////
//*****************************************************************************//
//* Project      : localizations                                              *//
//* Latest Source: https://github.com/vampirsoft/localizations                *//
//* Unit Name    : Utils4D.Tests.inc                                          *//
//* Author       : Сергей (LordVampir) Дворников                              *//
//* Copyright 2024 LordVampir (https://github.com/vampirsoft)                 *//
//* Licensed under MIT                                                        *//
//*****************************************************************************//
/////////////////////////////////////////////////////////////////////////////////

{$IF NOT DEFINED(UTILS_4_D_TESTS_INC)}
{$DEFINE UTILS_4_D_TESTS_INC}

// Если используется QuickLib (https://github.com/exilon/QuickLib),
// необходимо включить эту опцию
//{$DEFINE USE_QUICK_LIB}

// ВНИМАНИЕ!!!
// =============================================================================
// КОД СЛЕДУЮЩИЙ НИЖЕ НЕ ПРЕДНАЗНАЧЕН ДЛЯ ИЗМЕНЕНИЯ ПРОГРАММИСТОМ И
// СОДЕРЖИТ КРИТИЧЕСКИЕ НАСТРОЙКИ

{$IF NOT DEFINED(MSWINDOWS)}
  {$UNDEF USE_VCL_TESTRUNNER}
{$ENDIF MSWINDOWS}
{$IF NOT (DEFINED(USE_VCL_TESTRUNNER) OR DEFINED(USE_MOBILE_TESTRUNNER))}
  {$DEFINE CONSOLE_TESTRUNNER}
{$ENDIF CONSOLE_TESTRUNNER}

{$INCLUDE Common.Tests.inc}

{$ENDIF ~ UTILS_4_D_TESTS_INC}
