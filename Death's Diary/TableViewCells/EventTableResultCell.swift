//
//  EventTableResultCell.swift
//  Death's Diary
//
//  Created by Greg Durrett on 5/22/18.
//  Copyright © 2018 AppHazard Productions. All rights reserved.
//

import UIKit

class EventTableResultCell: UITableViewCell {

    @IBOutlet weak var eventDieResult: UILabel!
    
    @IBOutlet weak var eventResultDescription: UILabel!
    
    
    var event: EventResult? {
        didSet {
            eventDieResult.text = event?.eventDieResult
            eventDieResult.padding = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 0)
            eventResultDescription.attributedText = event?.eventResultDescription
            eventResultDescription.padding = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
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
