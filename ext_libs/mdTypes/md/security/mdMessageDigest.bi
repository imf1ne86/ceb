'mdMessageDigest - by MOD
'20131223

'http://docs.oracle.com/javase/6/docs/api/java/security/MessageDigest.html


#Ifndef __MDMESSAGEDIGEST_BI__
#Define __MDMESSAGEDIGEST_BI__

#Define MDMESSAGEDIGEST_SHA512_Ch(x,y,z) ((x And y) Xor ((Not x) And z))
#Define MDMESSAGEDIGEST_SHA512_Maj(x,y,z) ((x And y) Xor (x And z) Xor (y And z))

#Define MDMESSAGEDIGEST_SHA512_Sum0(x) (ROTR(28,x) Xor ROTR(34,x) Xor ROTR(39,x))
#Define MDMESSAGEDIGEST_SHA512_Sum1(x) (ROTR(14,x) Xor ROTR(18,x) Xor ROTR(41,x))

#Define MDMESSAGEDIGEST_SHA512_Sig0(x) (ROTR( 1,x) Xor ROTR( 8,x) Xor SHRR( 7,x))
#Define MDMESSAGEDIGEST_SHA512_Sig1(x) (ROTR(19,x) Xor ROTR(61,x) Xor SHRR( 6,x))

#Define MDMESSAGEDIGEST_SHA1_Ch(x,y,z) ((x And y) Xor ((Not x) And z))
#Define MDMESSAGEDIGEST_SHA1_Maj(x,y,z) ((x And y) Xor (x And z) Xor (y And z))
#Define MDMESSAGEDIGEST_SHA1_Par(x,y,z) (x Xor y Xor z)

#Macro MDMESSAGEDIGEST_MD5_FF(a, b, c, d, x, s, t)
	a += ((b And c) Or ((Not b) And d)) + x + t
	a = rotl(a, s) + b
#EndMacro

#Macro MDMESSAGEDIGEST_MD5_GG(a, b, c, d, x, s, t)
	a += ((b And d) Or (c And (Not d))) + x + t
	a = rotl(a, s) + b
#EndMacro

#Macro MDMESSAGEDIGEST_MD5_HH(a, b, c, d, x, s, t)
	a += (b Xor c Xor d) + x + t
	a = rotl(a, s) + b
#EndMacro

#Macro MDMESSAGEDIGEST_MD5_II(a, b, c, d, x, s, t)
	a += (c Xor (b Or (Not d))) + x + t
	a = ROTL(a, s) + b
#EndMacro
	
Type mdMessageDigest
	Public:
	Declare Function digest() As String
	Declare Function digest(ByRef in As String) As String
	Declare Function getAlgorithm() As String
	Declare Static Function getInstance(ByRef algorithm As String) As mdMessageDigest Ptr
	Declare Sub reset()
	Declare Sub update(ByRef in As String)
	
	Declare Function createHash(ByRef text As String) As String
	Declare Function createFileHash(ByRef file As String) As String
	
	Protected:
	Declare Constructor (ByRef algorithm As String)
	
	Private:
	Declare Sub transform(ByVal block As UByte Ptr)
	Declare Sub update(ByVal dat As UByte Ptr, ByVal length As UInteger)
	Declare Function final() As String
	
	Declare Sub uIntegerToUByte(ByVal outpt As UByte Ptr, ByVal inpt As UInteger Ptr, ByVal nLength As UInteger)
	Declare Sub uByteToUInteger(ByVal outpt As UInteger Ptr, ByVal inpt As UByte Ptr, ByVal nLength As UInteger)
	
	Declare Function memcpy(ByVal destination As UByte Ptr, ByVal source As UByte Ptr, ByVal num As UInteger) As UByte Ptr
	Declare Function rotl(ByVal x As UInteger, ByVal n As UInteger) As UInteger
	Declare Function rotr(ByVal y As ULongInt, ByVal x As ULongInt) As ULongInt
	Declare Function shrr(ByVal n As ULongInt, ByVal x As ULongInt) As ULongInt
	
	As String algo
	
	As UByte buf(128)
	As UInteger count(4)
	As UInteger stateMD5(4)
	As UInteger stateSHA1(5)
	As ULongInt stateSHA512(8)
