'mdIterator - by MOD
'20131223

'http://docs.oracle.com/javase/6/docs/api/java/util/Iterator.html


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

#Macro ForEachPtr(T, var_, object_, P)
	Scope
	Dim As mdIterator##T##P var_##mdIterator##T##P = object_.iterator()
	While var_##mdIterator##T##P.hasNext()
		var_ = var_##mdIterator##T##P.nex()
#EndMacro
#Define ForEach(T, var_, object_, P...) ForEachPtr(T, var_, object_, P)

#Ifndef In
#Define In ,
#Define NextEach Wend : End Scope
#EndIf

#Define mdIteratorPtr(E, P) mdIterator##E##P
#Define mdIterator(E, P...) mdIteratorPtr(E, P)

#Macro mdIteratorDeclarePtr(E, P)

#Ifndef mdIterator##E##P
'#Define __MDITERATOR_BI__

Type mdIterator##E##P
	Public:
	Declare Constructor (ByVal node As mdBasicNode##E##P Ptr)
	Declare Function hasNext() As Boolean
	Declare Function nex() As E P
	Declare Sub remove()
	
	Private:
	pre As mdBasicNode##E##P Ptr
	cur As mdBasicNode##E##P Ptr
End Type

Constructor mdIterator##E##P (ByVal node As mdBasicNode##E##P Ptr)
	This.cur = node
End Constructor

Function mdIterator##E##P.hasNext() As Boolean
	Return This.cur <> NULL
End Function

Function mdIterator##E##P.nex() As E P
	This.pre = This.cur
	This.cur = This.cur->nex
	Return This.pre->value
End Function

Sub mdIterator##E##P.remove()
	This.pre->value = This.cur->value
	This.pre->nex = This.cur->nex
	Delete This.cur
	This.cur = This.pre->nex
End Sub

#EndIf '__MDITERATOR_BI__

#EndMacro

#Define mdIteratorDeclare(E, P...) mdIteratorDeclarePtr(E, P)
