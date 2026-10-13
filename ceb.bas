Rem Chemical Equation Balancer
/'
* *************************
* Программа написана на языке программирования FreeBASIC.
*
* @author Ефремов А. В., 13.10.2026
'/

#lang "fb"

#Include Once "chemtype.bi"
#Include Once "chem.bi"

Type ChemExprType
  leftExpression As CompoundList
  rightExpression As CompoundList
End Type

Const MAXCOEFF As Integer = 10

Const exampleEq As String = "K2Cr2O7 + FeSO4 + H2SO4 = K2SO4 + Cr2(SO4)3 + Fe2(SO4)3 + H2O"
Dim equation As String
Print "Chemical Equation Balancer"
Print "*************************"
Print: Print "Example:": Print exampleEq: Print
Line Input "Enter a case-sensitive chemical equation> ", equation
Dim objChem As Chemistry Ptr = New Chemistry(equation)

If objChem->GetLeftExpr <> "" And objChem->GetRightExpr <> "" And objChem->GetLeftExpr <> objChem->GetRightExpr Then
  Dim chemExpr As ChemExprType, el As ElementList, exprIdx As Integer
  el = objChem->ParseExpression(objChem->GetLeftExpr, chemExpr.leftExpression)
  el = objChem->ParseExpression(objChem->GetRightExpr, chemExpr.rightExpression)
  Print "The left-hand side: "; objChem->GetLeftExpr
  Print "The right-hand side: "; objChem->GetRightExpr

  Print "Trying to balance this chemical equation..."
  Dim isBalanced As Boolean = False

  For x1 As Integer = 1 To MAXCOEFF
    If isBalanced Then Exit For
    chemExpr.leftExpression.items(1).stoichiometricCoefficient = x1
    For x2 As Integer = 1 To MAXCOEFF
      If isBalanced Then Exit For
      chemExpr.leftExpression.items(2).stoichiometricCoefficient = x2
      For x3 As Integer = 1 To MAXCOEFF
        If isBalanced Then Exit For
        chemExpr.leftExpression.items(3).stoichiometricCoefficient = x3
        For x4 As Integer = 1 To MAXCOEFF
          If isBalanced Then Exit For
          chemExpr.leftExpression.items(4).stoichiometricCoefficient = x4
          For y1 As Integer = 1 To MAXCOEFF
            If isBalanced Then Exit For
            chemExpr.rightExpression.items(1).stoichiometricCoefficient = y1
            For y2 As Integer = 1 To MAXCOEFF
              If isBalanced Then Exit For
              chemExpr.rightExpression.items(2).stoichiometricCoefficient = y2
              For y3 As Integer = 1 To MAXCOEFF
                If isBalanced Then Exit For
                chemExpr.rightExpression.items(3).stoichiometricCoefficient = y3
                For y4 As Integer = 1 To MAXCOEFF
                  If isBalanced Then Exit For
                  chemExpr.rightExpression.items(4).stoichiometricCoefficient = y4
                  isBalanced = objChem->IsBalanced(chemExpr.leftExpression, chemExpr.rightExpression)
                Next y4
              Next y3
            Next y2
          Next y1
        Next x4
      Next x3
    Next x2
  Next x1


  If Not isBalanced Then
    Print "Working hella hard..."
    For x1 As Integer = 1 To MAXCOEFF
      If isBalanced Then Exit For
      chemExpr.leftExpression.items(1).stoichiometricCoefficient = x1
      For x2 As Integer = 1 To MAXCOEFF
        If isBalanced Then Exit For
        chemExpr.leftExpression.items(2).stoichiometricCoefficient = x2
        For x3 As Integer = 1 To MAXCOEFF
          If isBalanced Then Exit For
          chemExpr.leftExpression.items(3).stoichiometricCoefficient = x3
          For x4 As Integer = 1 To MAXCOEFF
            If isBalanced Then Exit For
            chemExpr.leftExpression.items(4).stoichiometricCoefficient = x4
            For x5 As Integer = 1 To MAXCOEFF
              If isBalanced Then Exit For
              chemExpr.leftExpression.items(5).stoichiometricCoefficient = x5
              For x6 As Integer = 1 To MAXCOEFF
                If isBalanced Then Exit For
                chemExpr.leftExpression.items(6).stoichiometricCoefficient = x6
                For x7 As Integer = 1 To MAXCOEFF
                  If isBalanced Then Exit For
                  chemExpr.leftExpression.items(7).stoichiometricCoefficient = x7
                  For x8 As Integer = 1 To MAXCOEFF
                    If isBalanced Then Exit For
                    chemExpr.leftExpression.items(8).stoichiometricCoefficient = x8
                    For x9 As Integer = 1 To MAXCOEFF
                      If isBalanced Then Exit For
                      chemExpr.leftExpression.items(9).stoichiometricCoefficient = x9
                      For x10 As Integer = 1 To MAXCOEFF
                        If isBalanced Then Exit For
                        chemExpr.leftExpression.items(10).stoichiometricCoefficient = x10
                        For y1 As Integer = 1 To MAXCOEFF
                          If isBalanced Then Exit For
                          chemExpr.rightExpression.items(1).stoichiometricCoefficient = y1
                          For y2 As Integer = 1 To MAXCOEFF
                            If isBalanced Then Exit For
                            chemExpr.rightExpression.items(2).stoichiometricCoefficient = y2
                            For y3 As Integer = 1 To MAXCOEFF
                              If isBalanced Then Exit For
                              chemExpr.rightExpression.items(3).stoichiometricCoefficient = y3
                              For y4 As Integer = 1 To MAXCOEFF
                                If isBalanced Then Exit For
                                chemExpr.rightExpression.items(4).stoichiometricCoefficient = y4
                                For y5 As Integer = 1 To MAXCOEFF
                                  If isBalanced Then Exit For
                                  chemExpr.rightExpression.items(5).stoichiometricCoefficient = y5
                                  For y6 As Integer = 1 To MAXCOEFF
                                    If isBalanced Then Exit For
                                    chemExpr.rightExpression.items(6).stoichiometricCoefficient = y6
                                    For y7 As Integer = 1 To MAXCOEFF
                                      If isBalanced Then Exit For
                                      chemExpr.rightExpression.items(7).stoichiometricCoefficient = y7
                                      For y8 As Integer = 1 To MAXCOEFF
                                        If isBalanced Then Exit For
                                        chemExpr.rightExpression.items(8).stoichiometricCoefficient = y8
                                        For y9 As Integer = 1 To MAXCOEFF
                                          If isBalanced Then Exit For
                                          chemExpr.rightExpression.items(9).stoichiometricCoefficient = y9
                                          For y10 As Integer = 1 To MAXCOEFF
                                            If isBalanced Then Exit For
                                            chemExpr.rightExpression.items(10).stoichiometricCoefficient = y10
                                            isBalanced = objChem->IsBalanced(chemExpr.leftExpression, chemExpr.rightExpression)
                                          Next y10
                                        Next y9
                                      Next y8
                                    Next y7
                                  Next y6
                                Next y5
                              Next y4
                            Next y3
                          Next y2
                        Next y1
                      Next x10
                    Next x9
                  Next x8
                Next x7
              Next x6
            Next x5
          Next x4
        Next x3
      Next x2
    Next x1
  End If

  If isBalanced Then
    Print "Balanced."
    Dim finalEq As String = "", k As Integer, ks As String
    For i As Integer = LBound(chemExpr.leftExpression.items) To chemExpr.leftExpression.count
      k = chemExpr.leftExpression.items(i).stoichiometricCoefficient
      if k <> 1 Then
        ks = Trim(Str(k)) + " "
      Else
        ks = ""
      End If
      If i > 1 Then
        finalEq += " + " + ks + chemExpr.leftExpression.items(i).compoundFormula
      Else
        finalEq += ks + chemExpr.leftExpression.items(i).compoundFormula
      End If
    Next i
    finalEq += " = "
    For i As Integer = LBound(chemExpr.rightExpression.items) To chemExpr.rightExpression.count
      k = chemExpr.rightExpression.items(i).stoichiometricCoefficient
      if k <> 1 Then
        ks = Trim(Str(k)) + " "
      Else
        ks = ""
      End If
      If i > 1 Then
        finalEq += " + " + ks + chemExpr.rightExpression.items(i).compoundFormula
      Else
        finalEq += ks + chemExpr.rightExpression.items(i).compoundFormula
      End If
    Next i
    Print finalEq
  Else
    Print "No balance has been found."
  End If

End If

Delete objChem

Print
Print "Hit any symbol key to quit..."
While Inkey = "": Wend
End
