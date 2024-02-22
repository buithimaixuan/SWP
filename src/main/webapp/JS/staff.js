/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

var today = new Date();
var selectedDate;
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0'); // nếu ngày và tháng nhỏ hơn 10 thì số đầu sẽ là số 0
var yyyy = today.getFullYear();

// Format ngày thành YYYY-MM-DD (định dạng ngày của trường input type="date")
var formattedDate = yyyy + '-' + mm + '-' + dd;

// Gán giá trị ngày mặc định là ngày hôm nay
document.getElementById('dayWriteNews').value = formattedDate;

// Bắt sự kiện thay đổi của trường input
document.getElementById('dayWriteNews').addEventListener('change', function () {
    selectedDate = new Date(this.value);

    // So sánh ngày được chọn với ngày hiện tại
    if (selectedDate > today) {
        document.getElementById('dateError').innerHTML = "Ngày không thể lớn hơn ngày hiện tại.";
        document.getElementById('dayWriteNews').value = formattedDate; // Xóa giá trị của trường input
    } else {
        document.getElementById('dateError').innerHTML = "";
    }
});


function displayImage(event, displayId) {
    var image = document.getElementById(displayId);
    var defaultImage = image.querySelector('.defaultImage');
    image.innerHTML = ''; // Xóa hình ảnh đang hiển thị trước đó

    var file = event.target.files[0];
    if (!file) {
        image.appendChild(defaultImage); // Hiển thị hình ảnh mặc định nếu không có file được chọn
        return;
    }

    var reader = new FileReader();
    reader.onload = function (event) {
        var img = document.createElement('img');
        img.src = event.target.result;
        img.style.maxWidth = '100%'; // Đảm bảo hình ảnh không vượt quá chiều rộng của phần tử cha
        image.appendChild(img);
    };
    reader.readAsDataURL(file);
}

function validateAddStaff() {
    var userStaff = document.getElementById("userStaff").value.trim();
    var nameStaff = document.getElementById("nameStaff").value.trim();
    var phoneStaff = document.getElementById("phoneStaff").value.trim();
    var emailStaff = document.getElementById("emailStaff").value.trim();
    var addressStaff = document.getElementById("addressStaff").value.trim();
    var positionStaff = document.getElementById("positionStaff").value.trim();
    var dayWriteNews = document.getElementById("dayWriteNews").value.trim();
    var gender = document.getElementById("gender").value;
    var dayBegin = document.getElementById("dayBegin").value.trim();
    var dayEnd = document.getElementById("dayEnd").value.trim();
    var newsPic = document.getElementById("newsPic").value.trim(); // Assuming this is the file input field
    
    var errorUserStaff = document.getElementById("errorUserStaff");
    var errorNameStaff = document.getElementById("errorNameStaff");
    var errorPhoneStaff = document.getElementById("errorPhoneStaff");
    var errorEmailStaff = document.getElementById("errorEmailStaff");
    var errorAddressStaff = document.getElementById("errorAddressStaff");
    var errorPositionStaff = document.getElementById("errorPositionStaff");
    var errorDayWriteNews = document.getElementById("errorDayWriteNews");
    var errorDayBegin = document.getElementById("errorDayBegin");
    var errorDayEnd = document.getElementById("errorDayEnd");
    // var errorNewsPic = document.getElementById("errorNewsPic"); // If you have an error message for the image
    
    // Resetting previous error messages
    errorUserStaff.innerHTML = "";
    errorNameStaff.innerHTML = "";
    errorPhoneStaff.innerHTML = "";
    errorEmailStaff.innerHTML = "";
    errorAddressStaff.innerHTML = "";
    errorPositionStaff.innerHTML = "";
    errorDayWriteNews.innerHTML = "";
    errorDayBegin.innerHTML = "";
    errorDayEnd.innerHTML = "";
    // errorNewsPic.innerHTML = "";
    
    // Validation logic
    var isValid = true;
    
    if (userStaff === "") {
        errorUserStaff.innerHTML = "Vui lòng nhập UserName.";
        isValid = false;
    }
    if (nameStaff === "") {
        errorNameStaff.innerHTML = "Vui lòng nhập FullName.";
        isValid = false;
    }
    if (phoneStaff === "") {
        errorPhoneStaff.innerHTML = "Vui lòng nhập Phone.";
        isValid = false;
    }
    if (emailStaff === "") {
        errorEmailStaff.innerHTML = "Vui lòng nhập Email.";
        isValid = false;
    }
    if (addressStaff === "") {
        errorAddressStaff.innerHTML = "Vui lòng nhập Address.";
        isValid = false;
    }
    if (positionStaff === "") {
        errorPositionStaff.innerHTML = "Vui lòng nhập Position.";
        isValid = false;
    }
    if (dayWriteNews === "") {
        errorDayWriteNews.innerHTML = "Vui lòng chọn Birthday.";
        isValid = false;
    }
    if (gender === "") {
       isValid = false;
    }
    if (dayBegin === "") {
        errorDayBegin.innerHTML = "Vui lòng chọn Begin Work.";
        isValid = false;
    }
    if (dayEnd === "") {
        errorDayEnd.innerHTML = "Vui lòng chọn End Work.";
        isValid = false;
    }
    if (newsPic === "") {
       isValid = false;
    }
    
    return isValid;
}