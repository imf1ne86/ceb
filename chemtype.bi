Rem Типы данных для химии
/'
* *************************
* Программа написана на языке программирования FreeBASIC.
*
* @author Ефремов А. В., 12.10.2026
'/

#lang "fb"

Const MAXITEM As Integer = 10

Type ElementType
  element As String
  atoms As Integer
End Type
Type ElementList
  items(1 To MAXITEM) As ElementType
  count As Integer
End Type
Type CompoundType
  compoundFormula As String
  stoichiometricCoefficient As Integer = 1
  elements As ElementList
End Type
Type CompoundList
  items(1 To MAXITEM) As CompoundType
  count As Integer
End Type
Enum EquationSide
  LeftSide
  RightSide
End Enum
Type SideOfEquationType
  sideOfEquation As EquationSide
  elements As ElementList
End Type
Type SideOfEquationList
  items(1 To 2) As SideOfEquationType
End Type
