/**
 * 
 */
 
 
function returnSeat() {
	var seat = [];
	var count = 0;
	$("input[type='checkbox']:checked").each(function(idx) {
		seat.push(this.value);
		count++;
	});

	if (count == 0) {
		alert('이용종료할 좌석을 선택하세요');
		return;
	}

	var form = document.getElementById("seatUseListForm");

	form.submit();

}