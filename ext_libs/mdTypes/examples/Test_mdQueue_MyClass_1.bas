#Include "md/util/mdQueue.bi"

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

mdQueueDeclare(MyClass)
Dim As mdQueue(MyClass) queue

Dim As MyClass foo
foo.myVar = 0 : queue.offer(foo)
foo.myVar = 1 : queue.offer(foo)
foo.myVar = 2 : queue.offer(foo)
foo.myVar = 3 : queue.offer(foo)
foo.myVar = 0 : queue.offer(foo)

Print "Output 1:"
Dim As MyClass array()
queue.toArray(array())
For i As Integer = 0 To UBound(array)
	Print array(i).myVar
Next
Print

Print "Output 2:"
Dim As MyClass element
ForEach(MyClass, element In queue)
	Print element.myVar
NextEach
Print

Print "Output 3:"
Dim As mdIterator(MyClass) iterator = queue.iterator()
While iterator.hasNext()
	Print iterator.nex().myVar
Wend
Print

Print "Size of queue: " & queue.size()
Print

Print "Removal Output 4:"
While queue.isEmpty = FALSE
	Print queue.poll().myVar
Wend
Print

Print "Size of queue: " & queue.size()
Print

Sleep

