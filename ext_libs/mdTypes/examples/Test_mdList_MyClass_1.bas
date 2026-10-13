#Include Once "md/util/mdList.bi"

Type MyClass
	Declare Constructor ()
	Declare Operator Cast() As String
	As Integer myVar
End Type
'must have a default constructor or no explicit constructor at all!
Constructor MyClass ()
	
End Constructor
'must implement cast to string for string representation
Operator MyClass.Cast() As String
	Return Str(myVar)
End Operator
'operator for comparision must exist!
Operator = (ByRef lhs As MyClass, ByRef rhs As MyClass) As Integer
	Return lhs.myVar = rhs.myVar
End Operator

mdListDeclare(MyClass)
Dim As mdList(MyClass) list

Dim As MyClass foo
foo.myVar = 0 : list.add(foo)
foo.myVar = 1 : list.add(foo)
foo.myVar = 2 : list.add(foo)
foo.myVar = 3 : list.add(foo)
foo.myVar = 0 : list.add(foo)

Print "Output 1:"
For i As Integer = 0 To list.size() - 1
	Print list.get(i).myVar
Next
Print

Print "Output 2:"
Dim As MyClass element
ForEach(MyClass, element In list)
	Print element.myVar
NextEach
Print

Print "Output 3:"
Dim As mdIterator(MyClass) iterator = list.iterator()
While iterator.hasNext()
	Print iterator.nex().myVar
Wend
Print

Sleep