End Type

Constructor mdMessageDigest (ByRef algorithm As String)
	This.algo = algorithm
	Select Case algorithm
		Case "MD5"
			count(0) = 0
			count(1) = 0
			
			stateMD5(0) = &H67452301
			stateMD5(1) = &Hefcdab89
			stateMD5(2) = &H98badcfe
			stateMD5(3) = &H10325476
		Case "SHA-1"
			stateSHA1(0) = &H67452301
			stateSHA1(1) = &Hefcdab89
			stateSHA1(2) = &H98badcfe
			stateSHA1(3) = &H10325476
			stateSHA1(4) = &Hc3d2e1f0
		Case "SHA-512"
			stateSHA512(0) = &H6a09e667f3bcc908ULL
			stateSHA512(1) = &Hbb67ae8584caa73bULL
			stateSHA512(2) = &H3c6ef372fe94f82bULL
			stateSHA512(3) = &Ha54ff53a5f1d36f1ULL
			stateSHA512(4) = &H510e527fade682d1ULL
			stateSHA512(5) = &H9b05688c2b3e6c1fULL
			stateSHA512(6) = &H1f83d9abfb41bd6bULL
			stateSHA512(7) = &H5be0cd19137e2179ULL
		Case Else
			
	End Select
End Constructor

Function mdMessageDigest.digest() As String
	Return This.final()
End Function

Function mdMessageDigest.digest(ByRef in As String) As String
	This.update(in)
	Return This.final()
End Function

Function mdMessageDigest.getAlgorithm() As String
	Return This.algo
End Function

Function mdMessageDigest.getInstance(ByRef algorithm As String) As mdMessageDigest Ptr
	Dim As mdMessageDigest Ptr newMessageDigest = New mdMessageDigest(algorithm)
	Return newMessageDigest
End Function

Sub mdMessageDigest.reset()
	Erase buf
	Erase count
End Sub

Sub mdMessageDigest.update(ByRef in As String)
	Dim As UInteger length = Len(in)
	
	Dim As UByte buffer(16384)
	For i As Integer = 0 To length - 1
		buffer(i) = in[i]
	Next
	
	update(@buffer(0), length)
End Sub

