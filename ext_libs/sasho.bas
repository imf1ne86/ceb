'' include file "standard.bi", v. 1.0.0 - containing
'' some string and array functions and procedures
'' for FreeBasic.
'' (c) 2006 Alexander Ivanov; e-mail: eto@applet-bg.com
'' Use and enjoy but (of course) WITHOUT ANY WARRANTY!
''====================================================================
/'$DYNAMIC'/
/'
========================== Explanations ==============================
  This text is for your information only - don't remove the remark signs!
 
***************************
  String finctions:
 
function IsByteInString(b as ubyte, test as string) as integer
     The function returns zero if 'b' not in 'test' else returns
     position of 'b' in 'test' - the first position is 1.

sub userConvertString(s as string, source as string, dest as string)
    Replace any charachter in 's', which is in 'source', with the charachter
    from 'dest' in such position.
   
function userLCase(s as string, lower as string, upper as string) as string
function userUCase(s as string, lower as string, upper as string) as string
    The functions convert 's' to lower or upper case characters with user
    defined set of charachters. Example (German, latin-1) - lower="дць",
                                                            upper="ДЦЬ"
    If lower="" AND upper="" the functions works as standard lcase() and
    ucase() finctions. If s="" or len(lower)<> len(upper)
    the functions return an empty string.

sub InvertLine(s as string)
    s="abcd" ---> s="dcba". I use this function to make a tergo (from
    the back) dictionaries.

function GetLeftWord(l as string) as string
    The function returns (and removes from the 'l') left "word" from
    string 'l'. The "word" delimiters are space (asc(32)) and tab (asc(9)).
    If string 'l' containts one "word" only, the string 'l' becomes empty.


*****************************
    Comparig functions:

function qsComparebyte (d1 as byte, d2 as byte) as integer
function qsCompareubyte (d1 as ubyte, d2 as ubyte) as integer
function qsCompareshort (d1 as short, d2 as short) as integer
function qsCompareushort (d1 as ushort, d2 as ushort) as integer
function qsCompareinteger (d1 as integer, d2 as integer) as integer
function qsCompareuinteger (d1 as uinteger, d2 as uinteger) as integer
function qsComparelongint (d1 as longint, d2 as longint) as integer
function qsCompareulongint (d1 as ulongint, d2 as ulongint) as integer
function qsComparesingle (d1 as single, d2 as single) as integer
function qsComparedouble (d1 as double, d2 as double) as integer
function qsComparestring (d1 as string, d2 as string) as integer
    if d1 > d2 returns 1
    if d1 < d2 returns -1
    if d1 = d2 returns 0

function qsDecComparebyte (d1 as byte, d2 as byte) as integer
function qsDecCompareubyte (d1 as ubyte, d2 as ubyte) as integer
function qsDecCompareshort (d1 as short, d2 as short) as integer
function qsDecCompareushort (d1 as ushort, d2 as ushort) as integer
function qsDecCompareinteger (d1 as integer, d2 as integer) as integer
function qsDecCompareuinteger (d1 as uinteger, d2 as uinteger) as integer
function qsDecComparelongint (d1 as longint, d2 as longint) as integer
function qsDecCompareulongint (d1 as ulongint, d2 as ulongint) as integer
function qsDecComparesingle (d1 as single, d2 as single) as integer
function qsDecComparedouble (d1 as double, d2 as double) as integer
function qsDecComparestring (d1 as string, d2 as string) as integer
    if d1 < d2 returns 1
    if d1 > d2 returns -1
    if d1 = d2 returns 0

*****************************
    Array functions:
 
sub CopyArray overload (source() as [any standard type],_
                        dest() as [such standard type])
    The sub copies the array 'source' in th array 'dest'.
   
sub UniqArray overload (source() as [any standard type],
                        dest() as [such standard type],_
                        frequencies() as integer)
    Note: the source() must be sorted!
    The subroutine makes dest() from source() without duplicated items.
    In any case the subroutine makes the array frequencies() containing
    the frequencies in source() for each element of dest().

