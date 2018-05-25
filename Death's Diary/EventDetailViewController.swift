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

        // Title manipulations
        eventTitle.text = chosenEvent?.eventTitle
        eventTitle.padding = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0) // Using UILabel extension in MVC
        // Description manipulations
        eventDescription.text = chosenEvent?.eventText
        eventDescription.textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 0)
        
        eventTableView?.register(EventTableHeadingCell.nib, forCellReuseIdentifier: EventTableHeadingCell.identifier)
        eventTableView?.register(EventTableResultCell.nib, forCellReuseIdentifier: EventTableResultCell.identifier)
        
        eventTableView.tableFooterView = UIView(frame: .zero)
        eventTableView.rowHeight = UITableViewAutomaticDimension
        eventTableView.estimatedRowHeight = 100
        eventTableView.separatorStyle = .none
        
        eventTableView.reloadData()
    }
    
}
extension EventDetailViewController: UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {

        if chosenEvent!.eventResults1.count == 0 {
            return 0
        } else if chosenEvent!.numEventTables == 2 {
            return 4
        } else {
            return 2
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 || section == 2 {
            return 1
        } else {
            return chosenEvent!.eventResults1.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = chosenEvent!
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EventTableHeadingCell.identifier, for: indexPath) as! EventTableHeadingCell
            cell.event = event
            cell.dieRoller = chosenEvent!.eventDieRoller1
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EventTableResultCell.identifier, for: indexPath) as! EventTableResultCell
            cell.event = event.eventResults1[indexPath.row]
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EventTableHeadingCell.identifier, for: indexPath) as! EventTableHeadingCell
            cell.event = event
            cell.dieRoller = chosenEvent!.eventDieRoller2
            return cell
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EventTableResultCell.identifier, for: indexPath) as! EventTableResultCell
            cell.event = event.eventResults2[indexPath.row]
            return cell
        } else {
            let cell = UITableViewCell(frame: .zero)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row % 2 == 0) {
            cell.backgroundColor = UIColor.lightGray
        } else {
            cell.backgroundColor = UIColor.lightText
        }
    }

    // For textView
    func adjustUITextViewHeight(view : UITextView)
    {
        view.translatesAutoresizingMaskIntoConstraints = true
        view.sizeToFit()
        view.isScrollEnabled = false
    }
}
