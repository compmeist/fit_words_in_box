# fit_words_in_box
simpleton's code to fit some text in a box (without hyphenation) for images or svg


	// Javascript (same as the repo .JS file )

		 function fitTextToBox(svg_text_el,x0,y0,xWidth,yWidth,txt,txtHt,txtWd) {

		     var x1 = x0;
		     var y1 = y0;
		     var maxChars = 756;
		     var cStr = txt.substring(0,maxChars);
		     var nCharsPerLn = Math.floor(xWidth / txtWd); 
		     var wAry = cStr.split(" ");   // parse the string to put words into an array

		     for (var l = wAry.length;l > 0; l = wAry.length ) {
			 var cndStr = wAry[0];
			 var nc = cndStr.length;
			 var tStr = '';
			 for (var n = 0;(((n+nc) < nCharsPerLn) && (wAry.length > 0));n=tStr.length) {
			 tStr += wAry[0] + " "; // arrays start at index 0
			 wAry.shift();  // remove the first element in array
			 if (wAry.length > 0) { // check next candidate
			     cndStr = wAry[0];
			     nc = cndStr.length;
			   }
			 }
			 insert_tspan(svg_text_el,tStr,x1,y1);  // presumably inserts a tspan child element 
			 y1 += txtHt;

		     }

		 }

    // Coldfusion cfscript
    
	 function fitTextToBox(myImage,x0,y0,xWidth,yWidth,txt,txt_color,l_attr) {
     
       var txtHt = l_attr.size*1.16;
       var txtWd = l_attr.size*0.65;
       var x1 = x0;
       var y1 = y0;
       var maxChars = 756;
       var cStr = left(txt,maxChars);
       var nCharsPerLn = int(xWidth / txtWd); // int and floor are equivalent
       var wAry = listToArray(cStr," ");  // parse the string to put words into an array
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
