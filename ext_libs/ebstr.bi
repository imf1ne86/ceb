'' ebstr.bi -  Escape string to binary string and
''              binary string to escape string.
'' Interface:
''  sub EscapeStrToBinStr(s as string)
''  sub BinStrToEscapeStr(s as string)
''
'' 2006, Alexander Ivanov, eto@applet-bg.com
#if ( __FB_OPTION_ESCAPE__ <> 0 )
    #error  You do not use this include file with OPTION ESCAPE.
#endif

#if ( __FB_OPTION_ESCAPE__ = 0 )
const as string gtBinDigits="01"
const as string gtOctDigits="01234567"
const as string gtDecDigits="0123456789"
const as string gtHexDigits=gtDecDigits+"aAbBcCdDeEfF"

private function IsByteInString(b as ubyte, test as string) as integer
    dim i as ulongint
    if test="" then return -1
    IsByteInString=0
    for i=0 to len(test)-1
        if test[i]=b then IsByteInString=i+1:exit for
    next
end function

private function GetBinLen(n as integer, s as string) as integer
    dim as integer p, l, _stop=8
    p=n:l=len(s)-1
    while IsByteInString(s[p],gtBinDigits)
        p+=1
        if p>l then exit while
        if (p-n) = _stop then exit while
    wend
    return p-n
end function

private function GetOctLen(n as integer, s as string) as integer
    dim as integer p, l, _stop=3
    p=n:l=len(s)-1
    while IsByteInString(s[p],gtOctDigits)
        p+=1
        if p>l then exit while
        if (p-n) = _stop then exit while
    wend
    return p-n
end function

private function GetDecLen(n as integer, s as string) as integer
    dim as integer p, l, _stop=3
    p=n:l=len(s)-1
    while IsByteInString(s[p],gtDecDigits)
        p+=1
        if p>l then exit while
        if (p-n) = _stop then exit while
    wend
    return p-n
end function

private function GetHexLen(n as integer, s as string) as integer
    dim as integer p, l, _stop=2
    p=n:l=len(s)-1
    while IsByteInString(s[p],gtHexDigits)
        p+=1
        if p>l then exit while
        if (p-n) = _stop then exit while
    wend
    return p-n
end function

sub EscapeStrToBinStr(s as string)
    dim as integer l,p,p2
    l=len(s)-1
    p=0
    while p < l
        if s[p]=92 then '' s[p] - backslash
            select case s[p+1]
                case 34:    '' \"
                    s=left(s,p) + mid(s,p+2): l=len(s)-1
                case 37:    '' \'
                    s=left(s,p) + mid(s,p+2): l=len(s)-1
                case 92:    '' \\
                    s=left(s,p)+mid(s,p+2): l=len(s)-1
                case 97:    '' \a
                    s=left(s,p)+mid(s,p+2):s[p]=7: l=len(s)-1
                case 98:    '' \b
                    s=left(s,p)+mid(s,p+2):s[p]=8: l=len(s)-1
                case 116:   '' \t
                    s=left(s,p)+mid(s,p+2):s[p]=9: l=len(s)-1
                case 110:   '' \n
                    s=left(s,p)+mid(s,p+2):s[p]=10: l=len(s)-1
                case 114:   '' \r
                    s=left(s,p)+mid(s,p+2):s[p]=13: l=len(s)-1
                case 38:    '' \&
                    if (p+1) < l then
                        select case s[p+2]
                            case 98:    '' \&b
                                p2=GetBinLen(p+3,s)+2
                                s=left(s,p)+_
                                  chr(cubyte(mid(s,p+2,p2)))+_
                                  mid(s,p+p2+2)
                            case 104:   '' \&h
                                p2=GetHexLen(p+3,s)+2
                                s=left(s,p)+_
                                  chr(cubyte(mid(s,p+2,p2)))+_
                                  mid(s,p+p2+2)
                            case 111:   '' \&o
                                p2=GetOctLen(p+3,s)+2
                                s=left(s,p)+_
                                  chr(cubyte(mid(s,p+2,p2)))+_
                                  mid(s,p+p2+2)
                        end select
                    end if
                case else
                    if IsByteInString(s[p+1], gtDecDigits) then
                           p2=GetDecLen(p+1,s)
                           s=left(s,p)+_
                             chr(cubyte(mid(s,p+2,p2)))+_
                             mid(s,p+p2+2)
                    end if
            end select
        end if
        p+=1
    wend
end sub

sub BinStrToEscapeStr(s as string)
    dim as integer l,p
    l=len(s)-1
    while p <= l
        select case s[p]
            case 7 :s=left(s,p)+"\a"+mid(s,p+2):l=len(s)-1:p+=1
            case 8 :s=left(s,p)+"\b"+mid(s,p+2):l=len(s)-1:p+=1
            case 9 :s=left(s,p)+"\t"+mid(s,p+2):l=len(s)-1:p+=1
            case 10:s=left(s,p)+"\n"+mid(s,p+2):l=len(s)-1:p+=1
            case 13:s=left(s,p)+"\r"+mid(s,p+2):l=len(s)-1:p+=1
            case 92:s=left(s,p)+chr(92)+chr(92)+mid(s,p+2):l=len(s)-1:p+=1
            case 34:s=left(s,p)+chr(92)+chr(34)+mid(s,p+2):l=len(s)-1:p+=1
            case 39:s=left(s,p)+chr(92)+chr(39)+mid(s,p+2):l=len(s)-1:p+=1
        end select
        p+=1
    wend
end sub
#endif
