//
//  HuntEvent.swift
//  KDMTables
//
//  Created by Greg Durrett on 5/9/18.
//  Copyright © 2018 AppHazard Productions. All rights reserved.
//

import Foundation

class HuntEvent {
    
    let eventNumber: String
    let eventText: NSMutableAttributedString
    let eventTitle: String
    let eventDie: String
    let eventDieRoller1: String
    let eventDieRoller2: String
    let eventResults1: [EventResult]
    let eventResults2: [EventResult]
    let numEventTables: Int
    
    init(eventNumber: String, eventText: NSMutableAttributedString, eventTitle: String, eventDie: String, eventDieRoller1: String, eventDieRoller2: String = "", eventResults1: [EventResult], eventResults2: [EventResult] = [], numEventTables: Int = 1) {
        self.eventNumber = eventNumber
        self.eventText = eventText
        self.eventTitle = eventTitle
        self.eventDie = eventDie
        self.eventDieRoller1 = eventDieRoller1
        self.eventDieRoller2 = eventDieRoller2
        self.eventResults1 = eventResults1
        self.eventResults2 = eventResults2
        self.numEventTables = numEventTables
    }
    
}
