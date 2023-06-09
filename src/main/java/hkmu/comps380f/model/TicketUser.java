package hkmu.comps380f.model;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "users")
public class TicketUser {
    @Id
    private String username;
    private String password;
    private String phone;
    private String email;
    private String desc;
    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER,
            cascade = CascadeType.ALL, orphanRemoval = true)
    private List<UserRole> roles = new ArrayList<>();
    public TicketUser() {}
    public TicketUser(String username, String password, String phone, String email, String[] roles) {
        this.username = username;
        this.password = "{noop}" + password;
        this.phone = phone;
        this.email = email;
        for (String role : roles) {
            this.roles.add(new UserRole(this, role));
        }
    }
    // getters and setters of all properties

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getDesc() {
        return desc;
    }
    public void setDesc(String desc) {
        this.desc = desc;
    }

    public List<UserRole> getRoles() {
        return roles;
    }
    public void setRoles(List<UserRole> roles) {
        this.roles = roles;
    }
}