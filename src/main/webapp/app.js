
//------------------------- signup form validation----------------------------
const form = document.getElementById("form");
const DOB = document.getElementById("DOB");
const email = document.getElementById("email");
const password = document.getElementById("password");
const confirmpw = document.getElementById("confirmPassword");

// submitting the form
form.addEventListener('submit', function(e){
    e.preventDefault();

    if (validateInputs()) {
        this.submit();
    }
});

//error message
const setError = (element, message) => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');

    errorDisplay.innerText = message;
    inputControl.classList.add('error');
    inputControl.classList.remove('success');
}

//success message
const setSuccess = element => {
    const inputControl = element.parentElement;
    const errorDisplay = inputControl.querySelector('.error');

    errorDisplay.innerText = '';
    inputControl.classList.add('success');
    inputControl.classList.remove('error');
}

//email validation
const isValidEmail = email => {
    const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}

//check for strong password
const isValidPassword = password => {
    const pw =  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;
    return pw.test(String(password).toLowerCase());
}

//check if age is above 18
function isAbove18(inputDate) {
    const dob = new Date(inputDate);
    const diff = Date.now() - dob.getTime();

    // Convert the difference in milliseconds to years
    const age = Math.floor(diff / (1000 * 60 * 60 * 24 * 365.25));

    // Check whether the calculated age is greater than or equal to 18
    return age >= 18;
}

const validateInputs = () => {
    const emailValue = email.value.trim();
    const dobValue = DOB.value;
    const passwordValue = password.value.trim();
    const confirmpwValue = confirmpw.value.trim();
    let isValid = true;

    //check email validation
    if(emailValue === '') {
        setError(email, 'Email is required');
        isValid=false;
    } else if(!isValidEmail(emailValue)) {
        setError(email, 'Insert valid email address');
        isValid=false;
    } else {
        setSuccess(email);
    }

    //check for age validation
    if (dobValue === '') {
        setError(DOB, 'DOB is required');
        isValid=false;
    } else {
        if(isAbove18(dobValue) === false){
            setError(DOB, "Sorry you don't have access to this system");
            isValid=false;
        } else {
            setSuccess(DOB);
        }
    }

    //check password validation
    if(passwordValue === '') {
        setError(password, 'Password is required');
        isValid=false;
    } else if(passwordValue.length < 7) {
        setError(password,'Password must be 7 characters');
        isValid=false;
    } else if (!isValidPassword(passwordValue)) {
        setError(password,'Please insert strong password');
        isValid=false;
    } else {
        setSuccess(password);
    }

    //check for matching password
    if(confirmpwValue === '') {
        setError(confirmpw, 'Please confirm your password');
        isValid=false;
    } else if(confirmpwValue !== passwordValue) {
        setError(confirmpw, "Password doesn't match");
        isValid=false;
    } else {
        setSuccess(confirmpw);
    }
    return isValid;
}






