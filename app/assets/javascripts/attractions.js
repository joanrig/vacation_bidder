$(() => {
  bindClickHandlers()
})

const bindClickHandlers = () => {
  $('.nav_element.attractions').on('click', (e) => {
    e.preventDefault()
    fetch(`/attractions.json`)
      .then((response) => console.log(response))

  //   fetch('http://localhost3000/attractions.json')
  // .then(function(response) {
  //   return response.json();
  // })
  // .then(function(myJson) {
  //   console.log(JSON.stringify(myJson));
  // });
  })

}


// $(document).ready(function() {
//   bindClickHandlers()
//   addNotesForm()
//   submitForm()

//
//   //works
//   function addNotesForm(){
//     notesDiv = document.getElementById("show-notes")
//     const button = document.querySelector('.btn')
//     button.addEventListener("click", function() {
//         notesDiv.innerHTML = notesForm()
//         submitForm()
//     })
//   }
//
//   //works
//   function notesForm (){
//     const id = document.querySelector('.glyphicon').id.split('-')[1]
//     const currentComments = document.querySelector('.current-comments').innerText
//     return `
//       <form id="new_notes" action="/attractions/${id}" method="patch">
//           <input type="text" name="attraction[notes]" value="${currentComments}">
//           <input type="submit" class="submit">
//       </form>
//     `
//   }
//
//
// //doesn't work but at least it's solvable.
//   function submitForm(){
//     $('#new_notes').on('submit', (function(event) {
//       event.preventDefault()
//
//       const patch = {
//         "data" : "New data"
//       }
//       let id = document.querySelector('.glyphicon').id.split('-')[1]
//
//         // https://stackoverflow.com/questions/38945677/using-jquery-patch-to-make-partial-update
//         $.ajax({
//            type: 'PATCH',
//            url: "/attractions/`${id}`",
//            data: JSON.stringify(patch),
//            processData: false,
//            contentType: 'application/merge-patch+json'
//         })
//           .done(function(data) {
//           console.log(data)
//         })
//
//     }))
//   }
//
//
// //document ready
// })
