#Include Once "md/util/mdStack.bi"

mdStackDeclare(String)

Dim As mdStack(String) tempStack

tempStack.add("0")
tempStack.add("1")
tempStack.add("2")
tempStack.add("3")
tempStack.add("0")

Dim As mdStack(String) stack = tempStack

Dim As String element
ForEach(String, element In stack)
	Print element
NextEach

Print "clear and readd"
stack.clear()
stack.addAll(tempStack)

ForEach(String, element In stack)
	Print element
NextEach

Print "removeAllElements and clone"
stack.removeAllElements()
stack = *tempStack.clone()

ForEach(String, element In stack)
	Print element
NextEach

Print
Print "-------"
Print

Print stack.firstElement()
Print stack.elementAt(2)
Print stack.lastElement()

Print
Print "-------"
Print

Dim As String array()
stack.copyInto(array())
For i As Integer = LBound(array) To UBound(array)
	Print i, array(i)
Next

Print
Print "-------"
Print

Print "clear and clone"
stack.clear()
stack = *tempStack.clone()

Print
Print "-------"
Print "index of ""6"":", stack.indexOf("6")
Print "last index of ""6"":", stack.lastIndexOf("6")
Print "-------"
Print

Print "remove index inclusive 1 to exclusive 3"
stack.removeRange(1, 3)
ForEach(String, element In stack)
	Print element
NextEach
Print "Search ""3"":", stack.search("3")

Sleep
