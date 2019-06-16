window.addEventListener('DOMContentLoaded', (event) => {
  console.log('DOM fully loaded and parsed')
  showForm()
  submitBidderForm()
})


class Bidder {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.email = obj.email
        this.website = obj.website
    }


    static newBidderForm() { 
      return (` 
        <form id="bidder-form"> 
        <input id='name' type='text' name='name' placeholder="Company Name"></input><br> 
        <input id='email' type='text' name='email' placeholder="Email"></input><br> 
        <input id='website' type='text' name='website' placeholder="Website"></input><br> 
        <input type='submit'/> 
        </form> 
        `) 
      }
  }

  Bidder.prototype.bidderHTML = function () {
    return (`
      <p>${data.name}</p>
      <p>${data.email}</p>
      <p>${data.website}</p>
    `)
    }




  function showForm(){
    $('#bidder-form-goes-here').html(Bidder.newBidderForm())
  }


  function submitBidderForm() {
    $('#bidder-form').on('submit', function(event) {
      event.preventDefault()

      let values = $(this).serialize();
      const posting = $.post('/bidders.json', values);
      //this debugger hits

      posting.done(function(data){
        let newBidder = new Bidder(data)
        $('#bidder-results').innerHTML = newBidder.bidderHTML()
        debugger

      })
    })
  }


//document ready
// })
