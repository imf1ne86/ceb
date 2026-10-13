#Include Once "md/util/mdVector.bi"

mdVectorDeclare(String)

Dim As mdVector(String) tempVector

tempVector.add("0")
tempVector.add("1")
tempVector.add("2")
tempVector.add("3")
tempVector.add("0")

Dim As mdVector(String) vector = tempVector

Dim As String element
ForEach(String, element In vector)
	Print element
NextEach

Print "clear and readd"
vector.clear()
vector.addAll(tempVector)

ForEach(String, element In vector)
	Print element
NextEach

Print "removeAllElements and clone"
vector.removeAllElements()
vector = *tempVector.clone()

ForEach(String, element In vector)
	Print element
NextEach

Print
Print "-------"
Print

Print vector.firstElement()
Print vector.elementAt(2)
Print vector.lastElement()

Print
Print "-------"
Print

Dim As String array()
vector.copyInto(array())
For i As Integer = LBound(array) To UBound(array)
	Print i, array(i)
Next

Print
Print "-------"
Print

Print "clear and clone"
vector.clear()
vector = *tempVector.clone()

Print
Print "-------"
Print "index of ""6"":", vector.indexOf("6")
Print "last index of ""6"":", vector.lastIndexOf("6")
Print "-------"
Print

Print "remove index inclusive 1 to exclusive 3"
vector.removeRange(1, 3)
ForEach(String, element In vector)
	Print element
NextEach


Sleep