Sub mdMessageDigest.transform(ByVal block As UByte Ptr)
	Select Case This.algo
		Case "MD5"
			Dim As UInteger a = stateMD5(0), b = stateMD5(1), c = stateMD5(2), d = stateMD5(3)
			Dim As UInteger X(16)
			uByteToUInteger(@X(0), block, 64)
			
			MDMESSAGEDIGEST_MD5_FF(a, b, c, d, X( 0),  7, &Hd76aa478)
			MDMESSAGEDIGEST_MD5_FF(d, a, b, c, X( 1), 12, &He8c7b756)
			MDMESSAGEDIGEST_MD5_FF(c, d, a, b, X( 2), 17, &H242070db)
			MDMESSAGEDIGEST_MD5_FF(b, c, d, a, X( 3), 22, &Hc1bdceee)
			MDMESSAGEDIGEST_MD5_FF(a, b, c, d, X( 4),  7, &Hf57c0faf)
			MDMESSAGEDIGEST_MD5_FF(d, a, b, c, X( 5), 12, &H4787c62a)
			MDMESSAGEDIGEST_MD5_FF(c, d, a, b, X( 6), 17, &Ha8304613)
			MDMESSAGEDIGEST_MD5_FF(b, c, d, a, X( 7), 22, &Hfd469501)
			MDMESSAGEDIGEST_MD5_FF(a, b, c, d, X( 8),  7, &H698098d8)
			MDMESSAGEDIGEST_MD5_FF(d, a, b, c, X( 9), 12, &H8b44f7af)
			MDMESSAGEDIGEST_MD5_FF(c, d, a, b, X(10), 17, &Hffff5bb1)
			MDMESSAGEDIGEST_MD5_FF(b, c, d, a, X(11), 22, &H895cd7be)
			MDMESSAGEDIGEST_MD5_FF(a, b, c, d, X(12),  7, &H6b901122)
			MDMESSAGEDIGEST_MD5_FF(d, a, b, c, X(13), 12, &Hfd987193)
			MDMESSAGEDIGEST_MD5_FF(c, d, a, b, X(14), 17, &Ha679438e)
			MDMESSAGEDIGEST_MD5_FF(b, c, d, a, X(15), 22, &H49b40821)
			
			MDMESSAGEDIGEST_MD5_GG(a, b, c, d, X( 1),  5, &Hf61e2562)
			MDMESSAGEDIGEST_MD5_GG(d, a, b, c, X( 6),  9, &Hc040b340)
			MDMESSAGEDIGEST_MD5_GG(c, d, a, b, X(11), 14, &H265e5a51)
			MDMESSAGEDIGEST_MD5_GG(b, c, d, a, X( 0), 20, &He9b6c7aa)
			MDMESSAGEDIGEST_MD5_GG(a, b, c, d, X( 5),  5, &Hd62f105d)
			MDMESSAGEDIGEST_MD5_GG(d, a, b, c, X(10),  9, &H02441453)
			MDMESSAGEDIGEST_MD5_GG(c, d, a, b, X(15), 14, &Hd8a1e681)
			MDMESSAGEDIGEST_MD5_GG(b, c, d, a, X( 4), 20, &He7d3fbc8)
			MDMESSAGEDIGEST_MD5_GG(a, b, c, d, X( 9),  5, &H21e1cde6)
			MDMESSAGEDIGEST_MD5_GG(d, a, b, c, X(14),  9, &Hc33707d6)
			MDMESSAGEDIGEST_MD5_GG(c, d, a, b, X( 3), 14, &Hf4d50d87)
			MDMESSAGEDIGEST_MD5_GG(b, c, d, a, X( 8), 20, &H455a14ed)
			MDMESSAGEDIGEST_MD5_GG(a, b, c, d, X(13),  5, &Ha9e3e905)
			MDMESSAGEDIGEST_MD5_GG(d, a, b, c, X( 2),  9, &Hfcefa3f8)
			MDMESSAGEDIGEST_MD5_GG(c, d, a, b, X( 7), 14, &H676f02d9)
			MDMESSAGEDIGEST_MD5_GG(b, c, d, a, X(12), 20, &H8d2a4c8a)
			
			MDMESSAGEDIGEST_MD5_HH(a, b, c, d, X( 5),  4, &Hfffa3942)
			MDMESSAGEDIGEST_MD5_HH(d, a, b, c, X( 8), 11, &H8771f681)
			MDMESSAGEDIGEST_MD5_HH(c, d, a, b, X(11), 16, &H6d9d6122)
			MDMESSAGEDIGEST_MD5_HH(b, c, d, a, X(14), 23, &Hfde5380c)
			MDMESSAGEDIGEST_MD5_HH(a, b, c, d, X( 1),  4, &Ha4beea44)
			MDMESSAGEDIGEST_MD5_HH(d, a, b, c, X( 4), 11, &H4bdecfa9)
			MDMESSAGEDIGEST_MD5_HH(c, d, a, b, X( 7), 16, &Hf6bb4b60)
			MDMESSAGEDIGEST_MD5_HH(b, c, d, a, X(10), 23, &Hbebfbc70)
			MDMESSAGEDIGEST_MD5_HH(a, b, c, d, X(13),  4, &H289b7ec6)
			MDMESSAGEDIGEST_MD5_HH(d, a, b, c, X( 0), 11, &Heaa127fa)
			MDMESSAGEDIGEST_MD5_HH(c, d, a, b, X( 3), 16, &Hd4ef3085)
			MDMESSAGEDIGEST_MD5_HH(b, c, d, a, X( 6), 23, &H04881d05)
			MDMESSAGEDIGEST_MD5_HH(a, b, c, d, X( 9),  4, &Hd9d4d039)
			MDMESSAGEDIGEST_MD5_HH(d, a, b, c, X(12), 11, &He6db99e5)
			MDMESSAGEDIGEST_MD5_HH(c, d, a, b, X(15), 16, &H1fa27cf8)
			MDMESSAGEDIGEST_MD5_HH(b, c, d, a, X( 2), 23, &Hc4ac5665)
			
			MDMESSAGEDIGEST_MD5_II(a, b, c, d, X( 0),  6, &Hf4292244)
			MDMESSAGEDIGEST_MD5_II(d, a, b, c, X( 7), 10, &H432aff97)
			MDMESSAGEDIGEST_MD5_II(c, d, a, b, X(14), 15, &Hab9423a7)
			MDMESSAGEDIGEST_MD5_II(b, c, d, a, X( 5), 21, &Hfc93a039)
			MDMESSAGEDIGEST_MD5_II(a, b, c, d, X(12),  6, &H655b59c3)
			MDMESSAGEDIGEST_MD5_II(d, a, b, c, X( 3), 10, &H8f0ccc92)
			MDMESSAGEDIGEST_MD5_II(c, d, a, b, X(10), 15, &Hffeff47d)
			MDMESSAGEDIGEST_MD5_II(b, c, d, a, X( 1), 21, &H85845dd1)
			MDMESSAGEDIGEST_MD5_II(a, b, c, d, X( 8),  6, &H6fa87e4f)
			MDMESSAGEDIGEST_MD5_II(d, a, b, c, X(15), 10, &Hfe2ce6e0)
			MDMESSAGEDIGEST_MD5_II(c, d, a, b, X( 6), 15, &Ha3014314)
			MDMESSAGEDIGEST_MD5_II(b, c, d, a, X(13), 21, &H4e0811a1)
			MDMESSAGEDIGEST_MD5_II(a, b, c, d, X( 4),  6, &Hf7537e82)
			MDMESSAGEDIGEST_MD5_II(d, a, b, c, X(11), 10, &Hbd3af235)
			MDMESSAGEDIGEST_MD5_II(c, d, a, b, X( 2), 15, &H2ad7d2bb)
			MDMESSAGEDIGEST_MD5_II(b, c, d, a, X( 9), 21, &Heb86d391)
			
			stateMD5(0) += a
			stateMD5(1) += b
			stateMD5(2) += c
			stateMD5(3) += d
		Case "SHA-1"
			Dim As UInteger a, b, c, d, e, T
			Dim As UInteger w(80)
			
			Dim As Integer i
			
			Dim As UByte Ptr where = block
			For i = 0 To 15
				Dim As UInteger temp = block[(4*i)]
				temp Shl= 8:temp Or= block[(4*i) + 1]
				temp Shl= 8:temp Or= block[(4*i) + 2]
				temp Shl= 8:temp Or= block[(4*i) + 3]
				w(i) = temp
			Next
			
			For i = 16 To 79
				w(i) = rotl((w(i-3) Xor w(i-8) Xor w(i-14) Xor w(i-16)), 1)
			Next
			
			a = stateSHA1(0)
			b = stateSHA1(1)
			c = stateSHA1(2)
			d = stateSHA1(3)
			e = stateSHA1(4)
			
			For i = 0 To 19
				T = rotl(a, 5) + MDMESSAGEDIGEST_SHA1_Ch(b, c, d) + e + &H5a827999 + w(i)
				e = d
				d = c
				c = rotl(b, 30)
				b = a
				a = T
			Next
			For i = 20 To 39
				T = rotl(a, 5) + MDMESSAGEDIGEST_SHA1_Par(b, c, d) + e + &H6ed9eba1 + w(i)
				e = d
				d = c
				c = rotl(b, 30)
				b = a
				a = T
			Next
			For i = 40 To 59
				T = rotl(a, 5) + MDMESSAGEDIGEST_SHA1_Maj(b, c, d) + e + &H8f1bbcdc + w(i)
				e = d
				d = c
				c = rotl(b, 30)
				b = a
				a = T
			Next
			For i = 60 To 79
				T = rotl(a, 5) + MDMESSAGEDIGEST_SHA1_Par(b, c, d) + e + &Hca62c1d6 + w(i)
				e = d
				d = c
				c = rotl(b, 30)
				b = a
				a = T
			Next
			
			stateSHA1(0) += a
			stateSHA1(1) += b
			stateSHA1(2) += c
			stateSHA1(3) += d
			stateSHA1(4) += e
		Case "SHA-512"
			Dim As ULongInt a, b, c, d, e, f, g, h, T1, T2
			Dim As ULongInt w(80)
			Dim As ULongInt K(80) => { _
			&H428a2f98d728ae22ULL, &H7137449123ef65cdULL, &Hb5c0fbcfec4d3b2fULL, &He9b5dba58189dbbcULL, &H3956c25bf348b538ULL, &H59f111f1b605d019ULL, _
			&H923f82a4af194f9bULL, &Hab1c5ed5da6d8118ULL, &Hd807aa98a3030242ULL, &H12835b0145706fbeULL, &H243185be4ee4b28cULL, &H550c7dc3d5ffb4e2ULL, _
			&H72be5d74f27b896fULL, &H80deb1fe3b1696b1ULL, &H9bdc06a725c71235ULL, &Hc19bf174cf692694ULL, &He49b69c19ef14ad2ULL, &Hefbe4786384f25e3ULL, _
			&H0fc19dc68b8cd5b5ULL, &H240ca1cc77ac9c65ULL, &H2de92c6f592b0275ULL, &H4a7484aa6ea6e483ULL, &H5cb0a9dcbd41fbd4ULL, &H76f988da831153b5ULL, _
			&H983e5152ee66dfabULL, &Ha831c66d2db43210ULL, &Hb00327c898fb213fULL, &Hbf597fc7beef0ee4ULL, &Hc6e00bf33da88fc2ULL, &Hd5a79147930aa725ULL, _
			&H06ca6351e003826fULL, &H142929670a0e6e70ULL, &H27b70a8546d22ffcULL, &H2e1b21385c26c926ULL, &H4d2c6dfc5ac42aedULL, &H53380d139d95b3dfULL, _
			&H650a73548baf63deULL, &H766a0abb3c77b2a8ULL, &H81c2c92e47edaee6ULL, &H92722c851482353bULL, &Ha2bfe8a14cf10364ULL, &Ha81a664bbc423001ULL, _
			&Hc24b8b70d0f89791ULL, &Hc76c51a30654be30ULL, &Hd192e819d6ef5218ULL, &Hd69906245565a910ULL, &Hf40e35855771202aULL, &H106aa07032bbd1b8ULL, _
			&H19a4c116b8d2d0c8ULL, &H1e376c085141ab53ULL, &H2748774cdf8eeb99ULL, &H34b0bcb5e19b48a8ULL, &H391c0cb3c5c95a63ULL, &H4ed8aa4ae3418acbULL, _
			&H5b9cca4f7763e373ULL, &H682e6ff3d6b2b8a3ULL, &H748f82ee5defb2fcULL, &H78a5636f43172f60ULL, &H84c87814a1f0ab72ULL, &H8cc702081a6439ecULL, _
			&H90befffa23631e28ULL, &Ha4506cebde82bde9ULL, &Hbef9a3f7b2c67915ULL, &Hc67178f2e372532bULL, &Hca273eceea26619cULL, &Hd186b8c721c0c207ULL, _
			&Heada7dd6cde0eb1eULL, &Hf57d4f7fee6ed178ULL, &H06f067aa72176fbaULL, &H0a637dc5a2c898a6ULL, &H113f9804bef90daeULL, &H1b710b35131c471bULL, _
			&H28db77f523047d84ULL, &H32caab7b40c72493ULL, &H3c9ebe0a15c9bebcULL, &H431d67c49c100d4cULL, &H4cc5d4becb3e42b6ULL, &H597f299cfc657e2aULL, _
			&H5fcb6fab3ad6faecULL, &H6c44198c4a475817ULL}
			
			Dim As Integer i
			
			For i = 0 To 15
				Dim As ULongInt temp = block[(8*i)]
				temp Shl= 8:temp Or= block[(8*i) + 1]
				temp Shl= 8:temp Or= block[(8*i) + 2]
				temp Shl= 8:temp Or= block[(8*i) + 3]
				temp Shl= 8:temp Or= block[(8*i) + 4]
				temp Shl= 8:temp Or= block[(8*i) + 5]
				temp Shl= 8:temp Or= block[(8*i) + 6]
				temp Shl= 8:temp Or= block[(8*i) + 7]
				w(i) = temp
			Next
			
			For i = 16 To 79
				w(i) = MDMESSAGEDIGEST_SHA512_Sig1(w(i-2)) + w(i-7) + MDMESSAGEDIGEST_SHA512_Sig0(w(i-15)) + w(i-16)
			Next
			
			a = stateSHA512(0)
			b = stateSHA512(1)
			c = stateSHA512(2)
			d = stateSHA512(3)
			e = stateSHA512(4)
			f = stateSHA512(5)
			g = stateSHA512(6)
			h = stateSHA512(7)
			
			For i = 0 To 79
				T1 = h + MDMESSAGEDIGEST_SHA512_Sum1(e) + MDMESSAGEDIGEST_SHA512_Ch(e,f,g) + K(i) + w(i)
				T2 = MDMESSAGEDIGEST_SHA512_Sum0(a) + MDMESSAGEDIGEST_SHA512_Maj(a,b,c)
				h = g
				g = f
				f = e
				e = d + T1
				d = c
				c = b
				b = a
				a = T1 + T2
			Next
			
			stateSHA512(0) += a
			stateSHA512(1) += b
			stateSHA512(2) += c
			stateSHA512(3) += d
			stateSHA512(4) += e
			stateSHA512(5) += f
			stateSHA512(6) += g
			stateSHA512(7) += h
		Case Else
			
	End Select
