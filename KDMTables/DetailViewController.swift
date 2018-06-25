//
//  DetailViewController.swift
//  KDMTables
//
//  Created by Greg Durrett on 5/8/18.
//  Copyright © 2018 AppHazard Productions. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = display!.text!
            display.text = textCurrentlyInDisplay + digit!
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    @IBAction func sendRoll(_ sender: Any) {
        resultInt = Int(display.text!)! - 1
        switch table!.type {
        case .hunt:
            if resultInt < 0 || resultInt > 99 {
                showFormAlert(alertText: "Invalid Number", message: """
Please choose a number from 1 to 100!
""")
                display.text = ""
            } else {
                performSegue(withIdentifier: "ShowHuntEventDetail", sender: self)
                userIsInTheMiddleOfTyping = false
            }
        case .brain:
            if resultInt < 0 || resultInt > 12 {
                showFormAlert(alertText: "Invalid Number", message: """
Please choose a number from 1 to 13!
""")
                display.text = ""
            } else {
                performSegue(withIdentifier: "ShowBrainTraumaDetail", sender: self)
                userIsInTheMiddleOfTyping = false
            }
        case .injury:
            if resultInt < 0 || resultInt > 12 {
                showFormAlert(alertText: "Invalid Number", message: """
Please choose a number from 1 to 13!
""")
                display.text = ""
            } else {
                performSegue(withIdentifier: "ShowInjuryEventDetail", sender: self)
                userIsInTheMiddleOfTyping = false
            }
        }

    }
    
    @IBAction func sendClear(_ sender: Any) {
        display.text = "0"
    }

    let huntEvents = DataModel.sharedInstance.allHuntEvents
    let brainEvents = DataModel.sharedInstance.allBrainEvents
    let injuryEvents = DataModel.sharedInstance.allInjuryEvents
    
    var resultInt = Int()
    var userIsInTheMiddleOfTyping = false
    
    
    var table: Table? {
        didSet {
            refreshUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowHuntEventDetail" {
            let destinationVC = segue.destination as! HuntEventDetailViewController
            destinationVC.chosenEvent = huntEvents[resultInt]
        } else if segue.identifier == "ShowBrainTraumaDetail" {
            let destinationVC = segue.destination as! BrainEventDetailViewContoller
            destinationVC.chosenEvent = brainEvents[resultInt]
        } else if segue.identifier == "ShowInjuryEventDetail" {
            let destinationVC = segue.destination as! InjuryEventDetailViewController
            destinationVC.chosenEvent = injuryEvents[resultInt]
        }
    }
    
    func refreshUI() {
        loadViewIfNeeded()
        nameLabel.text = table?.name
        //descriptionLabel.text = table?.description
        //iconImageView.image = table?.icon
        //weaponImageView.image = table?.weaponImage
    }

    func showFormAlert(alertText: String, message: String) {
        let alertView = UIAlertController(
            title: alertText,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        //alertView.view.tintColor = colorDefinitions.scenarioAlertViewTintColor
        alertView.addAction(action)
        alertView.popoverPresentationController?.sourceView = self.view
        
        present(alertView, animated: true, completion: nil)
    }

}
extension DetailViewController: TableSelectionDelegate {
    func tableSelected(_ newTable: Table) {
        table = newTable
    }
}
