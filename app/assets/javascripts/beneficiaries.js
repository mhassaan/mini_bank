$(document).on('turbolinks:load',function(){
  $('#beneficiary_benefactor_id').on('change',function(){
      var user_id = $(this).val();
      var str = '';
      $.ajax({
        url: '/beneficiaries/all_accounts',
        method: 'get',
        data: {id: user_id},
        dataType: 'json'
      }).done(function(response){
        console.log("Success reponse is:"+ JSON.stringify(response));
        var $dropdown = $("#beneficiary_benefactor_id");
        $('#beneficiary_account_id').find('option:not(:first)').remove();
        $(jQuery.parseJSON(JSON.stringify(response))).each(function() {
          $('#beneficiary_account_id').append("<option value='" + this.id + "'> " + this.title + "</option>")
        });
      }).fail(function(response){
        console.log("Fail reponse is:"+ response);
      });
  });

});
