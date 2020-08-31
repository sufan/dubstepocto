//
//  TestRMData.swift
//  Potpourri
//
//  Created by sufan on 8/11/20.
//

let testSchedule = TVScheduleModel(id: 555, name: "Avatar: The Last Airbender", season: 5, number: 4, airdate: "2020-08-20", airtime: "14:30", airstamp: "2020-08-20T18:30:00+00:00", runtime: 30, show: testShow)
    
let testShow = TVShowModel(id: 555, name: "Avatar: The Last Airbender", type: "Animation", language: "English", genres: ["Action","Adventure","Fantasy"], status: "Ended", runtime: 30, premiered: "2005-02-21", officialSite: "https://www.nick.com/shows/avatar", schedule: testShowSchedule, rating: testRating, weight: 82, network: testNetwork, externals: testShowExternals, image: testShowImage, summary: "<p>Water. Earth. Fire. Air. Only the Avatar was the master of all four elements. Only he could stop the ruthless Fire Nation from conquering the world. But when the world needed him most, he disappeared. Until now... On the South Pole, a lone Water Tribe village struggles to survive. It's here that a young Waterbender named Katara and her warrior brother Sokka rescue a strange boy named Aang from a cavernous iceberg. Not only is Aang an Airbender--a race of people no one has seen in a century--but they soon discover that Aang is also the long lost Avatar. Now it's up to Katara and Sokka to make sure Aang faces his destiny to save the tribe--and himself. Did we mention he's only 12?</p>", updated: 1597812804)
    
let testShowSchedule = TVShowScheduleModel(time: "11:00", days: ["Saturday"])

let testRating = TVShowRatingModel(average: 8.9)

let testNetwork = TVNetworkModel(id: 27, name: "Nickelodeon", country: testCountry)

let testCountry = TVCountryModel(name: "United States", code: "US", timezone: "America/New_York")

let testShowExternals = TVShowExternalsModel(tvrage: 2680, thetvdb: 74852, imdb: "tt0417299")

let testShowImage = TVImageModel(medium: "http://static.tvmaze.com/uploads/images/medium_portrait/79/199224.jpg", original: "http://static.tvmaze.com/uploads/images/original_untouched/79/199224.jpg")


let testSchedules = [
    testSchedule,
    
    TVScheduleModel(id: 13615, name: "Boku no Hero Academia", season: 2020, number: 86, airdate: "2020-08-19", airtime: "09:00", airstamp: "2020-08-19T13:00:00+00:00", runtime: 30, show: TVShowModel(id: 13615, name: "Boku no Hero Academia", type: "Animation", language: "Japanese", genres: ["Comedy", "Action", "Adventure", "Anime"], status: "Running", runtime: nil, premiered: "2016-04-03", officialSite: nil, schedule: TVShowScheduleModel(time: "14:00", days: []), rating: TVShowRatingModel(average: nil), weight: 23, network:nil, externals: TVShowExternalsModel(tvrage: nil, thetvdb: nil, imdb: nil), image: TVImageModel(medium: "http://static.tvmaze.com/uploads/images/medium_portrait/65/164727.jpg", original: "http://static.tvmaze.com/uploads/images/original_untouched/65/164727.jpg"), summary: nil, updated: 1597516485)),
    
    TVScheduleModel(id: 1912549, name: "Ep. #14554", season: 2020, number: nil, airdate: "2020-08-20", airtime: "14:00", airstamp: "2020-08-20T18:00:00+00:00", runtime: 60, show: nil),
    
    TVScheduleModel(id: 1, name: "", season: 1, number: 1, airdate: "2020-08-19", airtime: "09:00", airstamp: "2020-08-19T13:00:00+00:00", runtime: 30, show: TVShowModel(id: 13615, name: "Phasellus vel viverra", type: "", language: "", genres: ["Comedy"], status: "Running", runtime: nil, premiered: "2016-04-03", officialSite: nil, schedule: TVShowScheduleModel(time: "14:00", days: []), rating: TVShowRatingModel(average: nil), weight: 23, network:nil, externals: TVShowExternalsModel(tvrage: nil, thetvdb: nil, imdb: nil), image: TVImageModel(medium: "http://static.tvmaze.com/uploads/images/medium_portrait/65/164727.jpg", original: "http://static.tvmaze.com/uploads/images/original_untouched/65/164727.jpg"), summary: nil, updated: 1597516485)),
    
    TVScheduleModel(id: 2, name: "", season: 2, number: 1, airdate: "2020-08-19", airtime: "09:00", airstamp: "2020-08-19T13:00:00+00:00", runtime: 30, show: TVShowModel(id: 13615, name: "Orci varius", type: "", language: "", genres: ["Action"], status: "", runtime: nil, premiered: "2016-04-03", officialSite: nil, schedule: TVShowScheduleModel(time: "14:00", days: []), rating: TVShowRatingModel(average: nil), weight: 23, network:nil, externals: TVShowExternalsModel(tvrage: nil, thetvdb: nil, imdb: nil), image: TVImageModel(medium: "http://static.tvmaze.com/uploads/images/medium_portrait/65/164727.jpg", original: "http://static.tvmaze.com/uploads/images/original_untouched/65/164727.jpg"), summary: nil, updated: 1597516485)),
    
    TVScheduleModel(id: 3, name: "", season: 3, number: 1, airdate: "2020-08-19", airtime: "09:00", airstamp: "2020-08-19T13:00:00+00:00", runtime: 30, show: TVShowModel(id: 13615, name: "Pellentesque volutpat velit orci", type: "", language: "", genres: ["Adventure"], status: "", runtime: nil, premiered: "2016-04-03", officialSite: nil, schedule: TVShowScheduleModel(time: "14:00", days: []), rating: TVShowRatingModel(average: nil), weight: 23, network:nil, externals: TVShowExternalsModel(tvrage: nil, thetvdb: nil, imdb: nil), image: TVImageModel(medium: "http://static.tvmaze.com/uploads/images/medium_portrait/65/164727.jpg", original: "http://static.tvmaze.com/uploads/images/original_untouched/65/164727.jpg"), summary: nil, updated: 1597516485)),

    TVScheduleModel(id: 4, name: "", season: 4, number: 1, airdate: "2020-08-19", airtime: "09:00", airstamp: "2020-08-19T13:00:00+00:00", runtime: 30, show: TVShowModel(id: 13615, name: "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet", type: "", language: "", genres: ["Anime"], status: "Running", runtime: nil, premiered: "2016-04-03", officialSite: nil, schedule: TVShowScheduleModel(time: "14:00", days: []), rating: TVShowRatingModel(average: nil), weight: 23, network:nil, externals: TVShowExternalsModel(tvrage: nil, thetvdb: nil, imdb: nil), image: TVImageModel(medium: "http://static.tvmaze.com/uploads/images/medium_portrait/65/164727.jpg", original: "http://static.tvmaze.com/uploads/images/original_untouched/65/164727.jpg"), summary: nil, updated: 1597516485)),

]

let unown = ["bandage",
             "cross.case",
             "bed.double",
             "pills",
             "cross",
             "waveform.path.ecg",
             "staroflife",
             "leaf",
             "hare",
             "tortoise",
]
