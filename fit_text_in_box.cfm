
<cfscript>
	 function fitTextToBox(myImage,x0,y0,xWidth,yWidth,txt,txt_color,l_attr) {
     var rs = 0;
     var txtHt = l_attr.size*1.16;
     var txtWd = l_attr.size*0.5;
     var x1 = x0;
     var y1 = y0;
     var maxChars = 756;
     var cStr = left(txt,maxChars);
     var nCharsPerLn = int(xWidth / txtWd); // int and floor are equivalent
     var wAry = listToArray(cStr," ");   // parse the string to put words into an array
      ImageSetDrawingColor(myImage,txt_color);
     for (var l = arrayLen(wAry);l > 0; l = arrayLen(wAry) ) {
     	 var cndStr = wAry[1];
     	 var nc = len(cndStr);
     	 var tStr = '';
     	 for (var n = 0;(((n+nc) < nCharsPerLn) && (arrayLen(wAry) > 0));n=len(tStr)) {
         tStr &= wAry[1] & " "; // arrays start at index 1
         arrayDeleteAt(wAry,1);  // remove the first element in array
         if (arrayLen(wAry) > 0) {  // check next candidate
		     	  cndStr = wAry[1];
		     	  nc = len(cndStr);
         }
     	 }
     	 ImageDrawText(myImage,tStr,x1,y1,l_attr);
     	 y1 += txtHt;
       
     }
	 }
</cfscript>
