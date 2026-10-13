'mdString - by MOD
'20131223

'http://docs.oracle.com/javase/6/docs/api/java/lang/String.html


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

#Ifndef __MDSTRING_BI__
#Define __MDSTRING_BI__

Type mdString
	Public:
	Declare Constructor()
	Declare Constructor(bytes() As Byte)
	'Declare Constructor(bytes() As Byte, ByRef charset As mdCharset)
	'Declare Constructor(ascii() As Byte, ByVal hibyte_ As Integer)
	'Declare Constructor(bytes() As Byte, ByVal offset As Integer, ByVal length_ As Integer)
	'Declare Constructor(bytes() As Byte, ByVal offset As Integer, ByVal length_ As Integer, ByRef charset As mdCharset)
	'Declare Constructor(bytes() As Byte, ByVal hibyte_As Integer, ByVal offset As Integer, ByVal count As Integer)
	'Declare Constructor(bytes() As Byte, ByVal offset As Integer, ByVal length_ As Integer, ByRef charsetName As mdString)
	'Declare Constructor(bytes() As Byte, ByRef charsetName As mdString)
	Declare Constructor(ByVal value As ZString Ptr)
	Declare Constructor(ByVal value As ZString Ptr, ByVal offset As Integer, ByVal count As Integer)
	'Declare Constructor(codePoints() As Integer, ByVal offset As Integer, ByVal count As Integer)
	Declare Constructor(ByRef original As mdString)
	'Declare Constructor(ByRef buffer As mdStringBuffer)
	'Declare Constructor(ByRef builder As mdStringBuilder)
	Declare Destructor()
	Declare Function charAt(ByVal index As Integer) As Byte
	'Declare Function codePointAt(ByVal index As Integer) As Integer
	'Declare Function codePointBefore(ByVal index As Integer) As Integer
	'Declare Function codePointCount(ByVal beginIndex As Integer, ByVal endIndex As Integer) As Integer
	Declare Function compareTo(ByRef anotherString As mdString) As Integer
	Declare Function compareToIgnoreCase(ByRef str_ As mdString) As Integer
	Declare Function concat(ByRef str_ As mdString) As mdString
	'Declare Function contains(ByRef s As mdCharSequence) As Boolean
	'Declare Function contentEquals(ByRef cs As mdCharSequence) As Boolean
	'Declare Function contentEquals(ByRef sb As mdStringBuffer) As Boolean
	Declare Static Function copyValueOf(ByVal data_ As ZString Ptr) As mdString
	Declare Static Function copyValueOf(ByVal data_ As ZString Ptr, ByVal offset As Integer, ByVal count As Integer) As mdString
	Declare Function endsWith(ByRef suffix As mdString) As Boolean
	'Declare Function equals(ByRef anObject As mdObject) As Boolean
	Declare Function equals(ByRef anObject As mdString) As Boolean
	Declare Function equalsIgnoreCase(ByRef anotherString As mdString) As Boolean
	'Declare Static Function formatString(ByRef l As mdLocale, ByRef format_ As mdString, ...) As mdString
	'Declare Static Function formatString(ByRef format_ As mdString, ...) As mdString
	Declare Function getBytes(ret() As Byte) As Boolean
	'Declare Function getBytes(ret() As Byte, ByRef charset As mdCharset) As Boolean
	Declare Sub getBytes(ByVal srcBegin As Integer, ByVal srcEnd As Integer, dst() As Byte, ByVal dstBegin As Integer)
	'Declare Function getBytes(ret() As Byte, ByRef charsetName As mdString) As Boolean
	Declare Sub getChars(ByVal srcBegin As Integer, ByVal srcEnd As Integer, ByRef dst As ZString Ptr, ByVal dstBegin As Integer)
	Declare Function hashCode() As Integer
	Declare Function indexOf(ByVal ch As Integer) As Integer
	Declare Function indexOf(ByVal ch As Integer, ByVal fromIndex As Integer) As Integer
	Declare Function indexOf(ByRef str_ As mdString) As Integer
	Declare Function indexOf(ByRef str_ As mdString, ByVal fromIndex As Integer) As Integer
	Declare Function intern() As mdString
	Declare Function isEmpty() As Boolean
	Declare Function lastIndexOf(ByVal ch As Integer) As Integer
	Declare Function lastIndexOf(ByVal ch As Integer, ByVal fromIndex As Integer) As Integer
	Declare Function lastIndexOf(ByRef str_ As mdString) As Integer
	Declare Function lastIndexOf(ByRef str_ As mdString, ByVal fromIndex As Integer) As Integer
	Declare Function length() As Integer
	'Declare Function matches(ByRef regex As mdString) As Boolean
	'Declare Function offsetByCodePoints(ByVal index As Integer, ByVal codePointOffset As Integer) As Integer
	Declare Function regionMatches(ByVal ignoreCase As Boolean, ByVal toffset As Integer, ByRef other As mdString, ByVal ooffset As Integer, ByVal length_ As Integer) As Boolean
	Declare Function regionMatches(ByVal toffset As Integer, ByRef other As mdString, ByVal ooffset As Integer, ByVal length_ As Integer) As Boolean
	Declare Function replace(ByVal oldChar As Byte, ByVal newChar As Byte) As mdString
	'Declare Function replace(ByRef target As mdCharSequence, ByRef replacement As mdCharSequence) As mdString
	Declare Function replace(ByRef target As mdString, ByRef replacement As mdString) As mdString
	Declare Function replace(ByVal target As ZString Ptr, ByVal replacement As ZString Ptr) As mdString
	'Declare Function replaceAll(ByRef regex As mdString, ByRef replacement As mdString) As mdString
	'Declare Function replaceFirst(ByRef regex As mdString, ByRef replacement As mdString) As mdString
	Declare Function replaceFirst(ByRef target As mdString, ByRef replacement As mdString) As mdString 'TODO: add regex and use the method header above
	Declare Function replaceFirst(ByVal target As ZString Ptr, ByVal replacement As ZString Ptr) As mdString 'TODO: add regex and use the method header above
	'Declare Function split(ret() As mdString, ByRef regex As mdString) As Boolean
	'Declare Function split(ret() As mdString, ByRef regex As mdString, ByVal limit As Integer) As Boolean
	Declare Function split(ret() As mdString, ByRef target As mdString) As Boolean 'TODO: add regex and use the method header above
	Declare Function split(ret() As String, ByRef target As mdString) As Boolean 'TODO: add regex and use the method header above
	Declare Function split(ret() As mdString, ByRef target As mdString, ByVal limit As Integer) As Boolean 'TODO: add regex and use the method header above
	Declare Function split(ret() As String, ByRef target As mdString, ByVal limit As Integer) As Boolean 'TODO: add regex and use the method header above
	Declare Function startsWith(ByRef prefix As mdString) As Boolean
	Declare Function startsWith(ByRef prefix As mdString, ByVal toffset As Integer) As Boolean
	'Declare Function subSequence(ByVal beginIndex As Integer, ByVal endIndex As Integer) As mdCharSequence
	Declare Function substring(ByVal beginIndex As Integer) As mdString 
	Declare Function substring(ByVal beginIndex As Integer, ByVal endIndex As Integer) As mdString
	Declare Function toCharArray() As ZString Ptr
	Declare Function toLowerCase() As mdString
	'Declare Function toLowerCase(ByRef locale As mdLocale) As mdString
	Declare Function tomdString() As mdString
	Declare Function toUpperCase() As mdString
	'Declare Function toUpperCase(ByRef locale As mdLocale) As mdString
	Declare Function trimString() As mdString
	'Declare Static Function valueOf(ByVal b As Boolean) As mdString
	Declare Static Function valueOf(ByVal c As Byte) As mdString
	Declare Static Function valueOf(ByVal data_ As ZString Ptr) As mdString
	Declare Static Function valueOf(ByVal data_ As ZString Ptr, ByVal offset As Integer, ByVal count As Integer) As mdString
	Declare Static Function valueOf(ByVal d As Double) As mdString
	Declare Static Function valueOf(ByVal f As Single) As mdString
	Declare Static Function valueOf(ByVal i As Integer) As mdString
	Declare Static Function valueOf(ByVal l As Long) As mdString
	'Declare Static Function valueOf(ByRef obj As mdObject) As mdString
	
	Declare Function compareTo(ByVal anotherString As ZString Ptr) As Integer
	Declare Function compareToIgnoreCase(ByVal str_ As ZString Ptr) As Integer
	Declare Function concat(ByVal str_ As ZString Ptr) As mdString
	Declare Function endsWith(ByVal suffix As ZString Ptr) As Boolean
	Declare Function equals(ByVal anObject As ZString Ptr) As Boolean
	Declare Function equalsIgnoreCase(ByVal anotherString As ZString Ptr) As Boolean
	Declare Function indexOf(ByVal str_ As ZString Ptr) As Integer
	Declare Function indexOf(ByVal str_ As ZString Ptr, ByVal fromIndex As Integer) As Integer
	Declare Function lastIndexOf(ByVal str_ As ZString Ptr) As Integer
	Declare Function lastIndexOf(ByVal str_ As ZString Ptr, ByVal fromIndex As Integer) As Integer
	Declare Function regionMatches(ByVal ignoreCase As Boolean, ByVal toffset As Integer, ByVal other As ZString Ptr, ByVal ooffset As Integer, ByVal length_ As Integer) As Boolean
	Declare Function regionMatches(ByVal toffset As Integer, ByVal other As ZString Ptr, ByVal ooffset As Integer, ByVal length_ As Integer) As Boolean
	Declare Function startsWith(ByVal prefix As ZString Ptr) As Boolean
	Declare Function startsWith(ByVal prefix As ZString Ptr, ByVal toffset As Integer) As Boolean
	Declare Function toString() As String
	Declare Operator Cast() As String
	Declare Operator Let(ByVal data_ As ZString Ptr)
	Declare Operator Let(ByRef data_ As mdString)
	Declare Operator += (ByVal data_ As ZString Ptr)
	Declare Operator += (ByRef data_ As mdString)
	Declare Operator &= (ByVal data_ As ZString Ptr)
	Declare Operator &= (ByRef data_ As mdString)
	Declare Operator @ () As ZString Ptr
	
	Private:
	data_ As ZString Ptr
