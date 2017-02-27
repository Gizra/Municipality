$(document).ready(function(){
  $('.contents').hide();
  $('.navigate').appendTo('body');
  $('.step-1').appendTo('body');
  $('.btn.language').click(function(event){
    $('.step-1').appendTo('.contents');
    var lang = event.target.id;
    $('.step-2 > :not(".'+lang+'")').hide();
    $('.step-2').appendTo('body');
    $('.btn.purpose').click(function(event){
    $('.step-2').appendTo('.contents');
    var purpose = event.target.id;
    $('.step-3 > :not(".'+lang+'")').hide();
    $('.step-3').appendTo('body');
    });
  });
});
