// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap
$(document).ready(function() {
	$('a[id^="add-form-"]').click(function(event) {
		clone = $(this).parent().children(".bond").first().clone(true);
		clone.find(":input").each(function(){
			$(this).val('');
		});
		$(this).parent().append(clone);
		$(this).parent().append('<span class="help-block"></span>');
	  event.preventDefault();
	});

	$('a[id^="add-heading"]').click(function(event) {
		clone = $(this).parent().clone(true);
		clone.find(":input").each(function(){
			$(this).val('');
		});
		clone.append('<span class="help-block"></span>');
		$(this).parent().parent().append(clone);
	  event.preventDefault();
	});

	$('a[id^="add-para"]').click(function(event) {
		clone = $(this).parent().children("[id$=_para]").first().clone(true);
		clone.val('');
		clone.append('<span class="help-block"></span>');
		$(this).parent().append(clone);
	  event.preventDefault();
	});

	$('.remove-bond').click(function(event) {
		if($(this).parent().parent().children('.bond').length != 1)
			$(this).closest(".bond").remove();
		event.preventDefault();
	});
});
