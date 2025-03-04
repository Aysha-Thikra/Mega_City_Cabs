package Bean;

public class Admin {
    private String userID;
    private String firstName;
    private String lastName;
    private String address;
    private String NIC;
    private String phoneNumber;
    private String email;
    private String username;
    private String password;
    private String licenseNumber = "Not needed";
    private int userLevel = 1;

    public Admin(String userID, String firstName, String lastName, String address, String NIC, 
                 String phoneNumber, String email, String username, String password) {
        this.userID = userID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.NIC = NIC;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.username = username;
        this.password = password;
    }

    public String getUserID() { return userID; }
    public void setUserID(String userID) { this.userID = userID; }

    public String getFirstName() { return firstName; }
    public void setFirstName(String firstName) { this.firstName = firstName; }

    public String getLastName() { return lastName; }
    public void setLastName(String lastName) { this.lastName = lastName; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getNIC() { return NIC; }
    public void setNIC(String NIC) { this.NIC = NIC; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getLicenseNumber() { return licenseNumber; }
    public int getUserLevel() { return userLevel; }
}
