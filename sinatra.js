function monthSelector( month ) {
	var days = document.getElementById("daySelect");

	// Add back missing days
	if( days.length < 30 ) {
		var option = document.createElement("option");
		option.text = "30";
		option.value = "30";
		days.add(option);
	} 

	if( days.length < 31 ) {
		var option = document.createElement("option");
		option.text = "31";
		option.value = "31";
		days.add(option);
	} 
	
	if( month == "February" || month == "April" || month == "June" || month == "September" || month == "November" ) {
		days.remove(30);
	}
	
	if( month == "February" ) {
		days.remove(29);
	}
}

function changePage( day, month ) {
	if( window.location.pathname == "/on_this_day/" ) {
		location.assign( month + "/" + day );
	} else if ( window.location.pathname == "/on_this_day" ) {
		location.assign( "on_this_day/" + month + "/" + day );
	} else {
		location.assign( "../" + month + "/" + day);
	}
}

function browse_recordings_select() {
	var recordings = document.getElementsByClassName('browse_recording');
	
	var e = document.getElementById("browse_recordings_select_song");
	var song_id = e.options[e.selectedIndex].value;
	
	var e2 = document.getElementById("browse_recordings_select_type");
	var type = e2.options[e2.selectedIndex].value;
	
	var e3 = document.getElementById("browse_recordings_select_date");
	var date = e3.options[e3.selectedIndex].value;

	
	if (song_id == "0" && type == "all" && date == "0") {
		for (var i = 0; i < recordings.length; i++) {
			recordings[i].style.display = 'list-item';
		}
	} else {
		for (var i = 0; i < recordings.length; i++) {
			recordings[i].style.display = 'none';
		}
	
		var idToFind = '';
		if( song_id != "0" ) {
			idToFind = idToFind + 'browse_recording_song_' + song_id + ' ';
		}
		if( type != "all" ) {
			idToFind = idToFind + 'browse_recording_type_' + type + ' ';
		}
		if( date != "0" ) {
			idToFind = idToFind + 'browse_recording_date_' + date;
		}
		typeElements = document.getElementsByClassName(idToFind);
			
		for (var i = 0; i < typeElements.length; i++) {
			typeElements[i].style.display = 'list-item';
		}
	}
}

function clearFilters() {
	var e = document.getElementById("browse_recordings_select_song");
	e.selectedIndex = 0;
	
	var e2 = document.getElementById("browse_recordings_select_type");
	e2.selectedIndex = 0;
	
	var e3 = document.getElementById("browse_recordings_select_date");
	e3.selectedIndex = 0;

	browse_recordings_select();
}