#Include Once "md/util/mdList.bi"

Type MyClass
	Public:
	Declare Constructor ()
	Declare Constructor (ByVal value As Integer)
	Declare Operator Cast() As String
	
	Declare Sub setMyVar (ByVal value As Integer)
	Declare Function getMyVar () As Integer
	
	Private:
	As Integer myVar
End Type
'must have a default constructor or no explicit constructor at all!
Constructor MyClass ()
	
End Constructor
Constructor MyClass (ByVal value As Integer)
	This.setMyVar(value)
End Constructor
'must implement cast to string for string representation
Operator MyClass.Cast() As String
	Return Str(myVar)
End Operator

Sub MyClass.setMyVar (ByVal value As Integer)
	This.myVar = value
End Sub
Function MyClass.getMyVar () As Integer
	Return This.myVar
End Function

'operator for comparision must exist!
Operator = (ByRef lhs As MyClass, ByRef rhs As MyClass) As Integer
	Return lhs.getMyVar() = rhs.getMyVar()
End Operator

mdListDeclare(MyClass)
Dim As mdList(MyClass) list

Dim As MyClass foo
foo.setMyVar(0) : list.add(foo)
foo.setMyVar(1) : list.add(foo)
foo.setMyVar(2) : list.add(foo)
foo.setMyVar(3) : list.add(foo)
foo.setMyVar(0) : list.add(foo)

Print "Output 1:"
For i As Integer = 0 To list.size() - 1
	Print list.get(i).getMyVar()
Next
Print

Print "Output 2:"
Dim As MyClass element
ForEach(MyClass, element In list)
	Print element.getMyVar()
NextEach
Print

Print "Output 3:"
Dim As mdIterator(MyClass) iterator = list.iterator()
While iterator.hasNext()
	Print iterator.nex().getMyVar()
Wend
Print

Sleep

