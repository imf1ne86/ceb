#Include Once "md/util/mdList.bi"
mdListDeclare(String)

#Include Once "md/util/mdMap.bi"
mdMapDeclare(String, mdList(String))

'family map
Dim As mdMap(String, mdList(String)) families

'create some families
Dim As mdList(String) does
does.add("Walter")
does.add("Jack")
does.add("Carmen")

Dim As mdList(String) johnsons
johnsons.add("Marcus")
johnsons.add("Diana")
johnsons.add("Bred")
johnsons.add("Bianca")

Dim As mdList(String) smiths
smiths.add("Alexander")
smiths.add("Lilly")


'add families to map
Dim As mdList(String) tempList
tempList = families.put("Doe", does)
tempList = families.put("Johnson", johnsons)
tempList = families.put("Smith", smiths)

Dim As String userInput
Dim As mdSet(String) familyNames = families.keySet()
Do
	Print !"Meet these families:\n"
	Dim As String familyName
	ForEach (String, familyName In familyNames)
		Print !"\"" & familyName & !"\""
	NextEach
	Print !"\nTo exit type \"exit\"\n\n"
	
	Input userInput
	If LCase(userInput) = "exit" Then
		Exit Do
	Else
		Cls
		If families.containsKey(userInput) Then
			Print "These are the members of family " & userInput & ":"
			Dim As mdList(String) familyMembers = families.get(userInput)
			Dim As String familyMember
			ForEach (String, familyMember In familyMembers)
				Print "- " & familyMember
			NextEach
			Print !"\n\n"
		Else
			Print !"This family does not exist.\n"
		EndIf
	EndIf
Loop
