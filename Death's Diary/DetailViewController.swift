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
        if resultInt < 0 || resultInt > 100 {
            print("Please type a number between 1 and 100")
            display.text = "0"
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

        display.text = "0"
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension DetailViewController: TableSelectionDelegate {
    func tableSelected(_ newTable: Table) {
        table = newTable
    }
}
