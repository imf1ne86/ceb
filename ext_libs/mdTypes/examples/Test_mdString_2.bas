#Include Once "md/lang/mdString.bi"

Dim As mdString text = "boo:and:foo"

Dim As mdString array()

Print text.split(array(), ":", 0)
For i As Integer = LBound(array) To UBound(array)
	Print i, "|" & array(i) & "|"
Next
Print
Print text.split(array(), "o", 0)
For i As Integer = LBound(array) To UBound(array)
	Print i, "|" & array(i) & "|"
Next

Print:Print:Print

Print text.replace("boo", "bar")
Print text.replace("bar", "foo")

Print:Print:Print

Dim As mdString text2 = "foo&bar&baz&foobar&foobaz&barbaz"
Print text2.replaceFirst("&", "|")

Sleep