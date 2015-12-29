$(document).ready(function(){
    //Retrieve Stripe public key for permission to interact with Stripe
    Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'));
    //Watch for a form submission
    $("#form-submit-btn").click(function(event){
        
        event.preventDefault();//Prevents the form's default behaviour so that it doesn't yet submit
        $('input[type=submit]').prop('disabled',true);//disables submit button, prevents multiple clicks
        var error = false;
        var ccNum = $('#card_number').val(),// jquery commands to grab values from credit card detail fields
            cvcNum = $('#card_code').val(),
            expMonth = $('#card_month').val(),
            expYear = $('card_year').val();
        
        if(!error){
            //Get the Stripe token, ship credit card details off to Stripe
            Stripe.createToken({ // After this line of code runs Stripe sends back a status and response used below
                number: ccNum,
                cvc: cvcNum,
                exp_month: expMonth,
                exp_year: expYear
            }, stripeResponseHandler);// Stripe sends back a response containing a card token, this command handles it
        }
        return false;
    }); //form submission

    function stripeResponseHandler(status, response){
        // Get a reference to the form:
        var f = $("new_user");// entire form assigned to var f
        
        //Get the token from the response:
        var token = response.id; //this finds the card token sent by Stripe
        
        //Add the token to the form:
        f.append('<input type="hidden" name="user[stripe_card_token]" value="' + token + '" />');
    
        //Submit the form
        f.get(0).submit(); //form is submitted to our own server containing email, password and hidden card token
    }    
});