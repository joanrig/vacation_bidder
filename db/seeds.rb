
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
    notes: "eat sushi!!"
  },

  {
    title: "learn Spaanish in Spain",
    traveler_id: 1,
    notes: "i love salamanca!"
  }
])

Attractions = Attraction.create([
  {
    name: "Zion",
    category: "park",
    website: "https://www.nationalparks.org/explore-parks/zion-national-park"
  },

  {
    name: "Crater Lake",
    category: "park",
    website: "https://www.nationalparks.org/explore-parks/crater-lake-national-park"
  },

  {
    name: "Ragbrai",
    category: "event",
    website: "https://ragbrai.com/"
  },

  {
    name: "Annapurna Circuit",
    category: "hike",
    website: "https://en.wikipedia.org/wiki/Annapurna_Circuit"
  },

  {
    name: "Globe Theatre",
    category: "theater",
    website: "https://www.shakespearesglobe.com"
  },

  {
    name: "Shakespeare's birthplace",
    category: "tour",
    website: "https://www.shakespeare.org.uk/visit/shakespeares-birthplace/"
  },

  {
    name: "Boston marathon",
    category: "event",
    website: "https://www.baa.org/"
  },

  {
    name: "Battle Road Trail",
    category: "trail",
    website: "https://www.nps.gov/mima/planyourvisit/placestogo.htm"
  },

  {
    name: "Tour de Noto",
    category: "bike route",
    website: "https://www.okujapan.com/trips/noto-peninsula-self-guided-cycling-7-days-116"
  },

  {
    name: "Mt. Fuji",
    category: "hike",
    website: "https://www.japan-guide.com/e/e6901.html"
  },

  {
    name: "Warner Brothers Studio",
    category: "tour",
    website: "https://www.getyourguide.com/london-l57/warner-bros-studio-tour-london-including-transportation-t16403/?utm_force=0"
  },

  {
    name: "Tio Tula School",
    category: "school",
    website: "https://www.tiatula.com/"
  }
])

Vacations = Vacation.create([
  {
    name: "2019 England tour",
    category: "cultural",
    budget: 5000,
    number_of_travelers: 4,
    bucket_list_id: 1
  },

  {
    name: "2020 Japan tour",
    category: "outdoors",
    budget: 5000,
    number_of_travelers: 4,
    bucket_list_id: 6
  }
])
