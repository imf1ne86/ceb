'Include mdList Class
#Include Once "md/util/mdList.bi"

'Declare mdList to be ready to use Strings
mdListDeclare(String)


'Include mdMap Class
#Include Once "md/util/mdMap.bi"

'Declare mdMap to be ready to use Longs as keys and mdList with Strings as value
mdMapDeclare(Long, mdList(String))


'Create a map object
Dim As mdMap(Long, mdList(String)) myMap

'Prepare some mdList values and fill myMap
Dim As mdList(String) myList(0 To 4)
For i As Integer = LBound(myList) To UBound(myList)
	myList(i).add("myList " & i)
	For j As Integer = 1 To 5
		myList(i).add(Str(j))
	Next
	
	'use a temp list, because myMap.put returns a mdList
	Dim As mdList(String) tempList = myMap.put(i, myList(i))
Next

Dim As mdList(String) iList = myMap.get(0)
Dim As String element
ForEach (String, element In iList)
	Print "element:", element
NextEach

Sleep