End Type

Constructor mdString()
	This.data_ = Callocate(1)
End Constructor

Constructor mdString(bytes() As Byte)
	If @bytes(0) = NULL Then
		This.Constructor()
		Exit Constructor
	EndIf
	This.data_ = Callocate(UBound(bytes) - LBound(bytes) + 1)
	If data_ = NULL Then
		This.Constructor()
		Exit Constructor
	EndIf
	Dim As Integer i, index = 0
	For i = LBound(bytes) To UBound(bytes)
		This.data_[index][0] = bytes(i)
		index += 1
	Next
End Constructor

'Constructor mdString(bytes() As Byte, ByRef charset As mdCharset)

'Constructor mdString(ascii() As Byte, ByVal hibyte_ As Integer)

'Constructor mdString(bytes() As Byte, ByVal offset As Integer, ByVal length_ As Integer)

'Constructor mdString(bytes() As Byte, ByVal offset As Integer, ByVal length_ As Integer, ByRef charset As mdCharset)

'Constructor mdString(bytes() As Byte, ByVal hibyte_As Integer, ByVal offset As Integer, ByVal count As Integer)

'Constructor mdString(bytes() As Byte, ByVal offset As Integer, ByVal length_ As Integer, ByRef charsetName As mdString)

'Constructor mdString(bytes() As Byte, ByRef charsetName As mdString)

