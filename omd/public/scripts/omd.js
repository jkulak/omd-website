function $(id) {
	return document.getElementById(id);
}

function runScroll() {
	scrollIt(0, 3, "tweet");
	scrollIt(0, 3, "short");
}

function scrollIt(id, max, elem) {
	var prevId = id-1;
	if (prevId<0) prevId = max-1;
	var nextId = id+1;
	if (nextId>=max) nextId = 0;	
	$(elem+(id)).style.display="block";
	$(elem+(prevId)).style.display="none";
	var t=setTimeout("scrollIt("+nextId+","+max+",\""+elem+"\");",3000)
}