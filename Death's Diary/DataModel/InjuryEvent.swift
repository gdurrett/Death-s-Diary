//
//  InjuryEvent.swift
//  Death's Diary
//
//  Created by Greg Durrett on 6/4/18.
//  Copyright © 2018 AppHazard Productions. All rights reserved.
//

import Foundation

class InjuryEvent {
    
    let eventNumber: String
    let eventText: NSMutableAttributedString
    let eventTitle: String
    let eventDie: String
    let eventResults: [EventResult]
    
    init(eventNumber: String, eventText: NSMutableAttributedString, eventTitle: String, eventDie: String, eventResults: [EventResult]) {
        self.eventNumber = eventNumber
        self.eventText = eventText
        self.eventTitle = eventTitle
        self.eventDie = eventDie
        self.eventResults = eventResults
    }
    
}
