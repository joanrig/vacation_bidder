window.addEventListener('DOMContentLoaded', (event) => {
  console.log('DOM fully loaded and parsed')


class Bidder {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.email = obj.email
        this.website = obj.website
    }


    static newBidderForm() { 
      return (` 
        <form id="new-bidder-form"> 
        <input id='name' type='text' name='name' placeholder="Company Name"></input><br> 
        <input id='email' type='text' name='email' placeholder="Email"></input><br> 
        <input id='website' type='text' name='website' placeholder="Website"></input><br> 
        <input type='submit'/> 
        </form> 
        `) 
      }
  }


  function submitBidderForm() {
    $('#new-bidder-form').submit(function(event) {
      event.preventDefault()

      let values = $(this).serialize();
      let posting = $.post('/bidders.json', values);

      posting.done(function(data) {

        let bidderDiv = `
         <p>${this.name}</p>
        `

        $('#bidder-results').html(bidderDiv);
      })
    })
  }

  Bidder.newBidderForm()
  submitBidderForm()

//document ready
})
