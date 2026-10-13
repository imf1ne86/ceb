#Include Once "md/util/mdMap.bi"

mdMapDeclare(String, String)
Dim As mdMap(String, String) map

Print map.size(), map.isEmpty()
Print "previous value of key 0 = " & map.put("0", "-0")
Print "previous value of key 1 = " & map.put("1", "-1")
Print "previous value of key 2 = " & map.put("2", "-2")
Print "previous value of key 3 = " & map.put("3", "-3")
Print map.size(), map.isEmpty()
Print "2 = " & map.get("2")
Print "3 = " & map.get("3")
Print "4 = " & map.get("4")
Print "previous value of key 0 = " & map.put("0", "-00")
Print
Print "------------------------"
Print

Dim As mdMap(String, String) newMap = map
'Print newMap.remove("2")
Print "Size: " & newMap.size()

#Include Once "md/util/mdList.bi"
mdListDeclare(String)

Dim As mdSet(String) set = newMap.keySet()
Dim As mdList(String) list = newMap.values()

Print "0 = " & newMap.get("0")
Print "1 = " & newMap.get("1")
Print "2 = " & newMap.get("2")
Print "3 = " & newMap.get("3")
Print "4 = " & newMap.get("4")

Dim As String element
ForEach (String, element In set)
	Print "keys: " & element
NextEach
ForEach (String, element In list)
	Print "values: " & element
NextEach
Dim As Integer i = 0
Dim As String tempValue
Dim As String key
ForEach (String, key In set)
	Print "keys and values: ", key, list.get(i)
	i += 1
NextEach
Print
Print "------------------------"
Print

Print newMap.containsKey("1")
Print newMap.containsKey("4")
Print newMap.containsValue("-1")
Print newMap.containsValue("-4")

newMap.clear()
Print newMap.size(), newMap.isEmpty()

Sleep
