$(document).on 'event_dates#show:loaded', ->
	console.log 'event_dates show loaded'
	$('select').on 'change', (e) ->
		if (parseInt(e.target.value) == 1)
			$('.merchant-fields').removeClass 'squished'
		else 
			$('.merchant-fields').addClass 'squished'