Rem Класс для работы с химическими соединениями и реакциями
/'
* *************************
* При поддержке нейросети "GPT-6 Luna".
* Программа написана на языке программирования FreeBASIC.
*
* @author Ефремов А. В., 12.10.2026
'/

#lang "fb"

#Include Once "ext_libs/mdTypes/md/lang/mdString.bi"

Type Chemistry
  Public:
    Dim equation As String
    /'
    * Признак того, что уравнение химической реакции сбалансировано
    *
    * @param leftHandSide Левая часть уравнения химической реакции
    * @param rightHandSide Правая часть уравнения химической реакции
    * @return Boolean Истина - уравнение сбалансировано; ложь - в
    * противном случае
    '/
    Declare Function IsBalanced(ByVal leftHandSide As CompoundList, ByVal rightHandSide As CompoundList) As Boolean
    /'
    * Функция, раскладывающая одну из частей химической
    * реакции на химические элементы
    *
    * @param expression Одна из частей уравнения химической реакции
    * @param exprInfo На выходе в этом параметре будет полная
    * информация о каждом химическом соединении
    * @return ElementList Описание элементов из уравнения (общее
    * кол-во элементов, наименование каждого элемента, кол-во атомов
    * для каждого элемента)
    '/
    Declare Function ParseExpression(ByVal expression As String, ByRef exprInfo As CompoundList) As ElementList
    Declare Property GetLeftExpr As String
    Declare Property GetRightExpr As String
    Declare Property IsExprOk As Boolean
    Declare Constructor(equation As String)
  Private:
    Dim As String leftExpr, rightExpr
    Dim ok As Boolean = False: ' признак отсутствия каких-либо ошибок
    Declare Sub GetExpressions()
    Declare Function GetChemicalCompounds (ByVal expression As String) As CompoundList
    Declare Function IsDigitChar(ByVal ch As String) As Integer
    Declare Function IsUpperChar(ByVal ch As String) As Integer
    Declare Function IsLowerChar(ByVal ch As String) As Integer
    Declare Sub AddElement(ByRef result As ElementList, ByRef elementName As String, ByVal amount As Integer, ByRef ok As Integer)
    Declare Function ParseSequence(ByRef formula As String, ByRef pos As Integer, ByVal closingChar As String, ByRef result As ElementList, ByRef ok As Integer) As Integer
    Declare Function GetElementList(ByVal compoundFormula As String) As ElementList
    Declare Sub AddSideOfEquation(ByRef eq As SideOfEquationList, ByVal objHandSide As CompoundList, ByVal idx As Integer, ByVal sideOfEquation As EquationSide, ByRef isError As Boolean)
End Type

Constructor Chemistry(equation As String)
  This.equation = equation
  This.GetExpressions()
End Constructor

Sub Chemistry.GetExpressions()
  If This.equation <> "" Then
    Dim part() As mdString, fEq As mdString = This.equation, isSplit As Boolean = fEq.split(part(), "=", 0)
    Dim lPart As Integer = LBound(part), rPart As Integer = UBound(part)
    If (isSplit) And (lPart <> rPart) Then
      This.leftExpr = Trim(part(lPart))
      This.rightExpr = Trim(part(rPart))
      This.ok = True
    End If
  End If
End Sub

Property Chemistry.GetLeftExpr As String
  Dim result As String
  If This.ok Then
    result = This.leftExpr
  End If
  Return result
End Property

Property Chemistry.GetRightExpr As String
  Dim result As String
  If This.ok Then
    result = This.rightExpr
  End If
  Return result
End Property

Property Chemistry.IsExprOk As Boolean
  Return This.ok
End Property

Function Chemistry.GetChemicalCompounds (ByVal expression As String) As CompoundList
  Dim result As CompoundList
  result.count = 0
  expression = Trim(expression)
  If This.ok Then
    Dim formula() As mdString, fExpr As mdString = expression, isSplit As Boolean = fExpr.split(formula(), "+", 0)
    If isSplit Then
      Dim cnt As Integer = 0
      For idx As Integer = LBound(formula) To UBound(formula)
        If cnt >= UBound(result.items) Then Exit For
        cnt += 1
        result.items(cnt).compoundFormula = Trim(formula(idx))
        result.count = cnt
      Next idx
    End If
  End If
  Return result
