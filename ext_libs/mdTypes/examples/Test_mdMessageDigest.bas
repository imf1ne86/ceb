#Include Once "md/security/mdMessageDigest.bi"

Dim As String result
Dim As String text = "Franz jagt im komplett verwahrlosten Taxi quer durch Bayern"

Dim As mdMessageDigest m = *mdMessageDigest.getInstance("MD5") '"SHA-1", "SHA-512"
m.update(text)
result = m.digest()
If UCase(result) = UCase("a3cca2b2aa1e3b5b3b5aad99a8529074") Then
	Print "Digest Test 1: yeah"
Else
	Print "Digest Test 1: nooo"
EndIf



Dim As mdMessageDigest m1 = *mdMessageDigest.getInstance("MD5")
result = m1.createHash(text)
If UCase(result) = UCase("a3cca2b2aa1e3b5b3b5aad99a8529074") Then
	Print "Result Test 1: yeah"
Else
	Print "Result Test 1: nooo"
EndIf

Dim As mdMessageDigest s1 = *mdMessageDigest.getInstance("SHA-1")
result = s1.createHash(text)
If UCase(result) = UCase("68ac906495480a3404beee4874ed853a037a7a8f") Then
	Print "Result Test 2: yeah"
Else
	Print "Result Test 2: nooo"
EndIf

Dim As mdMessageDigest s2 = *mdMessageDigest.getInstance("SHA-512")
result = s2.createHash(text)
If UCase(result) = UCase("af9ed2de700433b803240a552b41b5a472a6ef3fe1431a722b2063c75e9f07451f67a28e37d09cde769424c96aea6f8971389db9e1993d6c565c3c71b855723c") Then
	Print "Result Test 3: yeah"
Else
	Print "Result Test 3: nooo"
EndIf

Sleep
