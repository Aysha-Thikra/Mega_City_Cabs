package Bean;

public class Customer {
    private String firstName;
    private String lastName;
    private String address;
    private String nic;
    private String phoneNumber;
    private String email;
    private String username;
    private String password;

    public Customer(String firstName, String lastName, String address, String nic, String phoneNumber, String email, String username, String password) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.address = address;
        this.nic = nic;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.username = username;
        this.password = password;
    }

    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public String getAddress() { return address; }
    public String getNic() { return nic; }
    public String getPhoneNumber() { return phoneNumber; }
    public String getEmail() { return email; }
    public String getUsername() { return username; }
    public String getPassword() { return password; }
}
