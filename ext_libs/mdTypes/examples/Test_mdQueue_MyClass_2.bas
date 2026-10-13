#Include "md/lang/mdString.bi"
#Include "md/util/mdQueue.bi"

mdQueueDeclare(mdString)
Dim As mdQueue(mdString) queue

Dim As mdString foo
foo = "0" : queue.offer(foo)
foo = "1" : queue.offer(foo)
foo = "2" : queue.offer(foo)
foo = "3" : queue.offer(foo)
foo = "0" : queue.offer(foo)

Print "Output 1:"
Dim As mdString array()
queue.toArray(array())
For i As Integer = 0 To UBound(array)
	Print array(i)
Next
Print

Print "Output 2:"
Dim As mdString element
ForEach(mdString, element In queue)
	Print element
NextEach
Print

Print "Output 3:"
Dim As mdIterator(mdString) iterator = queue.iterator()
While iterator.hasNext()
	Print iterator.nex()
Wend
Print

Print "Size of queue: " & queue.size()
Print

Print "Removal Output 4:"
While queue.isEmpty = FALSE
	Print queue.poll()
Wend
Print

Print "Size of queue: " & queue.size()
Print

Sleep

