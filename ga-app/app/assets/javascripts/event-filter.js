$(document).on('ready page:load', function () {
	$('#EventList').mixItUp({
		layout: {
			display: 'block'
		}
	});
});


$(document).on('page:fetch', function(){
    $('#EventList').mixItUp('destroy');
});

$(document).on('ready page:load', function () {
	$('#EventList').mixItUp({
		layout: {
			display: 'block'
		}
	});
});
