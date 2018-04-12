//= require jquery3
//= require flatpickr/flatpickr
//= require turbolinks
//= require_self



$(function() {
 
	$('.form-datepicker').flatpickr({
	 		altInput: true,

	 		minDate: new Date(),

	        altFormat: 'j F Y',
	 
	        monthNames: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'],
	 
	        dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S']                              
	 
	});
 
});

