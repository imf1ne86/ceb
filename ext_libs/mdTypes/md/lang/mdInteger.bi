'mdInteger - by MOD
'20131223

'http://docs.oracle.com/javase/6/docs/api/java/lang/Integer.html


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

#Ifndef __MDINTEGER_BI__
#Define __MDINTEGER_BI__

Type mdInteger
	Public:
	Const As Integer MAX_VALUE = (2^31) - 1
	Const As Integer MIN_VALUE = -(2^31)
	Const As Integer SIZE = 32
	
	Declare Constructor ()
	Declare Constructor (ByVal value As Integer)
	Declare Constructor (ByRef value As mdInteger)
	Declare Constructor (ByRef s As String)
	
	'Declare Static Function bitCount(ByVal i As Integer) As Integer
	Declare Function byteValue() As Byte
	Declare Function compareTo(ByRef anotherInteger As mdInteger) As Integer
	Declare Static Function decode(ByRef nm As String) As mdInteger
	Declare Function doubleValue() As Double
	'Declare Function equals(ByRef obj As mdObject) As Boolean
	Declare Function equals(ByRef obj As mdInteger) As Boolean
	Declare Function floatValue() As Single
	Declare Function singleValue() As Single
	'Declare Static Function getInteger(ByRef nm As String) As mdInteger
	'Declare Static Function getInteger(ByRef nm As String, ByVal value As Integer) As mdInteger
	'Declare Static Function getInteger(ByRef nm As String, ByRef value As mdInteger) As mdInteger
	'Declare Function hashCode() As Integer
	'Declare Static Function highestOneBit(ByVal i As Integer) As Integer
	Declare Function intValue() As Integer
	Declare Function longValue() As Long
	'Declare Static Function lowestOneBit(ByVal i As Integer) As Integer
	'Declare Static Function numberOfLeadingZeros(ByVal i As Integer) As Integer
	'Declare Static Function numberOfTrailingZeros(ByVal i As Integer) As Integer
	Declare Static Function parseInt(ByRef s As String) As Integer
	'Declare Static Function parseInt(ByRef s As String, ByVal radix As Integer) As Integer
	'Declare Static Function reverse(ByVal i As Integer) As Integer
	Declare Static Function reverseBytes(ByVal i As Integer) As Integer
	Declare Static Function rotateLeft(ByVal i As Integer, ByVal distance As Integer) As Integer
	Declare Static Function rotateRight(ByVal i As Integer, ByVal distance As Integer) As Integer
	Declare Function shortValue() As Short
	Declare Static Function signum(ByVal i As Integer) As Integer
	Declare Static Function toBinaryString(ByVal i As Integer) As String
	Declare Static Function toHexString(ByVal i As Integer) As String
	Declare Static Function toOctalString(ByVal i As Integer) As String
	Declare Function toString() As String
	Declare Static Function toString(ByVal i As Integer) As String
	'Declare Static Function toString(ByVal i As Integer, ByVal radix As Integer) As String
	Declare Static Function valueOf(ByVal i As Integer) As mdInteger
	Declare Static Function valueOf(ByRef s As String) As mdInteger
	'Declare Static Function valueOf(ByRef s As String, ByVal radix As Integer) As mdInteger
	
	Declare Operator Cast() As Integer
	Declare Operator Cast() As String
	Declare Operator Let(ByVal value As Integer)
	Declare Operator Let(ByRef value As mdInteger)
	
	Private:
	As Integer<mdInteger.SIZE> dat
End Type

Constructor mdInteger ()
	This.dat = 0
End Constructor

Constructor mdInteger (ByVal value As Integer)
	This.dat = value
End Constructor

Constructor mdInteger (ByRef value As mdInteger)
	This.dat = value.intValue()
End Constructor

Constructor mdInteger (ByRef s As String)
	This.dat = ValInt(s)
End Constructor

'Function mdInteger.bitCount(ByVal i As Integer) As Integer
'	
'End Function

Function mdInteger.byteValue() As Byte
	Dim As Byte value = This.dat
	Return value
End Function

Function mdInteger.compareTo(ByRef anotherInteger As mdInteger) As Integer
	Return This.dat - anotherInteger.intValue()
End Function

Function mdInteger.decode(ByRef nm As String) As mdInteger
	Dim As mdInteger newmdInteger = ValInt(nm)
	Return newmdInteger
End Function

Function mdInteger.doubleValue() As Double
	Dim As Double value = This.dat
	Return value
