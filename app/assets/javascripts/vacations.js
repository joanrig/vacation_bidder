$(document).ready(function() {
  getVacations()
  listenForHover()
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

// function listenFornewVacationFormClick() {
//     $('button#ajax-new-vacation').on('click', function(event) {
//         event.preventDefault()
//         let newVacationForm = Vacation.newVacationForm()
//             // $('div#new-vacation-form-div')
//         document.querySelector('div#new-vacation-form-div').innerHTML = newVacationForm
//
//     })
// }

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

    // static newVacationForm() {
    //     return (`
    // 	<strong>New vacation form</strong>
    // 		<form>
    // 			<input id='vacation-name' type='text' name='name'></input><br>
    //               <input type='text' name='budget'></input><br>
    //               <input type='text' name='number_of_travelers'></input><br>
    //               <input type='text' name='notes'></input><br>
    // 			<input type='submit' />
    // 		</form>
	  // `)
  }

function listenForHover() {
  $('h3.vacation').mouseenter(function(event) {
    event.preventDefault()
    // this doesn't work:
    // const found = allVacations.find(v => v.id === id)
    const id = event.target.parentElement.id
    //sample code does not work:
    //myArray.find(x => x.id === '45')
    // $.grep(myArray, function(e){ return e.id == id; })
    const found = $.grep(allVacations, function(v){
      return v.id == id
    })
    debugger
    const attractionsHTML = found.attractions.map(attraction => {
      return
      (`
        <div class='attractions'>
            <h3>${attraction.name}</h3>
        </div>
      `)
      debugger
      // then add above html to DOM
    })
  })
}
