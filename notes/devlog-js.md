

###INDEX

[ X ] make sure vacations displayed on index page are user's vacations, not all vacations

[ X ] my vacations button - should not show duplicates -- .distinct is not helping

[ X ] my vacations button - should not adds all vacations *each* time it is clicked.
      https://www.the-art-of-web.com/javascript/doublesubmit/
      used this: https://stackoverflow.com/questions/19053917/enable-the-button-to-be-clicked-only-to-once-exception

[ X] make sure each vacation lands in a div with its vacation-id
this was done in rails:
  <div id="product-<%= product.id %>"><%= truncate(product.description) %></div>
  <button class="js-more" data-id="<%= product.id %>">More Info</button>
  https://stackoverflow.com/questions/11480365/iterating-over-divs-with-same-id-and-adding-number

[  ] add link to this vacations' url

[  ] add hover event listener, so something interesting happens when you hover over vacations (ie shows all attractions)


###SHOW



###NEW ATTRACTIONS FORM?
