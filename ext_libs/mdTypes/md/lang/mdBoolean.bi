'mdBoolean - by MOD
'20131223

'http://docs.oracle.com/javase/6/docs/api/java/lang/Boolean.html


#Ifndef __MDBOOLEAN_BI__
#Define __MDBOOLEAN_BI__

#Include Once "md/lang/mdString.bi"

Type mdBoolean
	Public:
	As Integer getFALSE = 0
	As Integer getTRUE = (Not 0)
	
	Declare Constructor (ByVal value As Integer)
	Declare Constructor (ByVal s As ZString Ptr)
	Declare Constructor (ByRef s As mdString)
	Declare Destructor ()
	
	Declare Function booleanValue() As Integer
	Declare Function compareTo(ByRef b As mdBoolean) As Integer
	'Declare Function equals(ByRef obj As mdObject) As Integer
	Declare Function equals(ByRef obj As mdBoolean) As Integer
	Declare Static Function getBoolean(ByVal name_ As ZString Ptr) As Integer
	Declare Static Function getBoolean(ByRef name_ As mdString) As Integer
	Declare Function hashCode() As Integer
	Declare Static Function parseBoolean(ByVal s As ZString Ptr) As Integer
	Declare Static Function parseBoolean(ByRef s As mdString) As Integer
	Declare Function toString() As String
	Declare Static Function toString(ByVal b As Integer) As String
	Declare Function tomdString() As mdString
	Declare Static Function tomdString(ByVal b As Integer) As mdString
	Declare Static Function valueOf(ByVal b As Integer) As mdBoolean
	Declare Static Function valueOf(ByVal s As ZString Ptr) As mdBoolean
	Declare Static Function valueOf(ByRef s As mdString) As mdBoolean
	
	Private:
	value As Integer = 0
End Type

Constructor mdBoolean (ByVal value As Integer)
	This.value = value
End Constructor

Constructor mdBoolean (ByVal s As ZString Ptr)
	This.value = ValInt(*s)
End Constructor

Constructor mdBoolean (ByRef s As mdString)
	This.value = ValInt(*s.toCharArray())
End Constructor

Destructor mdBoolean ()
	
End Destructor

Function mdBoolean.booleanValue() As Integer
	Return This.value
End Function

Function mdBoolean.compareTo(ByRef b As mdBoolean) As Integer
	If This.value = b.booleanValue() Then
		Return 0
	ElseIf This.value = TRUE And b.booleanValue() = FALSE Then
		Return 1
	ElseIf This.value = FALSE And b.booleanValue() = TRUE Then
		Return -1
	EndIf
End Function

'Function mdBoolean.equals(ByRef obj As mdObject) As Integer

Function mdBoolean.equals(ByRef obj As mdBoolean) As Integer
	Return This.value = obj.booleanValue()
End Function

Function mdBoolean.getBoolean(ByVal name_ As ZString Ptr) As Integer
	Return UCase(*name_) = "TRUE"
End Function

Function mdBoolean.getBoolean(ByRef name_ As mdString) As Integer
	Return UCase(*name_.toCharArray()) = "TRUE"
End Function

Function mdBoolean.hashCode() As Integer
	If This.value = FALSE Then
		Return 1237
	Else
		Return 1231
	EndIf
End Function

Function mdBoolean.parseBoolean(ByVal s As ZString Ptr) As Integer
	Return UCase(*s) = "TRUE"
End Function

Function mdBoolean.parseBoolean(ByRef s As mdString) As Integer
	Return UCase(*s.toCharArray()) = "TRUE"
End Function

Function mdBoolean.toString() As String
	If This.value = FALSE Then
		Return "FALSE"
	Else
		Return "TRUE"
	EndIf
End Function

Function mdBoolean.toString(ByVal b As Integer) As String
	If b = FALSE Then
		Return "FALSE"
	Else
		Return "TRUE"
	EndIf
End Function

Function mdBoolean.tomdString() As mdString
	Dim As mdString newString
	If This.value = FALSE Then
		newString = "FALSE"
	Else
		newString = "TRUE"
	EndIf
	Return newString
End Function

Function mdBoolean.tomdString(ByVal b As Integer) As mdString
	Dim As mdString newString
	If b = FALSE Then
		newString = "FALSE"
	Else
		newString = "TRUE"
	EndIf
	Return newString
End Function

Function mdBoolean.valueOf(ByVal b As Integer) As mdBoolean
	Dim As mdBoolean Ptr newBoolean = New mdBoolean(b)
	Return *newBoolean
End Function

Function mdBoolean.valueOf(ByVal s As ZString Ptr) As mdBoolean
	Dim As mdBoolean Ptr newBoolean = New mdBoolean(s)
	Return *newBoolean
End Function

Function mdBoolean.valueOf(ByRef s As mdString) As mdBoolean
	Dim As mdBoolean Ptr newBoolean = New mdBoolean(s)
	Return *newBoolean
End Function

Operator = (ByRef lhs As mdBoolean, ByRef rhs As mdBoolean) As Integer
	Return lhs.equals(rhs)
End Operator

#EndIf '__MDBOOLEAN_BI__
