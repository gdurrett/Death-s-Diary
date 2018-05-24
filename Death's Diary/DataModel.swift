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
        
        let eventResult1a = EventResult(eventDieResult: "1 - 5", eventResultDescription: "You fumble and cut your foot on a jagged shard. Suffer monster level event damage to your legs.")
        let eventResult1b = EventResult(eventDieResult: "6 - 8", eventResultDescription: "You salvage something useful. Gain 1 broken lantern basic resource.")
        let eventResult1c = EventResult(eventDieResult: "9+", eventResultDescription: "The survivors uncover a long-abandoned lantern hoard. The forlorn sight fills them with dread: each survivor sets their insanity to 0. After composing themselves, each survivor scavenges 1 broken lantern basic resource; add them to settlement storage.")
        let huntEvent1 = HuntEvent(eventNumber: "0", eventText: "The survivors feel something crunching beneath their feet. The event revealer may choose to lower their lantern and investigate or ignore the sensation and continue their journey.\n\nIf they choose to investigate, the event revealer gains +1 courage and rolls 1d10. Otherwise, roll again on the hunt event table before moving on the hunt event board.", eventTitle: "1: Broken Lanterns", eventDie: "1d10", eventDieRoller: "Event revealer - investigate", eventResults: [eventResult1a, eventResult1b, eventResult1c])
        allHuntEvents.append(huntEvent1)
        
        let eventResult2a = EventResult(eventDieResult: "", eventResultDescription: "If the settlement has Cannibalize, the event revealer gains 1 random basic resource.")
        let eventResult2b = EventResult(eventDieResult: "", eventResultDescription: "If the settlement has Graves, the event revealer examines the corpse and gains +1 courage and +1 understanding.")
        let eventResult2c = EventResult(eventDieResult: "", eventResultDescription: "If the settlement has Memento Mori, the event revealer uderstands a little about what happened to the corpse. They gain 1 random fighting art.")
        let huntEvent2 = HuntEvent(eventNumber: "1", eventText: "The survivors are overcome by a sudden chill, their breath seizing in their lungs. The survivors' teeth chatter mercilessly. All survivors lose monster level survival. At the center of the sudden frost is a perfectly-preserved corpse.", eventTitle: "Corpse", eventDie: "N/A", eventDieRoller: "Event revealer", eventResults: [eventResult2a, eventResult2b, eventResult2c])
        allHuntEvents.append(huntEvent2)

        let eventResult3a = EventResult(eventDieResult: "1 - 3", eventResultDescription: "Running and flailing wildly, you suddenly find yourself panicked and alone. The waiting cancer pigeons descend and mercilessly peck your back, their happy cooing filling your head with horror. An hour later, the other survivors find you balled up and weeping on the ground. You are Dead Inside: you cannot gain survival. Record this impairment.")
        let eventResult3b = EventResult(eventDieResult: "4 - 6", eventResultDescription: "A cancer pigeon latched onto your back!, Shake it free by spending 1 survival. Otherwise, you are Dead Inside: you cannot gain survival. Record this impairment.")
        let eventResult3c = EventResult(eventDieResult: "7 - 8", eventResultDescription: "You escape the terrible creatures.")
        let eventResult3d = EventResult(eventDieResult: "9+", eventResultDescription: "You manage to strike one of the foul creatures down. Gain 1 random basic resource.")
        let huntEvent3 = HuntEvent(eventNumber: "2", eventText: "The survivors are surrounded by the echoing coo of infant babble. Strange baby-faced birds circle overhead. Gripped with instinctual horror, the survivors break into a run!\n\nEach survivor rolls 1d10. The lowest scoring survivor (or survivors, in case of ties) becomes a straggler. If any survivor has noisy gear, -2 to their roll. Each straggler rolls 1d10.\n\nIf any survivor has a whip, they crack it, scattering many of the birds. In this case, each straggler adds +4 to their roll.", eventTitle: "Cancer Pigeons", eventDie: "1d10", eventDieRoller: "Straggler", eventResults: [eventResult3a, eventResult3b, eventResult3c, eventResult3d])
        allHuntEvents.append(huntEvent3)
        
        let eventResult4a = EventResult(eventDieResult: "1 - 8", eventResultDescription: "The hunt takes its toll. Powerful hunger pangs set in. All survivors gain a -1 speed token.")
        let eventResult4b = EventResult(eventDieResult: "9 - 14", eventResultDescription: "You manage to stave off the terrible hunger.")
        let eventResult4c = EventResult(eventDieResult: "15+", eventResultDescription: "Everyone is invigorated by their snack. Each survivor gains +1 survival")
        let huntEvent4 = HuntEvent(eventNumber: "3", eventText: "The path ahead is arid and dead. You may have survivors gain +1 courage and press on. Otherwise, roll again on the hunt event table before moving on the hunt board. If you press on, your stomachs grumble in the dark as you stumble forward. The survivors pool their supplies.\n\nThe event revealer rolls 1d10 and adds +2 to their roll for each consumable gear or resource the group has.", eventTitle: "Famine", eventDie: "1d10", eventDieRoller: "Event revealer", eventResults: [eventResult4a, eventResult4b, eventResult4c])
        allHuntEvents.append(huntEvent4)
    }
}
