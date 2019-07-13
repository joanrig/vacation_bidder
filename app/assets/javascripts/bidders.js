
// window.addEventListener('DOMContentLoaded', (event) => {
//   console.log('DOM fully loaded and parsed')
//
//
//
// class Bidder {
//     constructor(obj) {
//         this.id = obj.id
//         this.name = obj.name
//         this.email = obj.email
//         this.website = obj.website
//     }
//
//
//     static newBidderForm() { 
//       return (` 
//         <form id="bidder-form"> 
//         <input id='name' type='text' name='name' placeholder="Company Name"></input><br> 
//         <input id='email' type='text' name='email' placeholder="Email"></input><br> 
//         <input id='website' type='text' name='website' placeholder="Website"></input><br> 
//         <input type='submit'/> 
//         </form> 
//         `) 
//       }
//   }
//
//   Bidder.prototype.bidderHTML = function () {
//     return (`
//       <p>${data.name}</p>
//       <p>${data.email}</p>
//       <p>${data.website}</p>
//     `)
//     }

$(function () {
  $('form').submit(function(event) {
    event.preventDefault()

    const values = $(this).serialize()
    const posting = $.post('/bidders', values)

    posting.done(function(data) {
      $('#bidder-result').html('')
      $("#name").text(data["name"])
      $("#email").text(data["email"])
      $("#website").text(data["website"])
    })
  })
})

//document ready
// })
