package tw.chitou.util;


public class CkResponse {
	
	private String uploaded;
	
	private String url;
	
	public CkResponse() {
		super();
	}

	public CkResponse(String url) {
		super();
		this.url = url;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getUploaded() {
		return uploaded;
	}

	public void setUploaded(String uploaded) {
		this.uploaded = uploaded;
	}
	
	

}
