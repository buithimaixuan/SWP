/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const username = document.getElementById("userN");
const password = document.getElementById("pwd");
const setSuccess = (element) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector("span");
    errorDisplay.innerText = "";
    inputControl.classList.add("success");
    inputControl.classList.remove("error");
};
const setError = (element, message) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector("span");
    errorDisplay.innerText = message;
    inputControl.classList.add("error");
    inputControl.classList.remove("success");
};
function validateInputs() {
    let check = true;
    const user = username.value.trim();
    const pwd = password.value.trim();
    if (user === "") {
        setError(username, "Username is require!");
        check = false;
    } else if (user.length > 100) {
        setError(username, "Username length cannot greater than 100 character");
        check = false;
    } else {
        setSuccess(username);
    }

    if (pwd === "") {
        setError(password, "Password is require!");
        check = false;
    } else {
        setSuccess(password);
    }
    return check;
}

function validateResgisterCus() {
    let check = true;
    const fullname = document.getElementById("fullname");
    const email = document.getElementById("email");
    const phone = document.getElementById("phone");
    const avatar = document.getElementById("avatar");
    const username = document.getElementById("user");
    const password = document.getElementById("pass");
    const emailHidden = document.getElementById("resultEmail").innerHTML;
    const phoneHidden = document.getElementById("resultPhone").innerHTML;
    const usernameHidden = document.getElementById("result").innerHTML;
    
    if (avatar.value.trim() === "") {
        setError(avatar, "avatar is require");
        check = false;
    } else if (!checkImage(avatar.value.trim())) {
        setError(avatar, "File must be images as 'jpg' or 'png' or 'jpeg'");
        check = false;
    } else {
        setSuccess(avatar);
    }

    if (fullname.value.trim() === "") {
        setError(fullname, "Fullname is require!");
        check = false;
    } else {
        setSuccess(fullname);
    }

    if (email.value.trim() === "") {
        setError(email, "Email is require!");
        check = false;
    } else if (!isValidEmail(email.value.trim())) {
        setError(email, "Please enter right form of email!");
        check = false;
    } else {
        if (emailHidden.trim() === "This email is already existed!") {
            setError(email, "");
            check = false;
        } else {
            setSuccess(email);

        }
    }

    if (phone.value.trim() === "") {
        setError(phone, "Phone is require!");
        check = false;
    } else if (!isVietnamesePhoneNumber(phone.value.trim())) {
        setError(phone, "Phone number must is vietnamese phone number!");
        check = false;
    } else {
        if (phoneHidden.trim() === "This phone is already existed!") {
            setError(phone, "");
            check = false;
        } else {
            setSuccess(phone);

        }
    }

    if (password.value.trim() === "") {
        setError(password, "Password is require!");
        check = false;
    } else {
        setSuccess(password);
    }

    if (username.value.trim() === "") {
        setError(username, "Username is require!");
        check = false;
    } else if (username.value.length > 100) {
        setError(username, "Username length cannot greater than 100 character");
        check = false;
    } else {
        if (usernameHidden.trim() === "This username is already existed!") {
            setError(username, "");
            check = false;
        } else {
            setSuccess(username);

        }
    }

    


    return check;
}

function checkImage(fileName) {
    const substrings = fileName.split(".");
    const ext = substrings[substrings.length - 1].toLowerCase(); // Lấy phần mở rộng và chuyển đổi thành chữ thường

    const imgExtensions = ["jpg", "png", "jpeg"];
    return imgExtensions.includes(ext);
}

function isVietnamesePhoneNumber(number) {
    return /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/.test(number);
}

function isValidEmail(email) {
    // Sử dụng regular expression để kiểm tra định dạng email
//    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}


