//= require jquery
//= require rails-ujs
//= require turbolinks
//= require pagination
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

  // initial grab of comment buttons for revealing comment forms on posts
  $("div.post").on("click", ".js-comment-button", (e) => {
    console.log("grabbed comment buttons")
    e.preventDefault();
    form = $(e.target).parents(".post").children(".js-post-comment-form").removeClass("hidden").addClass("active");
    form.find("input.input").focus();
    input = form.find("input.input");
    input.on("focusout", function() {
      form.addClass("hidden").removeClass("active");
    })
  })

  // initial grab of reply buttons for comments
  $("div.comment-body").on("click", "a[id*='js-reply-comment']", (e) => {
    console.log("grabbed reply buttons")
    e.preventDefault()
    $($(e.target)).parent(".comment-likes").siblings(".replies").toggleClass("hidden")
    $($(e.target)).parent(".comment-likes").siblings(".js-reply-comment").toggleClass("hidden").find("input").focus();
  })
// close document.ready
})
