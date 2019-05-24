package hyunkwanko;

public class Company {
	private String companyName; 
	private String address;
	
	public Company(String companyName, String address) { 
		setCompanyName(companyName);
		setAddress(address); 
	}
	
	public String getCompanyName() { 
		return (companyName); 	
	}
	
	public void setCompanyName(String companyName) {
		this.companyName = companyName; 
	}
	
	public String getAddress() { 
		return (address); 
	}
	
	public void setAddress(String address) { 
		this.address = address; 
	}
}
