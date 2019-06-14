

$(function () {
  $('form').submit(function(event) {
    event.preventDefault()

    var values = $(this).serialize()
    var posting = $.post('/bidders', values)
    debugger

    posting.done(function(data) {
      var post = data;
      $("#name").text(bidder["name"])
      $("#email").text(bidder["email"])
      $("#website").text(bidder["website"])
    })
  })
})
