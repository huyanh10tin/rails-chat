$(document).on("turbolinks:load", function() {
    $(window).on('scroll', function() {
      const more_posts_url = $('.pagination span.next a[rel="next"]').attr('href');
      if (more_posts_url && ($(window).scrollTop() > ($(document).height() - $(window).height() - 60))) {
            $('.pagination').html('<img id="loading" src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />');

            // Updates posts with infinite pagination
            $.getScript(more_posts_url)
              .done(function(){
                console.log("updating buttons!")

                // comment form button
                $("div.post").on("click", ".js-comment-button", (e) => {
                  console.log("comment button updated and clicked")
                  e.preventDefault();
                  form = $(e.target).parents(".post").children(".js-post-comment-form").removeClass("hidden").addClass("active");
                  form.find("input.input").focus();
                  input = form.find("input.input");
                  input.on("focusout", function() {
                    form.addClass("hidden").removeClass("active");
                  })
                })

                // reply to comment button
                $("div.comment-body").on("click", "a[id*='js-reply-comment']", (e) => {
                  console.log("reply button updated and clicked")
                  e.preventDefault()
                  $($(e.target)).parent(".comment-likes").siblings(".replies").toggleClass("hidden");
                  $($(e.target)).parent(".comment-likes").siblings(".js-reply-comment").toggleClass("hidden").find("input").focus();
                })
              })

              .fail(function() {
                $("#loading").hide();
              })
          }
      return;
    });

    // close #infinite scrolling

  // close document ready
});