Constructor mdString(ByVal value As ZString Ptr)
	If value = NULL Then
		This.Constructor()
		Exit Constructor
	EndIf
	This.data_ = Callocate(Len(*value) + 1)
	If This.data_ = NULL Then
		This.Constructor()
		Exit Constructor
	EndIf
	For i As Integer = 0 To Len(*value)
		This.data_[i][0] = value[i][0]
	Next
End Constructor

Constructor mdString(ByVal value As ZString Ptr, ByVal offset As Integer, ByVal count As Integer)
	If value = NULL Then
		This.Constructor()
	EndIf
	This.data_ = Callocate(offset + count + 1)
	If This.data_ = NULL Then
		This.Constructor()
		Exit Constructor
	EndIf
	Dim As Integer i, index = 0
	For i = offset To offset + count
		This.data_[index][0] = value[i][0]
		index += 1
	Next
End Constructor

'Constructor mdString(codePoints() As Integer, ByVal offset As Integer, ByVal count As Integer)

Constructor mdString(ByRef original As mdString)
	Dim As ZString Ptr value = original.toCharArray()
	This.data_ = Callocate(Len(*value) + 1)
	If This.data_ = NULL Then
		This.Constructor(value)
		Exit Constructor
	EndIf
	For i As Integer = 0 To Len(*value)
		This.data_[i][0] = value[i][0]
	Next
End Constructor

'Constructor mdString(ByRef buffer As mdStringBuffer)

'Constructor mdString(ByRef builder As mdStringBuilder)

Destructor mdString()
	If This.data_ <> NULL Then
		DeAllocate(This.data_)
		This.data_ = NULL
	EndIf
End Destructor

Function mdString.charAt(ByVal index As Integer) As Byte
	If This.data_ <> NULL Then
		Return This.data_[index]
	EndIf
	Return 0
End Function

'Function mdString.codePointAt(ByVal index As Integer) As Integer

'Function mdString.codePointBefore(ByVal index As Integer) As Integer

'Function mdString.codePointCount(beginIndex As Integer, endIndex As Integer) As Integer

Function mdString.compareTo(ByRef anotherString As mdString) As Integer
	If This.length() <> anotherString.length() Then
		Return Len(*This.data_) - anotherString.length()
	EndIf
	Dim As ZString Ptr value = anotherString.toCharArray()
	For i As Integer = 0 To Len(*value)
		If This.data_[i][0] <> value[i][0] Then
			Return Cast(Integer, This.data_[i][0]) - Cast(Integer, value[i][0])
		EndIf
	Next
End Function

Function mdString.compareToIgnoreCase(ByRef str_ As mdString) As Integer
	If This.length() <> str_.length() Then
		Return Len(*This.data_) - str_.length()
	EndIf
	Dim As String valueString = UCase(*str_.toCharArray())
	Dim As String thisString = UCase(*This.data_)
	For i As Integer = 0 To Len(valueString) - 1
		If thisString[i] <> valueString[i] Then
			Return Cast(Integer, thisString[i]) - Cast(Integer, valueString[i])
		EndIf
	Next
End Function

Function mdString.concat(ByRef str_ As mdString) As mdString
	Dim As String tempString = *This.data_ & *str_.toCharArray()
	Dim As mdString newString = StrPtr(tempString)
	Return newString
End Function

'Function mdString.contains(ByRef s As mdCharSequence) As Boolean

'Function mdString.contentEquals(ByRef cs As mdCharSequence) As Boolean

'Function mdString.contentEquals(ByRef sb As mdStringBuffer) As Boolean

Function mdString.copyValueOf(ByVal data_ As ZString Ptr) As mdString
	If data_ = NULL Then
		Dim As mdString emptyString
		Return emptyString
	EndIf
	Dim As mdString newString = data_
	Return newString
End Function

Function mdString.copyValueOf(ByVal data_ As ZString Ptr, ByVal offset As Integer, ByVal count As Integer) As mdString
	If data_ = NULL Then
		Dim As mdString emptyString
		Return emptyString
	EndIf
	Dim As ZString Ptr newZString = Callocate(count - offset + 1)
	If newZString = NULL Then
		Dim As mdString emptyString
		Return emptyString
	EndIf
	Dim i As Integer
	For i = offset To offset + count - 1
		newZString[i - offset][0] = data_[i][0]
	Next
	newZString[i - offset][0] = 0
	Print *newZString
	Dim As mdString newString = newZString
	Return newString
End Function

Function mdString.endsWith(ByRef suffix As mdString) As Boolean
	If Right(*This.data_, suffix.length()) = *suffix.toCharArray() Then
		Return TRUE
	EndIf
	Return FALSE
