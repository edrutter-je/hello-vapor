import Vapor

extension Droplet {
    func setupRoutes() throws {
        get("campaigntimes") { req in
            var json = JSON()
            
            try json.set("campaigns", [["name" : "valentines",
                                        "start": Date.with(year: 2018, month: 2, day: 14, hour: 0, minute: 0),
                                        "end": Date.with(year: 2018, month: 2, day: 15, hour: 0, minute: 0)],
                                       ["name" : "christmas",
                                        "start": Date.with(year: 2018, month: 12, day: 20, hour: 0, minute: 0),
                                        "end": Date.with(year: 2018, month: 12, day: 25, hour: 0, minute: 0)],
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
