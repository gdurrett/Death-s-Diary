//
//  tables.swift
//  Death's Diary
//
//  Created by Greg Durrett on 5/8/18.
//  Copyright © 2018 AppHazard Productions. All rights reserved.
//

import Foundation
import UIKit

enum Weapon {
    case blowgun, ninjaStar, fire, sword, smoke
}

class Table {
    let name: String
    let description: String
    
    init(name: String, description: String, iconName: String, weapon: Weapon) {
        self.name = name
        self.description = description
    }
    
//    var weaponImage: UIImage {
//        switch weapon {
//        case .blowgun:
//            return UIImage(named: "blowgun.png")!
//        case .fire:
//            return UIImage(named: "fire.png")!
//        case .ninjaStar:
//            return UIImage(named: "ninjastar.png")!
//        case .smoke:
//            return UIImage(named: "smoke.png")!
//        case .sword:
//            return UIImage(named: "sword.png")!
//        }
//    }

}