End Function

'Function mdString.equals(ByRef anObject As mdObject) As Boolean

Function mdString.equals(ByRef anObject As mdString) As Boolean
	Dim As String thisString = *This.data_
	Dim As String aString = *anObject.toCharArray()
	Return thisString = aString
End Function

Function mdString.equalsIgnoreCase(ByRef anotherString As mdString) As Boolean
	Dim As String thisString = *This.data_
	Dim As String aString = *anotherString.toCharArray()
	Return UCase(thisString) = UCase(aString)
End Function

'Function mdString.formatString(ByRef l As mdLocale, ByRef format_ As mdString, ...) As mdString

'Function mdString.formatString(ByRef format_ As mdString, ...) As mdString

Function mdString.getBytes(ret() As Byte) As Boolean
	If This.data_ = NULL Then
		Return FALSE
	EndIf
	Dim As Integer thisLength = Len(*This.data_) - 1
	ReDim ret(0 To thisLength)
	For i As Integer = 0 To thisLength
		ret(i) = This.data_[i][0]
	Next
	Return TRUE
End Function

'Function mdString.getBytes(ret() As Byte, ByRef charset As mdCharset) As Boolean

Sub mdString.getBytes(ByVal srcBegin As Integer, ByVal srcEnd As Integer, dst() As Byte, ByVal dstBegin As Integer)
	Dim As Integer thisLength = Len(*This.data_) + 1
	If This.data_ = NULL OrElse (srcBegin > thisLength Or srcEnd > thisLength Or dstBegin > thisLength) Then
		Exit Sub
	EndIf
	
	ReDim dst(0 To srcEnd - 1)
	For i As Integer = dstBegin To srcEnd - srcBegin
		dst(i) = This.data_[i + srcBegin][0]
	Next
End Sub

'Function mdString.getBytes(ret() As Byte, ByRef charsetName As mdString) As Boolean

Sub mdString.getChars(ByVal srcBegin As Integer, ByVal srcEnd As Integer, ByRef dst As ZString Ptr, ByVal dstBegin As Integer)
	Dim As Integer thisLength = Len(*This.data_) + 1
	If This.data_ = NULL OrElse (srcBegin > thisLength Or srcEnd > thisLength Or dstBegin > thisLength) Then
		Exit Sub
	EndIf
	
	dst = Callocate(srcEnd + 1)
	If dst = NULL Then
		Exit Sub
	EndIf
	Dim As Integer i
	For i = dstBegin To srcEnd - srcBegin
		dst[i][0] = This.data_[i + srcBegin][0]
	Next
	dst[i][0] = 0
End Sub

Function mdString.hashCode() As Integer
	If This.data_ = NULL Then
		Return 0
	EndIf
	Dim As Integer sum = 0, thisLength = Len(*This.data_), i
	For i = 0 To thisLength - 1
		sum += This.data_[i][0] * 31^(thisLength - (i + 1))
	Next
	sum += This.data_[thisLength][0]
	Return sum
End Function

Function mdString.indexOf(ByVal ch As Integer) As Integer
	If This.data_ = NULL Then
		Return -1
	EndIf
	For i As Integer = 0 To Len(*This.data_)
		If This.data_[i][0] = ch Then
			Return i
		EndIf
	Next
	Return -1
End Function

Function mdString.indexOf(ByVal ch As Integer, ByVal fromIndex As Integer) As Integer
	If This.data_ = NULL Then
		Return -1
	EndIf
	For i As Integer = fromIndex To Len(*This.data_)
		If This.data_[i][0] = ch Then
			Return i
		EndIf
	Next
	Return -1
End Function

Function mdString.indexOf(ByRef str_ As mdString) As Integer
	If This.data_ = NULL Or str_.length() = 0 Then
		Return -1
	EndIf
	Dim As ZString Ptr newZString = str_.toCharArray()
	Return InStr(*This.data_, *newZString)
End Function

Function mdString.indexOf(ByRef str_ As mdString, ByVal fromIndex As Integer) As Integer
	If This.data_ = NULL Or str_.length() = 0 Then
		Return -1
	EndIf
	Dim As ZString Ptr newZString = str_.toCharArray()
	Return InStr(Mid(*This.data_, fromIndex), *newZString)
End Function

Function mdString.intern() As mdString
	Return This
End Function

Function mdString.isEmpty() As Boolean
	If Len(*This.data_) = 0 Then
		Return TRUE
	EndIf
	Return FALSE
End Function

Function mdString.lastIndexOf(ByVal ch As Integer) As Integer
	If This.data_ = NULL Then
		Return -1
	EndIf
	Dim As Integer found = -1, i
	For i = 0 To Len(*This.data_)
		If This.data_[i][0] = ch Then
			found = i
		EndIf
	Next
	Return found
End Function

Function mdString.lastIndexOf(ByVal ch As Integer, ByVal fromIndex As Integer) As Integer
	If This.data_ = NULL Then
		Return -1
	EndIf
	Dim As Integer found = -1, i
	For i = fromIndex To Len(*This.data_)
		If This.data_[i][0] = ch Then
			found = i
		EndIf
	Next
	Return found
End Function

Function mdString.lastIndexOf(ByRef str_ As mdString) As Integer
	If This.data_ = NULL Or str_.length() = 0 Then
		Return -1
	EndIf
	Dim As ZString Ptr newZString = str_.toCharArray()
	Return InStrRev(*This.data_, *newZString)
