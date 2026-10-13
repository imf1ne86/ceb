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


#Include Once "md/util/mdList.bi"
mdListDeclare(MyClass)

Dim As mdSet(Long) set = map.keySet()
Dim As mdList(MyClass) list = map.values()

Print "Output 1:"
For i As Integer = 0 To 3
	Print "Key: " & i, "Value: " & list.get(i).myVar
Next
Print

Print "Output 2 (Keys):"
Dim As Long element1
ForEach (Long, element1 In set)
	Print "Key: " & element1
NextEach

Print "Output 2 (Values):"
Dim As MyClass element2
ForEach (MyClass, element2 In list)
	Print "Value: " & element2.myVar
NextEach
Print

Print "Output 3:"
Dim As Integer i
Dim As Long key
ForEach (Long, key In set)
	Print "Key: " & key, "Value: " & list.get(i).myVar
	i += 1
NextEach
Print

Sleep
