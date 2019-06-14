

$(function () {
  $('form').submit(function(event) {
    event.preventDefault()

    const values = $(this).serialize()
    const posting = $.post('/bidders', values)

    posting.done(function(data) {
      const post = data
      $("#name").text(post["name"])
      $("#email").text(post["email"])
      $("#website").text(post["website"])
    })
  })
})