sub JoinArray overload (first() as [any standard type],
                        secnd() as [such standard type],
                        dest() as [such standard type])
    The subroutine joins the array 'first()' and the array 'secnd()'
    in the array 'dest()'. The array 'dest()' is based on zero
    (lbound(dest)=0) alway.

function GetSubArray overload ( source() as [any standard type],_
                                f as integer, t as integer,_
                                dest() as [such standard type])
    if f<lbound(source) or t>ubound(source) the functions return -1 and
    empty dest().

function QuickSort overload (d() as [standard type], inx() as integer,_
                             fromPos as integer, toPos as integer,_
                             flags as ulongint) as integer:_

sub InvertTextLines(s() as string)
    Using sub InvertLine() the function inverts all strings in array s()

sub RemoveEmptyLines(s() as string)
    The subroutine removes empty strings from s(). Mostly the ubound(s)
    is decreased.
   
sub TextToWords(text() as string, words() as string)
    Using GetLeftWord() the subroutine creates array words() containing the
    "words" from text() in order left to right and top to bottom.

*******************************
   Text file reading and writing functions:
   
function ReadTextFile(fileName as string, text() as string) as integer
function WriteTextFile(fileName as string, text() as string) as integer
    Reding from text file to string array text() and writing the text
    array to text file. The functions return (-1) on IO error.
   
=========================== End of explanations ===========================
'/
'' A set of flags for QuickSort():
Const As Uinteger qsClearFlags = 0  '' defaults:
                                    '' - without index;
                                    '' - increasing (for A to Z, for 0 to 9)
Const As Uinteger qsMakeIndex   = 1,_
                  qsDecreasing  = 2

#define _Make_CopyArray_Sub( _a__type_ ) _
Sub CopyArray overload (source() As _a__type_, dest() As _a__type_):_
    Dim As Longint f,t,i:_
    f=Lbound(source): t=Ubound(source): Redim dest(f To t):_
    For i=f To t:dest(i)=source(i):Next:_
End Sub

_Make_CopyArray_Sub( Byte )
_Make_CopyArray_Sub( Ubyte )
_Make_CopyArray_Sub( Short )
_Make_CopyArray_Sub( Ushort )
_Make_CopyArray_Sub( Integer )
_Make_CopyArray_Sub( Uinteger )
_Make_CopyArray_Sub( Longint )
_Make_CopyArray_Sub( Ulongint )
_Make_CopyArray_Sub( Single )
_Make_CopyArray_Sub( Double )
_Make_CopyArray_Sub( String )

'#define _Make_UniqArray_Sub( _a__type_ ) _
'Sub UniqArray overload (source() As _a__type_, dest() As _a__type_,_
'                        frequencies() As Integer):_
'    Dim As Longint f, t, r, dPtr:_
'    f=Lbound(source):t=Ubound(source):_
'    dPtr=0:Redim dest(dPtr): Redim frequencies(dPtr):_
'    dest(dPtr)=source(f):frequencies(dPtr)=1:f+=1:_
'    For r = f To t:_
'        If source(r)<>dest(dPtr) Then:_
'            dPtr+=1:_
'            Redim preserve dest(dPtr):_
'            Redim preserve frequencies(dPtr):_
'            dest(dPtr)=source(r):frequencies(dPtr)=1:_
'        Else:_
'            frequencies(dPtr)+=1:_
'        End If:_
'    Next:_
'End Sub

#define _Make_UniqArray_Sub( _a__type_ ) _
Sub UniqArray overload (source() As _a__type_, dest() As _a__type_,_
                        frequencies() As Integer):_
    Dim As Longint f, t, r, dPtr:_
    f=Lbound(source):t=Ubound(source):_
    dPtr=0:Redim dest(1+t-f): Redim frequencies(1+t-f):_
    dest(dPtr)=source(f):frequencies(dPtr)=1:f+=1:_
    For r = f To t:_
        If source(r)<>dest(dPtr) Then:_
            dPtr+=1:_
            dest(dPtr)=source(r):frequencies(dPtr)=1:_
        Else:_
            frequencies(dPtr)+=1:_
        End If:_
    Next:_
    Redim preserve dest(dPtr):_
    Redim preserve frequencies(dPtr):_
