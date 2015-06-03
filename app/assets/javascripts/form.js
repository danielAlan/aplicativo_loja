$(document).ready(function(){
  $('.cep').mask('99999-999');
  $('.phone').mask('9999-9999');
  $('.cel').mask('(19)99999-9999');
  $('.phone_with_ddd').mask('(99)9999-9999');
  $('.phone_us').mask('(999)999-9999');
  $('.cpf').mask('999.999.999-99', {reverse: true});
  $('.cnpj').mask('99.999.999/9999-99', {reverse: true});
  $('.money').mask('999.999.999.999.999,99', {reverse: true});
  $(".timemask").mask("99:99");
  $(".datepicker").mask("99/99/9999");
  $(".datemask").mask("99/99/9999");
  $(".mesano").mask("99/99");
});