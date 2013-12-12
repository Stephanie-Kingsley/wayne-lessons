$(document).ready(function(){

  //"use strict";

  //$('.list-group-item:first').addClass('active');
  $('.reading:even').css("display", "none");


  $('.list-group-item').click(function() {
    console.log($(this));
  });
});
