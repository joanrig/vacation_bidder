
function listenFornewBucketListItemFormClick() {
    $('button#new-bucket-list-item').on('click', function(event) {
        event.preventDefault()
        let newBucketListItemForm = BucketList.newBucketListItemForm()
            // $('div#new-vacation-form-div')
        document.querySelector('div#new-bucket-list-item-form').innerHTML = newBucketListItemForm()

    })
}


const allBucketListItems = []

class BucketListItem {
    constructor(obj) {
        this.id = obj.id
        this.name = obj.name
        this.user = obj.user
        this.notes = obj.notes
        this.vacation = obj.vacation_id
        allBucketListItems.push(this)
    }
  }



  static newBucketListItemForm() {
      return (`
  	     <strong>Let's add to your bucket list!</strong>
  		   <form>
  			    <input id='vacation-name' type='text' name='name'></input><br>
            <input type='text' name='notes'></input><br>
  			    <input type='submit' />
  		   </form>
      `)
  }
