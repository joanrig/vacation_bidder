$(document).ready(function() {
  getVacations()
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
function showAttractions() {
  const id = event.target.id
  const thisVacation = $.grep(allVacations, function(v){
    return v.id == id
  })

  const attractions = thisVacation[0].attractions
  const attractionsDiv = document.getElementById(`attractions-${id}`)
  
  attractionsDiv.innerHTML = attractions.map(a => {
    return(`
        ${a.name}
    `)
  })
}
