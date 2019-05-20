as of friday 822am

<%= render '/vacations/layout' %>

<div class="center" style="text-align:center">
  <div class="container">
    <div class="panel-a">
      <div class="panel-body">
        <div class="form" style="color:midnightblue">
          <p>Now editing:</p>
          <h2><%= @vacation.name %></h2>

        <p>
          <%= form_for @vacation, :html => {:class => "black_text"}  do |f| %>
            <%= f.label :name%><br>
            <%= f.text_field :name %><br><br>
            <%= f.label :budget%><br>
            <%= f.text_field :budget %><br><br>
            <%= f.label :number_of_travelers %><br>
            <%= f.text_field :number_of_travelers %><br><br><br>

            <% if @attractions %>
            <p>Attractions already assigned to this vacation:</p>
              <%= f.collection_check_boxes :attraction_ids, @attractions.uniq, :id, :name do |b| %>
                <div class="collection-check-box">
                  <%= b.check_box %>
                  <%= b.label %>
                </div>
              <% end %>
            <% else %>
              <h4>This vacation doesn't have any attractions yet. Let's add some.</h4>
            <% end %><br><br>

            <p>Add more Attractions</p>
            <%= f.label :attraction_id %><br>
            <%= f.fields_for @bucket_attraction do |ba| %>
              <%= f.collection_select :attraction_ids, @attractions.uniq.sort_by(&:name), :id, :name %><br>

              <%# <%= link_to "Update Attractions", new_vacation_vacation_attraction_path(@vacation) %><br> %>

            <% end %>
            <%= f.submit %><br><br>
          <% end %>
        </p>
