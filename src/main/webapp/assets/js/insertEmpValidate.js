//Validate insert form
const validateLoginForm = new JustValidate('#insert-form');
validateLoginForm.addField(
    '#firstname', [
        {
            rule: 'maxLength',
            value: 50,
        },
        {
            rule: 'required',
            errorMessage: 'First Name is required',
        }
    ]).addField(
    '#lastname', [
        {
            rule: 'maxLength',
            value: 50,
        },
        {
            rule: 'required',
            errorMessage: 'First Name is required',
        }
    ]).addField(
    '#phone', [
        {
            rule: 'customRegexp',
            value: /^\d{8,20}$/,
            errorMessage: 'Only number from 8-20'
        },
        {
            rule: 'required',
            errorMessage: 'Phone is required',
        }
    ]).addField(
    '#dateofbirth', [
        {
            rule: 'required',
            errorMessage: 'Date of birth is required'
        }
    ]).addRequiredGroup(
    '#radio-gender-group', [
        {
            rule: 'customRegexp',
            value: /^\d{8,20}$/,
            errorMessage: 'Only number from 8-20'
        },
        {
            rule: 'required',
            errorMessage: 'Phone is required',
        }
    ]).addField(
    '#account', [
        {
            rule: 'maxLength',
            value: 50,
        },
        {
            rule: 'required',
            errorMessage: 'Account is required',
        }
    ]).addField(
    '#email', [
        {
            rule: 'email',
            errorMessage: 'Email is invalid format',
        },
        {
            rule: 'required',
            errorMessage: 'Email is required',
        }
    ]).addField(
    '#password', [
        {
            rule: 'maxLength',
            value: 50,
        },
        {
            rule: 'required',
            errorMessage: 'First Name is required',
        },
        {
            rule: 'customRegexp',
            value: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,100}$/,
            errorMessage: 'Need contains at least 1 Uppercase, 1 lowercase, 1 number'
        }
    ]).addField(
    '#address', [
        {
            rule: 'maxLength',
            value: 50,
        },
    ]).addField(
    '#department', [
        {
            rule: 'required',
            errorMessage: 'Department is required',
        }
    ]).addField(
    '#remark', [
        {
            rule: 'maxLength',
            value: 2000,
        }
    ])
    .onSuccess((ev) => {
    document.forms["insert-form"].submit();
});


