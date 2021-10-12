function insert_tspan(e,t,x,y) {
	console.log(t);
}


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
