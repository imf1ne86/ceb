#Include Once "md/util/mdList.bi"

mdListDeclare(String)
Dim As mdList(String) list
list.add("0")
list.add("1")
list.add("2")
list.add("3")
list.add("4")
list.add("5")

For i As Integer = 0 To list.size() - 1
	Print list.get(i)
Next

Dim As String element
ForEach(String, element In list)
	Print element
NextEach

Dim As mdIterator(String) iterator = list.iterator()
While iterator.hasNext()
	Print iterator.nex()
Wend

Sleep

Type foo
	Declare Constructor ()
	As mdList(String) bar
End Type
Constructor foo ()
	bar.add("0")
	bar.add("1")
	bar.add("2")
End Constructor

Dim As foo baz(5)
Dim As String el
ForEach (String, el in baz(0).bar)
	Print el
NextEach
ForEach (String, el in baz(0).bar)
	Print el
NextEach

Sleep