End Sub

Sub mdMessageDigest.update(ByVal dat As UByte Ptr, ByVal length As UInteger)
	Select Case This.algo
		Case "MD5"
			Dim As UInteger nIndex = Cast(UInteger, ((count(0) Shr 3) And &H3f))
			count(0) += (length Shl 3)
			If (count(0) < (length Shl 3)) Then
				count(1) += 1
			EndIf
			count(1) += (length Shr 29)
			Dim As UInteger i, nPartLen = 64 - nIndex
			If (length >= nPartLen) Then
				memcpy(@buf(nIndex), dat, nPartLen)
				transform(@buf(0))
				i = nPartLen
				While i + 63 < length
					transform(@dat[i])
					i += 64
				Wend
				nIndex = 0
			Else
				i = 0
			EndIf
			memcpy(@buf(nIndex), @dat[i], length - i)
		Case "SHA-1"
			Dim As UInteger i, part_len, index = Cast(UInteger, (count(0) Shr 3) And &H3f)
			count(0) += (length Shl 3)
			If (count(0) < (length Shl 3)) Then
				count(1) += 1
			EndIf
			count(1) += (length Shr 29)
			part_len = 64 - index
			If (length >= part_len) Then
				memcpy(@buf(index), dat, part_len)
				transform(@buf(0))
				i = part_len
				While i + 63 < length
					transform(@dat[i])
					i += 64
				Wend
				index = 0
			Else
				i = 0
			EndIf
			memcpy(@buf(index), @dat[i], length - i)
		Case "SHA-512"
			Dim As UInteger i, part_len, index = Cast(UInteger, (count(0) Shr 3) And &H7f)
			count(0) += (length Shl 3)
			If (count(0) < (length Shl 3)) Then
				count(1) += 1
				If (count(1) < 1) Then
					count(2) += 1
					If (count(2) < 1) Then
						count(3) += 1
					EndIf
				EndIf
			EndIf
			count(1) += (length Shr 29)
			part_len = 128 - index
			If (length >= part_len) Then
				memcpy(@buf(index), dat, part_len)
				transform(@buf(0))
				i = part_len
				While i + 127 < length
					transform(@dat[i])
					i += 128
				Wend
				index = 0
			Else
				i = 0
			EndIf
			memcpy(@buf(index), @dat[i], length - i)
		Case Else
			
	End Select
