$(document).ready(function() {
  listenFornewBucketListItemFormClick()
})


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
        this.vacation = obj.vacation
        allBucketListItems.push(this)
    }
  }



  static newBucketListItemForm() {
      return (`
        <%= form_for bucket_list_item do |f| %>
        <div class="field<%= ' field_with_errors' if bucket_list_item.errors[:name].any? %>">
          <div class="center" style="text-align:center">
          <%= f.label :name, "Name of bucket list item" %><br>
          <%= f.text_field :name %>
          </div>
        </div>

        <br>
        <br>
        <div class="field<%= ' field_with_errors' if bucket_list_item.errors[:notes].any? %>">
          <div class="center" style="text-align:center">
            <%= f.label :notes %><br>
            <div style="color:black">
              <%= f.text_area :notes %>
            </div>
          </div>
        </div>

        <br>
        <br>
        <%= f.hidden_field :user_id, :value => user.id %>
        <div style="color:black">
          <%= f.submit %>
        </div>
        <% end %>
      `)
  }
