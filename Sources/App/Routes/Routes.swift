import Vapor

import Foundation

extension Droplet {
    func setupRoutes() throws {
        get("campaigntimes") { req in
            var json = JSON()
            
//            let startOfDay = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date())
//
//            let breakfastStart = Calendar.current.date(bySettingHour: 4, minute: 30, second: 0, of: Date())
//            let breakfastEnd = Calendar.current.date(bySettingHour: 11, minute: 30, second: 0, of: Date())
//
//            let dinnertStart = Calendar.current.date(bySettingHour: 17, minute: 0, second: 0, of: Date())
//            let dinnerEnd = Calendar.current.date(bySettingHour: 11, minute: 00, second: 0, of: Date())
//
//            let valentinesDayStart = Date.with(year: 2018, month: 2, day: 14, hour: 0, minute: 0)
//            let valentinesDayEnd = Date.with(year: 2018, month: 2, day: 15, hour: 0, minute: 0)
            
            let christmasStart = Date.with(year: 2018, month: 12, day: 20, hour: 0, minute: 0)
            let christmasEnd = Date.with(year: 2018, month: 12, day: 25, hour: 0, minute: 0)
            
            let xfactorStart = Date.with(year: 2018, month: 9, day: 20, hour: 0, minute: 0)
            let xfactorEnd = Date.with(year: 2018, month: 12, day: 3, hour: 0, minute: 0)
            
            try json.set("campaigns", [["name" : "goat_oclock",
                                        "start": Date() + TimeInterval(5.0*60.0),
                                        "end": Date() + TimeInterval(6.0*60.0),
                                        "tagline": "🐐🐐🐐🐐🐐🐐🐐"],
//                                       ["name" : "midnight_feast",
//                                        "start": startOfDay,
//                                        "end": breakfastStart,
//                                        "tagline": "Had a few too many? Close one eye for faster ordering"],
//                                       ["name" : "breakfast",
//                                        "start": breakfastStart,
//                                        "end": breakfastEnd,
//                                        "tagline": "Wake up and smell the bacon"],
//                                       ["name" : "dinner",
//                                        "start": dinnertStart,
//                                        "end": dinnerEnd,
//                                        "tagline": "Avoid an argument over who's cooking, Just Eat"],
//                                       ["name" : "valentines_day",
//                                        "start": valentinesDayStart,
//                                        "end": valentinesDayEnd,
//                                        "tagline": "🍕+🌭 = 😍"],
                                       ["name" : "christmas",
                                        "start": christmasStart,
                                        "end": christmasEnd,
                                        "tagline": "Christmas dinner from KFC? 🎄"],
                                       ["name" : "xfactor",
                                        "start": xfactorStart,
                                        "end": xfactorEnd,
                                        "imageurl": "https://cdn.itv.com/uploads/show/show_branding_logo/64/7PcsLO1kx2-hCm4iLNaRW6ECPyj7El1iL8DE7K4z4w4.png"]])
            return json
        }
        
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }

        get("plaintext") { req in
            return "Hello, world!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
    }
}
