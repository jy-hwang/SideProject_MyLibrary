package model1.mylibrary.seat;

public class UseSeatDetailDTO {

	private String memberNo;
	private String seatId;
	private String seatNm;
	private String seatLocation;
	private String useStatus;
	private String useStatusNm;
	private String useStartTime;
	private String useEndTime;
	private String useEndSchedule;

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getSeatId() {
		return seatId;
	}

	public void setSeatId(String seatId) {
		this.seatId = seatId;
	}

	public String getSeatNm() {
		return seatNm;
	}

	public void setSeatNm(String seatNm) {
		this.seatNm = seatNm;
	}

	public String getSeatLocation() {
		return seatLocation;
	}

	public void setSeatLocation(String seatLocation) {
		this.seatLocation = seatLocation;
	}

	public String getUseStatus() {
		return useStatus;
	}

	public void setUseStatus(String useStatus) {
		this.useStatus = useStatus;
	}

	public String getUseStatusNm() {
		return useStatusNm;
	}

	public void setUseStatusNm(String useStatusNm) {
		this.useStatusNm = useStatusNm;
	}

	public String getUseStartTime() {
		return useStartTime;
	}

	public void setUseStartTime(String useStartTime) {
		this.useStartTime = useStartTime;
	}

	public String getUseEndTime() {
		return useEndTime;
	}

	public void setUseEndTime(String useEndTime) {
		this.useEndTime = useEndTime;
	}

	public String getUseEndSchedule() {
		return useEndSchedule;
	}

	public void setUseEndSchedule(String useEndSchedule) {
		this.useEndSchedule = useEndSchedule;
	}

}
