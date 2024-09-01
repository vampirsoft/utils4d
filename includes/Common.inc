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

{$ALIGN          8}       // Record fields alignment
{$SCOPEDENUMS    ON}      // Use enum values only with enum type
{$WRITEABLECONST OFF}     // {$J-}
{$OVERFLOWCHECKS OFF}     // {$Q-}
{$RANGECHECKS    OFF}     // {$R-}
{$TYPEDADDRESS   ON}      // {$T+}
{$BOOLEVAL       OFF}     // {$B-}
{$SAFEDIVIDE     OFF}     // {$U-}
{$EXTENDEDSYNTAX ON}      // {$X+}

{$IF DEFINED(DEBUG)}
  {$DEBUGINFO    ON}      // {$D+}
  {$LOCALSYMBOLS ON}      // {$L+}
  {$OPTIMIZATION OFF}     // {$O-}
  {$ASSERTIONS   ON}      // {$C+}
  {$STACKFRAMES  ON}      // {$W+}
  {$INLINE       OFF}     // inline methods are used as usual
{$ELSE ~ NOT DEBUG}
  {$DEBUGINFO    OFF}     // {$D-}
  {$LOCALSYMBOLS OFF}     // {$L-}
  {$OPTIMIZATION ON}      // {$O+}
  {$ASSERTIONS   OFF}     // {$C-}
  {$STACKFRAMES  OFF}     // {$W-}
  {$INLINE       ON}      // inline methods are built into the code as part of it
{$ENDIF ~ DEBUG}

{$ENDIF ~ COMMON_INC}
