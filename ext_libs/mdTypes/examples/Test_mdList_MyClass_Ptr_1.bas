#Include Once "md/util/mdList.bi"

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
mdListDeclare(MyClass, Ptr) 'specify Ptr for macro declaration
Dim As mdList(MyClass, Ptr) list 'specify Ptr for variable declaration

'generate some Ptr vars and add them to the list
Dim As MyClass Ptr foo1 = New MyClass
Dim As MyClass Ptr foo2 = New MyClass
Dim As MyClass Ptr foo3 = New MyClass
Dim As MyClass Ptr foo4 = New MyClass
Dim As MyClass Ptr foo5 = New MyClass
foo1->myVar = 0 : list.add(foo1)
foo2->myVar = 1 : list.add(foo2)
foo3->myVar = 2 : list.add(foo3)
foo4->myVar = 3 : list.add(foo4)
foo5->myVar = 0 : list.add(foo5)

Print "Output 1:"
For i As Integer = 0 To list.size() - 1
	Print list.get(i)->myVar 'we get a Ptr here
Next
Print

Print "Output 2:"
Dim As MyClass Ptr element 'use Ptr here, too
ForEach(MyClass, element In list, Ptr) 'specify Ptr for ForEach
	Print element->myVar
NextEach
Print

Print "Output 3:"
Dim As mdIterator(MyClass, Ptr) iterator = list.iterator() 'specify Ptr for mdIterator variable declaration
While iterator.hasNext()
	Print iterator.nex()->myVar
Wend
Print

'the list will not deallocate Ptr, so do it by hand
Delete foo1
Delete foo2
Delete foo3
Delete foo4
Delete foo5

Sleep

