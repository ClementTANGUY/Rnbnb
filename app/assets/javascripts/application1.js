//= require jquery3
//= require flatpickr/flatpickr
//= require turbolinks
//= require_self



$(function() {
 
	$('.form-datepicker').flatpickr({
	 		altInput: true,

	 		minDate: new Date(),

	        altFormat: 'j F Y',                             
	 
	});
 
});

