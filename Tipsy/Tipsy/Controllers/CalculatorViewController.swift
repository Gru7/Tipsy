//
//  ViewController.swift
//  Tipsy
//
//  Created by Guseyn on 14.05.2021.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var numOfPeople = 2
    var textBillField:String=""
    var billFinal = 0.0
    var finalBill = ""
    var finalTip = ""
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
      
        
        // обнуляем все кнопки
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        //выбранная кнопка становится true
        sender.isSelected = true
        
        //помещяем значение кнопки в константу
         finalTip = sender.currentTitle!
        //удаляем последний знак , то есть процент
        let deletePercent = String(finalTip.dropLast())
        // приводим тип Double
        let valueToDouble = Double(deletePercent)!
        //чтобы выводилось нужное дробное число
        tip = valueToDouble/100
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format:"%.0f",sender.value)
        numOfPeople = Int(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        // записываем значение нашего textField
        let bill = billTextField.text!
        // делаем проверку
        if bill != "" {
          //помещаем знаечени bill
            billFinal = Double(bill)!
            //производим математическую операцию
            let total = billFinal * (1 + tip) / Double(numOfPeople)
            
            finalBill = String(format: "%.2f", total)
        }
        self.performSegue(withIdentifier: "PresentModally", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PresentModally"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.finalBill = finalBill
            destinationVC.finalNumberOfPeople = numOfPeople
            destinationVC.tip = Int(tip * 100)
        }
    }

    

}

