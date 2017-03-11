$(document).on 'events#show:loaded', ->
	console.log 'events show loaded'
	$('#register-btn').on 'click', (e) ->
		$.ajax "/event_registrations/#{$(e.target).data 'event-id'}",
		{
			type: 'POST'
			data: { user_id: $(e.target).data('user-id')}
			dataType: 'html'
			error: (jqXHR, textStatus, errorThrown) ->
          swal('Failure', 'You have not been registered', 'error')
			success: (data, textStatus, jqXHR) ->
          swal("Success", "You have not been registered", "success")
		}