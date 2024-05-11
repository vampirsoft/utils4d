/////////////////////////////////////////////////////////////////////////////////
//*****************************************************************************//
//* Project      : localizations                                              *//
//* Latest Source: https://github.com/vampirsoft/localizations                *//
//* Unit Name    : Common.Tests.inc                                           *//
//* Author       : Сергей (LordVampir) Дворников                              *//
//* Copyright 2024 LordVampir (https://github.com/vampirsoft)                 *//
//* Licensed under MIT                                                        *//
//*****************************************************************************//
/////////////////////////////////////////////////////////////////////////////////

{$IF NOT DEFINED(COMMON_TESTS_INC)}
{$DEFINE COMMON_TESTS_INC}

// Если используется QuickLib (https://github.com/exilon/QuickLib),
// необходимо включить эту опцию
//{$DEFINE USE_QUICK_LIB}

// Тесты в коносле
{$DEFINE CONSOLE_TESTRUNNER}

// ВНИМАНИЕ!!!
// =============================================================================
// НАСТРОЙКИ БИБЛИОТЕКИ

{$INCLUDE Common.inc}

{$ENDIF ~ COMMON_TESTS_INC}
