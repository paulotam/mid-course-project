//
//  ViewController.swift
//  mid-course-project
//
//  Created by Paulo Tam on 25/04/2016.
//  Copyright © 2016 Paulo Tam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var myCalc = Calculator()
  @IBOutlet weak var displayField: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    display(myCalc.clear())
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func button0(sender: AnyObject) {
    display(myCalc.addNumber(Double(0)))
  }

  @IBAction func button1(sender: AnyObject) {
    display(myCalc.addNumber(Double(1)))
  }

  @IBAction func button2(sender: AnyObject) {
    display(myCalc.addNumber(Double(2)))
  }
  
  @IBAction func button3(sender: AnyObject) {
    display(myCalc.addNumber(Double(3)))
  }
  
  @IBAction func buttonDot(sender: AnyObject) {
  }
  
  @IBAction func buttonPlus(sender: AnyObject) {
    myCalc.setOperation("+")
  }
  
  @IBAction func buttonMinus(sender: AnyObject) {
    myCalc.setOperation("-")
  }
  
  @IBAction func buttonTimes(sender: AnyObject) {
    myCalc.setOperation("*")
  }
  
  @IBAction func button4(sender: AnyObject) {
    display(myCalc.addNumber(Double(4)))
  }
  
  @IBAction func buttonEquals(sender: AnyObject) {
    display(myCalc.process())
  }
  
  func display(textValue: String) {
    displayField.text = textValue
  }
  
//  func display(doubleValue: Double) {
//    displayField.text = String(doubleValue)
//  }
  
  @IBAction func buttonClear(sender: AnyObject) {
    display(myCalc.clear())
  }
}

