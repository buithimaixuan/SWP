/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const username = document.getElementById('username');
const password = document.getElementById('password');
const fullname = document.getElementById('fullname');
const phone = document.getElementById('phone');
const email = document.getElementById('email');
const address = document.getElementById('address');
const birthday = document.getElementById('birthday');

const form = document.getElementById('staffForm');
const listUsername = document.querySelectorAll('.listUsername');

//REGISTER VALIDATE
form.addEventListener('submit', function(e){
    if(!validateInputs()){
        e.preventDefault();
    }
});

const setError = (element, message) => {
    const inputControl = element.parentElement.parentElement;
    const errorDisplay = inputControl.querySelector('.error');
    
    errorDisplay.innerText = message;
    inputControl.classList.add('error');
    inputControl.classList.remove('success');
};

const setSuccess = element => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');
    
    errorDisplay.innerText = '';
    inputControl.classList.add('success');
    inputControl.classList.remove('error');
};

const isValidPhone = phone => {
    const re = /(84|0[3|5|7|8|9])+([0-9]{8})\b/g;
    return re.test(String(phone));
};

const isValidEmail = email => {
    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
};

const isValidUsername = username => {
    var count = 0;
    for(var i = 0; i < listUsername.length; i++){
        if(username === listUsername[i].value){
            count++;
        }
    }
//    true is valid and false is invalid
    return (count === 0) ? true : false;
}; 

const validateInputs = () => {
    const usernameValue = username.value.trim();
    const passwordValue = password.value.trim();
    const fullnameValue = fullname.value.trim();
    const phoneValue = phone.value.trim();
    const emailValue = email.value.trim();
    const addressValue = address.value.trim();
    var count = 0;
    
    if(usernameValue === ''){
        setError(username, 'Hãy điền tên tài khoản');
        count++;
    } else if(!isValidUsername(usernameValue)) {
        setError(username, 'Tên tài khoản đã được đăng ký');
        count++;
    } else {
        setSuccess(username);
        console.log('Success');
    }
    
    if(passwordValue === ''){
        setError(password, 'Hãy điền mật khẩu');
        count++;
    } else if(passwordValue.length < 8){
        setError(password, 'Mật khẩu phải lớn hơn 8 ký tự');
        count++;
    } else{
        setSuccess(password);
    }
    
    if(fullnameValue === ''){
        setError(fullname, 'Hãy điền họ và tên đầy đủ');
        count++;
    } else{
        setSuccess(fullname);
    }
    
    if(phoneValue === ''){
        setError(phone, 'Hãy điền số điện thoại');
        count++;
    } else if(!isValidPhone(phoneValue)){
        setError(phone, 'Số điện thoại không hợp lệ. Hãy điền số điện thoại Việt Nam');
        count++;
    } else{
        setSuccess(phone);
    }
    
    if(emailValue === ''){
        setError(email, 'Hãy điền địa chỉ email');
        count++;
    } else if(!isValidEmail(emailValue)){
        setError(email, 'Địa chỉ email không hợp lệ');
        count++;
    } else{
        setSuccess(email);
    }
    
    if(addressValue === ''){
        setError(address, 'Hãy điền địa chỉ cụ thể');
        count++;
    } else{
        setSuccess(address);
    }
    
    return (count === 0) ? true : false;
};
