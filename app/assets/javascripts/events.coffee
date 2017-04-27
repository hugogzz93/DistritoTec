$(document).on 'events#show:loaded', ->
	console.log 'events show loaded'
	$('.register-btn').on 'click', (e) ->
		unless $(e.target).hasClass('disabled')
			$(e.target).addClass('disabled')
			$.ajax "/event_registrations/#{$(e.target).data 'event-id'}",
			{
				type: 'POST'
				data: { user_id: $(e.target).data('user-id'), event_date_id: $(e.target).data('date-id')}
				dataType: 'html'
				error: (jqXHR, textStatus, errorThrown) ->
	          swal('Failure', 'You have not been registered', 'error')
				success: (data, textStatus, jqXHR) ->
	          swal("Success", "You have been registered", "success")
			}