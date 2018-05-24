//
//  EventDetailViewController.swift
//  Death's Diary
//
//  Created by Greg Durrett on 5/10/18.
//  Copyright © 2018 AppHazard Productions. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    @IBOutlet weak var eventTableView: UITableView!
    
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var eventDescription: UITextView!
    
    var chosenEvent: HuntEvent?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        eventTableView.dataSource = self
        eventTableView.delegate = self
        eventDescription.delegate = self

        eventTitle.text = chosenEvent?.eventTitle
        eventDescription.text = chosenEvent?.eventText
        eventDescription.sizeToFit()
        
        eventTableView?.register(EventTableHeadingCell.nib, forCellReuseIdentifier: EventTableHeadingCell.identifier)
        eventTableView?.register(EventTableResultCell.nib, forCellReuseIdentifier: EventTableResultCell.identifier)
        
        eventTableView.tableFooterView = UIView(frame: .zero)
        eventTableView.rowHeight = UITableViewAutomaticDimension
        eventTableView.estimatedRowHeight = 100
        eventTableView.separatorStyle = .none
        
        adjustUITextViewHeight(arg: eventDescription) // See if we can dynamically size
        eventTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension EventDetailViewController: UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        if chosenEvent!.eventResults.count == 0 {
            return 0
        } else {
            return 2
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            print(chosenEvent!.eventResults.count)
            return chosenEvent!.eventResults.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = chosenEvent!
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EventTableHeadingCell.identifier, for: indexPath) as! EventTableHeadingCell
            cell.event = event
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EventTableResultCell.identifier, for: indexPath) as! EventTableResultCell
            cell.event = event.eventResults[indexPath.row]
            print("Got here?")
            return cell
        } else {
            let cell = UITableViewCell(frame: .zero)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row % 2 == 0)
        {
            cell.backgroundColor = UIColor.lightGray
        } else {
            cell.backgroundColor = UIColor.lightText
        }
    }
    
    // For textView
    func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
}
