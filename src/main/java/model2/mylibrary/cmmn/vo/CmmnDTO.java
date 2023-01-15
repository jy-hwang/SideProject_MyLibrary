package model2.mylibrary.cmmn.vo;

public class CmmnDTO {

	private String modiYn;
	private String parentCode;
	private String cmmnCode;
	private String cmmnName;
	private String useYn;
	private String desc;
	
	private String regiUser;
	private String regiDate;
	private String updtUser;
	private String updtDate;
	
	public String getModiYn() {
		return modiYn;
	}
	
	public void setModiYn(String modiYn) {
		this.modiYn = modiYn;
	}
	
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	public String getCmmnCode() {
		return cmmnCode;
	}
	public void setCmmnCode(String cmmnCode) {
		this.cmmnCode = cmmnCode;
	}
	public String getCmmnName() {
		return cmmnName;
	}
	public void setCmmnName(String cmmnName) {
		this.cmmnName = cmmnName;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getRegiUser() {
		return regiUser;
	}
	public void setRegiUser(String regiUser) {
		this.regiUser = regiUser;
	}
	public String getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(String regiDate) {
		this.regiDate = regiDate;
	}
	public String getUpdtUser() {
		return updtUser;
	}
	public void setUpdtUser(String updtUser) {
		this.updtUser = updtUser;
	}
	public String getUpdtDate() {
		return updtDate;
	}
	public void setUpdtDate(String updtDate) {
		this.updtDate = updtDate;
	}

	@Override
	public String toString() {
		return "CmmnDTO [modiYn=" + modiYn + ", parentCode=" + parentCode + ", cmmnCode=" + cmmnCode + ", cmmnName="
				+ cmmnName + ", useYn=" + useYn + ", desc=" + desc + ", regiUser=" + regiUser + ", regiDate=" + regiDate
				+ ", updtUser=" + updtUser + ", updtDate=" + updtDate + "]";
	}
	
	
	
}