End Function

'Function mdInteger.equals(ByRef obj As mdObject) As Boolean

Function mdInteger.equals(ByRef obj As mdInteger) As Boolean
	If @This = @obj Then
		Return TRUE
	Else
		Return FALSE
	EndIf
End Function

Function mdInteger.floatValue() As Single
	Dim As Single value = This.dat
	Return value
End Function

Function mdInteger.singleValue() As Single
	Return This.floatValue()
End Function

'Function mdInteger.getInteger(ByRef nm As String) As mdInteger
'	
'End Function
'
'Function mdInteger.getInteger(ByRef nm As String, ByVal value As Integer) As mdInteger
'	
'End Function
'
'Function mdInteger.getInteger(ByRef nm As String, ByRef value As mdInteger) As mdInteger
'	
'End Function

'Function mdInteger.hashCode() As Integer
'	
'End Function
'
'Function mdInteger.highestOneBit(ByVal i As Integer) As Integer
'	
'End Function

Function mdInteger.intValue() As Integer
	Dim As Integer value = This.dat
	Return value
End Function

Function mdInteger.longValue() As Long
	Dim As Long value = This.dat
	Return value
End Function

'Function mdInteger.lowestOneBit(ByVal i As Integer) As Integer
'	
'End Function
'
'Function mdInteger.numberOfLeadingZeros(ByVal i As Integer) As Integer
'	
'End Function
'
'Function mdInteger.numberOfTrailingZeros(ByVal i As Integer) As Integer
'	
'End Function

Function mdInteger.parseInt(ByRef s As String) As Integer
	Return ValInt(s)
End Function

'Function mdInteger.parseInt(ByRef s As String, ByVal radix As Integer) As Integer
'	
'End Function
'
'Function mdInteger.reverse(ByVal i As Integer) As Integer
'	
'End Function

Function mdInteger.reverseBytes(ByVal i As Integer) As Integer
	Dim As Integer part(1 To 4)
	part(1) = i And &hFF
	part(2) = (i Shr  8) And &hFF
	part(3) = (i Shr 16) And &hFF
	part(4) = (i Shr 24) And &hFF
	Return ((part(1) Shl 24) Or (part(2) Shl 16) Or (part(3) Shl 8) Or part(4))
End Function

Function mdInteger.rotateLeft(ByVal i As Integer, ByVal distance As Integer) As Integer
	Return ((i Shl distance) Or (i Shr (32 - distance)))
End Function

Function mdInteger.rotateRight(ByVal i As Integer, ByVal distance As Integer) As Integer
	Return ((i Shr (32 - distance)) Or (i Shl distance))
End Function

Function mdInteger.shortValue() As Short
	Dim As Short value = This.dat
	Return value
End Function

Function mdInteger.signum(ByVal i As Integer) As Integer
	Return Sgn(i)
End Function

Function mdInteger.toBinaryString(ByVal i As Integer) As String
	Return Bin(i)
End Function

Function mdInteger.toHexString(ByVal i As Integer) As String
	Return Hex(i)
End Function

Function mdInteger.toOctalString(ByVal i As Integer) As String
	Return Oct(i)
End Function

Function mdInteger.toString() As String
	Return IIf(This.dat >= 0, " ", "") & Str(This.dat)
End Function

Function mdInteger.toString(ByVal i As Integer) As String
	Return IIf(i >= 0, " ", "") & Str(i)
End Function

'Function mdInteger.toString(ByVal i As Integer, ByVal radix As Integer) As String
'	
'End Function

Function mdInteger.valueOf(ByVal i As Integer) As mdInteger
	Dim As mdInteger newmdInteger = i
	Return newmdInteger
End Function

Function mdInteger.valueOf(ByRef s As String) As mdInteger
	Dim As mdInteger newmdInteger = ValInt(s)
	Return newmdInteger
End Function

'Function mdInteger.valueOf(ByRef s As String, ByVal radix As Integer) As mdInteger
'	
'End Function

Operator mdInteger.Cast() As Integer
	Return This.dat
End Operator

Operator mdInteger.Cast() As String
	Return IIf(This.dat >= 0, " ", "") & Str(This.dat)
End Operator

Operator mdInteger.Let(ByVal value As Integer)
	this.dat = value
End Operator

Operator mdInteger.Let(ByRef value As mdInteger)
	this.dat = value.intValue()
End Operator

#EndIf '__MDINTEGER_BI__
