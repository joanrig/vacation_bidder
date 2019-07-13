
$(document).ready(function() {
  getCategoriesAndNestedAttractions()


  //INSPIRE ME aka categories index ///////////////

  //triggered by click on Inspire me in nav bar
  function getCategoriesAndNestedAttractions() {
    $('.nav-element.inspire-me').on('click', (e) => {
      e.preventDefault()
      history.pushState(null, null, "categories")
      fetch(`/attractions.json`)
      // return response in json, pass it on
        .then((res) => res.json())
        .then(categories => {
          $('#app-container').html('')

          //if arrow function only takes in one argument you dn't need to wrap them in parentheses
          //verbose version of arrow function: categories.forEach(function(category{
          categories.forEach(category => {
            let newCategory = new Category(category)
            let categoryHtml = ''
            categoryHtml += newCategory.formatIndex()
            $('#app-container').append(categoryHtml)
          })
        })
    })
  }

  const allCategories = []

  class Category {
    constructor(category) {
      //this is the object you are building
      this.id = category.id
      this.name = category.name
      this.attractions = category.attractions
      allCategories.push(this)
    }
  }

  //get rid of duplicates in category.attractions- Rails problem

  Category.prototype.formatIndex = function(){
    let attractions = []
    let previousId = null
    for (let i=0; i < this.attractions.length; i++) {
      let currentId = this.attractions[i].id
      if (currentId != previousId){
        attractions.push(this.attractions[i])
      }
      previousId = currentId
    }

    let sortedAttractions = attractions.sort(function(a, b) {
      var nameA = a.name.toUpperCase(); // ignore upper and lowercase
      var nameB = b.name.toUpperCase(); // ignore upper and lowercase
      if (nameA < nameB) {
        return -1;
      }
      if (nameA > nameB) {
        return 1;
      }

      // names must be equal
      return 0;
    });

    let attractionsHtml = sortedAttractions.map(a => {
      return(`
          <h3 style="color:white"><a href="attractions/${a.id}" class="attraction">${a.name}</a></h3>
          <br>
      `)
    }).join(' ')

    let categoryHtml = `
    <h1 style="color:white"><a href="categories/${this.id}" class="category">${this.name}</a></h1>
    `
    return (categoryHtml + attractionsHtml)
  }

  // categories show page - click on attraction to show info
  listenForAttractionClick()

  function listenForAttractionClick(){
    $('.attraction').one('click', function(e){
      e.preventDefault()

      const id = event.target.href.split('/')[4]
      fetch(`/attractions/${id}.json`)
        .then((res) => res.json())
        .then(attraction => {
          let newAttraction = new Attraction(attraction)
          let attractionHtml = newAttraction.formatShow()
          $(`#show-attraction-${id}`).append(attractionHtml)
      })
    })
  }

  const allAttractions = []

  class Attraction {
    constructor(attraction) {
      this.id = attraction.id
      this.name = attraction.name
      this.website= attraction.website
      this.city= attraction.city
      this.county= attraction.county
      this.state= attraction.state
      this.country= attraction.country
      this.notes= attraction.notes
      this.public= attraction.public
      allAttractions.push(this)
    }
  }

  Attraction.prototype.formatShow = function() {
    let attractionHtml = `
        <p>${this.website}</p>
        <p>${this.country}</p>
        <p>${this.notes}</p>
        <hr>
    `
    return attractionHtml
  }
//document ready
})




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
