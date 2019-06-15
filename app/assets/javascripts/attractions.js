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
    $('#new_notes').on('submit', (function(event) {
      event.preventDefault()


      let id = document.querySelector('.glyphicon').id.split('-')[1]
      return $.ajax({
          type: "Patch",
          url: "/attractions/`${id}`",
          data: JSON.stringify(item),
          dataType: "json",
          contentType: 'application/json; charset=utf-8'
      })
    }))
  }


//document ready
})
