
Users = User.create([
  {
    name: "Joan",
    email: "joan@test.com",
    age: 35  ,
    organizer: true,
  },

  {
    name: "Eric",
    email: "eric@test.com",
    age: 52  ,
    organizer: true,
  },

  {
    name: "Cambria",
    email: "cam@test.com",
    age: 16  ,
    organizer: true,
  },

  {
    name: "Indy",
    email: "indy@test.com",
    age: 15  ,
    organizer: false,
  },

  {
    name: "Katy",
    email: "katy@test.com",
    age: 61  ,
    organizer: true,
  }
])


BucketListItems = BucketListItem.create([
  {
    title: "Harry Potter and Shakespeare tour",
    user_id: 3,
    vacation_id: 1,
    notes: "definitely see King Lear"
  },

  {
    title: "Ride Ragbrai",
    user_id: 2,
    notes: "bring sag wagon"
  },

  {
    title: "Nepal tour",
    user_id: 1,
    notes: "can't wait to try apple pie trail!"
  },

  {
    title: "Run Boston Marathon",
    user_id: 4,
    notes: "lots of training to do!"
  },

  {
    title: "Southwest tour",
    user_id: 1,
    notes: "bring bikes to zion!"
  },

  {
    title: "bike tour of Japan",
    user_id: 2,
    vacation_id: 2,
    notes: "eat sushi!!"
  },

  {
    title: "learn Spanish in Spain",
    user_id: 1,
    notes: "i love salamanca!"
  }
])

BucketAttractions = BucketAttraction.create([
  {
    bucket_list_item_id: 1,
    attraction_id: 5
  },

  {
    bucket_list_item_id: 1,
    attraction_id: 6
  },

  {
    bucket_list_item_id: 1,
    attraction_id: 11
  },

  {
    bucket_list_item_id: 3,
    attraction_id: 4
  },

  {
    bucket_list_item_id: 4,
    attraction_id: 7
  },

  {
    bucket_list_item_id: 4,
    attraction_id: 8
  },

  {
    bucket_list_item_id: 6,
    attraction_id: 9
  },

  {
    bucket_list_item_id: 6,
    attraction_id: 10
  },

  {
    bucket_list_item_id: 7,
    attraction_id: 12
  }
])

Attractions = Attraction.create([
  {
    name: "Zion National Park",
    website: "https://www.nationalparks.org/explore-parks/zion-national-park"
  },

  {
    name: "Crater Lake National Park",
    website: "https://www.nationalparks.org/explore-parks/crater-lake-national-park"
  },

  {
    name: "Ragbrai",
    website: "https://ragbrai.com/"
  },

  {
    name: "Annapurna Circuit",
    website: "https://en.wikipedia.org/wiki/Annapurna_Circuit"
  },

  {
    name: "Globe Theatre",
    website: "https://www.shakespearesglobe.com"
  },

  {
    name: "Shakespeare's birthplace",
    website: "https://www.shakespeare.org.uk/visit/shakespeares-birthplace/"
  },

  {
    name: "Boston marathon",
    website: "https://www.baa.org/"
  },

  {
    name: "Battle Road Trail",
    website: "https://www.nps.gov/mima/planyourvisit/placestogo.htm"
  },

  {
    name: "Tour de Noto",
    website: "https://www.okujapan.com/trips/noto-peninsula-self-guided-cycling-7-days-116"
  },

  {
    name: "Mt. Fuji",
    website: "https://www.japan-guide.com/e/e6901.html"
  },

  {
    name: "Warner Brothers Studio",
    website: "https://www.getyourguide.com/london-l57/warner-bros-studio-tour-london-including-transportation-t16403/?utm_force=0"
  },

  {
    name: "Tio Tula School",
    website: "https://www.tiatula.com/"
  }
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

Categories = Category.create([
  {
    name: "parks",
    image: "https://images.unsplash.com/photo-1504827910875-50c950d5d13f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2089&q=80"
  },

  {
    name:"bicycling",
    image: "https://images.unsplash.com/photo-1471506480208-91b3a4cc78be?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1653&q=80"
  },

  {
    name:"hiking",
    image: "https://www.planetware.com/photos-large/USCA/california-redwood-national-and-state-parks-boy-scout-tree-trail.jpg"
  },

  {
    name:"theater",
    image: "http://theatreprojects.com/files/projects/chicago-shakespeare-theater-navy-pier-01.jpg"
  },

  {
    name:"tour",
    image:"https://static1.squarespace.com/static/5558ab9fe4b02d567e71d61f/571fd1ca859fd093dd9eda99/571fd1d1cf80a163a4d4dc6c/1461703167640/DSC_4183.JPG?format=2500w"
  },

  {
    name:"running",
    image: "https://wpassets.trainingpeaks.com/wp-content/uploads/2018/04/02142228/04078-hal-higdon-top-10-running-tips-blog-700x394.jpg"
  },

  {
    name:"classes",
    image:"https://img.grouponcdn.com/deal/dTi8d7uFDafiTprJSS2m/K8-2048x1229/v1/c700x420.jpg"
  },

])



Vacations = Vacation.create([
  {
    name: "2019 England tour",
    category: "cultural",
    budget: 5000,
    number_of_users: 4,
  },

  {
    name: "2020 Japan tour",
    category: "outdoors",
    budget: 6000,
    number_of_users: 4,
  }
])
