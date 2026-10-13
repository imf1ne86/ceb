'mdStack - by MOD
'20131223

'http://docs.oracle.com/javase/6/docs/api/java/util/Stack.html


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

#Define mdStackPtr(E, P) mdStack##E##P
#Define mdStack(E, P...) mdStackPtr(E, P)

#Macro mdStackDeclarePtr(E, P)

#Ifndef mdBasicNode##E##P
'#Define __MBBASICNODE__

Type mdBasicNode##E##P
	nex As mdBasicNode##E##P Ptr
	value As E P
End Type

#EndIf '__MBBASICNODE__

#Include Once "md/util/mdVector.bi"
mdVectorDeclarePtr(E, P)

#Include Once "md/util/mdIterator.bi"
mdIteratorDeclarePtr(E, P)

#Ifndef mdStack##E##P
'#Define __MDSTACK_BI__

Type mdStack##E##P Extends mdVector##E##P
	Public:
	Declare Constructor ()
	Declare Constructor (ByRef element As E P)
	Declare Constructor (ByRef l As mdCollection##E##P)
	Declare Destructor ()
	
	Declare Function add(ByRef element As E P) As Boolean
	Declare Function add(ByVal index As Integer, ByRef element As E P) As Boolean
	Declare Function addAll(ByRef c As mdCollection##E##P) As Boolean
	Declare Function addAll(ByVal index As Integer, ByRef c As mdCollection##E##P) As Boolean
	Declare Sub addElement(ByRef element As E P)
	Declare Function capacity() As Integer
	Declare Sub clear()
	'Declare Function clone() As mdObject
	Declare Function clone() As mdStack##E##P Ptr
	'Declare Function contains(ByRef o As mdObject) As Boolean
	Declare Function contains(ByRef o As E P) As Boolean
	Declare Function containsAll(ByRef c As mdCollection##E##P) As Boolean
	Declare Sub copyInto(anArray() As E P)
	Declare Function elementAt(ByVal index As Integer) As E P
	'Declare Function elements() As mdEnumeration##E##P
	Declare Function empty() As Boolean
	Declare Sub ensureCapacity(ByVal minCapacity As Integer)
	Declare Function equals(ByRef o As mdCollection##E##P) As Boolean
	Declare Function firstElement() As E P
	Declare Function get(ByVal index As Integer) As E P
	Declare Function hashCode() As Integer
	'Declare Function indexOf(ByRef o As mdObject) As Integer
	Declare Function indexOf(ByRef o As E P) As Integer
	Declare Function indexOf(ByRef o As E P, ByVal index As Integer) As Integer
	Declare Sub insertElementAt(ByRef o As E P, ByVal index As Integer)
	Declare Function isEmpty() As Boolean
	Declare Function iterator() As mdIterator##E##P
	Declare Function lastElement() As E P
	'Declare Function lastIndexOf(ByRef o As mdObject) As Integer
	Declare Function lastIndexOf(ByRef o As E P) As Integer
	Declare Function lastIndexOf(ByRef o As E P, ByVal index As Integer) As Integer
	'Declare Function listIterator() As mdListIterator
	'Declare Function listIterator(ByVal index As Integer) As mdListIterator
	Declare Function peek_() As E P
	Declare Function pop() As E P
	Declare Function push(ByRef item As E P) As E P
	Declare Function remove(ByVal index As Integer) As E P
	'Declare Function remove(ByRef o As mdObject) As Boolean
	Declare Function remove(ByRef o As E P) As Boolean
	Declare Function removeAll(ByRef c As mdCollection##E##P) As Boolean
	Declare Sub removeAllElements()
	Declare Function removeElement(ByRef obj As E P) As Boolean
	Declare Sub removeElementAt(ByVal index As Integer)
	Declare Function retainAll(ByRef c As mdCollection##E##P) As Boolean
	'Declare Function search(ByRef o As mdObject) As Integer
	Declare Function search(ByRef o As E P) As Integer
	Declare Function set(ByVal index As Integer, ByRef element As E P) As E P
	Declare Sub setElementAt(ByRef element As E P, ByVal index As Integer)
	Declare Sub setSize(ByVal newSize As Integer)
	Declare Function size() As Integer
	Declare Function subList(ByVal fromIndex As Integer, ByVal toIndex As Integer) As mdList##E##P
	Declare Function toArray(array() As E P) As Boolean
	Declare Function toString() As String
	Declare Sub trimToSize()
	
	Declare Operator Cast() As Integer
	Declare Operator Cast() As String
	Declare Operator Let(ByRef c As mdCollection##E##P)
	
	'Protected:
	Declare Sub removeRange(ByVal fromIndex As Integer, ByVal toIndex As Integer)
End Type

Constructor mdStack##E##P ()
	
End Constructor

Constructor mdStack##E##P (ByRef element As E P)
	This.add(element)
End Constructor

Constructor mdStack##E##P (ByRef l As mdCollection##E##P)
	This.addAll(l)
End Constructor

Destructor mdStack##E##P ()
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node, nextNode
	While currentNode->nex <> NULL
		nextNode = currentNode->nex->nex
		Delete currentNode->nex
		currentNode->nex = nextNode
	Wend
End Destructor

Function mdStack##E##P.add(ByRef element As E P) As Boolean
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

Function mdStack##E##P.add(ByVal index As Integer, ByRef element As E P) As Boolean
	Dim As Integer i = 0
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
	While currentNode <> NULL
		If i = index Then
			Dim As mdBasicNode##E##P Ptr nextNode = currentNode->nex
			currentNode->nex = New mdBasicNode##E##P
			If currentNode->nex = NULL Then
				currentNode->nex = nextNode
				Return FALSE
			Else
				currentNode->nex->value = element
				currentNode->nex->nex = nextNode
				Return TRUE
			EndIf
		EndIf
		
		i += 1
		currentNode = currentNode->nex
	Wend
	
	Return FALSE
End Function

Function mdStack##E##P.addAll(ByRef c As mdCollection##E##P) As Boolean
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

Function mdStack##E##P.addAll(ByVal index As Integer, ByRef c As mdCollection##E##P) As Boolean
	Dim As E P temp()
	c.toArray(temp())
	If @temp(0) = NULL Then
		Return FALSE
	EndIf
	For i As Integer = 0 To UBound(temp)
		This.add(index + i, temp(i))
	Next
	Return TRUE
End Function

Sub mdStack##E##P.addElement(ByRef element As E P)
	This.add(element)
End Sub

Function mdStack##E##P.capacity() As Integer
	Return -1 'the representation of this vector is a linked list, not an array, so capacity = RAM
End Function

Sub mdStack##E##P.clear()
	This.Destructor()
End Sub

Function mdStack##E##P.clone() As mdStack##E##P Ptr
	Dim As mdStack##E##P Ptr retVector = New mdStack##E##P
	For i As Integer = 0 To This.size() - 1
		retVector->add(This.get(i))
	Next
	Return retVector
End Function

Function mdStack##E##P.contains(ByRef o As E P) As Boolean
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		If currentNode->nex->value = o Then
			Return TRUE
		EndIf
		currentNode = currentNode->nex
	Wend
	Return FALSE
End Function

Function mdStack##E##P.containsAll(ByRef c As mdCollection##E##P) As Boolean
	Dim As E P temp()
	c.toArray(temp())
	For i As Integer = LBound(temp) To UBound(temp)
		If This.contains(temp(i)) = FALSE Then
			Return FALSE
		EndIf
	Next
	Return TRUE
End Function

Sub mdStack##E##P.copyInto(anArray() As E P)
	This.toArray(anArray())
End Sub

Function mdStack##E##P.elementAt(ByVal index As Integer) As E P
	Return This.get(index)
End Function

Function mdStack##E##P.empty() As Boolean
	Return This.isEmpty()
End Function

Sub mdStack##E##P.ensureCapacity(ByVal minCapacity As Integer)
	'see This.capacity()
End Sub

Function mdStack##E##P.equals(ByRef o As mdCollection##E##P) As Boolean
	If @This = @o Then
		Return TRUE
	EndIf
	Return FALSE
End Function

Function mdStack##E##P.firstElement() As E P
	Return This.get(0)
End Function

Function mdStack##E##P.get(ByVal index As Integer) As E P
	Dim As Integer i = 0
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		If i = index Then
			Return currentNode->nex->value
		EndIf
		
		i += 1
		currentNode = currentNode->nex
	Wend
	Dim As E P tempRet
	Return tempRet
End Function

Function mdStack##E##P.hashCode() As Integer
	Dim As Integer hash = 1
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		hash = 31 * hash + IIf(currentNode->nex = NULL, 0, Cast(UInteger, currentNode->nex) \ This.size())
		currentNode = currentNode->nex
	Wend
	Return hash
End Function

Function mdStack##E##P.indexOf(ByRef o As E P) As Integer
	Dim As Integer i = -1, retIndex = -1
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		i += 1
		If currentNode->nex->value = o Then
			retIndex = i
			Exit While
		EndIf
		currentNode = currentNode->nex
	Wend
	Return retIndex
End Function

Function mdStack##E##P.indexOf(ByRef o As E P, ByVal index As Integer) As Integer
	Dim As Integer i = -1, retIndex = -1
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		i += 1
		If i >= index AndAlso currentNode->nex->value = o Then
			retIndex = i
			Exit While
		EndIf
		currentNode = currentNode->nex
	Wend
	Return retIndex
End Function

Sub mdStack##E##P.insertElementAt(ByRef o As E P, ByVal index As Integer)
	This.add(index, o)
End Sub

Function mdStack##E##P.isEmpty() As Boolean
	If This.size() = 0 Then
		Return TRUE
	EndIf
	Return FALSE
End Function

Function mdStack##E##P.iterator() As mdIterator##E##P
	Dim As mdIterator##E##P newIterator = This.node.nex
	Return newIterator
End Function

Function mdStack##E##P.lastElement() As E P
	Return This.get(This.size() - 1)
End Function

Function mdStack##E##P.lastIndexOf(ByRef o As E P) As Integer
	Dim As Integer i = 0, retIndex = -1
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		If currentNode->nex->value = o Then
			retIndex = i
		EndIf
		i += 1
		currentNode = currentNode->nex
	Wend
	Return retIndex
End Function

Function mdStack##E##P.lastIndexOf(ByRef o As E P, ByVal index As Integer) As Integer
	Dim As Integer i = -1, retIndex = -1
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		If i >= index AndAlso currentNode->nex->value = o Then
			retIndex = i
		EndIf
		i += 1
		currentNode = currentNode->nex
	Wend
	Return retIndex
End Function

Function mdStack##E##P.peek_() As E P
	Return This.get(0)
End Function

Function mdStack##E##P.pop() As E P
	Return This.remove(0)
End Function

Function mdStack##E##P.push(ByRef item As E P) As E P
	This.add(0, item)
	Return item
End Function

Function mdStack##E##P.remove(ByVal index As Integer) As E P
	Dim As Integer i = 0
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node, nextNode
	While currentNode->nex <> NULL
		If i = index Then
			Dim As E P value = currentNode->nex->value
			nextNode = currentNode->nex->nex
			Delete currentNode->nex
			currentNode->nex = nextNode
			Return value
		EndIf
		
		i += 1
		currentNode = currentNode->nex
	Wend
	Dim As E P tempRet
	Return tempRet
End Function

Function mdStack##E##P.remove(ByRef o As E P) As Boolean
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

Function mdStack##E##P.removeAll(ByRef c As mdCollection##E##P) As Boolean
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

Sub mdStack##E##P.removeAllElements()
	This.clear()
End Sub

Function mdStack##E##P.removeElement(ByRef obj As E P) As Boolean
	Return This.remove(obj)
End Function

Sub mdStack##E##P.removeElementAt(ByVal index As Integer)
	Dim As E P tempE = This.remove(index)
End Sub

Function mdStack##E##P.retainAll(ByRef c As mdCollection##E##P) As Boolean
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

Function mdStack##E##P.search(ByRef o As E P) As Integer
	Return This.indexOf(o) + 1
End Function

Function mdStack##E##P.set(ByVal index As Integer, ByRef element As E P) As E P
	Dim As Integer i = 0
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		If i = index Then
			Dim As E P value = currentNode->nex->value
			currentNode->nex->value = element
			Return value
		EndIf
		
		i += 1
		currentNode = currentNode->nex
	Wend
	Dim As E P tempRet
	Return tempRet
End Function

Sub mdStack##E##P.setElementAt(ByRef element As E P, ByVal index As Integer)
	Dim As E P tempE = This.set(index, element)
End Sub

Sub mdStack##E##P.setSize(ByVal newSize As Integer)
	'see this.capacity()
End Sub

Function mdStack##E##P.size() As Integer
	Dim As Integer count = 0
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		count += 1
		currentNode = currentNode->nex
	Wend
	Return count
End Function

Function mdStack##E##P.subList(ByVal fromIndex As Integer, ByVal toIndex As Integer) As mdList##E##P
	Dim As Integer i = 0
	Dim As mdList##E##P newmdList
	Dim As mdBasicNode##E##P Ptr currentNode = @This.node
	While currentNode->nex <> NULL
		If i >= fromIndex And i <= toIndex Then
			newmdList.add(currentNode->nex->value)
		EndIf
		i += 1
		currentNode = currentNode->nex
	Wend
	Return newmdList
End Function

Function mdStack##E##P.toArray(array() As E P) As Boolean
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

Function mdStack##E##P.toString() As String
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

Sub mdStack##E##P.trimToSize()
	'see This.capacity()
End Sub

Operator mdStack##E##P.Cast() As Integer
	Return This.hashCode()
End Operator

Operator mdStack##E##P.Cast() As String
	Return This.toString()
End Operator

Operator mdStack##E##P.Let(ByRef c As mdCollection##E##P)
	This.clear()
	This.addAll(c)
End Operator

Sub mdStack##E##P.removeRange(ByVal fromIndex As Integer, ByVal toIndex As Integer)
	Dim As E P tempE
	For i As Integer = toIndex - 1 To fromIndex Step -1
		tempE = This.remove(i)
	Next
End Sub

#EndIf '__MDSTACK_BI__

#EndMacro

#Define mdStackDeclare(E, P...) mdStackDeclarePtr(E, P)
