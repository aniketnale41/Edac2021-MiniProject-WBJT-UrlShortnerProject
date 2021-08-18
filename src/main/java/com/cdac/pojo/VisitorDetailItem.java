package com.cdac.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class VisitorDetailItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int visitorId;
	private String ShortItemId;
	private String visitorDetail;
	private boolean isDesktop;
	private int userId;
	

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public VisitorDetailItem(String shortItemId, String visitorDetail, boolean isDesktop, int userId) {
		super();
		ShortItemId = shortItemId;
		this.visitorDetail = visitorDetail;
		this.isDesktop = isDesktop;
		this.userId = userId;
	}

	public VisitorDetailItem(int visitorId, String shortItemId, String visitorDetail, boolean isDesktop) {
		super();
		this.visitorId = visitorId;
		ShortItemId = shortItemId;
		this.visitorDetail = visitorDetail;
		this.isDesktop = isDesktop;
	}

	public boolean isDesktop() {
		return isDesktop;
	}

	public void setDesktop(boolean isDesktop) {
		this.isDesktop = isDesktop;
	}

	public VisitorDetailItem() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	public int getVisitorId() {
		return visitorId;
	}

	public void setVisitorId(int visitorId) {
		this.visitorId = visitorId;
	}

	public String getShortItemId() {
		return ShortItemId;
	}

	public void setShortItemId(String shortItemId) {
		ShortItemId = shortItemId;
	}

	public String getVisitorDetail() {
		return visitorDetail;
	}

	public void setVisitorDetail(String visitorDetail) {
		this.visitorDetail = visitorDetail;
	}

	@Override
	public String toString() {
		return "VisitorDetailItem [visitorId=" + visitorId + ", ShortItemId=" + ShortItemId + ", visitorDetail="
				+ visitorDetail + "]";
	}
}