End Sub

Function mdMessageDigest.final() As String
	Select Case This.algo
		Case "MD5"
			Dim As UByte bits(8), PADDING(64) => { &H80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
			uIntegerToUByte(@bits(0), @count(0), 8)
			
			Dim As UInteger nIndex = Cast(UInteger, (count(0) Shr 3) And &H3f)
			update(@PADDING(0), IIf((nIndex < 56), (56 - nIndex), (120 - nIndex)))
			update(@bits(0), 8)
			
			Dim As UByte lpszMD5(16)
			uIntegerToUByte(@lpszMD5(0), @stateMD5(0), 16)
			
			Dim As String strMD5
			For i As Integer = 0 To 15
				Dim As String strn
				If lpszMD5(i) = 0 Then
					strn = "00"
				ElseIf lpszMD5(i) <= 15 Then
					strn = "0" + Str(Hex(lpszMD5(i)))
				Else
					strn = Str(Hex(lpszMD5(i)))
				EndIf
				strMD5 += strn
			Next
			Return strMD5
		Case "SHA-1"
			Dim As UByte bits(8), PADDING(64) => {&H80}
			Dim As UInteger index, pad_len, t
			
			t = count(0)
			bits(7) = t:t Shr= 8
			bits(6) = t:t Shr= 8
			bits(5) = t:t Shr= 8
			bits(4) = t
			t = count(1)
			bits(3) = t:t Shr= 8
			bits(2) = t:t Shr= 8
			bits(1) = t:t Shr= 8
			bits(0) = t
			
			index = Cast(UInteger, (count(0) Shr 3) And &H3f)
			pad_len = IIf(index < 56, (56 - index), (120 - index))
			update(@PADDING(0), pad_len)
			update(@bits(0), 8)
			
			Dim As String ret
			For i As Integer = 0 To 4
		   		ret += Hex(stateSHA1(i), 8)
			Next
			Return ret
		Case "SHA-512"
			Dim As UByte bits(16), PADDING(128) => {&H80}
			Dim As UInteger index, pad_len, t
			
			t = count(0)
			bits(15) = t:t Shr= 8
			bits(14) = t:t Shr= 8
			bits(13) = t:t Shr= 8
			bits(12) = t
			t = count(1)
			bits(11) = t:t Shr= 8
			bits(10) = t:t Shr= 8
			bits( 9) = t:t Shr= 8
			bits( 8) = t
			t = count(2)
			bits( 7) = t:t Shr= 8
			bits( 6) = t:t Shr= 8
			bits( 5) = t:t Shr= 8
			bits( 4) = t
			t = count(3)
			bits( 3) = t:t Shr= 8
			bits( 2) = t:t Shr= 8
			bits( 1) = t:t Shr= 8
			bits( 0) = t
			
			index = Cast(UInteger, (count(0) Shr 3) And &H7f)
			pad_len = IIf(index < 112, (112 - index), (240 - index))
			update(@PADDING(0), pad_len)
			update(@bits(0), 16)
			
			Dim As String ret
			For i As Integer = 0 To 7
				ret += Hex(stateSHA512(i), 16)
			Next
			Return ret
		Case Else
			Return ""
	End Select
End Function

Sub mdMessageDigest.uIntegerToUByte(ByVal outpt As UByte Ptr, ByVal inpt As UInteger Ptr, ByVal nLength As UInteger)
	Dim As UInteger i, j
	
	While j < nLength
		outpt[ j ] = Cast(UByte, (inpt[i]       ))
		outpt[j+1] = Cast(UByte, (inpt[i] Shr  8))
		outpt[j+2] = Cast(UByte, (inpt[i] Shr 16))
		outpt[j+3] = Cast(UByte, (inpt[i] Shr 24))
		i += 1
		j += 4
	Wend
End Sub

Sub mdMessageDigest.uByteToUInteger(ByVal outpt As UInteger Ptr, ByVal inpt As UByte Ptr, ByVal nLength As UInteger)
	Dim As UInteger i, j
	While j < nLength
		outpt[i] = (Cast(UInteger, inpt[j])) Or (Cast(UInteger, inpt[j+1]) Shl 8) Or (Cast(UInteger, inpt[j+2]) Shl 16) Or (Cast(UInteger, inpt[j+3]) Shl 24)
		i += 1
		j += 4
	Wend
End Sub

Function mdMessageDigest.memcpy(ByVal destination As UByte Ptr, ByVal source As UByte Ptr, ByVal num As UInteger) As UByte Ptr
	For i As Integer = 0 To num - 1
		destination[i]  = source[i]
	Next
	Return destination
End Function
Function mdMessageDigest.rotl(ByVal x As UInteger, ByVal n As UInteger) As UInteger
	Return ((x Shl n) Or (x Shr (32 - n)))
End Function
Function mdMessageDigest.rotr(ByVal y As ULongInt, ByVal x As ULongInt) As ULongInt
	Return ((x Shr y) Or (x Shl (64 - y)))
End Function

Function mdMessageDigest.shrr(ByVal n As ULongInt, ByVal x As ULongInt) As ULongInt
	Return (x Shr n)
End Function

Function mdMessageDigest.createHash(ByRef text As String) As String
	Dim As UInteger length = Len(text)
	If length = 0 Then
		Return ""
	EndIf
	
	Dim As UByte buffer(16384)
	For i As Integer = 0 To length - 1
		buffer(i) = text[i]
	Next
	
	update(@buffer(0), length)
	
	Return final()
End Function

Function mdMessageDigest.createFileHash(ByRef file As String) As String
	Dim As UInteger length = Len(file)
	If length = 0 Then
		Return ""
	EndIf
	
	Dim As Integer FF = FreeFile
	If Open(file For Binary Access Read As #FF) <> 0 Then
		Return ""
	EndIf
	
	Dim As UInteger fileLength = Lof(FF)
	If fileLength = 0 Then
		Close #FF
		Return ""
	EndIf
	
	Dim As UByte buffer(16384)
	Dim As UInteger toBuffer
	Do Until fileLength = 0
		If fileLength >= 16384 Then
			fileLength -= 16384
			toBuffer = 16384
		Else
			toBuffer = fileLength
			fileLength = 0
		EndIf
		Get #FF, , buffer(0), toBuffer
		update(@buffer(0), toBuffer)
	Loop
	Close #FF
	
	Return final()
End Function

#EndIf '__MDMESSAGEDIGEST_BI__
