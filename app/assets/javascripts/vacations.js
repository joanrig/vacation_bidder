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



function showAttractionsOnHover() {
  $('.vacation').hover
  // start hover
  (function(event) {
    event.preventDefault()
    const id = event.target.parentElement.id
    const found = $.grep(allVacations, function(v){
      return v.id == id
    })
    const attractions = found[0].attractions
    const attractionsHTML = attractions.map(a => {
      return(`
          <div class="attractions">
            <h5>${a.name}</h5>
          </div>
        `)
    })
    document.getElementById("attractions-js").innerHTML = attractionsHTML
  })
  //end hover
  (function(event) {
    document.getElementById("attractions-js").innerHTML =""
  })
}
