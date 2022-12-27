package model1.mylibrary.seat;

import java.util.Date;

public class UseSeatDetailDTO {

	private String memberNo;
	private String seatId;
	private String seatNm;
	private String seatLocation;
	private String useStatus;
	private String useStatusNm;
	private Date useStartTime;
	private Date useEndTime;
	private Date useEndSchedule;
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
	public Date getUseStartTime() {
		return useStartTime;
	}
	public void setUseStartTime(Date useStartTime) {
		this.useStartTime = useStartTime;
	}
	public Date getUseEndTime() {
		return useEndTime;
	}
	public void setUseEndTime(Date useEndTime) {
		this.useEndTime = useEndTime;
	}
	public Date getUseEndSchedule() {
		return useEndSchedule;
	}
	public void setUseEndSchedule(Date useEndSchedule) {
		this.useEndSchedule = useEndSchedule;
	}
	
	
	
	
}
