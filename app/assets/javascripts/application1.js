//= require flatpickr/flatpickr.min
//= require flatpickr/fr
//= require turbolinks
//= require_self





flatpickr('.form-datepicker', {
	altInput: true,
	altFormat: 'j F Y',
	minDate: new Date(),
})