End Function

Function mdString.lastIndexOf(ByRef str_ As mdString, ByVal fromIndex As Integer) As Integer
	If This.data_ = NULL Or str_.length() = 0 Then
		Return -1
	EndIf
	Dim As ZString Ptr newZString = str_.toCharArray()
	Return InStrRev(Mid(*This.data_, fromIndex), *newZString)
End Function

Function mdString.length() As Integer
	Return Len(*This.data_)
End Function

'Function mdString.matches(ByRef regex As mdString) As Boolean

'Function mdString.offsetByCodePoints(ByVal index As Integer, ByVal codePointOffset As Integer) As Integer

Function mdString.regionMatches(ByVal ignoreCase As Boolean, ByVal toffset As Integer, ByRef other As mdString, ByVal ooffset As Integer, ByVal length_ As Integer) As Boolean
	Dim As String thisString = Mid(*This.data_, toffset + 1, length_)
	Dim As String otherString = Mid(*other.toCharArray(), ooffset + 1, length_)
	If ignoreCase Then
		thisString = UCase(thisString)
		otherString = UCase(otherString)
	EndIf
	Return thisString = otherString
End Function

Function mdString.regionMatches(ByVal toffset As Integer, ByRef other As mdString, ByVal ooffset As Integer, ByVal length_ As Integer) As Boolean
	Dim As String thisString = Mid(*This.data_, toffset + 1, length_)
	Dim As String otherString = Mid(*other.toCharArray(), ooffset + 1, length_)
	Return thisString = otherString
End Function

Function mdString.replace(ByVal oldChar As Byte, ByVal newChar As Byte) As mdString
	Dim As Integer thisLength = Len(*This.data_)
	Dim As ZString Ptr newZString = Callocate(thisLength + 1)
	If newZString = NULL Then
		Dim As mdString emptyString
		Return emptyString
	EndIf
	For i As Integer = 0 To thisLength
		If This.data_[i][0] = oldChar Then
			newZString[i][0] = newChar
		Else
			newZString[i][0] = This.data_[i][0]
		EndIf
	Next
	Dim As mdString newString = newZString
	Return newString
End Function

'Function mdString.replace(ByRef target As mdCharSequence, ByRef replacement As mdCharSequence) As mdString

Function mdString.replace(ByRef target As mdString, ByRef replacement As mdString) As mdString
	Dim As String array(), ret
	This.split(array(), target)
	
	Dim As Integer i
	For i = LBound(array) To UBound(array) - 1
		ret &= array(i) & replacement
	Next
	ret &= array(i)
	
	This = ret
	Dim As mdString newString = This.data_
	Return newString
End Function

Function mdString.replace(ByVal target As ZString Ptr, ByVal replacement As ZString Ptr) As mdString
	Dim As String array(), ret
	This.split(array(), *target)
	
	Dim As Integer i
	For i = LBound(array) To UBound(array) - 1
		ret &= array(i) & *replacement
	Next
	ret &= array(i)
	
	This = ret
	Dim As mdString newString = This.data_
	Return newString
End Function

'Function mdString.replaceAll(ByRef regex As mdString, ByRef replacement As mdString) As mdString

'Function mdString.replaceFirst(ByRef regex As mdString, ByRef replacement As mdString) As mdString
Function mdString.replaceFirst(ByRef target As mdString, ByRef replacement As mdString) As mdString
	Dim As String ret
	
	Dim As Integer index = This.indexOf(target)
	If index >= 0 Then
		ret = Left(*This.data_, index - 1) & replacement & Mid(*This.data_, index + replacement.length())
	Else
		ret = *This.data_
	EndIf
	
	This = ret
	Dim As mdString newString = This.data_
	Return newString
End Function
Function mdString.replaceFirst(ByVal target As ZString Ptr, ByVal replacement As ZString Ptr) As mdString
	Dim As String ret
	
	Dim As Integer index = This.indexOf(*target)
	If index >= 0 Then
		ret = Left(*This.data_, index - 1) & *replacement & Mid(*This.data_, index + Len(*replacement))
	Else
		ret = *This.data_
	EndIf
	
	This = ret
	Dim As mdString newString = This.data_
	Return newString
End Function

'Function mdString.split(ret() As mdString, ByRef regex As mdString) As Boolean
Function mdString.split(ret() As mdString, ByRef target As mdString) As Boolean
	Dim As Integer arrayIndex = 0
	
	ReDim ret(0)
	If target.length() = 1 Then
		For i As Integer = 0 To This.length() - 1
			If This.data_[i] = target.toCharArray[0][0] Then
				arrayIndex += 1
				ReDim Preserve ret(arrayIndex)
			Else
				ret(arrayIndex) &= Chr(This.data_[i][0])
			EndIf
		Next
	Else
		For i As Integer = 0 To This.length() - 1
			If Mid(*This.data_, i + 1, target.length()) = target Then
				arrayIndex += 1
				i += target.length() - 1
				ReDim Preserve ret(arrayIndex)
			Else
				ret(arrayIndex) &= Chr(This.data_[i][0])
			EndIf
		Next
	EndIf
	
	If @ret(0) = NULL Then
		Return FALSE
	Else
		Return TRUE
	EndIf
