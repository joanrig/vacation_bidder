
Travelers = Traveler.create([
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
    traveler_id: 3,
    vacation_id: 1,
    notes: "definitely see King Lear"
  },

  {
    title: "Ride Ragbrai",
    traveler_id: 2,
    notes: "bring sag wagon"
  },

  {
    title: "Nepal tour",
    traveler_id: 1,
    notes: "can't wait to try apple pie trail!"
  },

  {
    title: "Run Boston Marathon",
    traveler_id: 4,
    notes: "lots of training to do!"
  },

  {
    title: "Southwest tour",
    traveler_id: 1,
    notes: "bring bikes to zion!"
  },

  {
    title: "bike tour of Japan",
    traveler_id: 2,
    vacation_id: 2,
    notes: "eat sushi!!"
  },

  {
    title: "learn Spanish in Spain",
    traveler_id: 1,
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
    name: "Zion",
    website: "https://www.nationalparks.org/explore-parks/zion-national-park"
  },

  {
    name: "Crater Lake",
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
    category_id: 7
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
    name:"park"
  },

  {
    name:"bicycling"
  },

  {
    name:"hiking"
  },

  {
    name:"theater"
  },

  {
    name:"tour"
  },

  {
    name:"running"
  },

  {
    name:"classes"
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
