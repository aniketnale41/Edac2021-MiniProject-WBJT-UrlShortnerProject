package com.cdac.pojo;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
public class ShortUrlItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int itemId;
	private boolean isEnabled;
	private int visitorCount;	
	private String redirectUrl;
	private String shortUrlId;
	private int userId;
	
	public ShortUrlItem() {
		super();
	}

	public ShortUrlItem(boolean isEnabled, int visitorCount, String redirectUrl, String shortUrlId, int userId) {
		super();
		this.isEnabled = isEnabled;
		this.visitorCount = visitorCount;
		this.redirectUrl = redirectUrl;
		this.shortUrlId = shortUrlId;
		this.userId = userId;
	}

	public ShortUrlItem(int itemId, boolean isEnabled, int visitorCount, String redirectUrl, String shortUrlId,
			int userId) {
		super();
		this.itemId = itemId;
		this.isEnabled = isEnabled;
		this.visitorCount = visitorCount;
		this.redirectUrl = redirectUrl;
		this.shortUrlId = shortUrlId;
		this.userId = userId;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public boolean isEnabled() {
		return isEnabled;
	}

	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	public int getVisitorCount() {
		return visitorCount;
	}

	public void setVisitorCount(int visitorCount) {
		this.visitorCount = visitorCount;
	}

	public String getRedirectUrl() {
		return redirectUrl;
	}

	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}

	public String getShortUrlId() {
		return shortUrlId;
	}

	public void setShortUrlId(String shortUrlId) {
		this.shortUrlId = shortUrlId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "ShortUrlItem [itemId=" + itemId + ", isEnabled=" + isEnabled + ", visitorCount=" + visitorCount
				+ ", redirectUrl=" + redirectUrl + ", shortUrlId=" + shortUrlId + ", userId=" + userId + "]";
	}
}