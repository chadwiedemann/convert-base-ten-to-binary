//
//  ViewController.swift
//  Convert decimal to binary
//
//  Created by Chad Wiedemann on 10/19/16.
//  Copyright © 2016 Chad Wiedemann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var binaryLabel: UILabel!
    @IBOutlet weak var regularNumberTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
    @IBAction func convertToBinaryButton(_ sender: AnyObject) {
        let myInt = Int(self.regularNumberTextField.text!)
        
            
            self.binaryLabel.text = returnBinaryNumber(numberToConvert: myInt!).description
            
            
    }
    
    func numberOfDigitsInBinary(number: Double) -> Int {
        var currentValue:Double = 0
        var counter: Int = 0
        while number > currentValue{
            currentValue = pow(2, Double(counter))
            counter = counter + 1
        }
        return counter
    }
    
    func findsValueOfArray(array: [Int]) -> Int {
        var answer = 0
        for i in 0...array.count-1{
            if array[i] == 1{
                answer = answer + Int(pow(2, Double(i)))
            }
        }
        return answer
    }
    
    func buildIntFromArray(array: [Int]) -> Int {
        var finalNumber: Int = 0
        var currentIterate: Int = 0
        for i in 0...array.count-1{
            currentIterate = Int(pow(10, Double(i))) * array[i]
            finalNumber = finalNumber + currentIterate
        }
        return finalNumber
    }
    
    
    func returnBinaryNumber(numberToConvert: Int) -> Int {
        let numDig = numberOfDigitsInBinary(number: Double(numberToConvert))
        let arrayToBuild : NSMutableArray = NSMutableArray(capacity: numDig)
        var tempNum = numberToConvert
        for i in 0...numDig {
            
            arrayToBuild[i] = tempNum % 2
            tempNum = tempNum / 2
            
            
            if findsValueOfArray(array: arrayToBuild.copy() as! [Int]) == numberToConvert{
                return buildIntFromArray(array: arrayToBuild.copy() as! [Int])
            }
        }
        return 99999
    }

    
}

