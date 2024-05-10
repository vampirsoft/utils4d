/////////////////////////////////////////////////////////////////////////////////
//*****************************************************************************//
//* Project      : localizations                                              *//
//* Latest Source: https://github.com/vampirsoft/localizations                *//
//* Unit Name    : Common.inc                                                 *//
//* Author       : Сергей (LordVampir) Дворников                              *//
//* Copyright 2024 LordVampir (https://github.com/vampirsoft)                 *//
//* Licensed under MIT                                                        *//
//*****************************************************************************//
/////////////////////////////////////////////////////////////////////////////////

{$IF NOT DEFINED(COMMON_INC)}
{$DEFINE COMMON_INC}

// ВНИМАНИЕ!!!
// =============================================================================
// КОД СЛЕДУЮЩИЙ НИЖЕ НЕ ПРЕДНАЗНАЧЕН ДЛЯ ИЗМЕНЕНИЯ ПРОГРАММИСТОМ И
// СОДЕРЖИТ КРИТИЧЕСКИЕ НАСТРОЙКИ ДЛЯ БИБЛИОТЕКИ CryptoHash

{$WRITEABLECONST OFF}     // {$J-}
{$OVERFLOWCHECKS OFF}     // {$Q-}
{$RANGECHECKS OFF}        // {$R-}
{$TYPEDADDRESS ON}        // {$T+}
{$BOOLEVAL OFF}           // {$B-}
{$SAFEDIVIDE OFF}         // {$U-}
{$EXTENDEDSYNTAX ON}      // {$X+}

{$IF DEFINED(DEBUG)}
  {$DEBUGINFO ON}         // {$D+}
  {$LOCALSYMBOLS ON}      // {$L+}
  {$OPTIMIZATION OFF}     // {$O-}
  {$ASSERTIONS ON}        // {$C+}
  {$STACKFRAMES ON}       // {$W+}
  {$INLINE OFF}
{$ELSE ~ NOT DEBUG}
  {$DEBUGINFO OFF}        // {$D-}
  {$LOCALSYMBOLS OFF}     // {$L-}
  {$OPTIMIZATION ON}      // {$O+}
  {$ASSERTIONS OFF}       // {$C-}
  {$STACKFRAMES OFF}      // {$W-}
  {$INLINE ON}
{$ENDIF ~ DEBUG}

{$ENDIF ~ COMMON_INC}
