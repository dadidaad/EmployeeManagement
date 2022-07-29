// Validate profile edit 

const profileValidation = new window.JustValidate('#search-form')

profileValidation.addField(
    '#search', [
    {
        rule: 'maxLength',
        value: 50,
    },
]
).onSuccess(() => {
    document.forms['search-form'].submit();
});
