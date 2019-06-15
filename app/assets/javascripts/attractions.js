$(document).ready(function() {
  addNotesForm()
  submitForm()

  //works
  function addNotesForm(){
    notesDiv = document.getElementById("show-notes")
    const button = document.querySelector('.btn')
    button.addEventListener("click", function() {
        notesDiv.innerHTML = notesForm()
        submitForm()
    })
  }

  //works
  function notesForm (){
    const id = document.querySelector('.glyphicon').id.split('-')[1]
    const currentComments = document.querySelector('.current-comments').innerText
    return `
      <form id="new_notes" action="/attractions/${id}" method="patch">
          <input type="text" name="attraction[notes]" value="${currentComments}">
          <input type="submit" class="submit">
      </form>
    `
  }


  function submitForm(){
    const form = document.querySelector('#new_notes')
    $(form).on('submit', function(event) {
        event.preventDefault()
        const values = $(this).serialize()
        const id = document.querySelector('.glyphicon').id.split('-')[1]

        fetch(`http://localhost:3000/attractions/${id}`, {
          method: 'PATCH',
          headers: {
            'Content-Type': 'application/json'
          },

          body: JSON.stringify({
            attraction: attraction.notes
          })
        })

        .then(function(json) { 
        console.log(json)
        })

    }))
  }


//document ready
})
