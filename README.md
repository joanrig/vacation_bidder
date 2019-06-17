# README


## Welcome to your Bucket List bidding system!

You can use this web app to create bucket lists and turn the items in them into real vacations.

Users start out by building bucket lists. Each item in the list has a name ("Bike across France", "Hike the Annapurna", etc) and optional notes ("be sure to see / bring x" etc).

On the bucket list index page, you can see all the items in your bucket and click on any one to turn it into a vacation. After the vacation is created you can edit it to add attractions (maybe go to language school in Tours while you're in France?) and schedule details, if you like.

Future versions of this app will implement bidding, which will allow users to toggle the status of their vacation from private to "open to bids". Even when a vacation is open to bids, user details will remain private; all that bidders will see will be the list of destinations, dates, and special instructions. Bidders will be able to search vacations for particular destinations, dates, or budget amounts.


I hope you can use this free app to make your bucket list dreams come true!


## Blog Posts

You can read more about the development of this web app in these blog posts:

1. Nested routes and nested forms
https://medium.com/@joanrigdon/rails-portfolio-project-vacation-bidder-part-1-db9cf4590141

2. Speed! JavaScript and Event Listeners
https://medium.com/@joanrigdon/breaking-the-speed-limit-with-javascript-event-listeners-23aaecadfa26



## Videos

1. Here is a 9-minute video walkthrough of how this program works:
https://medium.com/@joanrigdon/rails-portfolio-project-vacation-bidder-part-1-db9cf4590141

2. Here is a 4-minutes video walkthrough of the Javascript features I recently added to this project:
https://www.loom.com/share/9bbb474022e443ffa2d80158261dc196

## Project requirements

Rails App with JavaScript Frontend Spec
Project Specs:
[ X ] Must have a Rails Backend and new requirements implemented through JavaScript.

[ X ] Makes use of ES6 features as much as possible(e.g Arrow functions, Let & Const, Constructor Functions)

[ X ] Must translate the JSON responses into Javascript Model Objects using either ES6 class or constructor syntax.

[ X ] Must render at least one index page (index resource - 'list of things') via JavaScript and an Active Model Serialization JSON Backend. //vacations - list of attractions

[ debug ] Must render at least one show page (show resource - 'one specific thing') via JavaScript and an Active Model Serialization JSON Backend. //- Vacations - show notes

[ X ] Your Rails application must reveal at least one `has-many` relationship through JSON that is then rendered to the page. // vacation's attraction

[ X ] Must use your Rails application to render a form for creating a resource that is submitted dynamically through JavaScript. - //attractions new notes


[ X ] At least one of the JS Model Objects must have a method on the prototype. // display vacation notes - debugging




## Usage

To run this program,
1. clone this repo, then run 'bundle install'.
2. run rake db:create and then rake db:migrate to set up the database with no data.
3. (optional) If you would like to experiment with seed data, you run rake db:seed.

At any point, you can reset the database by running:
1. rake db:drop
2. rake db:create
3. rake db:migrate
4. (optional) rake db:seed

After the database is set up, run 'rails s' in terminal to start the rails server.

Then navigate to http://localhost:3000/ in your browser.

You can shut down the rails server at any time by typing Control+C in your terminal.



## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/space_missions. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The web app is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


## Code of Conduct

Everyone interacting in the SpaceMissions project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/space_missions/blob/master/CODE_OF_CONDUCT.md).
