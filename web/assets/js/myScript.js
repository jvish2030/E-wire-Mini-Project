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

function link(i) {
    var loc = window.location.href;
    var test = loc.search("pageid");
    if (test !== -1) {
        var n = loc.length;
        var res = loc.slice(0, n - 1);
        res = res + i;
        window.location.assign(res);
    } else {
        window.location.assign(loc + "&pageid=" + i);
    }
}
  