/**
 * 
 */
 
 
function borrow() {
	var books = [];
	var count = 0;
	$("input[type='checkbox']:checked").each(function(idx) {
		books.push(this.value);
		count++;
	});

	if (count == 0) {
		alert('한 권 이상 선택하세요');
		return;
	}

	if (count > 5) {
		alert('한번에 다섯권이하로 선택하세요');
		return;
	}

	var form = document.getElementById("bookListForm");

	form.submit();

}

function addBook() {

	location.href("../book/BookAdd.jsp");

}


function returnBook() {
	var books = [];
	var count = 0;
	$("input[type='checkbox']:checked").each(function(idx) {
		books.push(this.value);
		count++;
	});

	if (count == 0) {
		alert('한 권 이상 선택하세요');
		return;
	}

	var form = document.getElementById("borrowListForm");

	form.submit();

}