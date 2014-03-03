// function submitForm() {
//   var formData = $.form2JSON('#userForm');
//   var data = JSON.stringify(formData);
//   window.location = 'form-target.html?' + data;
// }
$(function() {
  $('.button.done').on('click', function() {
    $('#new_split_payment')[0].submit();
  });
});
