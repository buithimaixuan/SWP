/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// Lấy ngày hiện tại
var today = new Date();
var selectedDate;
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0'); // nếu ngày và tháng nhỏ hơn 10 thì số đầu sẽ là số 0
var yyyy = today.getFullYear();

// Format ngày thành YYYY-MM-DD (định dạng ngày của trường input type="date")
var formattedDate = yyyy + '-' + mm + '-' + dd;

// Gán giá trị ngày mặc định là ngày hôm nay
document.getElementById('dayWriteNews').value = formattedDate;

document.getElementById('dayWriteNews').addEventListener('change', function () {
    selectedDate = new Date(this.value);

    // So sánh ngày được chọn với ngày hiện tại
    if (selectedDate > today) {
        document.getElementById('ErrorDay').innerHTML = "Ngày không thể lớn hơn ngày hiện tại.";
        document.getElementById('dayWriteNews').value = formattedDate; // Xóa giá trị của trường input
    } else {
        document.getElementById('ErrorDay').innerHTML = "";
    }
});

document.getElementById('daywork').value = formattedDate;

document.getElementById('daywork').addEventListener('change', function () {
    selectedDate = new Date(this.value);

    // So sánh ngày được chọn với ngày hiện tại
    if (selectedDate > today) {
        document.getElementById('dateError').innerHTML = "Ngày không thể lớn hơn ngày hiện tại.";
        document.getElementById('daywork').value = formattedDate; // Xóa giá trị của trường input
    } else {
        document.getElementById('dateError').innerHTML = "";
    }
});


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

function validateStaff() {
    let check = true;
    const fullname = document.getElementById("fullname");
    const email = document.getElementById("email");
    const phone = document.getElementById("phone");
    const username = document.getElementById("user");
    const password = document.getElementById("pass");
    const address = document.getElementById("address");

    const emailHidden = document.getElementById("resultEmail").innerHTML;
    const phoneHidden = document.getElementById("resultPhone").innerHTML;
    const usernameHidden = document.getElementById("result").innerHTML;



    if (fullname.value.trim() === "") {
        setError(fullname, "Fullname is require!");
        check = false;
    } else {
        setSuccess(fullname);
    }
    if (address.value.trim() === "") {
        setError(address, "Address is require!");
        check = false;
    } else {
        setSuccess(address);
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


function isVietnamesePhoneNumber(number) {
    return /(03|05|07|08|09|01[2|6|8|9])+([0-9]{8})\b/.test(number);
}

function isValidEmail(email) {
    // Sử dụng regular expression để kiểm tra định dạng email
//    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
}




