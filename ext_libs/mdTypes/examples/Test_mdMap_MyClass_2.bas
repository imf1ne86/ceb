#Include Once "md/util/mdMap.bi"

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


mdMapDeclare(Long, MyClass)
Dim As mdMap(Long, MyClass) map

Dim As MyClass foo, tempFoo
foo.myVar = 0 : tempFoo = map.put(0, foo)
foo.myVar = 1 : tempFoo = map.put(1, foo)
foo.myVar = 2 : tempFoo = map.put(2, foo)
foo.myVar = 3 : tempFoo = map.put(3, foo)
foo.myVar = 0 : tempFoo = map.put(0, foo) 'no duplicate keys, so this will not be added


Dim As mdSet(mdMapEntry(Long, MyClass)) set = map.entrySet()
Dim As mdMapEntry(Long, MyClass) element
ForEach (mdMapEntry(Long, MyClass), element In set)
	Print element.getKey(), element.getValue().myVar
NextEach

Sleep
