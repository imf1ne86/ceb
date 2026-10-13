'mdSet - by MOD
'20131223

'http://docs.oracle.com/javase/6/docs/api/java/util/Set.html


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

#Define mdSetPtr(E, P) mdSet##E##P
#Define mdSet(E, P...) mdSetPtr(E, P)

#Macro mdSetDeclarePtr(E, P)

#Ifndef mdBasicNode##E##P
'#Define __MBBASICNODE__

Type mdBasicNode##E##P
	nex As mdBasicNode##E##P Ptr
	value As E P
End Type

#EndIf '__MBBASICNODE__

#Include Once "md/util/mdCollection.bi"
mdCollectionDeclarePtr(E, P)

#Include Once "md/util/mdIterator.bi"
mdIteratorDeclarePtr(E, P)

#Ifndef mdSet##E##P
'#Define __MDSET_BI__

Type mdSet##E##P Extends mdCollection##E##P
	Public:
	Declare Constructor ()
	Declare Constructor (ByRef element As E P)
	Declare Constructor (ByRef s As mdCollection##E##P)
	Declare Destructor ()
	Declare Function add(ByRef element As E P) As Boolean
	Declare Function addAll(ByRef c As mdCollection##E##P) As Boolean
	Declare Sub clear()
	'Declare Function contains(ByRef o As mdObject) As Boolean
	Declare Function contains(ByRef o As E P) As Boolean
	Declare Function containsAll(ByRef c As mdCollection##E##P) As Boolean
	Declare Function equals(ByRef o As mdCollection##E##P) As Boolean
	Declare Function hashCode() As Integer
	Declare Function isEmpty() As Boolean
	Declare Function iterator() As mdIterator##E##P
	'Declare Function remove(ByRef o As mdObject) As Boolean
	Declare Function remove(ByRef o As E P) As Boolean
	Declare Function removeAll(ByRef c As mdCollection##E##P) As Boolean
	Declare Function retainAll(ByRef c As mdCollection##E##P) As Boolean
	Declare Function size() As Integer
	'Declare Function toArray(array() As mdObject) As Boolean
	Declare Function toArray(array() As E P) As Boolean
	Declare Function toString() As String
	
	Declare Operator Cast() As Integer
	Declare Operator Cast() As String
	Declare Operator Let(ByRef c As mdCollection##E##P)
End Type

Constructor mdSet##E##P ()
	
End Constructor

Constructor mdSet##E##P (ByRef element As E P)
	This.add(element)
End Constructor

Constructor mdSet##E##P (ByRef s As mdCollection##E##P)
	This.addAll(s)
End Constructor

Destructor mdSet##E##P ()
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node, nextNode
    While currentNode->nex <> NULL
    	nextNode = currentNode->nex->nex
        Delete currentNode->nex
        currentNode->nex = nextNode
    Wend
End Destructor

Function mdSet##E##P.add(ByRef element As E P) As Boolean
	If This.contains(element) Then
		Return FALSE
	EndIf
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
    While currentNode->nex <> NULL
        currentNode = currentNode->nex
    Wend
    
    currentNode->nex = New mdBasicNode##E##P
    If currentNode->nex = NULL Then
        Return FALSE
    Else
        currentNode->nex->value = element
        Return TRUE
    EndIf
End Function

Function mdSet##E##P.addAll(ByRef c As mdCollection##E##P) As Boolean
	Dim As E P temp()
	c.toArray(temp())
	If @temp(0) = NULL Then
		Return FALSE
	EndIf
	For i As Integer = LBound(temp) To UBound(temp)
		This.add(temp(i))
	Next
	Return TRUE
End Function

Sub mdSet##E##P.clear()
	This.Destructor()
End Sub

'Function mdSet##E##P.contains(ByRef o As mdObject) As Boolean

Function mdSet##E##P.contains(ByRef o As E P) As Boolean
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		If currentNode->nex->value = o Then
			Return TRUE
		EndIf
		currentNode = currentNode->nex
	Wend
	Return FALSE
End Function

Function mdSet##E##P.containsAll(ByRef c As mdCollection##E##P) As Boolean
	Dim As E P temp()
	c.toArray(temp())
	For i As Integer = LBound(temp) To UBound(temp)
		If This.contains(temp(i)) = FALSE Then
			Return FALSE
		EndIf
	Next
	Return TRUE
End Function

Function mdSet##E##P.equals(ByRef o As mdCollection##E##P) As Boolean
	If @This = @o Then
		Return TRUE
	EndIf
	Return FALSE
End Function

Function mdSet##E##P.hashCode() As Integer
	Dim As Integer hash = 1
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
    While currentNode->nex <> NULL
    	hash = 31 * hash + IIf(currentNode->nex = NULL, 0, Cast(UInteger, currentNode->nex) \ This.size())
    	currentNode = currentNode->nex
    Wend
    Return hash
End Function

Function mdSet##E##P.isEmpty() As Boolean
	If This.size() = 0 Then
		Return TRUE
	EndIf
	Return FALSE
End Function

Function mdSet##E##P.iterator() As mdIterator##E##P
	Dim As mdIterator##E##P newIterator = This.node.nex
	Return newIterator
End Function

'Function mdSet##E##P.remove(ByRef o As mdObject) As Boolean

Function mdSet##E##P.remove(ByRef o As E P) As Boolean
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node, nextNode
    While currentNode->nex <> NULL
    	If currentNode->nex->value = o Then
    		nextNode = currentNode->nex->nex
    		Delete currentNode->nex
    		currentNode->nex = nextNode
    		Return TRUE
    	EndIf
    	
        currentNode = currentNode->nex
    Wend
    Return FALSE
End Function

Function mdSet##E##P.removeAll(ByRef c As mdCollection##E##P) As Boolean
	Dim As Integer cSize = c.size()
	
	If cSize = 0 Or This.size() = 0 Then
		Return FALSE
	EndIf
	
	Dim As E P temp()
	c.toArray(temp())
	For i As Integer = LBound(temp) To UBound(temp)
		If This.contains(temp(i)) Then
			This.remove(temp(i))
		EndIf
	Next
	Return TRUE
End Function

Function mdSet##E##P.retainAll(ByRef c As mdCollection##E##P) As Boolean
	Dim As Integer thisSize = This.size()
	
	If thisSize = 0 Or c.size() = 0 Then
		Return FALSE
	EndIf
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node, nextNode
	While currentNode->nex <> NULL
		If c.contains(currentNode->nex->value) = FALSE Then
			nextNode = currentNode->nex->nex
    		Delete currentNode->nex
    		currentNode->nex = nextNode
		EndIf
		currentNode = currentNode->nex
	Wend
	Return TRUE
End Function

Function mdSet##E##P.size() As Integer
	Dim As Integer count = 0
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		count += 1
		currentNode = currentNode->nex
	Wend
	Return count
End Function

'Function mdSet##E##P.toArray(array() As mdObject) As Boolean

Function mdSet##E##P.toArray(array() As E P) As Boolean
	Dim As Integer thisSize = This.size(), i = 0
	If thisSize = 0 Then
		Return FALSE
	EndIf
	
	ReDim array(0 To thisSize - 1)
	If @array(0) = NULL Then
		Return FALSE
	EndIf
	
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		array(i) = currentNode->nex->value
		i += 1
		currentNode = currentNode->nex
	Wend
	Return TRUE
End Function

Function mdSet##E##P.toString() As String
	Dim As String ret = "["
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		ret &= Str(currentNode->nex->value)
		currentNode = currentNode->nex
		If currentNode->nex <> NULL Then
			ret &= ", "
		EndIf
	Wend
	ret &= "]"
	Return ret
End Function

Operator mdSet##E##P.Cast() As Integer
	Return This.hashCode()
End Operator

Operator mdSet##E##P.Cast() As String
	Return This.toString()
End Operator

Operator mdSet##E##P.Let(ByRef c As mdCollection##E##P)
	This.clear()
	This.addAll(c)
End Operator

#EndIf '__MDSET_BI__

#EndMacro

#Define mdSetDeclare(E, P...) mdSetDeclarePtr(E, P)
