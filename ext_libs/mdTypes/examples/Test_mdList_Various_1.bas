#Include Once "md/util/mdList.bi"

mdListDeclare(String)
Dim As mdList(String) foo
Print "Is empty? " & foo.isEmpty(), foo.size()
Print foo.add("0")
Print foo.add("1")
Print foo.add("2")
Print foo.add("1")
Print foo.add(3, "3")
Dim As String temp
ForEach(String, temp In foo)
	Print temp, "temp"
NextEach
'Print "removing: " & foo.remove(0)
'Print "removing: " & foo.remove("0")
Print "Ist leer? " & foo.isEmpty(), foo.size()
For i As Integer = 0 To foo.size() - 1
	Print i, foo.get(i)
Next
If foo.contains("0") Then
	Print "foo contains 0 at index: " & foo.indexOf("0")
EndIf
Print "Last index of 0: " & foo.lastIndexOf("0")
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

mdListDeclare(Single)
Dim As mdList(Single) tt
tt.add(1)
Dim As Single temp2
ForEach(Single, temp2 In tt)
	Print temp2, "temp2"
NextEach

Dim As mdList(String) bar = foo.subList(1, 2)
'foo.clear()
Print "Is empty? " & foo.isEmpty(), foo.size()
Print
Print "------------------------"
Print
Print bar.size()
For i As Integer = 0 To bar.size() - 1
	Print i, bar.get(i)
Next
'Print bar.set(1, "5")
'For i As Integer = 0 To bar.size() - 1
'	Print i, bar.get(i)
'Next
Print "hash: " & bar.hashCode()
Print
Print "------------------------"
Print
'Print "remove", foo.removeAll(bar)
Print "retain", foo.retainAll(bar)
For i As Integer = 0 To foo.size() - 1
	Print i, foo.get(i)
Next


Sleep