End Function
Function mdString.split(ret() As String, ByRef target As mdString) As Boolean
	Dim As Integer arrayIndex = 0
	
	ReDim ret(0)
	If target.length() = 1 Then
		For i As Integer = 0 To This.length() - 1
			If This.data_[i] = target.toCharArray[0][0] Then
				arrayIndex += 1
				ReDim Preserve ret(arrayIndex)
			Else
				ret(arrayIndex) &= Chr(This.data_[i][0])
			EndIf
		Next
	Else
		For i As Integer = 0 To This.length() - 1
			If Mid(*This.data_, i + 1, target.length()) = target Then
				arrayIndex += 1
				i += target.length() - 1
				ReDim Preserve ret(arrayIndex)
			Else
				ret(arrayIndex) &= Chr(This.data_[i][0])
			EndIf
		Next
	EndIf
	
	If @ret(0) = NULL Then
		Return FALSE
	Else
		Return TRUE
	EndIf
End Function

'Function mdString.split(ret() As mdString, ByRef regex As mdString, ByVal limit As Integer) As Boolean
Function mdString.split(ret() As mdString, ByRef target As mdString, ByVal limit As Integer) As Boolean
	Dim As Integer arrayIndex = 0
	
	ReDim ret(0)
	If target.length() = 1 Then
		For i As Integer = 0 To This.length() - 1
			If This.data_[i] = target.toCharArray[0][0] Then
				If limit < 1 Or arrayIndex < limit - 1 Then
					arrayIndex += 1
					ReDim Preserve ret(arrayIndex)
				Else
					ret(arrayIndex) &= Chr(target.toCharArray[0][0])
				EndIf
			Else
				ret(arrayIndex) &= Chr(This.data_[i][0])
			EndIf
		Next
	Else
		For i As Integer = 0 To This.length() - 1
			If Mid(*This.data_, i + 1, target.length()) = target Then
				If limit < 1 Or arrayIndex < limit - 1 Then
					arrayIndex += 1
					i += target.length() - 1
					ReDim Preserve ret(arrayIndex)
				Else
					ret(arrayIndex) &= Chr(This.data_[i][0])
				EndIf
			Else
				ret(arrayIndex) &= Chr(This.data_[i][0])
			EndIf
		Next
	EndIf
	
	If limit = 0 Then
		Dim As Integer index
		For index = UBound(ret) To LBound(ret) Step -1
			If ret(index) <> "" Then
				Exit For
			EndIf
		Next
		If index <> arrayIndex Then
			ReDim Preserve ret(index)
		EndIf
	EndIf
	
	If @ret(0) = NULL Then
		Return FALSE
	Else
		Return TRUE
	EndIf
End Function
Function mdString.split(ret() As String, ByRef target As mdString, ByVal limit As Integer) As Boolean
	Dim As Integer arrayIndex = 0
	
	ReDim ret(0)
	If target.length() = 1 Then
		For i As Integer = 0 To This.length() - 1
			If This.data_[i] = target.toCharArray[0][0] Then
				If limit < 1 Or arrayIndex < limit - 1 Then
					arrayIndex += 1
					ReDim Preserve ret(arrayIndex)
				Else
					ret(arrayIndex) &= Chr(target.toCharArray[0][0])
				EndIf
			Else
				ret(arrayIndex) &= Chr(This.data_[i][0])
			EndIf
		Next
	Else
		For i As Integer = 0 To This.length() - 1
			If Mid(*This.data_, i + 1, target.length()) = target Then
				If limit < 1 Or arrayIndex < limit - 1 Then
					arrayIndex += 1
					i += target.length() - 1
					ReDim Preserve ret(arrayIndex)
				Else
					ret(arrayIndex) &= Chr(This.data_[i][0])
				EndIf
			Else
				ret(arrayIndex) &= Chr(This.data_[i][0])
			EndIf
		Next
	EndIf
	
	If limit = 0 Then
		Dim As Integer index
		For index = UBound(ret) To LBound(ret) Step -1
			If ret(index) <> "" Then
				Exit For
			EndIf
		Next
		If index <> arrayIndex Then
			ReDim Preserve ret(index)
		EndIf
	EndIf
	
	If @ret(0) = NULL Then
		Return FALSE
	Else
		Return TRUE
	EndIf
End Function

Function mdString.startsWith(ByRef prefix As mdString) As Boolean
	If Left(*This.data_, prefix.length()) = *prefix.toCharArray() Then
		Return TRUE
	EndIf
	Return FALSE
End Function

Function mdString.startsWith(ByRef prefix As mdString, ByVal toffset As Integer) As Boolean
	If Left(*This.data_, prefix.length() - toffset) = Mid(*prefix.toCharArray(), toffset) Then
		Return TRUE
	EndIf
	Return FALSE
End Function

'Function mdString.subSequence(ByVal beginIndex As Integer, ByVal endIndex As Integer) As mdCharSequence

Function mdString.substring(ByVal beginIndex As Integer) As mdString
	Dim As ZString Ptr newZString = Callocate(Len(*This.data_) - beginIndex + 1)
	If newZString = NULL Then
		Return This
	EndIf
	For i As Integer = beginIndex To Len(*This.data_) + 1
		newZString[i - beginIndex][0] = This.data_[i][0]
	Next
	Dim As mdString newString = newZString
	Return newString
End Function
 
Function mdString.substring(ByVal beginIndex As Integer, ByVal endIndex As Integer) As mdString
	Dim As ZString Ptr newZString = Callocate(endIndex - beginIndex + 2)
	If newZString = NULL Then
		Return This
	EndIf
	For i As Integer = 0 To (endIndex - beginIndex)
		newZString[i][0] = This.data_[i + beginIndex][0]
	Next
	Dim As mdString newString = newZString
	Return newString
