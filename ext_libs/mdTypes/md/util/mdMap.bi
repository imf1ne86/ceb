'mdMap - by MOD
'20131223

'http://docs.oracle.com/javase/6/docs/api/java/util/Map.html


#Ifndef Boolean
	#Define Boolean Integer
#EndIf
#Ifndef FALSE
	#Define FALSE 0
	#Define TRUE (Not FALSE)
#EndIf
#Ifndef NULL
	#Define NULL CPtr(Any Ptr, 0)
#EndIf

#Define mdMapEntryPtrPtr(K, PK, V, PV) mdMapEntry##K##PK##V##PV
#Define mdMapEntryPtr(K, PK, V, PV) mdMapEntryPtrPtr(K, PK, V, PV)
#Define mdMapEntry(K, V) mdMapEntryPtrPtr(K, , V, )

#Define mdMapPtr(K, PK, V, PV) mdMap##K##PK##V##PV
#Define mdMap(K, V) mdMapPtr(K, , V, )

#Macro mdMapDeclarePtrPtr(K, PK, V, PV)

#Include Once "md/util/mdCollection.bi"
mdCollectionDeclarePtr(V, PV)

#Include Once "md/util/mdSet.bi"
mdSetDeclarePtr(K, PK)

#Ifndef mdMapEntry##K##PK##V##PV
'#Define __MDMAPENTRY__

