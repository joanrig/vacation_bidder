$(document).ready(function() {
  updateNotes()

  function updateNotes(){
    notesDiv = document.getElementById("show-notes")
    document.querySelector('.btn').addEventListener("click", function() {
        notesDiv.innerHTML = notesForm()
    })
  }

  function notesForm (){
    const currentComments = document.querySelector('.current-comments').innerText
    return `
      <form action="/attractions" method="post">
          <input type="text" name="attraction[notes]" value="${currentComments}">
      </form>
    `
  }



})