End Function

Function mdString.toCharArray() As ZString Ptr
	Dim As ZString Ptr newZString = Callocate(Len(*This.data_) + 1)
	If newZString = NULL Then
		Return NULL
	EndIf
	For i As Integer = 0 To Len(*This.data_)
		newZString[i][0] = This.data_[i][0]
	Next
	Return newZString
End Function

Function mdString.toLowerCase() As mdString
	Dim As String tempString = LCase(*This.data_)
	Dim As mdString newString = StrPtr(tempString)
	Return newString
End Function

'Function mdString.toLowerCase(ByRef locale As mdLocale) As mdString

Function mdString.tomdString() As mdString
	Return This
End Function

Function mdString.toUpperCase() As mdString
	Dim As String tempString = UCase(*This.data_)
	Dim As mdString newString = StrPtr(tempString)
	Return newString
End Function

'Function mdString.toUpperCase(ByRef locale As mdLocale) As mdString

Function mdString.trimString() As mdString
	Dim As String tempString = Trim(*This.data_)
	Dim As mdString newString = StrPtr(tempString)
	Return newString
End Function

'Function mdString.valueOf(ByVal b As Boolean) As mdString

Function mdString.valueOf(ByVal c As Byte) As mdString
	Dim As mdString newString = Str(c)
	Return newString
End Function

Function mdString.valueOf(ByVal data_ As ZString Ptr) As mdString
	Dim As mdString newString = mdString(data_)
	Return newString
End Function

Function mdString.valueOf(ByVal data_ As ZString Ptr, ByVal offset As Integer, ByVal count As Integer) As mdString
	Dim As mdString newString = mdString(data_, offset, count)
	Return newString
End Function

Function mdString.valueOf(ByVal d As Double) As mdString
	Dim As mdString newString = Str(d)
	Return newString
End Function

Function mdString.valueOf(ByVal f As Single) As mdString
	Dim As mdString newString = Str(f)
	Return newString
End Function

Function mdString.valueOf(ByVal i As Integer) As mdString
	Dim As mdString newString = Str(i)
	Return newString
End Function

Function mdString.valueOf(ByVal l As Long) As mdString
	Dim As mdString newString = Str(l)
	Return newString
End Function

'Function mdString.valueOf(ByRef obj As mdObject) As mdString

Function mdString.compareTo(ByVal anotherString As ZString Ptr) As Integer
	If This.length() <> Len(*anotherString) Then
		Return This.length() <> Len(*anotherString)
	EndIf
	Dim As ZString Ptr value = anotherString
	For i As Integer = 0 To Len(*value)
		If This.data_[i][0] <> value[i][0] Then
			Return Cast(Integer, This.data_[i][0]) - Cast(Integer, value[i][0])
		EndIf
	Next
End Function

Function mdString.compareToIgnoreCase(ByVal str_ As ZString Ptr) As Integer
	If This.length() <> Len(*str_) Then
		Return This.length() <> Len(*str_)
	EndIf
	Dim As String valueString = UCase(*str_)
	Dim As String thisString = UCase(*This.data_)
	For i As Integer = 0 To Len(valueString) - 1
		If thisString[i] <> valueString[i] Then
			Return Cast(Integer, thisString[i]) - Cast(Integer, valueString[i])
		EndIf
	Next
End Function

Function mdString.concat(ByVal str_ As ZString Ptr) As mdString
	Dim As String tempString = *This.data_ & *str_
	Dim As mdString newString = StrPtr(tempString)
	Return newString
End Function

Function mdString.endsWith(ByVal suffix As ZString Ptr) As Boolean
	If Right(*This.data_, Len(*suffix)) = *suffix Then
		Return TRUE
	EndIf
	Return FALSE
End Function

Function mdString.equals(ByVal anObject As ZString Ptr) As Boolean
	Dim As String thisString = *This.data_
	Dim As String aString = *anObject
	Return thisString = aString
End Function

Function mdString.equalsIgnoreCase(ByVal anotherString As ZString Ptr) As Boolean
	Dim As String thisString = *This.data_
	Dim As String aString = *anotherString
	Return UCase(thisString) = UCase(aString)
End Function

Function mdString.indexOf(ByVal str_ As ZString Ptr) As Integer
	If This.data_ = NULL Or Len(*str_) = 0 Then
		Return -1
	EndIf
	Dim As ZString Ptr newZString = str_
	Return InStr(*This.data_, *newZString)
End Function

Function mdString.indexOf(ByVal str_ As ZString Ptr, ByVal fromIndex As Integer) As Integer
	If This.data_ = NULL Or Len(*str_) = 0 Then
		Return -1
	EndIf
	Dim As ZString Ptr newZString = str_
	Return InStr(Mid(*This.data_, fromIndex), *newZString)
End Function

Function mdString.lastIndexOf(ByVal str_ As ZString Ptr) As Integer
	If This.data_ = NULL Or Len(*str_) = 0 Then
		Return -1
	EndIf
	Dim As ZString Ptr newZString = str_
	Return InStrRev(*This.data_, *newZString)
End Function

Function mdString.lastIndexOf(ByVal str_ As ZString Ptr, ByVal fromIndex As Integer) As Integer
	If This.data_ = NULL Or Len(*str_) = 0 Then
		Return -1
	EndIf
	Dim As ZString Ptr newZString = str_
	Return InStrRev(Mid(*This.data_, fromIndex), *newZString)
