//
//  Tables.swift
//  KDMTables
//
//  Created by Greg Durrett on 5/8/18.
//  Copyright © 2018 AppHazard Productions. All rights reserved.
//

import Foundation
import UIKit

enum tableType {
    case hunt, brain, injury
}

class Table {
    let name: String
    let description: String
    let type: tableType
    
    init(name: String, description: String, type: tableType) {
        self.name = name
        self.description = description
        self.type = type
    }

}
