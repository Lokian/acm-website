// Place your application-specific JavaScript functions and classes here

jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitButtonWithAjax = function() {
  this.submit(function() {
    $.post($(this).children('form').attr("action"), $(this).serialize(), null, "script");
    return false;
  })
  return this;
};
 
$(document).ready(function() {
  $("#new_rsvp").submitButtonWithAjax();
})