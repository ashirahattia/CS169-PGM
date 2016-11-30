# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

`$(document).ready(function() {
    $('#trigger-rematch').click(function(){
      $('#rematch-confirm-modal').fadeIn(500);
      event.preventDefault();
    });
    
    $('#trigger-cancel').click(function() {
      if($('#rematch-confirm-modal').is(':visible')) {
          $('#rematch-confirm-modal').fadeOut(500);
          event.preventDefault();
      }
    });
});`


