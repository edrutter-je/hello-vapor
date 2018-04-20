import Vapor

import Foundation

extension Droplet {
    func setupRoutes() throws {
        get("campaigntimes") { req in
            var json = JSON()
            
            try json.set("campaigns", [["name" : "goat_oclock",
                                        "start": Date() + TimeInterval(5.0*60.0),
                                        "end": Date() + TimeInterval(6.0*60.0),
                                        "tagline": "🐐🐐🐐🐐🐐🐐🐐"],
                                       ["name" : "midnight_feast",
                                        "start": Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date()),
                                        "end": Calendar.current.date(bySettingHour: 4, minute: 00, second: 0, of: Date()),
                                        "tagline": "Had a few too many? Close one eye for faster ordering"],
                                       ["name" : "breakfast",
                                        "start": Calendar.current.date(bySettingHour: 4, minute: 0, second: 0, of: Date()),
                                        "end": Calendar.current.date(bySettingHour: 11, minute: 30, second: 0, of: Date()),
                                        "tagline": "Wake up and smell the bacon"],
                                       ["name" : "dinner",
                                        "start": Calendar.current.date(bySettingHour: 17, minute: 0, second: 0, of: Date()),
                                        "end": Calendar.current.date(bySettingHour: 11, minute: 00, second: 0, of: Date()),
                                        "tagline": "Avoid an argument over who's cooking, Just Eat"],
                                       ["name" : "valentines_day",
                                        "start": Date.with(year: 2018, month: 2, day: 14, hour: 0, minute: 0),
                                        "end": Date.with(year: 2018, month: 2, day: 15, hour: 0, minute: 0),
                                        "tagline": "🍕+🌭 = 😍"],
                                       ["name" : "christmas",
                                        "start": Date.with(year: 2018, month: 12, day: 20, hour: 0, minute: 0),
                                        "end": Date.with(year: 2018, month: 12, day: 25, hour: 0, minute: 0),
                                        "tagline": "Christmas dinner from KFC? 🎄"],
                                       ["name" : "xfactor",
                                        "start": Date.with(year: 2018, month: 9, day: 20, hour: 0, minute: 0),
                                        "end": Date.with(year: 2018, month: 12, day: 3, hour: 0, minute: 0),
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
