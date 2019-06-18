package hyunkwanko;

public class Name {
	private String firstName; 
	private String lastName;
	
	// Default가 없어도 동작한다.
	
	public Name(String firstName, String lastName) { 
		setFirstName(firstName);
		setLastName(lastName); 
	}
	
	public String getFirstName() { 
		return (firstName); 
	}
	
	public void setFirstName(String firstName) { 
		this.firstName = firstName; 
	}
	
	public String getLastName() { 
		return (lastName); 
	}
	
	public void setLastName(String lastName) { 
		this.lastName = lastName; 
	}
}
