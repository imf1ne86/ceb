#Include Once "md/util/mdSet.bi"

mdSetDeclare(String)
Dim As mdSet(String) foo
Print "Is empty? " & foo.isEmpty(), foo.size()
Print foo.add("0")
Print foo.add("1")
Print foo.add("2")
Print foo.add("1")
Print foo.add("3")
'Print "removing: " & foo.remove("2")
Print "Is empty? " & foo.isEmpty(), foo.size()
Dim As String element
ForEach(String, element In foo)
	Print element
NextEach
Print
Print "------------------------"
Print
Dim As String array()
Print foo.toArray(array())
For i As Integer = 0 To UBound(array)
	Print i, array(i)
Next
Print
Print "------------------------"
Print
Dim As mdSet(String) bar = foo
'foo.clear()
Print "Is empty? " & foo.isEmpty(), foo.size()
Print
Print "------------------------"
Print
Print bar.size()
Print "hash: " & bar.hashCode()
Print
Print "------------------------"
Print
'Print "remove", foo.removeAll(bar)
ForEach(String, element In foo)
	Print element
NextEach
Print "retain", foo.retainAll(bar)
ForEach(String, element In foo)
	Print element
NextEach


Sleep
