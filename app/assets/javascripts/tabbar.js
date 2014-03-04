$(function() {
  var opts = {
     tabs : 3,
     imagePath : "../icons-ios/",
     icons : ["home", "contacts", "split_pay"],
     labels : ["Home", "Contacts", "Split Pay"],
     selected : 1
  };
  $.UITabbar(opts);
});
