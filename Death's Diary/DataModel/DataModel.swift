//
//  DataModel.swift
//  Death's Diary
//
//  Created by Greg Durrett on 5/9/18.
//  Copyright © 2018 AppHazard Productions. All rights reserved.
//

import Foundation
import UIKit

class DataModel {
    
    static var sharedInstance = DataModel()
    
    var allHuntEvents = [HuntEvent]()
    var allEventResults = [EventResult]()
    
    private init() {
        
        let eventResult1a = EventResult(eventDieResult: "1 - 5", eventResultDescription: NSMutableAttributedString().appendWith("You fumble and cut your foot on a jagged shard. Suffer monster level event damage to your legs."))
        let eventResult1b = EventResult(eventDieResult: "6 - 8", eventResultDescription: NSMutableAttributedString().appendWith("You salvage something useful. Gain 1 ").appendWith(weight: .bold, "broken lantern").appendWith(" basic resource."))
        let eventResult1c = EventResult(eventDieResult: "9+", eventResultDescription: NSMutableAttributedString().appendWith("The survivors uncover a long-abandoned lantern hoard. The forlorn sight fills them with dread: each survivor sets their insanity to 0. After composing themselves, each survivor scavenges 1").appendWith(weight: .bold, " broken lantern").appendWith(" basic resource; add them to settlement storage."))
        let huntEvent1 = HuntEvent(eventNumber: "0", eventText: "The survivors feel something crunching beneath their feet. The event revealer may choose to lower their lantern and investigate or ignore the sensation and continue their journey.\n\nIf they choose to investigate, the event revealer gains +1 courage and rolls 1d10. Otherwise, roll again on the hunt event table before moving on the hunt event board.", eventTitle: "1 | Broken Lanterns", eventDie: "1d10", eventDieRoller: "Event revealer - investigate", eventResults: [eventResult1a, eventResult1b, eventResult1c])
        allHuntEvents.append(huntEvent1)

        let eventResult2a = EventResult(eventDieResult: "", eventResultDescription: NSMutableAttributedString().appendWith("If the settlement has ").appendWith(weight: .bold, "Cannibalize").appendWith(", the event revealer gains 1 random basic resource."))
        let eventResult2b = EventResult(eventDieResult: "", eventResultDescription: NSMutableAttributedString().appendWith("If the settlement has ").appendWith(weight: .bold, "Graves").appendWith(", the event revealer examines the corpse and gains +1 courage and +1 understanding."))
        let eventResult2c = EventResult(eventDieResult: "", eventResultDescription: NSMutableAttributedString().appendWith("If the settlement has ").appendWith(weight: .bold, "Memento Mori").appendWith(", the event revealer uderstands a little about what happened to the corpse. They gain 1 random fighting art."))
        let huntEvent2 = HuntEvent(eventNumber: "1", eventText: "The survivors are overcome by a sudden chill, their breath seizing in their lungs. The survivors' teeth chatter mercilessly. All survivors lose monster level survival. At the center of the sudden frost is a perfectly-preserved corpse.", eventTitle: "2 | Corpse", eventDie: "N/A", eventDieRoller: "Event revealer", eventResults: [eventResult2a, eventResult2b, eventResult2c])
        allHuntEvents.append(huntEvent2)

        let eventResult3a = EventResult(eventDieResult: "1 - 3", eventResultDescription: NSMutableAttributedString().appendWith("Running and flailing wildly, you suddenly find yourself panicked and alone. The waiting cancer pigeons descend and mercilessly peck your back, their happy cooing filling your head with horror. An hour later, the other survivors find you balled up and weeping on the ground. You are ").appendWith(weight: .bold, "Dead Inside").appendWith(": you cannot gain survival. Record this impairment."))
        let eventResult3b = EventResult(eventDieResult: "4 - 6", eventResultDescription: NSMutableAttributedString().appendWith("A cancer pigeon latched onto your back!, Shake it free by spending 1 survival. Otherwise, you are ").appendWith(weight: .bold, "Dead Inside").appendWith(": you cannot gain survival. Record this impairment."))
        let eventResult3c = EventResult(eventDieResult: "7 - 8", eventResultDescription: NSMutableAttributedString().appendWith("You escape the terrible creatures."))
        let eventResult3d = EventResult(eventDieResult: "9+", eventResultDescription: NSMutableAttributedString().appendWith("You manage to strike one of the foul creatures down. Gain 1 random basic resource."))
        let huntEvent3 = HuntEvent(eventNumber: "2", eventText: "The survivors are surrounded by the echoing coo of infant babble. Strange baby-faced birds circle overhead. Gripped with instinctual horror, the survivors break into a run!\n\nEach survivor rolls 1d10. The lowest scoring survivor (or survivors, in case of ties) becomes a straggler. If any survivor has noisy gear, -2 to their roll. Each straggler rolls 1d10.\n\nIf any survivor has a whip, they crack it, scattering many of the birds. In this case, each straggler adds +4 to their roll.", eventTitle: "3 | Cancer Pigeons", eventDie: "1d10", eventDieRoller: "Straggler", eventResults: [eventResult3a, eventResult3b, eventResult3c, eventResult3d])
        allHuntEvents.append(huntEvent3)
        
        let eventResult4a = EventResult(eventDieResult: "1 - 8", eventResultDescription: NSMutableAttributedString().appendWith("The hunt takes its toll. Powerful hunger pangs set in. All survivors gain a -1 speed token."))
        let eventResult4b = EventResult(eventDieResult: "9 - 14", eventResultDescription: NSMutableAttributedString().appendWith("You manage to stave off the terrible hunger."))
        let eventResult4c = EventResult(eventDieResult: "15+", eventResultDescription: NSMutableAttributedString().appendWith("Everyone is invigorated by their snack. Each survivor gains +1 survival."))
        let huntEvent4 = HuntEvent(eventNumber: "3", eventText: "The path ahead is arid and dead. You may have survivors gain +1 courage and press on. Otherwise, roll again on the hunt event table before moving on the hunt board.\n\nIf you press on, your stomachs grumble in the dark as you stumble forward. The survivors pool their supplies. The event revealer rolls 1d10 and adds +2 to their roll for each consumable gear or resource the group has.", eventTitle: "4 | Famine", eventDie: "1d10", eventDieRoller: "Event revealer", eventResults: [eventResult4a, eventResult4b, eventResult4c])
        allHuntEvents.append(huntEvent4)
        
        let eventResult5a = EventResult(eventDieResult: "1", eventResultDescription: NSMutableAttributedString().appendWith("The event revealer contracts a flesh-eating disease while brushing past the giant boils! A random limb is affected and must be amputated immediately. Roll 1d10, 1-5: arms, 6-10: legs. Suffer the ").appendWith(weight: .bold, "dismembered").appendWith(" severe injury at this location."))
        let eventResult5b = EventResult(eventDieResult: "2 - 3", eventResultDescription: NSMutableAttributedString().appendWith("If any survivor is ").appendWith(weight: .bold, "insane").appendWith(", they imagine the flesh fields are attacking! They become hysterical, flailing and tangling themselves in the thick hair. Each ").appendWith(weight: .bold, "insane").appendWith(" survivor suffers monster level event damage to a random location."))
        let eventResult5c = EventResult(eventDieResult: "4 - 7", eventResultDescription: NSMutableAttributedString().appendWith("It's hot and gross, but the survivors pass through the flesh fields with no complications."))
        let eventResult5d = EventResult(eventDieResult: "8 - 9", eventResultDescription: NSMutableAttributedString().appendWith("The event revealer makes the best of a bad situation and cuts a portion of the flesh free. Gain 1 ").appendWith(weight: .bold, "hide").appendWith(" basic resource."))
        let eventResult5e = EventResult(eventDieResult: "10+", eventResultDescription: NSMutableAttributedString().appendWith("Each survivor harvests 1 ").appendWith(weight: .bold, "hide").appendWith(" basic resource from the flesh fields."))
        let huntEvent5 = HuntEvent(eventNumber: "4", eventText: "Ahead, the stone faces on the ground give way to a field of man-sized, fleshy boils sprouting thick black hair. The sinuous terrain radiates moist heat. As they travel, every survivor suffers heat exhaustion, losing 1 survival.\n\nThe event revealer rolls 1d10. If any survivor has a sickle, they help clear a path by cutting back the hair. Add +4 to the die roll.", eventTitle: "5 | Flesh Fields", eventDie: "1d10", eventDieRoller: "Event revealer", eventResults: [eventResult5a, eventResult5b, eventResult5c, eventResult5d, eventResult5e])
        allHuntEvents.append(huntEvent5)
        
        let huntEvent6 = HuntEvent(eventNumber: "5", eventText: "The survivors come upon a faceless statue holding a shining lantern. Basking in the warm light, the survivors are renewed. Each survivor gains 1 survival.\n\nIf the settlement has Sculpture, the survivors deeply appreciate the artist's subtle craftsmanship. Each survivor rolls 1d10. Gain that many survival and +1 understanding.\n\nThe survivors may rest here longer. If they do, each survivor heals all injury levels and lost armor points on 1 hit location. However, they lose track of their quarry. Move the quarry 1 space away from the survivors on the hunt board. If a survivor heals more than 5 lost armor points this way, they stare into the shining light for too long and gain 1 random disorder.\n\nIf all survivors are insane, they cannot rest longer.", eventTitle: "6 | Faceless Statue", eventDie: "N/A", eventDieRoller: "N/A", eventResults: [])
        allHuntEvents.append(huntEvent6)
        
        let eventResult7a = EventResult(eventDieResult: "1", eventResultDescription: NSMutableAttributedString().appendWith("With a muffled scream, you disappear into the ground. You manage to grab hold of a precarious ledge above the gaping maw. Lose all survival as you desperately climb up to safety. If you had none, you fall. Bones crunch between stone teeth. You are devoured whole. Dead."))
        let eventResult7b = EventResult(eventDieResult: "2 - 5", eventResultDescription: NSMutableAttributedString().appendWith("You scramble, but your leg is caught in the terrible maw. Suffer 2 event damage to the legs."))
        let eventResult7c = EventResult(eventDieResult: "6 - 9", eventResultDescription: NSMutableAttributedString().appendWith("You manage to leap away in time!"))
        let eventResult7d = EventResult(eventDieResult: "10+", eventResultDescription: NSMutableAttributedString().appendWith("Burp! Gurgle! The floor vomits a shiny piece of scrap. Gain 1 ").appendWith(weight: .bold, "broken lantern").appendWith(" basic resource."))
        let huntEvent7 = HuntEvent(eventNumber: "6", eventText: "The ground suddenly splits and a gaping stone mouth attempts to devour the event revealer whole! The event revealer rolls 1d10.\n\nIf another survivor has a whip, they throw a line to the event revealer. Add +4 to your roll.", eventTitle: "7 | Hungry Ground", eventDie: "1d10", eventDieRoller: "Event revealer", eventResults: [eventResult7a, eventResult7b, eventResult7c, eventResult7d])
        allHuntEvents.append(huntEvent7)
        
        let eventResult8a = EventResult(eventDieResult: "1 - 3", eventResultDescription: NSMutableAttributedString().appendWith("The fog around you turns black and fills with shapes of tormented faces. You are driven to madness. Gain 1 random disorder."))
        let eventResult8b = EventResult(eventDieResult: "4 - 6", eventResultDescription: NSMutableAttributedString().appendWith("The fog grows soupy and begins to wail. You plug your ears with your fingers, but it's hopeless. Suffer monster level brain event damage."))
        let eventResult8c = EventResult(eventDieResult: "7 - 9", eventResultDescription: NSMutableAttributedString().appendWith("You stick your thumbs into your ears and break into a run, leaving the wailing smoke."))
        let eventResult8d = EventResult(eventDieResult: "10+", eventResultDescription: NSMutableAttributedString().appendWith("Mimicking the disturbing smoke, you calmly start to wail with it. Gain +2 insanity."))
        let huntEvent8 = HuntEvent(eventNumber: "7", eventText: "A constant moan follows the survivors. Eventually, they enter an area shrouded in thick fog and the wailing reaches a fevered pitch.\n\nEvery non-deaf survivor rolls 1d10. If all survivors are deaf, they continue along, heedless to the cacophony: end this event. The lowest scoring survivor (or survivors, in case of ties) becomes a straggler. Each straggler rolls 1d10. If any survivor has noisy gear, the straggler adds +2 to their roll.\n\nIf any survivor has noisy gear, and the settlement has Drums, they counter the wails with a tune from home. Do not roll on the table and each survivor gains +2 insanity and +2 survival.", eventTitle: "8 | Wailing Smoke", eventDie: "1d10", eventDieRoller: "Straggler", eventResults: [eventResult8a, eventResult8b, eventResult8c, eventResult8d])
        allHuntEvents.append(huntEvent8)
        
        let eventResult9a = EventResult(eventDieResult: "1 - 3", eventResultDescription: NSMutableAttributedString().appendWith("The light is overpowering. Your fragile mind cannot understand its soulless words. Gain 1 random disorder."))
        let eventResult9b = EventResult(eventDieResult: "4 - 6", eventResultDescription: NSMutableAttributedString().appendWith("You wander through the light, bathed in a warm, awful feeling. You don't find anything other than exposure. Suffer monster level event damage to a random hit location."))
        let eventResult9c = EventResult(eventDieResult: "9+", eventResultDescription: NSMutableAttributedString().appendWith("Something about the light stirs you, and your resolve intensifies. Gain +1 survival"))
        let huntEvent9 = HuntEvent(eventNumber: "8", eventText: "A golden light blinds the survivors, stopping them in their tracks. The light shines from a single source. The event revealer is compelled to investigate. They gain +1 courage and roll 1d10.\n\nIf the event revealer is blind, they walk in the wrong direction and gain +3 insanity. Roll again on the hunt event table and do not investigate the light.", eventTitle: "9 | Golden Light", eventDie: "1d10", eventDieRoller: "Event revealer - Investigate", eventResults: [eventResult9a, eventResult9b, eventResult9c])
        allHuntEvents.append(huntEvent9)
        
        let huntEvent10 = HuntEvent(eventNumber: "9", eventText: "This event cannot be rerolled or avoided in any way.\n\nThe ground quakes and cracks beneath the survivors. A colossal worm bursts from below, its skin a mosaic of screaming faces. The mere sight of it is maddening.\n\nAll survivors gain 1 random disorder and must spend 1 survival or be devoured whole. If any survivor has noisy gear, the Harvester is drawn to the sound and they are instantly devoured. Nothing can save them.\n\nThe creature is so horrifying that the survivors' brains erase the experience from their memories. Do not gain the benefits of your death principle.", eventTitle: "10 | Harvester", eventDie: "N/A", eventDieRoller: "N/A", eventResults: [])
        allHuntEvents.append(huntEvent10)
        
        let eventResult11a = EventResult(eventDieResult: "1 - 3", eventResultDescription: NSMutableAttributedString().appendWith("You discover just how sickening playing with feces is. Lose 1 survival and roll again on the hunt event table before moving on the hunt board."))
        let eventResult11b = EventResult(eventDieResult: "4 - 6", eventResultDescription: NSMutableAttributedString().appendWith("The dropping tell a story. You are on the right track. Gain +1 survival."))
        let eventResult11c = EventResult(eventDieResult: "7+", eventResultDescription: NSMutableAttributedString().appendWith("You know these droppings well. You may skip the next hunt space. If this move begins the showdown, the survivors ").appendWith(weight: .bold, "ambush").appendWith(" their quarry"))
        let huntEvent11 = HuntEvent(eventNumber: "10", eventText: "The survivors find some monster droppings, like those of their quarry. The event revealer chooses to either investigate or consume the dorppings (choose only one).\n\nIf the event revealer investigates, gain +1 understanding and roll 1d10.", eventTitle: "11 | Monster Droppings", eventDie: "1d10", eventDieRoller: "Event revealer - Investigate", eventResults: [eventResult11a, eventResult11b, eventResult11c])
        allHuntEvents.append(huntEvent11)
        
    }
}
extension NSMutableAttributedString {
    
    @discardableResult func appendWith(color: UIColor = UIColor.darkText, weight: UIFont.Weight = .regular, ofSize: CGFloat = 14.0, _ text: String) -> NSMutableAttributedString{
        let attrText = NSAttributedString.makeWith(color: color, weight: weight, ofSize:ofSize, text)
        self.append(attrText)
        return self
    }
    
}
extension NSAttributedString {
    
    public static func makeWith(color: UIColor = UIColor.darkText, weight: UIFont.Weight = .regular, ofSize: CGFloat = 14.0, _ text: String) -> NSMutableAttributedString {
        
        let attrs = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: ofSize, weight: weight), NSAttributedStringKey.foregroundColor: color]
        return NSMutableAttributedString(string: text, attributes:attrs)
    }
}
