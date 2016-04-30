//
//  Calculator.swift
//  mid-course-project
//
//  Created by Paulo Tam on 25/04/2016.
//  Copyright © 2016 Paulo Tam. All rights reserved.
//

class Calculator {
  
  var currentString: String
  var currentNumber: Double?
  var currentNumber2: Double?
  
  var currentOperation = ""
  
  var currentTotal:Double = 0
  
  init() {
    currentString = ""
    currentNumber = 0
    currentOperation = ""
    currentNumber2 = 0
    clear()
  }
  
  func resetInternals() {
    currentString = ""
    currentOperation = ""
    currentNumber = 0
    currentNumber2 = 0
  }
  
  
  func plus() -> Double {
    let value: Double = 0
    return value
    
  }
  
  func getCurrentValue() -> Double {
    return currentTotal
  }
  
  func addNumber(value: Double!) -> String {
    if currentOperation == "" {
      currentNumber = setValue(currentNumber!, additionalDigit: value!)
      currentString = forTailingZero(currentNumber!)
    } else {
      currentNumber2 = setValue(currentNumber2!, additionalDigit: value!)
      currentString = forTailingZero(currentNumber2!)
    }
    
    print("Value1 : \(currentNumber) \(currentOperation) Value2 : \(currentNumber2)  ")
    return currentString
  }
  
  func setValue(currentDigit: Double, additionalDigit: Double) -> Double {
    
    var returnDigit: Double = 0
    if currentDigit == 0 {
      returnDigit = additionalDigit
    } else if currentNumber > 0 {
      returnDigit = (currentDigit * 10 ) + additionalDigit
    }
    
    print("setting: \(additionalDigit) to \(currentDigit) to make \(returnDigit) ")
    
    return returnDigit
  }
  
  func setOperation(operation: String) -> String {
    print("Current: \(currentOperation) New: \(operation)")
    if currentOperation == "" {
      currentOperation = operation
    } else if currentOperation == operation {
      process()
      currentNumber2 = 0
      currentString = forTailingZero(currentTotal)
      
    } else {
      //do action then
      //process()
      //currentNumber2 = 0
      //currentOperation = operation
      //currentString = forTailingZero(currentTotal)

    }
    print("Value1 : \(currentNumber) \(currentOperation) Value2 : \(currentNumber2)  ")
    return currentString
  }
  
  func process() -> String {
    print("Value1 : \(currentNumber) \(currentOperation) Value2 : \(currentNumber2)  ")
    switch currentOperation {
    case "+":
      currentTotal = currentNumber! + currentNumber2!
      currentNumber = currentTotal
    case "-":
      currentTotal = currentNumber! - currentNumber2!
      currentNumber = currentTotal
    case "*":
      currentTotal = currentNumber! * currentNumber2!
      currentNumber = currentTotal
    case "/":
      currentTotal = currentNumber! / currentNumber2!
      currentNumber = currentTotal
    default:
        currentTotal = currentNumber!
    }
    print("Totals: \(currentTotal) ")
    print("Value1 : \(currentNumber) \(currentOperation) Value2 : \(currentNumber2)  ")
    currentString = forTailingZero(currentTotal)
    return currentString
  }
  
  func clear() -> String {
    resetInternals()
    return forTailingZero(0)
  }
  
  func forTailingZero(temp: Double) -> String{
    let tempVar = String(format: "%g", temp)
    return tempVar
  }

  
}
