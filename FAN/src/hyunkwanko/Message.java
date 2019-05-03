package hyunkwanko;

public class Message {
	private int code;
	private String msg; 
	public Message() { 
		this.code = 0;
		this.msg = "NONE"; 
	}
	
	public String getMessage() {
		return msg;
	}

	public void setMessage(String msg) {
		this.msg = msg;
	}
	
	public int getCode() {
		return code;
	}
	
	public void setCode(int code) {
		this.code = code; 
	}
}