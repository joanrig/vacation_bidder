Users = User.create([
  {
    first_name: "Joan",
    last_name: "Gonzales",
    email: "joan@test.com",
    role: "traveler",
    password: "password"
  },

  {
    first_name: "Eric",
    last_name: "Jones",
    email: "eric@test.com",
    role: "traveler",
    password: "password"
  },

  {
    first_name: "Cambria",
    last_name: "Lee",
    email: "cam@test.com",
    role: "traveler",
    password: "password"
  },

  {
    first_name: "Indy",
    last_name: "Ward",
    email: "indy@test.com",
    role: "traveler",
    password: "password"
  },

  {
    first_name: "Katy",
    last_name: "June",
    email: "katy@test.com",
    role: "bidder",
    password: "password"
  }
])


BucketListItems = BucketListItem.create([
  {
    name: "Harry Potter and Shakespeare tour",
    user_id: 3,
    vacation_id: 1,
    notes: "definitely see King Lear"
  },

  {
    name: "Ride Ragbrai",
    user_id: 2,
    notes: "bring sag wagon"
  },

  {
    name: "Nepal tour",
    user_id: 1,
    notes: "can't wait to try apple pie trail!"
  },

  {
    name: "Run Boston Marathon",
    user_id: 4,
    notes: "lots of training to do!"
  },

  {
    name: "Southwest tour",
    user_id: 1,
    notes: "bring bikes to zion!"
  },

  {
    name: "bike tour of Japan",
    user_id: 2,
    vacation_id: 2,
    notes: "eat sushi!!"
  },

  {
    name: "learn Spanish in Spain",
    user_id: 1,
    notes: "i love salamanca!"
  }
])

Attractions = Attraction.create([
  {
    name: "Zion National Park",
    website: "https://www.nationalparks.org/explore-parks/zion-national-park",
    notes: "must do the Narrows",
    city: "Springdale",
    state: "Utah",
    country: "U.S."
  },

  {
    name: "Crater Lake National Park",
    website: "https://www.nationalparks.org/explore-parks/crater-lake-national-park",
    notes: "Wizard Island is the best",
    county: "Klamath",
    state: "Oregon",
    country: "U.S."
  },

  {
    name: "Ragbrai",
    website: "https://ragbrai.com/",
    notes: "bring your own sag wagon",
    state: "Iowa",
    country: "U.S."

  },

  {
    name: "Annapurna Circuit",
    website: "https://en.wikipedia.org/wiki/Annapurna_Circuit",
    notes: "aim for October",
    country: "Nepal"
  },

  {
    name: "Globe Theatre",
    website: "https://www.shakespearesglobe.com",
    notes: "cheap tickets available through so-and-so",
    city: "London",
    country: "U.K."
  },

  {
    name: "Shakespeare's birthplace",
    website: "https://www.shakespeare.org.uk/visit/shakespeares-birthplace/",
    notes: "could be cool!",
    city: "Stratford-upon-Avon",
    country: "UK"
  },

  {
    name: "Boston marathon",
    website: "https://www.baa.org/",
    notes: "need to complete qualifying run",
    city: "Boston",
    state: "Massachusetts",
    country: "US"
  },

  {
    name: "Battle Road Trail",
    website: "https://www.nps.gov/mima/planyourvisit/placestogo.htm",
    notes: "history and cycling!",
    county: "Middlesex",
    state: "Massachusetts"
  },

  {
    name: "Tour de Noto",
    website: "https://www.okujapan.com/trips/noto-peninsula-self-guided-cycling-7-days-116",
    notes: "awesome riding",
    country: "Japan"
  },

  {
    name: "Mt. Fuji",
    website: "https://www.japan-guide.com/e/e6901.html",
    country: "Japan"
  },

  {
    name: "Warner Brothers Studio - Harry Potter set",
    website: "https://www.getyourguide.com/london-l57/warner-bros-studio-tour-london-including-transportation-t16403/?utm_force=0",
    notes: "this is a seven-hour tour?",
    city: "London",
    country: "England"
  },

  {
    name: "Tio Tula School",
    website: "https://www.tiatula.com/",
    notes: "classes start on a rolling basis",
    city: "Salamanca",
    country: "Spain"
  }
])

VacationAttractions = VacationAttraction.create([
  {
    vacation_id: 1,
    attraction_id: 5
  },

  {
    vacation_id: 1,
    attraction_id: 6
  },

  {
    vacation_id: 1,
    attraction_id: 11
  },

  {
    vacation_id: 3,
    attraction_id: 4
  },

  {
    vacation_id: 4,
    attraction_id: 7
  },

  {
    vacation_id: 4,
    attraction_id: 8
  },

  {
    vacation_id: 6,
    attraction_id: 9
  },

  {
    vacation_id: 6,
    attraction_id: 10
  },

  {
    vacation_id: 7,
    attraction_id: 12
  }
])

Categories = Category.create([
  {
    name: "parks",
    image: "https://images.unsplash.com/photo-1504827910875-50c950d5d13f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2089&q=80",
    panel_a_rgb:()

  },

  {
    name:"bicycling",
    image: "https://images.unsplash.com/photo-1471506480208-91b3a4cc78be?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1653&q=80",
    panel_a_rgb: "(165, 147, 116, 0.3)"
  },

  {
    name:"hiking",
    image: "https://images.unsplash.com/photo-1547772863-4a1073b3f93c",
    panel_a_rgb: "(98, 60, 42, 0.3)"
  },

  {
    name:"theater",
    image: "http://theatreprojects.com/files/projects/chicago-shakespeare-theater-navy-pier-01.jpg",
    panel_a_rgb: "(0, 0, 0, 0.8)"
  },

  {
    name:"tour",
    image:"https://static1.squarespace.com/static/5558ab9fe4b02d567e71d61f/571fd1ca859fd093dd9eda99/571fd1d1cf80a163a4d4dc6c/1461703167640/DSC_4183.JPG?format=2500w",
    panel_a_rgb: "(4, 35, 102, 0.3)"
  },

  {
    name:"running",
    image: "https://wpassets.trainingpeaks.com/wp-content/uploads/2018/04/02142228/04078-hal-higdon-top-10-running-tips-blog-700x394.jpg",
    panel_a_rgb: "(3, 24, 60, 0.2)"
  },

  {
    name:"classes",
    image:"https://img.grouponcdn.com/deal/dTi8d7uFDafiTprJSS2m/K8-2048x1229/v1/c700x420.jpg",
    panel_a_rgb: "(107, 94, 86, 0.2)"
  },

])

AttractionCategories = AttractionCategory.create([
  {
    attraction_id: 1,
    category_id: 1
  },

  {
    attraction_id: 2,
    category_id: 1
  },

  {
    attraction_id: 3,
    category_id: 2
  },

  {
    attraction_id: 4,
    category_id: 3
  },

  {
    attraction_id: 5,
    category_id: 4
  },

  {
    attraction_id: 6,
    category_id: 5
  },

  {
    attraction_id: 7,
    category_id: 6
  },

  {
    attraction_id: 9,
    category_id: 2
  },

  {
    attraction_id: 10,
    category_id: 3
  },

  {
    attraction_id: 11,
    category_id: 5
  },

  {
    attraction_id: 12,
    category_id: 7
  },
])


Vacations = Vacation.create([
  {
    name: "2019 England tour",
    category: "cultural",
    budget: 5000,
    number_of_travelers: 4,
  },

  {
    name: "2020 Japan tour",
    category: "outdoors",
    budget: 6000,
    number_of_travelers: 4,
  }
])
