function validateUser()
{

    var fullname = document.forms["myUserRegisterForm"]["fullname"].value;
    var email = document.forms["myUserRegisterForm"]["email"].value;
    var password = document.forms["myUserRegisterForm"]["password"].value;
    var conpassword = document.forms["myUserRegisterForm"]["conpassword"].value;

    if (fullname == null || fullname == "")
    {
        window.alert("Full Name can't be blank");
        return false;
    } else if (email == null || email == "")
    {
        window.alert("Email can't be blank");
        return false;
    } else if (password.length < 6)
    {
        window.alert("Password must be at least 6 characters long.");
        return false;
    } else if (password != conpassword)
    {
        window.alert("Confirm Password should match with the Password");
        return false;
    }
}
  