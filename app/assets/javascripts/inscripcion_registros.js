$('.delete-link').on('click', function(e){
  var twit_id = $(this).attr("data-id");
  if($("#delete_" + twit_id).is(':checked')){
    $("#twit_" + twit_id).trigger('click');
  }else{
    alert('Please check the checkbox!')
  }
});