End Function

Function Chemistry.IsDigitChar(ByVal ch As String) As Integer
  Return (ch >= "0" And ch <= "9")
End Function

Function Chemistry.IsUpperChar(ByVal ch As String) As Integer
  Return (ch >= "A" And ch <= "Z")
End Function

Function Chemistry.IsLowerChar(ByVal ch As String) As Integer
  Return (ch >= "a" And ch <= "z")
End Function

Sub Chemistry.AddElement(ByRef result As ElementList, ByRef elementName As String, ByVal amount As Integer, ByRef ok As Integer)
  Dim As Integer i
  If amount < 1 Or amount > 255 Then
    ok = 0
    Exit Sub
  End If
  For i = 1 To result.count
    If result.items(i).element = elementName Then
      If CInt(result.items(i).atoms) + amount > 255 Then
        ok = 0
        Exit Sub
      End If
      result.items(i).atoms += CByte(amount)
      Exit Sub
    End If
  Next i
  If result.count >= MAXITEM Then
    ok = 0
    Exit Sub
  End If
  result.count += 1
  result.items(result.count).element = elementName
  result.items(result.count).atoms = CByte(amount)
End Sub

Function Chemistry.ParseSequence(ByRef formula As String, ByRef pos As Integer, ByVal closingChar As String, ByRef result As ElementList, ByRef ok As Integer) As Integer
  Dim As ElementList groupElements
  Dim As String ch, elementName, expectedClosing
  Dim As Integer groupCount, amount, i
  Do While pos <= Len(formula)
    ch = Mid(formula, pos, 1)
    If ch = ")" Or ch = "]" Then
      If closingChar = "" Or ch <> closingChar Then
        ok = 0
        Return 0
      End If
      pos += 1
      Return -1
    End If
    If ch = "(" Or ch = "[" Then
      If ch = "(" Then
        expectedClosing = ")"
      Else
        expectedClosing = "]"
      End If
      pos += 1
      groupElements.count = 0
      groupCount = This.ParseSequence(formula, pos, expectedClosing, groupElements, ok)
      If ok = 0 Or groupCount = 0 Then
        ok = 0
        Return 0
      End If
      amount = 0
      Do While pos <= Len(formula) And This.IsDigitChar(Mid(formula, pos, 1))
        amount = amount * 10 + Val(Mid(formula, pos, 1))
        pos += 1
        If amount > 255 Then
          ok = 0
          Return 0
        End If
      Loop
      If amount = 0 Then amount = 1
      For i = 1 To groupElements.count
        This.AddElement(result, groupElements.items(i).element, CInt(groupElements.items(i).atoms) * amount, ok)
        If ok = 0 Then Return 0
      Next i
    ElseIf This.IsUpperChar(ch) Then
      elementName = ch
      pos += 1
      If pos <= Len(formula) And This.IsLowerChar(Mid(formula, pos, 1)) Then
        elementName &= Mid(formula, pos, 1)
        pos += 1
      End If
      amount = 0
      Do While pos <= Len(formula) And This.IsDigitChar(Mid(formula, pos, 1))
        amount = amount * 10 + Val(Mid(formula, pos, 1))
        pos += 1
        If amount > 255 Then
          ok = 0
          Return 0
        End If
      Loop
      If amount = 0 Then amount = 1
      This.AddElement(result, elementName, amount, ok)
      If ok = 0 Then Return 0
    Else
      ok = 0
      Return 0
    End If
  Loop
  If closingChar <> "" Then
    ok = 0
    Return 0
  End If
  Return 1
End Function

Function Chemistry.GetElementList(ByVal compoundFormula As String) As ElementList
  Dim As ElementList result
  Dim As Integer pos, ok
  result.count = 0
  pos = 1
  ok = 1
  If Len(compoundFormula) = 0 Then ok = 0
  If ok Then
    If This.ParseSequence(compoundFormula, pos, "", result, ok) = 0 Then
      ok = 0
    End If
  End If
  If pos <= Len(compoundFormula) Then ok = 0
  ' При ошибке или превышении лимитов возвращается пустой список.
  If ok = 0 Then result.count = 0
  Return result
