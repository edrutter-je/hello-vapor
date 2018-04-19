//  Created by Ed Rutter on 19/04/2018.

import Foundation

extension Date {
    static func with(year: Int?, month: Int?, day: Int?, hour: Int?, minute: Int?) -> Date? {
        let components = DateComponents(year: year,
                                        month: month,
                                        day: day,
                                        hour: hour,
                                        minute: minute)

        return Calendar.current.date(from: components)
    }
}


