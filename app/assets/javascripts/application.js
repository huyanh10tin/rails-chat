//= require jquery
//= require rails-ujs
//= require turbolinks
//= require pagination
//= require_tree .


$(document).ready(function() {
  if ($(".search")) {
    tabs = $("li.tab").toArray();

    tabs.forEach(function(item) {
      item.addEventListener("click", function(e) {
        tab = $($(e.target)).parents("li").attr("data-panel");
        $("ul#list li").not(".hidden").toggleClass("hidden");
        $("." + tab).toggleClass("hidden");
    })
  })


$(window).on('scroll', function() {
  $("div.post").on("click", ".js-comment-button", (e) => {
    e.preventDefault();
    form = $(e.target).parents(".post").children(".js-post-comment-form").removeClass("hidden")
    form.find("input.input").focus();
    input = form.find("input.input")
    input.on("focusout", function() {
      form.addClass("hidden")
    })
  })
})





  // close if for .search
  }
// close document.ready
})
