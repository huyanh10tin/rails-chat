//= require jquery
//= require rails-ujs
//= require turbolinks
//= require pagination
//= require_tree .

$(function() {
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

  // grab comment button for revealing form to comment on post
  $("div.post").on("click", ".js-comment-button", (e) => {
    e.preventDefault();
    form = $(e.target).parents(".post").children(".js-post-comment-form").removeClass("hidden").addClass("active");
    form.find("input.input").focus();
    input = form.find("input.input");
    input.on("focusout", function() {
      form.addClass("hidden").removeClass("active");
    })
  })

  // grab new comment forms when new posts load via ajax
  $(window).on('scroll', function() {
    $("div.post").on("click", ".js-comment-button", (e) => {
      e.preventDefault();
      form = $(e.target).parents(".post").children(".js-post-comment-form").removeClass("hidden").addClass("active");
      form.find("input.input").focus();
      input = form.find("input.input");
      input.on("focusout", function() {
        form.addClass("hidden").removeClass("active");
      })
    })
  })

  // grab reply buttons for comments
  $buttons = $("a[id*='comments_']").toArray()
  $buttons.forEach(function(item) {
    item.addEventListener("click", function(e) {
      e.preventDefault();
      $($(e.target)).parent(".comment-likes").siblings(".replies").toggleClass("hidden")
      $($(e.target)).parent(".comment-likes").siblings(".js-reply-comment").toggleClass("hidden")
      $($(e.target)).parent(".comment-likes").siblings(".js-reply-comment").find("input").focus()
    })
  })

  // grab new reply button when new posts load via ajax
  $(window).on('scroll', function() {
    $buttons = $("a[id*='comments_']").toArray()
    $buttons.forEach(function(item) {
      item.addEventListener("click", function(e) {
        console.log(e.target)
        e.preventDefault();
        $($(e.target)).parent(".comment-likes").siblings(".replies").toggleClass("hidden")
        $($(e.target)).parent(".comment-likes").siblings(".js-reply-comment").toggleClass("hidden")
        $($(e.target)).parent(".comment-likes").siblings(".js-reply-comment").find("input").focus()
      })
    })
  })


// close document.ready
})
