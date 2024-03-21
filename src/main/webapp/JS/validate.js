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
        setError(username, "Bắt buộc nhập!");
        check = false;
    } else if (user.length > 100) {
        setError(username, "Tên đăng nhập dưới 100 kí tự");
        check = false;
    } else {
        setSuccess(username);
    }

    if (pwd === "") {
        setError(password, "Bắt buộc nhập!");
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
        setError(avatar, "Bắt buộc chọn!");
        check = false;
    } else if (!checkImage(avatar.value.trim())) {
        setError(avatar, "File phải là định dạng 'jpg' , 'png' hoặc 'jpeg'");
        check = false;
    } else {
        setSuccess(avatar);
    }

    if (fullname.value.trim() === "") {
        setError(fullname, "Bắt buộc nhập!");
        check = false;
    } else {
        setSuccess(fullname);
    }

    if (email.value.trim() === "") {
        setError(email, "Bắt buộc nhập!");
        check = false;
    } else if (!isValidEmail(email.value.trim())) {
        setError(email, "Vui lòng nhập đúng định dạng Email!");
        check = false;
    } else {
        if (emailHidden.trim() === "Email đã tồn tại!") {
            setError(email, "");
            check = false;
        } else {
            setSuccess(email);
        }
    }

    if (phone.value.trim() === "") {
        setError(phone, "Bắt buộc nhập!");
        check = false;
    } else if (!isVietnamesePhoneNumber(phone.value.trim())) {
        setError(phone, "Số điện thoại phải đúng định dạng Việt Nam!");
        check = false;
    } else {
        if (phoneHidden.trim() === "Số điện thoại đã tồn tại!") {
            setError(phone, "");
            check = false;
        } else {
            setSuccess(phone);

        }
    }

    if (password.value.trim() === "") {
        setError(password, "Bắt buộc nhập!");
        check = false;
    } else if (password.value.trim.length < 6 || password.value.trim.length > 6) {
        setError(password, "Mật khẩu từ 6 đến 20 kí tự!");
        check = false;
    } else
    {
        setSuccess(password);
    }

    if (username.value.trim() === "") {
        setError(username, "Bắt buộc nhập!");
        check = false;
    } else if (username.value.length > 100) {
        setError(username, "Tên đăng nhập dưới 100 kí tự");
        check = false;
    } else {
        if (usernameHidden.trim() === "Tên đăng nhập đã tồn tại!") {
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


