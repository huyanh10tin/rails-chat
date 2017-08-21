//= require jquery
//= require rails-ujs
//= require turbolinks
//= require pagination
//= require lightbox
//= require_tree .

$(document).on("turbolinks:load", function() {
  if ($(".search")) {
    tabs = $("li.tab").toArray();
    tabs.forEach(function(item) {
      item.addEventListener("click", function(e) {
        tab = $($(e.target)).parents("li").attr("data-panel");
        $("ul#list li").not(".hidden").toggleClass("hidden");
        $("." + tab).toggleClass("hidden");
      })
    })
  }

  if ($(".js-profile-tabs")) {
    tabs = $("ul li").toArray();
    tabs.forEach(function(item) {
      item.addEventListener("click", function(e) {
        $(e.target).parent("li").toggleClass("is-active");
      })
    })
  }

// close document.ready
})
