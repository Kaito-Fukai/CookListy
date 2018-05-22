$(document).ready(function() {
  $('#awayTeamIndex').on('cocoon:after-insert', function() {
        /* ... do something ... */
        $('select#awayteam').select2( {
          placeholder: "Away Team",
          allowClear: true
          });
        });
	});