//
//  MasterViewController.swift
//  Death's Diary
//
//  Created by Greg Durrett on 5/8/18.
//  Copyright © 2018 AppHazard Productions. All rights reserved.
//

import UIKit

protocol TableSelectionDelegate: class {
    func tableSelected(_ newTable: Table)
}
class MasterViewController: UITableViewController {

    weak var delegate: TableSelectionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tables.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let table = tables[indexPath.row]
        cell.textLabel?.text = table.name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedTable = tables[indexPath.row]
        delegate?.tableSelected(selectedTable)
        if let detailViewController = delegate as? DetailViewController,
            let detailNavigationController = detailViewController.navigationController {
            splitViewController?.showDetailViewController(detailNavigationController, sender: nil)
        }
    }
    let tables = [
        Table(name: "Hunt", description: "MEE-OW",
                iconName: "meetcatbot", weapon: .sword),
        Table(name: "Dog-Bot", description: "BOW-WOW",
                iconName: "meetdogbot", weapon: .blowgun),
        Table(name: "Explode-Bot", description: "BOOM!",
                iconName: "meetexplodebot", weapon: .smoke),
        Table(name: "Fire-Bot", description: "Will Make You Steamed",
                iconName: "meetfirebot", weapon: .ninjaStar),
        Table(name: "Ice-Bot", description: "Has A Chilling Effect",
                iconName: "meeticebot", weapon: .fire),
        Table(name: "Mini-Tomato-Bot", description: "Extremely Handsome",
                iconName: "meetminitomatobot", weapon: .ninjaStar)
    ]
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UILabel {
    private struct AssociatedKeys {
        static var padding = UIEdgeInsets()
    }
    
    public var padding: UIEdgeInsets? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.padding) as? UIEdgeInsets
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.padding, newValue as UIEdgeInsets?, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    override open func draw(_ rect: CGRect) {
        if let insets = padding {
            self.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
        } else {
            self.drawText(in: rect)
        }
    }
    
    override open var intrinsicContentSize: CGSize {
        guard let text = self.text else { return super.intrinsicContentSize }
        
        var contentSize = super.intrinsicContentSize
        var textWidth: CGFloat = frame.size.width
        var insetsHeight: CGFloat = 0.0
        
        if let insets = padding {
            textWidth -= insets.left + insets.right
            insetsHeight += insets.top + insets.bottom
        }
        
        let newSize = text.boundingRect(with: CGSize(width: textWidth, height: CGFloat.greatestFiniteMagnitude),
                                        options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                        attributes: [NSAttributedStringKey.font: self.font], context: nil)
        
        contentSize.height = ceil(newSize.size.height) + insetsHeight
        
        return contentSize
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
