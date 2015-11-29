jQuery(function($) {
  $('#bank_account_form').submit(function(event) {
    var $form = $(this);

    // Disable the submit button to prevent repeated clicks
    $form.find('button').prop('disabled', true);

    Stripe.bankAccount.createToken({
      country: 'FR',
      currency: 'EUR',
      account_number: $('.account-number').val()
    }, stripeResponseHandler);

    // Prevent the form from submitting with the default action
    return false;
  });
});


function stripeResponseHandler(status, response) {
  var $form = $('#bank_account_form');

  if (response.error) {
    // Show the errors on the form
    $form.find('.bank-errors').text(response.error.message);
    $("#notice").html(response.error.message);
    $form.find('button').prop('disabled', false);
  } else {
    // response contains id and bank_account, which contains additional bank account details
    var token = response.id;
    // Insert the token into the form so it gets submitted to the server
    $form.append($('<input type="hidden" name="stripeToken" />').val(token));
    // and submit
    $form.get(0).submit();
  }
}
