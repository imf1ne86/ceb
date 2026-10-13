#Include Once "md/util/mdStack.bi"

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

mdStackDeclare(MyClass)
Dim As mdStack(MyClass) stack

Dim As MyClass foo
foo.myVar = 0 : foo = stack.push(foo)
foo.myVar = 1 : foo = stack.push(foo)
foo.myVar = 2 : foo = stack.push(foo)
foo.myVar = 3 : foo = stack.push(foo)
foo.myVar = 4 : foo = stack.push(foo)

Print "Look at the top of the stack:", stack.peek_().myVar
Print

foo.myVar = 1
Print "find 1-based index of '1':", stack.search(foo)
Print

Print "Get all elements:"
While Not stack.empty
	Print stack.pop().myVar
Wend

Sleep

