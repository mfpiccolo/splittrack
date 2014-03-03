$(function() {
  var opts = {
     tabs : 3,
     imagePath : "../icons-ios/",
     icons : ["home", "weather", "mail"],
     labels : ["Home", "Contacts", "Split Pay"],
     selected : 1
  };
  $.UITabbar(opts);
});
