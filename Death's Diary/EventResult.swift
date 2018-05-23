//
//  EventResult.swift
//  Death's Diary
//
//  Created by Greg Durrett on 5/22/18.
//  Copyright © 2018 AppHazard Productions. All rights reserved.
//

import Foundation

class EventResult {
    
    let eventDieResult: String
    let eventResultDescription: String
    
    init(eventDieResult: String, eventResultDescription: String) {
        self.eventDieResult = eventDieResult
        self.eventResultDescription = eventResultDescription
    }
}
