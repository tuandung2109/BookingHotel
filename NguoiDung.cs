public class NguoiDung
{
    public string username { get; set; }
    public string email { get; set; }
    public string password { get; set; }
    public string role { get; set; }

    public NguoiDung(string username, string email, string password, string repassword, string role)
    {
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
    }
}
