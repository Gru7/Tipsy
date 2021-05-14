//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Guseyn on 14.05.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var finalBill = ""
    var finalNumberOfPeople = 0
    var tip = 10
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text=finalBill
        settingsLabel.text = "Split between \(finalNumberOfPeople) people, with \(tip)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    

}
