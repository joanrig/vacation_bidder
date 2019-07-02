$(document).ready(function() {
  getVacations()
  listenForAttractionsClick()

  function getVacations() {
    $.ajax({
          url: 'http://localhost:3000/vacations',
          method: 'get',
          dataType: 'json',
          success: function(data) {data.map(vacation => {
              // new js object
              const newVacation = new Vacation(vacation)
          })
        }
    })
  }

  const allVacations = []
  class Vacation {
      constructor(obj) {
          this.id = obj.id
          this.name = obj.name
          this.category = obj.category
          this.budget = obj.budget
          this.number_of_travelers = obj.number_of_travelers
          this.notes = obj.notes
          this.open_to_bids = obj.open_to_bids
          this.attractions = obj.attractions
          allVacations.push(this)
      }
    }


  ///   attractions  ///

  function listenForAttractionsClick(){
    cameras = document.querySelectorAll('.glyphicon-camera')
    cameras.forEach(function (element) {
      element.addEventListener("click", timesCameraClicked)
    })
  }

  let cameraCounter = 0
  function timesCameraClicked(){
    cameraCounter++
    if (cameraCounter % 2 === 0) {
      hideAttractions()
      } else {
      showAttractions()
    }
  }

  function showAttractions() {
    const id = event.target.id
    const thisVacation = $.grep(allVacations, function(v){
      return v.id == id
    })
    const attractions = thisVacation[0].attractions
    const attractionsDiv = document.getElementById(`attractions-${id}`)

    attractionsDiv.innerHTML = attractions.map(a => {
      return(`
          <a href="${a.url}" class="attraction">${a.name}</a>
          <br>
      `)
    })
  }

  function hideAttractions(){
    const id = event.target.id
    const attractionsDiv = document.getElementById(`attractions-${id}`)
    attractionsDiv.innerHTML = ""
  }


  ///  notes  ///

  Vacation.prototype.notes = function() {
    return (`
        <p>${this.notes}</p>
    `)
  }

  listenForNotesClick()
  function listenForNotesClick(){
    comments = document.querySelectorAll('.glyphicon-comment')
    comments.forEach(function (element) {
      element.addEventListener("click", timesCommentsClicked)
    })
  }

  let commentsCounter = 0
  function timesCommentsClicked(){
    commentsCounter++
    if (commentsCounter % 2 === 0) {
      hideNotes()
      } else {
      showNotes()
    }
  }

  function showNotes() {
    const id = event.target.id.split('-')[1]
    const thisVacation = $.grep(allVacations, function(v){
      return v.id == id
      // debugger hits
    })

    //error from line below: thisVacation.notes is not a function
    notes = thisVacation.notes()
    $(`#notes-${id}`).html(notes)
  }

  function hideNotes(){
    const id = event.target.id
    $(`#notes-${id}`).innerHTML = ""
  }

})
