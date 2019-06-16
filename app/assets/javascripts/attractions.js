$(document).ready(function() {


    $('form').submit(function(event) {
      event.preventDefault()

      const values = $(this).serialize()
      const posting = $.post('/attractions', values)

      posting.done(function(data) {
        showAttraction(data)
      })
    })


  function showAttraction(data){
    let categories = data.categories.map(c => {
      return(`
          <a href="http://localhost3000/categories/${c.id}">${c.name}</a>
          <br>
      `)

      $('#attraction-container').innerHTML = `
        <h1>Name: ${data.name}</h1>
        <p>Categories: ${categories}</p>
      `
    })
  }




//document ready
})
