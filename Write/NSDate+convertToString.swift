//
//  NSDate+convertToString.swift
//  Write
//
//  Created by Zulwiyoza Putra on 10/15/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import Foundation
import RealmSwift

extension NSDate {
    func convertToString() -> String {
        return DateFormatter.localizedString(from: self as Date, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}
