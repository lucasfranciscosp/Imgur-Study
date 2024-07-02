//
//  DateWorker.swift
//  Imgur-Study
//
//  Created by Clissia Bozzer Bovi on 02/07/24.
//

import Foundation

class DateWorker {
    
    static func getData(epochTime: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(epochTime))
        let formatter = getFormatter()
        let formattedDate = formatter.string(from: date)

        return isToday(formattedDate: formattedDate) ? "today" : "\(formattedDate)"
    }

    private static func isToday(formattedDate: String?) -> Bool {
        let formatter = getFormatter()
        let date = Date()
        let todaysDate = formatter.string(from: date)

        return (formattedDate == todaysDate) ? true : false
    }

    private static func getFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }
}
