//
//  DetailViewController.swift
//  Death's Diary
//
//  Created by Greg Durrett on 5/8/18.
//  Copyright © 2018 AppHazard Productions. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!

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
        if resultInt < 0 || resultInt > 99 {
            print("Please type a number between 1 and 100")
            showFormAlert(alertText: "Invalid Number", message: """
Please choose a number from 1 to 100!
""")
            display.text = ""
        } else {
            performSegue(withIdentifier: "ShowEventDetail", sender: self)
            userIsInTheMiddleOfTyping = false
        }
    }
    
    @IBAction func sendClear(_ sender: Any) {
        display.text = "0"
    }
    let huntEvents = DataModel.sharedInstance.allHuntEvents
    var resultInt = Int()
    var userIsInTheMiddleOfTyping = false
    
    var table: Table? {
        didSet {
            refreshUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        display.text = "Enter # from 1 to 100"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowEventDetail" {
            let destinationVC = segue.destination as! EventDetailViewController
            destinationVC.chosenEvent = huntEvents[resultInt]
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
