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