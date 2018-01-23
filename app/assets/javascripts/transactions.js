$(document).on('turbolinks:load',function(){
  $('#reciever_user_id').on('change',function(){
      var user_id = $(this).val();
      var str = '';
      $.ajax({
        url: '/beneficiaries/all_accounts',
        method: 'get',
        data: {id: user_id},
        dataType: 'json'
      }).done(function(response){
        console.log("Success reponse is:"+ JSON.stringify(response));
        $('#reciever_account_id').find('option:not(:first)').remove();
        $(jQuery.parseJSON(JSON.stringify(response))).each(function() {
          $('#reciever_account_id').append("<option value='" + this.id + "'> " + this.title + "</option>")
        });
      }).fail(function(response){
        console.log("Fail reponse is:"+ response);
      });
  });

  $('.update-payment-status-btn').on('click',function(){
  var transaction_id = $(this).val();
  alert(transaction_id);
  $(this).attr("disabled","disabled");
  $(this).html("Accepted");
  $.ajax({
    url: '/transactions/update_status',
    method: 'get',
    data: {id: transaction_id},
    dataType: 'json'
  }).done(function(response){
    console.log("Success reponse is:"+ response.status);
  }).fail(function(response){
    console.log("Fail reponse is:"+ response);
  });
});

});