End Sub

_Make_UniqArray_Sub( Byte )
_Make_UniqArray_Sub( Ubyte )
_Make_UniqArray_Sub( Short )
_Make_UniqArray_Sub( Ushort )
_Make_UniqArray_Sub( Integer )
_Make_UniqArray_Sub( Uinteger )
_Make_UniqArray_Sub( Longint )
_Make_UniqArray_Sub( Ulongint )
_Make_UniqArray_Sub( Single )
_Make_UniqArray_Sub( Double )
_Make_UniqArray_Sub( String )

'#define _Make_JoinArray_Sub( _a__type_ ) _
'Sub JoinArray overload (first() As _a__type_, secnd() As _a__type_,_
'                        dest() As _a__type_):_
'    Dim As Integer p,i:_
'    p=0:_
'    Redim dest(0):_
'    For i=Lbound(first) To Ubound(first):_
'        Redim preserve dest(p):_
'        dest(p)=first(i):_
'        p+=1:_
'    Next:_
'    For i=Lbound(secnd) To Ubound(secnd):_
'        Redim preserve dest(p):_
'        dest(p)=secnd(i):_
'        p+=1:_
'    Next:_
'End Sub

#define _Make_JoinArray_Sub( _a__type_ ) _
Sub JoinArray overload (first() As _a__type_, secnd() As _a__type_,_
                        dest() As _a__type_):_
    Dim As Integer p,i,x:_
    p=0:x=1+(Ubound(first)-LBound(first))+(Ubound(secnd)-LBound(secnd)):_
    Redim dest(x):_
    For i=Lbound(first) To Ubound(first):_
        dest(p)=first(i):_
        p+=1:_
    Next:_
    For i=Lbound(secnd) To Ubound(secnd):_
        dest(p)=secnd(i):_
        p+=1:_
    Next:_
End Sub

_Make_JoinArray_Sub( Byte )
_Make_JoinArray_Sub( Ubyte )
_Make_JoinArray_Sub( Short )
_Make_JoinArray_Sub( Ushort )
_Make_JoinArray_Sub( Integer )
_Make_JoinArray_Sub( Uinteger )
_Make_JoinArray_Sub( Longint )
_Make_JoinArray_Sub( Ulongint )
_Make_JoinArray_Sub( Single )
_Make_JoinArray_Sub( Double )
_Make_JoinArray_Sub( String )

#define _Make_GetSubArray_Function( _a__type_ ) _
Function GetSubArray overload ( source() As _a__type_, _
                      f As Integer, t As Integer, _
                      dest() As _a__type_) As Integer:_
    Dim As Integer p, i:_
    If f < Lbound(source) Then:_
        Return -1:_
    End If:_
    If t > Ubound(source) Then:_
        Return -1:_
    End If:_
    Redim dest(0):_
    p=0:_
    For i=f To t:_
        Redim preserve dest(p):_
        dest(p)=source(i):_
        p+=1:_
    Next:_
    Return 0:_
End Function:_

_Make_GetSubArray_Function( Byte )
_Make_GetSubArray_Function( Ubyte )
_Make_GetSubArray_Function( Short )
_Make_GetSubArray_Function( Ushort )
_Make_GetSubArray_Function( Integer )
_Make_GetSubArray_Function( Uinteger )
_Make_GetSubArray_Function( Longint )
_Make_GetSubArray_Function( Ulongint )
_Make_GetSubArray_Function( Single )
_Make_GetSubArray_Function( Double )
_Make_GetSubArray_Function( String )

#define _Make_qsCompare_Function( _a__type_ ) _
Function qsCompare##_a__type_ (d1 As _a__type_,_
                               d2 As _a__type_) As Integer:_
    If d1 > d2 Then Return 1: End If:_
    If d2 > d1 Then Return -1: End If:_
    Return 0:_
End Function:_

_Make_qsCompare_Function( Byte )
_Make_qsCompare_Function( Ubyte )
_Make_qsCompare_Function( Short )
_Make_qsCompare_Function( Ushort )
_Make_qsCompare_Function( Integer )
_Make_qsCompare_Function( Uinteger )
_Make_qsCompare_Function( Longint )
_Make_qsCompare_Function( Ulongint )
_Make_qsCompare_Function( Single )
_Make_qsCompare_Function( Double )
_Make_qsCompare_Function( String )

