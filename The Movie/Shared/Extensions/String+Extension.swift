//
//  String+Extension.swift
//  The Movie
//
//  Created by Marcelo Silva Honorio on 16/09/20.
//  Copyright © 2020 Mhonorio92. All rights reserved.
//

import Foundation

extension String {
    func dateFormatter(oldFormat: String = "yyyy-MM-dd", newFormat: String = "yyyy") -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = oldFormat
        if let date = formatter.date(from: self) {
            formatter.dateFormat = newFormat
            return formatter.string(from: date)
        }
        return self
    }
}
