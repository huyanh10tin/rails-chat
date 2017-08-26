// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on("turbolinks:load", function() {
  $('.conversations-aside').on('scroll', function() {

      if($(this).scrollTop() + $(this).innerHeight() + 60 >= $(this)[0].scrollHeight) {
        const more_posts_url = $('.pagination span.next a[rel="next"]').attr('href');
        if (more_posts_url && ($(window).scrollTop() > ($(document).height() - $(window).height() - 60))) {
          $('.pagination').html('<img id="loading" src="/assets/loading.gif" alt="Loading..." title="Loading..." />');

          $.getScript(more_posts_url)
            .done(function(){
              console.log("Reached bottom of aside");
            })
            .fail(function() {
              $("#loading").hide();
            })
        }
      }
  });

  $("div.conversation-body").first().toggleClass("hidden")

  $(".conversations-list").on("click", "div.conversation", (e) => {
    conversationNumber = $(e.target).parents(".conversation").attr("data-id")
    console.log(conversationNumber)
    $("div.conversation-body:not(.hidden)").toggleClass("hidden")
    $("#conversation_" + conversationNumber).toggleClass("hidden")

    console.log($("form.new_message").find("input#message_conversation_id").val(conversationNumber))

    $("form.new_message").find("input#message_conversation_id").val(conversationNumber)
  })
})
