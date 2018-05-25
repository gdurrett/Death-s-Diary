//
//  EventTableHeadingCell.swift
//  Death's Diary
//
//  Created by Greg Durrett on 5/22/18.
//  Copyright © 2018 AppHazard Productions. All rights reserved.
//

import UIKit

class EventTableHeadingCell: UITableViewCell {

    @IBOutlet weak var eventDie: UILabel!
    
    @IBOutlet weak var eventDieRoller: UILabel!
    
    //var rollerDescription: String
    
    var dieRoller: String? {
        didSet {
            eventDieRoller.text = dieRoller
        }
    }
    var event: HuntEvent? {
        didSet {
            eventDie.text = event!.eventDie
            eventDie.padding = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 0)
        }
    }
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
