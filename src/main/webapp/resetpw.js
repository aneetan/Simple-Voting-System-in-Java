// -------------- Reset pw form validation -------------------------------------------------------
const resetForm = document.getElementById("resetPwForm");
const resetPassword = document.getElementById("resetpw");
const resetconfirmpw = document.getElementById("confirm-resetpw");

resetForm.addEventListener('submit', function(e){
    e.preventDefault();

    if (validateResetInputs()) {
        this.submit();
    }
});

//error message
const setError =(element, message) => {
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

const isValidPassword = password => {
    const pw =  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;
    return pw.test(String(password).toLowerCase());
}

const validateResetInputs = () => {
    const resetpasswordValue = resetPassword.value.trim();
    const resetconfirmpwValue = resetconfirmpw.value.trim();
    let isValid = true;

    //check password validation
    if(resetpasswordValue === ''){
        setError(resetPassword, 'Password is required');
        isValid=false;
    } else if(resetpasswordValue.length < 7){
        setError(resetPassword,'Password must be 7 characters');
        isValid=false;
    }else if (!isValidPassword(resetpasswordValue)){
        setError(resetPassword,'Please insert strong password');
        isValid=false;
    }  else {
        setSuccess(resetPassword);
    }

    //check for matching password
    if(resetconfirmpwValue === ''){
        setError(resetconfirmpw, 'Please confirm your password');
        isValid=false;
    } else if(resetconfirmpwValue !== resetpasswordValue){
        setError(resetconfirmpw, "Password doesn't match");
        isValid=false;
    } else {
        setSuccess(resetconfirmpw);
    }
    return isValid;
}