End Function

Function mdString.regionMatches(ByVal ignoreCase As Boolean, ByVal toffset As Integer, ByVal other As ZString Ptr, ByVal ooffset As Integer, ByVal length_ As Integer) As Boolean
	Dim As String thisString = Mid(*This.data_, toffset + 1, length_)
	Dim As String otherString = Mid(*other, ooffset + 1, length_)
	If ignoreCase Then
		thisString = UCase(thisString)
		otherString = UCase(otherString)
	EndIf
	Return thisString = otherString
End Function

Function mdString.regionMatches(ByVal toffset As Integer, ByVal other As ZString Ptr, ByVal ooffset As Integer, ByVal length_ As Integer) As Boolean
	Dim As String thisString = Mid(*This.data_, toffset + 1, length_)
	Dim As String otherString = Mid(*other, ooffset + 1, length_)
	Return thisString = otherString
End Function

Function mdString.startsWith(ByVal prefix As ZString Ptr) As Boolean
	If Left(*This.data_, Len(*prefix)) = *prefix Then
		Return TRUE
	EndIf
	Return FALSE
End Function

Function mdString.startsWith(ByVal prefix As ZString Ptr, ByVal toffset As Integer) As Boolean
	If Left(*This.data_, Len(*prefix) - toffset) = Mid(*prefix, toffset) Then
		Return TRUE
	EndIf
	Return FALSE
End Function

Function mdString.toString() As String
	Return *This.data_
End Function

Operator mdString.Cast() As String
	Return *This.data_
End Operator

Operator mdString.Let(ByVal data_ As ZString Ptr)
	Dim As ZString Ptr newZString = Callocate(Len(*data_) + 1)
	If newZString = NULL Then
		Exit Operator
	EndIf
	Dim As ZString Ptr tempZString = data_
	For i As Integer = 0 To Len(*data_)
		newZString[i][0] = tempZString[i][0]
	Next
	DeAllocate(This.data_)
	This.data_ = newZString
End Operator

Operator mdString.Let(ByRef data_ As mdString)
	Dim As ZString Ptr newZString = Callocate(data_.length() + 1)
	If newZString = NULL Then
		Exit Operator
	EndIf
	Dim As ZString Ptr tempZString = data_.toCharArray()
	For i As Integer = 0 To data_.length()
		newZString[i][0] = tempZString[i][0]
	Next
	DeAllocate(This.data_)
	This.data_ = newZString
End Operator

Operator mdString.+= (ByVal data_ As ZString Ptr)
	Dim As String tempString = *This.data_ + *data_
	This.data_ = ReAllocate(This.data_, Len(tempString) + 1)
	For i As Integer = 0 To Len(tempString)
		This.data_[i][0] = tempString[i]
	Next
End Operator

Operator mdString.+= (ByRef data_ As mdString)
	Dim As String tempString = *This.data_ + *data_.toCharArray()
	This.data_ = ReAllocate(This.data_, Len(tempString) + 1)
	For i As Integer = 0 To Len(tempString)
		This.data_[i][0] = tempString[i]
	Next
End Operator

Operator mdString.&= (ByVal data_ As ZString Ptr)
	Dim As String tempString = *This.data_ & *data_
	This.data_ = ReAllocate(This.data_, Len(tempString) + 1)
	For i As Integer = 0 To Len(tempString)
		This.data_[i][0] = tempString[i]
	Next
End Operator

Operator mdString.&= (ByRef data_ As mdString)
	Dim As String tempString = *This.data_ & *data_.toCharArray()
	This.data_ = ReAllocate(This.data_, Len(tempString) + 1)
	For i As Integer = 0 To Len(tempString)
		This.data_[i][0] = tempString[i]
	Next
End Operator

Operator mdString.@ () As ZString Ptr
	Return This.data_
End Operator

Operator + (ByRef lhs As mdString, ByRef rhs As mdString) As mdString
	Dim As String tempString = *lhs.toCharArray() + *rhs.toCharArray()
	Return StrPtr(tempString)
End Operator

Operator + (ByRef lhs As ZString Ptr, ByRef rhs As mdString) As mdString
	Dim As String tempString = *lhs + *rhs.toCharArray()
	Return StrPtr(tempString)
End Operator

Operator + (ByRef lhs As mdString, ByRef rhs As ZString Ptr) As mdString
	Dim As String tempString = *lhs.toCharArray() + *rhs
	Return StrPtr(tempString)
End Operator

Operator & (ByRef lhs As mdString, ByRef rhs As mdString) As mdString
	Dim As String tempString = *lhs.toCharArray() & *rhs.toCharArray()
	Return StrPtr(tempString)
End Operator

Operator & (ByRef lhs As ZString Ptr, ByRef rhs As mdString) As mdString
	Dim As String tempString = *lhs & *rhs.toCharArray()
	Return StrPtr(tempString)
End Operator

Operator & (ByRef lhs As mdString, ByRef rhs As ZString Ptr) As mdString
	Dim As String tempString = *lhs.toCharArray() & *rhs
	Return StrPtr(tempString)
End Operator

Operator = (ByRef lhs As mdString, ByRef rhs As mdString) As Integer
	Return *lhs.toCharArray() = *rhs.toCharArray()
End Operator

#EndIf '__MDSTRING_BI__
