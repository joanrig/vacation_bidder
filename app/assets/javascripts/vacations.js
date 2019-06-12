$(function() {
    // console.log doesn't work anywhere in my program!
    console.log('vacations.js is loaded ...')
    listenForClick()
})

// this is a click but it should be on document ready ?
function listenForClick() {
    $('button#vacations-data').one('click', function(event) {
        event.preventDefault()
        getVacations()
    })
}

function getVacations() {
    $.ajax({
        url: 'http://localhost:3000/vacations',
        method: 'get',
        dataType: 'json',
        success: function(data) {
            data.map(vacation => {
                // new js object
                const newVacation = new Vacation(vacation)
                const newVacationHtml = newVacation.vacationHTML()
                document.getElementById('ajax-vacations').innerHTML += newVacationHtml
                listenForHover()
            })
        }
    })
}

function listenFornewVacationFormClick() {
    $('button#ajax-new-vacation').on('click', function(event) {
        event.preventDefault()
        let newVacationForm = Vacation.newVacationForm()
            // $('div#new-vacation-form-div')
        document.querySelector('div#new-vacation-form-div').innerHTML = newVacationForm

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

    static newVacationForm() {
        return (`
    	<strong>New vacation form</strong>
    		<form>
    			<input id='vacation-name' type='text' name='name'></input><br>
                  <input type='text' name='budget'></input><br>
                  <input type='text' name='number_of_travelers'></input><br>
                  <input type='text' name='notes'></input><br>
    			<input type='submit' />
    		</form>
	  `)
  }
}

Vacation.prototype.vacationHTML = function() {
    return (`
		<div class='vacation-js' id="${this.id}">
      <h3>${this.name}</h3>
		</div>
	`)
}

function listenForHover() {
  $('div.vacation-js').mouseenter(function(event) {
    event.preventDefault()
    const id = event.target.parentElement.id
    // this doesn't work:
    // const found = allVacations.find(v => v.id === id)
    const found = allVacations.find(v => v.id === 1)
    const attractionsHTML = found.attractions.map(attraction => {
      return
      (`
        <div class='attractions'>
            <h3>${attraction.name}</h3>
        </div>
      `)
      // then add above html to DOM
    })
  })
}
