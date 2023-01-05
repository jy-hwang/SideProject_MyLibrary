/**
 * 
 */
 
function useSeat(elem) {

	var useDetailForm = document.getElementById("useDetailForm");

	var alreadyUse = (useDetailForm.useStatus.value != "" ? true : false);

	if (alreadyUse) {
		alert("이미 좌석을 이용중입니다.");
		return;
	}

	var seatId = elem.id.substring(elem.id.length - 2, elem.id.length);

	var useSeat = confirm(seatId + "번 좌석을 이용하시겠습니까?");
	var seatForm = document.getElementById("seatForm");
	if (useSeat) {
		seatForm.seatId.value = elem.id;
		seatForm.submit();
	}
}
 
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