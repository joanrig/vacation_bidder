$(function() {
    console.log('vacations.js is loaded ...')
    listenForClick()
})

function listenForClick() {
    $('button#vacations-data').on('click', function(event)) {
        event.preventDefault()
        getVacations()
    })
}

function getVacations() {
    $.ajax({
        url: 'http://localhost:3000/vacations',
        method: 'get'
        dataType: 'json'

    }).done(function(data) {
        console.log("the data is: ", data)
        debugger
        let myVacation = new myVacation(data)
        let myVacationHTML = myVacation.vacationHTML()
        document.getElementById('ajax-vacations').innerHTML += myVacationHTML
    })
}

class Vacation {
    constructor(obj) {
        this.name = obj.name
        this.category = obj.category
        this.budget = obj.budget
        this.number_of_travelers = obj.number_of_travelers
        this.notes = obj.notes
        this.open_to_bids = obj.open_to_bids
        this.bucket_list_item_id = obj.bucket_list_item_id
        this.attractions = obj.attractions
    }
}