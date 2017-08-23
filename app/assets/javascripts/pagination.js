$(document).on("turbolinks:load", function() {
  // grab comment buttons
  $("#my-posts").on("click", ".js-comment-button", (e) => {
    e.preventDefault();

    $(e.target).parents("[id*=post_]").find("input.input").focus();
  })

  // grab reply buttons
  $("#my-posts").on("click", "a[id*='js-reply-comment']", (e) => {
    e.preventDefault();

    $parent = $(e.target).parents("div.comment")
    $parent.find(".js-reply-comment").last().toggleClass("hidden").find("input").focus().on("focusout", function(){
    })

    $parent.find("div.replies").toggleClass("hidden");
  })

  // pagination
  $(window).on('scroll', function() {
    const more_posts_url = $('.pagination span.next a[rel="next"]').attr('href');
    if (more_posts_url && ($(window).scrollTop() > ($(document).height() - $(window).height() - 60))) {
      $('.pagination').html('<img id="loading" src="/assets/loading.gif" alt="Loading..." title="Loading..." />');

      $.getScript(more_posts_url)
        .done(function(){
          console.log("Reached bottom");
        })
        .fail(function() {
          $("#loading").hide();
        })
    }
    return;
  });
});
