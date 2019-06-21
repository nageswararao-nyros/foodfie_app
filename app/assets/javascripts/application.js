// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require jquery.ui.touch-punch.min
//= require autocomplete-rails
// require turbolinks
//= require bootstrap
//= require custom_js
//= require image-scale
//= require retina_tag


$(document).ready(function() {
  $('#reset-password-submit').prop('disabled', true);

  $('#new-password-confirmation').on('input', function() {
    if ($(this).val() != $('#new-password').val()) {
      $('#passwordHelpBlock').removeClass('hidden');
      $(this).parent().addClass('has-error');
      $('#reset-password-submit').prop('disabled', true);
    } else {
      $('#passwordHelpBlock').addClass('hidden');
      $(this).parent().removeClass('has-error');
      $('#new-password').parent().removeClass('has-error');
      $('#reset-password-submit').prop('disabled', false);
    }
  });

  $('#new-password').on('input', function() {
    if ($('#new-password-confirmation').val() && ($(this).val() != $('#new-password-confirmation').val())) {
      $(this).parent().addClass('has-error');
      $('#reset-password-submit').prop('disabled', true);
    } else {
      $(this).parent().removeClass('has-error');
      $('#new-password-confirmation').parent().removeClass('has-error');
      $('#passwordHelpBlock').addClass('hidden');
      $('#reset-password-submit').prop('disabled', false);
    }
  });

  $(document).on("click", ".logo",function(){
    $('html, body').animate({scrollTop : 0},800);
    return false;
  })

  
});


