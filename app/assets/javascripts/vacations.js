$(document).ready(function() {
  getVacations()
  showAttractionsOnHover()
})

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

//works correctly for top vacation in list, shows all other info in wrong place (top div) and flickers like a bat out of hell.
function showAttractionsOnHover() {
  $('.vacations').mouseenter (function(event) {
    event.preventDefault()
    //find vacation based on hover location
    const id = event.target.parentElement.id
    if (id){
      const thisVacation = $.grep(allVacations, function(v){
        return v.id == id
      })

      const attractions = thisVacation[0].attractions
      const attractionsDiv = document.getElementById(id).getElementsByClassName('attractions')[0]
      debugger

      attractionsDiv.innerHTML = attractions.map(a => {
        return(`
            ${a.name}
        `)
      })
    }

    //end hover
    $('.vacations').mouseout(function(event) {
      attractionsDiv.innerHTML = ""
    })
  })
}
