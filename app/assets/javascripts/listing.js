var ready;
ready = function() {

  $('.nav-tabs').responsiveTabs();

  $(".table-wrap").each(function() {
    var nmtTable = $(this);
    var nmtHeadRow = nmtTable.find("thead tr");
    nmtTable.find("tbody tr").each(function() {
      var curRow = $(this);
      for (var i = 0; i < curRow.find("td").length; i++) {
        var rowSelector = "td:eq(" + i + ")";
        var headSelector = "th:eq(" + i + ")";
        curRow.find(rowSelector).attr('data-title', nmtHeadRow.find(headSelector).text());
      }
    });
  });

  //change room types based on hotel name
  $("#listing_hotel_id").on("change", function() {
    //console.log($(this).data('id'))
    //console.log(current_url)l=
    $.ajax({
      url: '/listings/changeRoomTypes',
      type: 'POST',
      data: { hotel_id: $(this).val() },
      dataType: 'html',
      success: function(data) {
        //$("#listing_room_type").children().remove();
        console.log(data);
        $(".room_types").html(data);
      }
    });
  });

  $('#datetimepicker6').datetimepicker({
    format: 'L'
  });
  $('#datetimepicker7').datetimepicker({
      format: 'L',
      useCurrent: false //Important! See issue #1075
  });
  $("#datetimepicker6").on("dp.change", function (e){
      $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
  });
  $("#datetimepicker7").on("dp.change", function (e){
      $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
  });
  
  $("#hotel_name").select2({
     theme: "bootstrap"
  });
  
  // show rotating images on only index page
  if(info.mode == 'index') {
    $('.carousel').carousel({
      interval: 6000
    });
  } else if(info.mode == 'hotel') {
    // on specfic hotel page, show static image, using picture_field value in database
    $("#hotel_name").val(info.hotel_name).trigger('change');
    $('.carousel').carousel({
      interval: false
    });
    $('#item-1').css('background-image', "url('" + info.picture_link + "')");
  }  
};
$(document).on('turbolinks:load', ready);
