//
//  InjuryEventDetailViewController.swift
//  Death's Diary
//
//  Created by Greg Durrett on 6/4/18.
//  Copyright © 2018 AppHazard Productions. All rights reserved.
//

import UIKit

class InjuryEventDetailViewController: UIViewController {
    
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var eventDescription: UITextView!
    
    var chosenEvent: InjuryEvent?
    var chosenResult: EventResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Title manipulations
        eventTitle.attributedText = chosenEvent?.eventText
        eventTitle.padding = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0) // Using UILabel extension in MVC
        // Description manipulations
        eventDescription.attributedText = chosenResult!.eventResultDescription
        eventDescription.textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 0)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // For textView
    func adjustUITextViewHeight(view : UITextView)
    {
        view.translatesAutoresizingMaskIntoConstraints = true
        view.sizeToFit()
        view.isScrollEnabled = false
    }
}
