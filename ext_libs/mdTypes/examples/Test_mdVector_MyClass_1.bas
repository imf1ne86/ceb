#Include Once "md/util/mdVector.bi"

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

mdVectorDeclare(MyClass)
Dim As mdVector(MyClass) vector

Dim As MyClass foo
foo.myVar = 0 : vector.add(foo)
foo.myVar = 1 : vector.add(foo)
foo.myVar = 2 : vector.add(foo)
foo.myVar = 3 : vector.add(foo)
foo.myVar = 0 : vector.add(foo)

Print "Output 1:"
For i As Integer = 0 To vector.size() - 1
	Print vector.get(i).myVar
Next
Print

Print "Output 2:"
Dim As MyClass element
ForEach(MyClass, element In vector)
	Print element.myVar
NextEach
Print

Print "Output 3:"
Dim As mdIterator(MyClass) iterator = vector.iterator()
While iterator.hasNext()
	Print iterator.nex().myVar
Wend
Print

Sleep

