$(() => {
  bindClickHandlers()
})

//attractions index page will show attractions through their categories, so we are making a fetch request for categories
const bindClickHandlers = () => {
  $('.nav_element.attractions').on('click', (e) => {
    e.preventDefault()
    fetch(`/attractions.json`)
    // return response in json, pass it on
      .then((res) => res.json())
      .then(categories => {
        $('#app-container').html('')
        //verbose version
        // categories.forEach(function(category{

        //arrow function version
        //if arrow function only takes in one argument you dn't need to wrap them in parentheses
        categories.forEach(category => {
          let newCategory = new Category(category)
          console.log(newCategory)
          let categoryHtml = newCategory.formatIndex()
          $('#app-container').append(categoryHtml)
        })
      })
  })
}

function Category(category) {
  //this is the object you are building
  this.id = category.id
  this.name = category.name
  this.attractions = category.attractions
}

Category.prototype.formatIndex = function(){
  let categoryHtml = `
  <h1>${this.name}</h1>
  `
  return categoryHtml
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
