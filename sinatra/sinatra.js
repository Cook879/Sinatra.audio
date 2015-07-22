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