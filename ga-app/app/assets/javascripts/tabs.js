$(document).ready(function () {

  $("#tab1").show();
  
  var currentTabSelector = $(".tabs li.active a").attr('href');
  $(currentTabSelector).show();
  
  $(".tabs li").on('click', function(e) {
   e.preventDefault();
  
    $(".tabs li").removeClass('active');
    $(this).addClass('active');
  
    var contentDivId = $(this).children("a").attr('href');
  
    $(".tab").hide();
    $(contentDivId).show();
  });
});