#define _Make_qsDecCompare_Function( _a__type_ ) _
Function qsDecCompare##_a__type_ (d1 As _a__type_,_
                               d2 As _a__type_) As Integer:_
    If d1 < d2 Then Return 1: End If:_
    If d2 > d1 Then Return -1: End If:_
    Return 0:_
End Function:_

_Make_qsDecCompare_Function( Byte )
_Make_qsDecCompare_Function( Ubyte )
_Make_qsDecCompare_Function( Short )
_Make_qsDecCompare_Function( Ushort )
_Make_qsDecCompare_Function( Integer )
_Make_qsDecCompare_Function( Uinteger )
_Make_qsDecCompare_Function( Longint )
_Make_qsDecCompare_Function( Ulongint )
_Make_qsDecCompare_Function( Single )
_Make_qsDecCompare_Function( Double )
_Make_qsDecCompare_Function( String )

#define _Make_QuickSort_Function( _a__type_ ) _
Function QuickSort overload (d() As _a__type_, inx() As Integer,_
                             fromPos As Integer, toPos As Integer,_
                             flags As Ulongint) As Integer:_
    Dim As Integer lft=0, rght=1:_
    Dim As Integer i,j,L,R,sPtr:_
    Dim As _a__type_ m:_
    Dim Compare As Function (d1 As _a__type_, d2 As _a__type_) As Integer:_
    i=Lbound(d): j=Ubound(d):_
    If i=j Then Return -1: End If:_
    If fromPos < i Then Return -1: End If:_
    If toPos > j Then Return -1: End If:_
    If (flags And qsMakeIndex) Then:_
        Redim inx(Lbound(d) To Ubound(d)) As Integer:_
        For i=Lbound(d) To Ubound(d):_
            inx(i)=i:_
        Next:_
    End If:_
    If (flags And qsDecreasing) Then:_
        Compare=@qsDecCompare##_a__type_:_
    Else:_
        Compare=@qsCompare##_a__type_:_
    End If:_
    sPtr=1:_
    Redim stack(1 To sPtr,lft To rght) As Integer:_
    stack(sPtr,lft)=fromPos:_
    stack(sPtr,rght)=toPos:_
    Do:_
        L=stack(sPtr,lft): R=stack(sPtr,rght): sPtr -= 1:_
        Do:_
            i=L: j=R: m=d((L+R)\2):_
            Do:_
                While Compare(m, d(i)) = 1: i+=1: Wend:_
                While Compare(d(j), m) = 1: j-=1: Wend:_
                If i<=j Then:_
                    Swap d(i),d(j):_
                    If (flags And qsMakeIndex) Then:_
                        Swap inx(i),inx(j):_
                    End If:_
                    i+=1: j-=1:_
                End If:_
            Loop Until i>j:_
            If (j-L) < (R-i) Then:_
                If j<R Then:_
                    sPtr+=1:_
                    Redim preserve stack(1 To sPtr,lft To rght):_
                    stack(sPtr,lft)=i: stack(sPtr,rght)=R:_
                End If:_
                R=j:_
            Else:_
                If L<j Then:_
                    sPtr+=1:_
                    Redim preserve stack(1 To sPtr,lft To rght):_
                    stack(sPtr,lft)=L: stack(sPtr,rght)=j:_
                End If:_
                L=i:_
            End If:_
        Loop Until L>=R:_
    Loop Until sPtr=0:_
    Return 0:_
End Function:_

_Make_QuickSort_Function( Byte )
_Make_QuickSort_Function( Ubyte )
_Make_QuickSort_Function( Short )
_Make_QuickSort_Function( Ushort )
_Make_QuickSort_Function( Integer )
_Make_QuickSort_Function( Uinteger )
_Make_QuickSort_Function( Longint )
_Make_QuickSort_Function( Ulongint )
_Make_QuickSort_Function( Single )
_Make_QuickSort_Function( Double )
_Make_QuickSort_Function( String )