Type mdMapEntry##K##PK##V##PV
	Public:
	Declare Constructor ()
	Declare Constructor (ByRef key As K PK, ByRef value As V PV)
	'Declare Function equals(ByRef o As mdObject) As Boolean
	Declare Function equals(ByRef o As mdMapEntry##K##PK##V##PV) As Boolean
	Declare Function getKey() As K PK
	Declare Function getValue() As V PV
	Declare Function hashCode() As Integer
	Declare Function setValue(ByRef value As V PV) As V PV
	Declare Function toString() As String
	
	Declare Operator Cast() As String
	
	Private:
	As K PK key
	As V PV value
End Type

Constructor mdMapEntry##K##PK##V##PV ()
	
End Constructor

Constructor mdMapEntry##K##PK##V##PV (ByRef key As K PK, ByRef value As V PV)
	This.key = key
	This.value = value
End Constructor

'Declare Function mdMapEntry##K##PK##V##PV.equals(ByRef o As mdObject) As Boolean

Function mdMapEntry##K##PK##V##PV.equals(ByRef o As mdMapEntry##K##PK##V##PV) As Boolean
	If o.getKey() = This.key And o.getValue() = This.value Then
		Return TRUE
	EndIf
	Return FALSE
End Function

Function mdMapEntry##K##PK##V##PV.getKey() As K PK
	Return This.key
End Function

Function mdMapEntry##K##PK##V##PV.getValue() As V PV
	Return This.value
End Function

Function mdMapEntry##K##PK##V##PV.hashCode() As Integer
	Return Cast(Integer, @This)
End Function

Function mdMapEntry##K##PK##V##PV.setValue(ByRef value As V PV) As V PV
	Dim As V PV tempValue = This.value
	This.value = value
	Return tempValue
End Function

Function mdMapEntry##K##PK##V##PV.toString() As String
	Return Str(This.key) & "=" & Str(This.value)
End Function

Operator mdMapEntry##K##PK##V##PV.Cast() As String
	Return This.toString()
End Operator

Operator = (ByRef lhs As mdMapEntry##K##PK##V##PV, ByRef rhs As mdMapEntry##K##PK##V##PV) As Integer
	Return @lhs = @rhs
End Operator

mdSetDeclare(mdMapEntry##K##PK##V##PV)

#EndIf '__MDMAPENTRY__

#Ifndef mdMapNode##K##PK##V##PV
'#Define __MDMAPNODE__

Type mdMapNode##K##PK##V##PV
	nex As mdMapNode##K##PK##V##PV Ptr
	value As mdMapEntry##K##PK##V##PV
End Type

#EndIf '__MDMAPNODE__

#Ifndef mdMap##K##PK##V##PV
'#Define __MDMAP_BI__

Type mdMap##K##PK##V##PV
	Public:
	Declare Constructor ()
	Declare Constructor (ByRef m As mdMap##K##PK##V##PV)
	Declare Destructor ()
	Declare Sub Clear()
	'Declare Function containsKey(ByRef key As mdObject) As Boolean
	Declare Function containsKey(ByRef key As K PK) As Boolean
	'Declare Function containsValue(ByRef value As mdObject) As Boolean
	Declare Function containsValue(ByRef value As V PV) As Boolean
	Declare Function entrySet() As mdSet(mdMapEntry##K##PK##V##PV)
	'Declare Function equals(ByRef o As mdObject) As Boolean
	Declare Function equals(ByRef o As mdMap##K##PK##V##PV) As Boolean
	'Declare Function get(ByRef key As mdObject) As V PV
	Declare Function get(ByRef key As K PK) As V PV
	Declare Function hashCode() As Integer
	Declare Function isEmpty() As Boolean
	Declare Function keySet() As mdSet##K##PK
	Declare Function put(ByRef key As K PK, ByRef value As V PV) As V PV
	Declare Sub putAll(ByRef m As mdMap##K##PK##V##PV)
	'Declare Function remove(ByRef key As mdObject) As V PV
	Declare Function remove(ByRef key As K PK) As V PV
	Declare Function size() As Integer
	Declare Function toString() As String
	Declare Function values() As mdCollection##V##PV
	
	Declare Operator Cast() As Integer
	Declare Operator Cast() As String
	Declare Operator Let(ByRef c As mdMap##K##PK##V##PV)
	
	Private:
	node As mdMapNode##K##PK##V##PV
	
End Type

Constructor mdMap##K##PK##V##PV ()
	
End Constructor

Constructor mdMap##K##PK##V##PV (ByRef m As mdMap##K##PK##V##PV)
	This.putAll(m)
End Constructor

Destructor mdMap##K##PK##V##PV ()
	Dim As mdMapNode##K##PK##V##PV Ptr currentNode = @This.node, nextNode
	While currentNode->nex <> NULL
		nextNode = currentNode->nex->nex
		Delete currentNode->nex
		currentNode->nex = nextNode
	Wend
End Destructor

Sub mdMap##K##PK##V##PV.clear()
	This.Destructor()
End Sub

'Function mdMap##K##PK##V##PV.containsKey(ByRef key As mdObject) As Boolean

Function mdMap##K##PK##V##PV.containsKey(ByRef key As K PK) As Boolean
	Dim As mdMapNode##K##PK##V##PV Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		If currentNode->nex->value.getKey() = key Then
			Return TRUE
		EndIf
		currentNode = currentNode->nex
	Wend
	Return FALSE
End Function

'Function mdMap##K##PK##V##PV.containsValue(ByRef value As mdObject) As Boolean

Function mdMap##K##PK##V##PV.containsValue(ByRef value As V PV) As Boolean
	Dim As mdMapNode##K##PK##V##PV Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		If currentNode->nex->value.getValue() = value Then
			Return TRUE
		EndIf
		currentNode = currentNode->nex
	Wend
	Return FALSE
End Function

Function mdMap##K##PK##V##PV.entrySet() As mdSet(mdMapEntry##K##PK##V##PV)
	Dim As mdSet(mdMapEntry##K##PK##V##PV) newmdSet
	Dim As mdMapNode##K##PK##V##PV Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		newmdSet.add(currentNode->nex->value)
		currentNode = currentNode->nex
	Wend
	Return newmdSet
End Function

'Function mdMap##K##PK##V##PV.equals(ByRef o As mdObject) As Boolean

Function mdMap##K##PK##V##PV.equals(ByRef o As mdMap##K##PK##V##PV) As Boolean
	If @This = @o Then
		Return TRUE
	EndIf
	Return FALSE
End Function

'Function mdMap##K##PK##V##PV.get(ByRef key As mdObject) As V PV

Function mdMap##K##PK##V##PV.get(ByRef key As K PK) As V PV
	Dim As mdMapNode##K##PK##V##PV Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		If currentNode->nex->value.getKey() = key Then
			Return currentNode->nex->value.getValue()
		EndIf
		currentNode = currentNode->nex
	Wend
	Dim As V PV emptyValue
	Return emptyValue
End Function

Function mdMap##K##PK##V##PV.hashCode() As Integer
	Return Cast(Integer, @This)
End Function

Function mdMap##K##PK##V##PV.isEmpty() As Boolean
	If This.size() = 0 Then
		Return TRUE
	EndIf
	Return FALSE
End Function

Function mdMap##K##PK##V##PV.keySet() As mdSet##K##PK
	Dim As mdSet##K##PK newSet
	Dim As mdMapNode##K##PK##V##PV Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		newSet.add(currentNode->nex->value.getKey())
		currentNode = currentNode->nex
	Wend
	Return newSet
End Function

Function mdMap##K##PK##V##PV.put(ByRef key As K PK, ByRef value As V PV) As V PV
	Dim As mdMapNode##K##PK##V##PV Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		If currentNode->nex->value.getKey() = key Then
			Dim As V PV tempValue = currentNode->nex->value.getValue(), unusedValue
			unusedValue = currentNode->nex->value.setValue(value)
			Return tempValue
		EndIf
		currentNode = currentNode->nex
	Wend
	
	Dim As mdMapEntry##K##PK##V##PV Ptr newEntry = New mdMapEntry##K##PK##V##PV(key, value)
	currentNode = @This.node
	While currentNode->nex <> NULL
		currentNode = currentNode->nex
	Wend
	
	currentNode->nex = New mdMapNode##K##PK##V##PV
	If currentNode->nex = NULL Then
	Else
		currentNode->nex->value = *newEntry
	EndIf
	Dim As V PV emptyValue
	Return emptyValue
End Function

Sub mdMap##K##PK##V##PV.putAll(ByRef m As mdMap##K##PK##V##PV)
	Dim As mdSet##K##PK newSet = m.keySet()
	Dim As mdCollection##V##PV newCollection = m.values()
	Dim As V PV valueArray()
	newCollection.toArray(valueArray())
	
	Dim As Integer i = 0
	Dim As V PV tempValue
	Dim As K PK key
	ForEach (K, key In newSet, PK)
		tempValue = This.put(key, valueArray(i))
		i += 1
	NextEach
End Sub

'Function mdMap##K##PK##V##PV.remove(ByRef key As mdObject) As V PV

Function mdMap##K##PK##V##PV.remove(ByRef key As K PK) As V PV
	Dim As mdMapNode##K##PK##V##PV Ptr currentNode = @This.node, nextNode
	While currentNode->nex <> NULL
		If currentNode->nex->value.getKey() = key Then
			Dim As V PV tempValue = currentNode->nex->value.getValue()
			nextNode = currentNode->nex->nex
			Delete currentNode->nex
			currentNode->nex = nextNode
			Return tempValue
		EndIf
		
		currentNode = currentNode->nex
	Wend
	Dim As V PV emptyValue
	Return emptyValue
End Function

Function mdMap##K##PK##V##PV.size() As Integer
	Dim As Integer count = 0
	Dim As mdMapNode##K##PK##V##PV Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		count += 1
		currentNode = currentNode->nex
	Wend
	Return count
End Function

Function mdMap##K##PK##V##PV.toString() As String
	Dim As String ret = "{"
	Dim As mdMapNode##K##PK##V##PV Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		ret &= Str(currentNode->nex->value)
		currentNode = currentNode->nex
		If currentNode->nex <> NULL Then
			ret &= ", "
		EndIf
	Wend
	ret &= "}"
	Return ret
End Function

Function mdMap##K##PK##V##PV.values() As mdCollection##V##PV
	Dim As mdCollection##V##PV newCollection
	Dim As mdMapNode##K##PK##V##PV Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		newCollection.add(currentNode->nex->value.getValue())
		currentNode = currentNode->nex
	Wend
	Return newCollection
End Function

Operator mdMap##K##PK##V##PV.Cast() As Integer
	Return This.hashCode()
End Operator

Operator mdMap##K##PK##V##PV.Cast() As String
	Return This.toString()
End Operator

Operator mdMap##K##PK##V##PV.Let(ByRef c As mdMap##K##PK##V##PV)
	This.clear()
	This.putAll(c)
End Operator

#EndIf '__MDMAP_BI__

#EndMacro

#Define mdMapDeclare(K, V) mdMapDeclarePtrPtr(K, , V, )
#Define mdMapDeclarePtr(K, PK, V, PV) mdMapDeclarePtrPtr(K, PK, V, PV)
