//
//  DataModel.swift
//  Death's Diary
//
//  Created by Greg Durrett on 5/9/18.
//  Copyright © 2018 AppHazard Productions. All rights reserved.
//

import Foundation

class DataModel {
    
    static var sharedInstance = DataModel()
    
    var allHuntEvents = [HuntEvent]()
    var allEventResults = [EventResult]()
    
    private init() {
        
        let eventResults1a = EventResult(eventDieResult: "1-5", eventResultDescription: "You fumble and cut your foot on a jagged shard. Suffer monster level event damage to your legs.")
        let eventResults1b = EventResult(eventDieResult: "6-8", eventResultDescription: "You salvage something useful. Gain 1 broken lantern basic resource.")
        let eventResults1c = EventResult(eventDieResult: "9+", eventResultDescription: "The survivors uncover a long-abandoned lantern hoard. The forlorn sight fills them with dread: each survivor sets their insanity to 0. After composing themselves, each survivor scavenges 1 broken lantern basic resource; add them to settlement storage.")
        let huntEvent1 = HuntEvent(eventNumber: "0", eventText: "The survivors feel something crunching beneath their feet. The event revealer may choose to lower their lantern and investigate or ignore the sensation and continue their journey. If they choose to investigate, the event revealer gains +1 courage and rolls 1d10. Otherwise, roll again on the hunt event table before moving on the hunt event board.", eventTitle: "1: Broken Lanterns", eventDie: "1d10", eventDieRoller: "Event revealer - investigate", eventResults: [eventResults1a, eventResults1b, eventResults1c])
        allHuntEvents.append(huntEvent1)

    }
}
