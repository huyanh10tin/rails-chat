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
        console.log(e.target)
        tab = $($(e.target)).parents("li").attr("data-panel");
        $("ul#list li").not(".hidden").toggleClass("hidden");
        $("." + tab).toggleClass("hidden");
    })
  })

  // close if for .search
  }
// close document.ready
})