''========================================================
Function IsByteInString(b As Ubyte, test As String) As Integer
''========================================================
    Dim i As Ulongint
    If test="" Then Return -1
    IsByteInString=0
    For i=0 To Len(test)-1
        If test[i]=b Then IsByteInString=i+1:Exit For
    Next
End Function

''==================================================================
Sub userConvertString(s As String, source As String, dest As String)
''==================================================================
    Dim As Integer i, test
    If s="" Then Return
    If Len(source)<>len(dest) Then Return
    If source="" And dest="" Then Return
    For i=0 To Len(s)-1
        test=IsByteInString(s[i],source)
        If test > 0 Then s[i]=dest[test-1]
    Next
End Sub

''===========================================================================
Function userLCase(s As String, lower As String, upper As String) As String
''===========================================================================
    Dim As String result
    result=Lcase(s)
    userConvertString(result,upper,lower)
    userLCase=result
End Function

''===========================================================================
Function userUCase(s As String, lower As String, upper As String) As String
''===========================================================================
    Dim As String result
    result=Ucase(s)
    userConvertString(result,lower,upper)
    userUCase=result
End Function

''=========================
Sub InvertLine(s As String)
''=========================
    Dim As Integer t,i
    t=Len(s)-1
    For i=0 To t \ 2
        Swap s[i], s[t]
        t-=1
    Next
End Sub

''=================================
Sub InvertTextLines(s() As String)
''=================================
    Dim As Integer i
    For i = Lbound(s) To Ubound(s)
        InvertLine(s(i))
    Next
End Sub

''=================================
Sub RemoveEmptyLines(s() as string)
''=================================
    Dim As Longint f, t, i, p
    f=Lbound(s): t=Ubound(s): p=f-1
    For i=f To t
        If s(i)="" Then
            Continue For
        Else
            p+=1
            s(p)=s(i)
        End If
    Next
    Redim preserve s(p)
End Sub

''===========================================
Function GetLeftWord(ByRef l As String) As String
''===========================================
    Dim As Ulongint i
    l=trim(l)
    If l="" Then GetLeftWord="":Exit Function
    For i=0 To Len(l)-1
        If (l[i]=32) Or (l[i]=9) Then
            GetLeftWord=Left(l,i)
            l=Mid(l,i+2)
            Exit Function
        End If
    Next
    GetLeftWord=l:l=""
End Function

''==================================================
Sub TextToWords(text() As String, words() As String)
''==================================================
    Dim As Longint f, t, i, m, wPtr
    Dim As String l, w
    f=Lbound(text):t=Ubound(text)
    wPtr=-1 : ReDim words(0)
    For i=f To t
        l=trim(text(i))
        While l<>""
            w = trim(GetLeftWord(l))
            If w<>"" Then
                wPtr+=1
                Redim preserve words(wPtr)
                words(wPtr)=w
            End If
        Wend
    Next
End Sub

''=====================================================================
Function ReadTextFile(fileName As String, text() As String) As Integer
''=====================================================================
    Dim As Integer fh, textPtr
    Dim As String l
    If fileName="" Then ReadTextFile=-1:Exit Function
    fh=Freefile
    If Open(fileName For Input As #fh) = 0 Then
        textPtr=0
        While Not Eof(fh)
            Line Input #fh, l
            Redim preserve text(textPtr)
            text(textPtr)=l
            textPtr+=1
        Wend
        Close(fh)
        ReadTextFile=0
    Else
        ReadTextFile=-1
    End If
End Function

''======================================================================
Function WriteTextFile(fileName As String, text() As String) As Integer
''======================================================================
    Dim As Integer i, fh
    If fileName="" Then WriteTextFile=-1:Exit Function
    fh=Freefile
    If Open(fileName For Output As #fh) = 0 Then
        For i=Lbound(text) To Ubound(text)
            Print #fh,text(i)
            If Err <> 0 Then
                Close(fh)
                WriteTextFile=-1
                Exit Function
            End If
        Next
        Close(fh)
        WriteTextFile=0
    Else
        WriteTextFile=-1
    End If
End Function
