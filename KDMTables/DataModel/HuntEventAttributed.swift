//
//  HuntEventAttributed.swift
//  KDMTables
//
//  Created by Greg Durrett on 5/24/18.
//  Copyright © 2018 AppHazard Productions. All rights reserved.
//

import Foundation

class HuntEventAttributed {
    
    let eventNumber: String
    let eventText: NSMutableAttributedString
    let eventTitle: String
    let eventDie: String
    let eventDieRoller: String
    let eventResults: [EventResult]
    
    init(eventNumber: String, eventText: NSMutableAttributedString, eventTitle: String, eventDie: String, eventDieRoller: String, eventResults: [EventResult]) {
        self.eventNumber = eventNumber
        self.eventText = eventText
        self.eventTitle = eventTitle
        self.eventDie = eventDie
        self.eventDieRoller = eventDieRoller
        self.eventResults = eventResults
    }
}
