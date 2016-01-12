$(function() { 
    $( "#item_start_date" ).datepicker({
      defaultDate: "0",
      minDate: "0",
      changeMonth: true,
      numberOfMonths: 3,
      onClose: function( selectedDate ) {
        $( "#item_end_date" ).datepicker( "option", "minDate", selectedDate );
      }
    });
    $( "#item_end_date" ).datepicker({
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 3,
      onClose: function( selectedDate ) {
        $( "#item_start_date" ).datepicker( "option", "maxDate", selectedDate );
      }
    });
  });

