//
//  Note.swift
//  Write
//
//  Created by Zulwiyoza Putra on 10/15/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
    var title = ""
    var content = ""
    var modificationTime = NSDate()
}
