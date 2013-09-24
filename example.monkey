Strict

Import mojo
Import qrcode

Function Main:Int()
	New MyApp
	Return 1
End

Class MyApp Extends App
	Field image:Image
	Field tried:Bool
	Field textIndex:= 0
	Field text:=["whoops", "qr codes are fun", "123456", "this is longer text and I think teh qr code should get a lotttttttt bigger to fit the size ... lets hope so ok ?"]
	
	Method OnCreate:Int()
		' --- setup the game ---
		SetUpdateRate(30)
		
		Return 0
	End
	
	Method OnUpdate:Int()
		' --- update the game ---
		'basic app update
		If KeyHit(KEY_ESCAPE) Error("")
		
		If MouseHit(MOUSE_LEFT)
			image = Null
			tried = False
			textIndex += 1
			If textIndex >= text.Length textIndex = 0
		EndIf
		
		If image = Null And tried = False
			image = CreateQRImage(text[textIndex], 4, 4)
			tried = True
		EndIf
		
		Return 0
	End
	
	Method OnRender:Int()
		' --- render the game ---
		Cls(0, 0, 0)
		
		SetColor(255, 255, 255)
		If image DrawImage(image, 200, 200)
		
		Local x:Int = 10
		Local y:Int = 10
		DrawText("Click to change text", x, y)
		y += FontHeight()
		DrawText("(scan this with a qr scanner to confirm the text matches)", x, y)
		y += FontHeight()
		y += 10
		
		x += 5
		For Local i:= 0 Until text.Length()
			If i = textIndex
				SetColor(0, 255, 0)
			Else
				SetColor(255, 255, 255)
			EndIf
			DrawText( (i + 1) + ") '" + text[i] + "'", x, y)
			y += FontHeight()
			y += 5
		Next
		
		Return 0
	End
End