//Validate login form 
const validateLoginForm = new JustValidate('#login-form');
validateLoginForm.addField(
    '#username', [
    {
        rule: 'maxLength',
        value: 50,
    },
    {
        rule: 'required',
        errorMessage: 'Account is required',
    }
]).addField(
        '#password', [
        {
            rule: 'maxLength',
            value: 50,
        },
        {
            rule: 'required',
            errorMessage: 'Password is required',
        }
    ]).onSuccess((ev) => {
        document.forms["login-form"].submit();
});


