package HealthCare.objects;

import java.io.Serializable;

public class SpecialityObject implements Serializable{
	private int sp_id;
	private String sp_name;
	private String sp_description;
	private String sp_notes;
	private String sp_created_date;
	private String sp_modified_date;
	private boolean sp_deleted;
	private String sp_language;
	public int getSp_id() {
		return sp_id;
	}
	public void setSp_id(int sp_id) {
		this.sp_id = sp_id;
	}
	public String getSp_name() {
		return sp_name;
	}
	public void setSp_name(String sp_name) {
		this.sp_name = sp_name;
	}
	public String getSp_description() {
		return sp_description;
	}
	public void setSp_description(String sp_description) {
		this.sp_description = sp_description;
	}
	public String getSp_notes() {
		return sp_notes;
	}
	public void setSp_notes(String sp_notes) {
		this.sp_notes = sp_notes;
	}
	public String getSp_created_date() {
		return sp_created_date;
	}
	public void setSp_created_date(String sp_created_date) {
		this.sp_created_date = sp_created_date;
	}
	public String getSp_modified_date() {
		return sp_modified_date;
	}
	public void setSp_modified_date(String sp_modified_date) {
		this.sp_modified_date = sp_modified_date;
	}
	public boolean isSp_deleted() {
		return sp_deleted;
	}
	public void setSp_deleted(boolean sp_deleted) {
		this.sp_deleted = sp_deleted;
	}
	public String getSp_language() {
		return sp_language;
	}
	public void setSp_language(String sp_language) {
		this.sp_language = sp_language;
	}
	
	

}
