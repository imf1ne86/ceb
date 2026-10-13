#Include "md/lang/mdString.bi"

Dim As mdString foo = "Hallo"
Print *foo.toCharArray(), foo.toString(), foo
Print *foo.toUpperCase().toCharArray()
Print *foo.toUpperCase().substring(2).toCharArray()
Print *foo.toUpperCase().substring(2,3).toCharArray()
Print foo.length()
Print *mdString.valueOf(15).toCharArray()
Dim As mdString bar
Print *bar.toCharArray()
Print bar.length()
bar = " Welt"
Print bar
Print foo.concat(bar), foo
Print foo.replace(Asc("a"), Asc("e"))
foo += bar
Print foo
Print
Print "------------------------"
Print
Dim As mdString neuerString = "Ej Junge! Aufpassen!"
Print neuerString.indexOf(mdString("Junge!"))
Print neuerString.indexOf("Junge!")
Print neuerString.lastIndexOf("unge!")
Print neuerString.charAt(1), Asc("j")
Print neuerString.compareTo(mdString("Ej Junge! Aufpassen!"))
Print neuerString.compareTo("Ej Junge! Aufpassen!")
Print neuerString.compareToIgnoreCase("Ej Junge! Aufpassen!")
Print neuerString.compareTo("El Junge! Aufpassen!")
Print
Print "------------------------"
Print
Dim As ZString Ptr tt = @"Test"
Print *mdString.copyValueOf(tt).toCharArray()
Print *mdString.copyValueOf(tt, 1, 2).toCharArray()
Print mdString.copyValueOf(tt).endsWith(mdString("est"))
Print mdString.copyValueOf(tt).endsWith("est")
Print mdString.copyValueOf(tt).endsWith("esd")
Print mdString.copyValueOf(tt).startsWith(mdString("Tes"))
Print mdString.copyValueOf(tt).startsWith("Tes")
Print mdString.copyValueOf(tt).startsWith("Des")
Print mdString.copyValueOf(tt).equals(mdString("Test"))
Print mdString.copyValueOf(tt).equals("Test")
Print mdString.copyValueOf(tt).equals("Dest")
Print mdString.copyValueOf(tt).equalsIgnoreCase(mdString("Test"))
Print mdString.copyValueOf(tt).equalsIgnoreCase("Test")
Print mdString.copyValueOf(tt).equalsIgnoreCase("Dest")
Print
Print "------------------------"
Print
Dim As Byte array()
'Print mdString.copyValueOf(tt).getBytes(array()), mdString.copyValueOf(tt).length()
mdString.copyValueOf(tt).getBytes(1, 3, array(), 1)
For i As Integer = LBound(array) To UBound(array)
	Print i, array(i), Chr(array(i))
Next
Dim As ZString Ptr zstrptr
mdString.copyValueOf(tt).getChars(0, 1, zstrptr, 0)
Print zstrptr, "=", *zstrptr
Print mdString.copyValueOf(tt).hashCode()
Print mdString.copyValueOf(tt).intern()
Print
Print "------------------------"
Print
Print mdString.copyValueOf(tt).regionMatches(FALSE, 0, "Test", 0, 2)
Print mdString.copyValueOf(tt).regionMatches(FALSE, 0, "Dest", 0, 2)
Print mdString.copyValueOf(tt).regionMatches(FALSE, 1, "Dest", 1, 2)
Print mdString.copyValueOf(tt).regionMatches(FALSE, 0, "test", 0, 2)
Print mdString.copyValueOf(tt).regionMatches(TRUE, 0, "Test", 0, 2)
Print mdString.copyValueOf(tt).regionMatches(TRUE, 0, "Dest", 0, 2)
Print mdString.copyValueOf(tt).regionMatches(TRUE, 1, "Dest", 1, 2)
Print mdString.copyValueOf(tt).regionMatches(TRUE, 0, "test", 0, 2)
Print mdString.copyValueOf(tt).regionMatches(0, "Test", 0, 2)
Print mdString.copyValueOf(tt).regionMatches(0, "Dest", 0, 2)
Print mdString.copyValueOf(tt).regionMatches(1, "Dest", 1, 2)
Print mdString.copyValueOf(tt).regionMatches(0, "test", 0, 2)
Print
Print "------------------------"
Print

Sleep