End Function

Function Chemistry.ParseExpression(ByVal expression As String, ByRef exprInfo As CompoundList) As ElementList
  Dim result As ElementList
  result.count = 0
  expression = Trim(expression)
  If This.ok AndAlso (Cbool(expression <> "") And Cbool(InStr(expression, "=") < 1)) Then
    Dim formula As CompoundList = This.GetChemicalCompounds(expression)
    If formula.count > 0 Then
      For idx As Integer = LBound(formula.items) To formula.count
        formula.items(idx).elements = This.GetElementList(formula.items(idx).compoundFormula)
      Next idx
    End If
    exprInfo = formula
  End If
  Return result
End Function

Sub Chemistry.AddSideOfEquation(ByRef eq As SideOfEquationList, ByVal objHandSide As CompoundList, ByVal idx As Integer, ByVal sideOfEquation As EquationSide, ByRef isError As Boolean)
  If This.ok AndAlso Not isError Then
    Dim element As String, atoms As Integer, k As Integer
    Dim As Integer idxCompound, idxElement, idxSideOfEquation
    Dim isFound As Boolean
    eq.items(idx).sideOfEquation = sideOfEquation
    eq.items(idx).elements.count = 0
    For idxCompound = LBound(objHandSide.items) To objHandSide.count
      If isError Then Exit For
      k = objHandSide.items(idxCompound).stoichiometricCoefficient
      For idxElement = LBound(objHandSide.items(idxCompound).elements.items) To objHandSide.items(idxCompound).elements.count
        If isError Then Exit For
        element = objHandSide.items(idxCompound).elements.items(idxElement).element
        atoms = k * objHandSide.items(idxCompound).elements.items(idxElement).atoms
        isFound = False
        For idxSideOfEquation = LBound(eq.items(idx).elements.items) To eq.items(idx).elements.count
          If isError Then Exit For
          If eq.items(idx).elements.items(idxSideOfEquation).element = element Then
            eq.items(idx).elements.items(idxSideOfEquation).atoms += atoms
            isFound = True
          End If
        Next idxSideOfEquation
        If Not isFound Then
          If eq.items(idx).elements.count < UBound(eq.items(idx).elements.items) Then
            eq.items(idx).elements.count += 1
            eq.items(idx).elements.items(eq.items(idx).elements.count).element = element
            eq.items(idx).elements.items(eq.items(idx).elements.count).atoms = atoms
          Else
            isError = True: ' переполнение элементами массива
            This.ok = False
          End If
        End If
      Next idxElement
    Next idxCompound
  End If
End Sub

Function Chemistry.IsBalanced(ByVal leftHandSide As CompoundList, ByVal rightHandSide As CompoundList) As Boolean
  Dim result As Boolean = False
  Dim isError As Boolean = False
  If This.ok AndAlso Not isError AndAlso (Cbool(leftHandSide.count > 0) And Cbool(rightHandSide.count > 0)) Then
    Dim eq As SideOfEquationList
    This.AddSideOfEquation(eq, leftHandSide, 1, LeftSide, isError)
    This.AddSideOfEquation(eq, rightHandSide, 2, RightSide, isError)
    ' проверка сбалансированности уравнения химической реакции
    If eq.items(1).elements.count <> eq.items(2).elements.count Then
      isError = True
      This.ok = False
    Else
      Dim As ElementType currEl1, currEl2
      Dim isFound As Boolean
      For i1 As Integer = LBound(eq.items(1).elements.items) To eq.items(1).elements.count
        currEl1 = eq.items(1).elements.items(i1)
        isFound = False
        For i2 As Integer = LBound(eq.items(2).elements.items) To eq.items(2).elements.count
          currEl2 = eq.items(2).elements.items(i2)
          If currEl2.element = currEl1.element And currEl2.atoms = currEl1.atoms Then
            isFound = True
            Exit For
          End If
        Next i2
        If Not isFound Then
          isError = True
          Exit For
        End If
      Next i1
    End If
    If Not isError Then
      result = True: ' уравнение химической реакции является сбалансированным
    End If
  End If
  If isError Then
    result = False
  End If
  Return result
End Function
