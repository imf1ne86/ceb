#Include Once "md/util/mdMap.bi"

'This exampe shows the usage with Ptr types
'Using Ptr types, you don't need any special type constructors and operators,
'that's why they are commented out here

Type MyClass
	'Declare Constructor ()
	'Declare Operator Cast() As String
	As Integer myVar
End Type
''must have a default constructor or no explicit constructor at all!
'Constructor MyClass ()
'	
'End Constructor
''must implement cast to string for string representation
'Operator MyClass.Cast() As String
'	Return Str(myVar)
'End Operator
''operator for comparision must exist!
'Operator = (ByRef lhs As MyClass, ByRef rhs As MyClass) As Integer
'	Return lhs.myVar = rhs.myVar
'End Operator


'definitions with Ptr
mdMapDeclarePtr(Long, , MyClass, Ptr) 'add Ptr to MyClass, leave Long as it is
Dim As mdMapPtr(Long, , MyClass, Ptr) map 'add Ptr to MyClass, leave Long as it is

'generate some Ptr vars and add them to the map
Dim As MyClass Ptr foo1 = New MyClass
Dim As MyClass Ptr foo2 = New MyClass
Dim As MyClass Ptr foo3 = New MyClass
Dim As MyClass Ptr foo4 = New MyClass
Dim As MyClass Ptr foo5 = New MyClass
Dim As MyClass Ptr tempFoo
foo1->myVar = 0 : tempFoo = map.put(0, foo1)
foo2->myVar = 1 : tempFoo = map.put(1, foo2)
foo3->myVar = 2 : tempFoo = map.put(2, foo3)
foo4->myVar = 3 : tempFoo = map.put(3, foo4)
foo5->myVar = 0 : tempFoo = map.put(0, foo5) 'no duplicate keys, so this will not be added


#Include Once "md/util/mdList.bi"
mdListDeclare(MyClass, Ptr) 'specifiy a MyClass Ptr list

Dim As mdSet(Long) set = map.keySet()
Dim As mdList(MyClass, Ptr) list = map.values() 'use the MyClass Ptr list

Print "Output 1:"
For i As Integer = 0 To 3
	Print "Key: " & i, "Value: " & list.get(i)->myVar
Next
Print

Print "Output 2 (Keys):"
Dim As Long element1
ForEach (Long, element1 In set)
	Print "Key: " & element1
NextEach

Print "Output 2 (Values):"
Dim As MyClass Ptr element2 'use Ptr here
ForEach (MyClass, element2 In list, Ptr) 'specify Ptr for ForEach
	Print "Value: " & element2->myVar
NextEach
Print

Print "Output 3:"
Dim As Integer i
Dim As Long key
ForEach (Long, key In set)
	Print "Key: " & key, "Value: " & list.get(i)->myVar
	i += 1
NextEach
Print

'the map will not deallocate Ptr, so do it by hand
Delete foo1
Delete foo2
Delete foo3
Delete foo4
Delete foo5

Sleep
