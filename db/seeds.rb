
Travelers = Traveler.create([
  {
    name: "Joan",
    email: "joan@test.com",
    password: "password",
    age: 35  ,
    organizer: true,
  },

  {
    name: "Eric",
    email: "eric@test.com",
    password: "password",
    age: 52  ,
    organizer: true,
  },

  {
    name: "Cambria",
    email: "cam@test.com",
    password: "password",
    age: 16  ,
    organizer: true,
  },

  {
    name: "Indy",
    email: "indy@test.com",
    password: "password",
    age: 15  ,
    organizer: false,
  },

  {
    name: "Katy",
    email: "indy@test.com",
    password: "password",
    age: 61  ,
    organizer: true,
  }])


  Attractions = Attraction.create([
    {
      name: "Zion",
      type: "park",
      website: "https://www.nationalparks.org/explore-parks/zion-national-park",
    },

    {
      name: "Glacier",
      type: "park",
      website: "https://www.nationalparks.org/explore-parks/glacier-national-park",
    },

    {
      name: "Ragbrai",
      type: "event",
      website: "https://ragbrai.com/",
    },

    {
      name: "Annapurna Circuit",
      type: "hike",
      website: "https://en.wikipedia.org/wiki/Annapurna_Circuit",
    },

    {
      name: "Globe Theatre",
      type: "theater",
      website: "https://www.shakespearesglobe.com",
    }])



Bucket_list_items = Bucket_list_item.create([
  {
    title: "See Shakespeare at Globe Theatre",
    traveler_id: 3,
    attraction_id: 5,
    notes: "definitely see King Lear"
  },

  {
    title: "Ride Ragbrai",
    traveler_id: 2,
    attraction_id: 3,
    notes: "bring sag wagon"
  },

  {
    title: "Ride Ragbrai",
    traveler_id: 2,
    attraction_id: 3,
    notes: "bring sag wagon"
  }])



    organizer: true,
  }])
