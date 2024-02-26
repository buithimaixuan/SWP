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

function validateAddProduct() {
    var proName = document.getElementById('proName').value.trim();
    var price = document.getElementById('price').value.trim();
    var realPrice = document.getElementById('realPrice').value.trim();
    var description = document.getElementById('description').value.trim();

    var mass = document.getElementById('mass').value.trim();
    var ingredient = document.getElementById('ingredient').value.trim();
    var brand = document.getElementById('brand').value.trim();

    var errorProName = document.querySelector(".errorProName");
    var errorPrice = document.querySelector(".errorPrice");

    var errorRealPrice = document.querySelector(".errorRealPrice");
 
    var errorDescription = document.querySelector(".errorDescription");

    var errorMass = document.querySelector(".errorMass");
    var errorIngredient = document.querySelector(".errorIngredient");
    var errorBrand = document.querySelector(".errorBrand");

    errorProName.innerHTML = '';
    errorPrice.innerHTML = '';
    errorRealPrice.innerHTML = '';

    
    errorDescription.innerHTML = '';

    errorMass.innerHTML = '';
    errorIngredient.innerHTML = '';
    errorBrand.innerHTML = '';

    var isValid = true;

    if (proName === '') {
        errorProName.innerHTML = "Tên sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    if (price === '') {
        errorPrice.innerHTML = "Giá gốc sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    if (price !== '' && price<=0) {
        errorPrice.innerHTML = "Giá gốc sản phẩm không thể nhỏ hơn hoặc bằng 0!";
        isValid = false;
    }
    if (realPrice === '') {
        errorRealPrice.innerHTML = "Giá bán sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    if (realPrice !== '' && realPrice<=0) {
        errorRealPrice.innerHTML = "Giá bán sản phẩm không thể nhỏ hơn hoặc bằng 0!";
        isValid = false;
    }
    if (parseFloat(realPrice) > parseFloat(price)) {
        errorRealPrice.innerHTML = "Giá bán phải nhỏ hơn hoặc bằng giá gốc";
        isValid = false;
    }

    if (description === '') {
        errorDescription.innerHTML = "Mô tả sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    if (description !== '' && (description.length < 10 || description.length > 1000)) {
        errorDescription.innerHTML = "Ðô dài cua mô tả sản phẩm phai lon hon 10 và nho hon hoac bang 1000 kí tu!";
        isValid = false;
    }
    if (mass === '') {
        errorMass.innerHTML = "Khối lượng sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    if (mass !== '' && mass<=0) {
        errorMass.innerHTML = "Khối lượng sản phẩm không thể nhỏ hơn hoặc bằng 0!";
        isValid = false;
    }
    if (brand === '') {
        errorBrand.innerHTML = "Thuong hieu sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    if (ingredient === '') {
        errorIngredient.innerHTML = "Thành phàn sản phẩm không thể bỏ trống!";
        isValid = false;
    }
    return isValid;
}
