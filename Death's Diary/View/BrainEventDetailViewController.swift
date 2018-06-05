//
//  BrainEventDetailViewController.swift
//  Death's Diary
//
//  Created by Greg Durrett on 6/4/18.
//  Copyright © 2018 AppHazard Productions. All rights reserved.
//

import UIKit

class BrainEventDetailViewController: UIViewController {

    @IBOutlet weak var eventTableView: UITableView!
    
    @IBOutlet weak var eventTitle: UILabel!
    
    @IBOutlet weak var eventDescription: UITextView!
    
    var chosenEvent: BrainEvent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventTableView.delegate = self
        eventTableView.dataSource = self

        // Title manipulations
        eventTitle.text = chosenEvent?.eventTitle
        eventTitle.padding = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 0) // Using UILabel extension in MVC
        // Description manipulations
        eventDescription.attributedText = chosenEvent?.eventText
        eventDescription.textContainerInset = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 0)
        
        eventTableView?.register(EventTableHeadingCell.nib, forCellReuseIdentifier: EventTableHeadingCell.identifier)
        eventTableView?.register(EventTableResultCell.nib, forCellReuseIdentifier: EventTableResultCell.identifier)
        
        eventTableView.tableFooterView = UIView(frame: .zero)
        eventTableView.rowHeight = UITableViewAutomaticDimension
        eventTableView.estimatedRowHeight = 100
        eventTableView.separatorStyle = .none
        
        eventTableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension BrainEventDetailViewController: UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let event = chosenEvent!
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: EventTableHeadingCell.identifier, for: indexPath) as! EventTableHeadingCell
            cell.brainEvent = event
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
