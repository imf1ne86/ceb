#Include Once "md/util/mdSet.bi"

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

mdSetDeclare(MyClass)
Dim As mdSet(MyClass) set

Dim As MyClass foo
foo.myVar = 0 : set.add(foo)
foo.myVar = 1 : set.add(foo)
foo.myVar = 2 : set.add(foo)
foo.myVar = 3 : set.add(foo)
foo.myVar = 0 : set.add(foo) 'no duplicates, so this will not be added

Print "Output 1:"
Dim As MyClass array()
set.toArray(array())
For i As Integer = 0 To UBound(array)
	Print array(i).myVar
Next
Print

Print "Output 2:"
Dim As MyClass element
ForEach(MyClass, element In set)
	Print element.myVar
NextEach
Print

Print "Output 3:"
Dim As mdIterator(MyClass) iterator = set.iterator()
While iterator.hasNext()
	Print iterator.nex().myVar
Wend
Print

Sleep
