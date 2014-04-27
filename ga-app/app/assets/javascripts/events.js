$(function(){
  $('.payment').click(function(event){
    event.preventDefault();
    var user_attendance = $(this)
    var attendance_id = user_attendance.data("id");
    var paid;
    if (user_attendance.hasClass("paid")){
      paid = true;
      user_attendance.removeClass("paid");
    }
    else if (user_attendance.hasClass("unpaid")) {
      paid = false;
      user_attendance.removeClass("unpaid");
    }

    var data = {id: attendance_id, paid: paid}
    var url = '/attendances/' + attendance_id
    $.ajax({
      url: url, 
      data: data,
      type: "PUT",
      success: function(paid){
        if (paid.paid == true) {
          user_attendance.addClass("paid");
          user_attendance.text("Paid");
        }
        else if (paid.paid == false) {
          user_attendance.addClass("unpaid");
          user_attendance.text("Unpaid");
        }
      }
    });
  });
});