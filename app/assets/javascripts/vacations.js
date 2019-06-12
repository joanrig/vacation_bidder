console.log("hello")

$(function() {
    console.log('vacations.js is loaded ...')
    listenForClick()
})


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
            // console log does not work
            console.log(data)
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
        this.bucket_list_item_id = obj.bucket_list_item_id
        this.attractions = obj.attractions
        allVacations << this
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
        debugger
        let id = event.target.parentElement.id
        let found = allVacations.map(v => v.id === this.id)

        event.preventDefault()


    })
}