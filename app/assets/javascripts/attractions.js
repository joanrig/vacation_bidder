$(document).ready(function() {
  setEventListener()

  // function getAttraction(){
  //   const id = document.URL.split('/')[4]
  //   $.ajax({
  //       url: `http://localhost:3000/attractions/:${id}`,
  //       method: 'get',
  //       dataType: 'json',
  //       success: function(data) {data.map
  //         debugger
  //         (attraction => {
  //           // new js object
  //           const newAttraction = new Attraction(attraction)
  //         })
  //       }
  //   })
  // }
  //
  // class Attraction {
  //     constructor(obj) {
  //         this.id = obj.id
  //         this.name = obj.name
  //         this.website = obj.website
  //         this.city = obj.city
  //         this.state = obj.state
  //         this.county = obj.county
  //         this.country = obj.country
  //         this.notes = obj.notes
  //         this.public = obj.public
  //     }
  //   }

  function setEventListener(){
    debugger
    document.querySelector('.glyphicon').addEventListener("click", addOrEditNotes)
  }

  function addOrEditNotes() {
    debugger
  }

  function showNotes(){
  }

})
