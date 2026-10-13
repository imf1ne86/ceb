#Include Once "md/util/mdList.bi"
#Include Once "md/lang/mdInteger.bi"

mdListDeclare(mdInteger) 'inner lists will contain mdInteger

mdListDeclare(mdList(mdInteger)) 'outer list will contain mdList(mdInteger)

'prepare inner lists
Dim As mdList(mdInteger) innerLists(0 To 3)
For i As Integer = LBound(innerLists) To UBound(innerLists)
	innerLists(i).add(0)
	innerLists(i).add(1)
	innerLists(i).add(2)
	innerLists(i).add(3)
	innerLists(i).add(0)
Next

'prepare outer list
Dim As mdList(mdListmdInteger) outerList 'we can't use recursive macros in FreeBASIC so we have to do it by hand
For i As Integer = LBound(innerLists) To UBound(innerLists)
	outerList.add(innerLists(i))
Next


Print "Output 1:"
Dim As mdList(mdInteger) innerElements
Dim As mdInteger singleElement
ForEach(mdList(mdInteger), innerElements In outerList) 'extract all inner lists
	ForEach(mdInteger, singleElement In innerElements) 'extract values of all inner lists
		Print singleElement
	NextEach
NextEach
Print

Sleep