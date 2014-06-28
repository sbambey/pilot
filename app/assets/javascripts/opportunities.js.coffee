# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
	$('form').on 'click', '.remove_fields', (event) ->
		$(this).parent().find('input[type=hidden]').each ->
			$(this).val('1')
		$(this).closest('.panel').hide()
		event.preventDefault()

	$('form').on 'click', '.add_fields', (event) ->
		time = new Date().getTime()
		regexp = new RegExp($(this).data('id'), 'g')
		if($(this).parent().attr('class') == 'add-buttons')
			$(this).parent().before($(this).data('fields').replace(regexp, time))
		else
			$(this).before($(this).data('fields').replace(regexp, time))
		event.preventDefault()
