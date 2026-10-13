#Include Once "md/util/mdList.bi"
#Include Once "md/lang/mdInteger.bi"

mdListDeclare(mdInteger)
Dim As mdList(mdInteger) list

list.add(0)
list.add(1)
list.add(2)
list.add(3)
list.add(0)

Print "Output 1:"
For i As Integer = 0 To list.size() - 1
	Print list.get(i)
Next
Print

Print "Output 2:"
Dim As mdInteger element
ForEach(mdInteger, element In list)
	Print element
NextEach
Print

Print "Output 3:"
Dim As mdIterator(mdInteger) iterator = list.iterator()
While iterator.hasNext()
	Print iterator.nex()
Wend
Print

'############

Dim As mdList(mdInteger) subList = list.subList(1, 3)

Print "Output 4:"
ForEach(mdInteger, element In subList)
	Print element
NextEach
Print

'############

Dim As mdList(mdInteger) newList
newList.addAll(0, list)

Print "Output 5:"
For i As Integer = 0 To newList.size() - 1
	Print newList.get(i)
Next
Print

Print "Output 6:"
ForEach(mdInteger, element In newList)
	Print element
NextEach
Print

Sleep