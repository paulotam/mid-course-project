//
//  Calculator.swift
//  mid-course-project
//
//  Created by Paulo Tam on 25/04/2016.
//  Copyright © 2016 Paulo Tam. All rights reserved.
//

class Calculator {

  var currentString: String
  var currentNumber2: Double?
  var currentOperation = ""
  var currentTotal: Double = 0
  var totalHasDot: Bool = false
  var number2HasDot: Bool = false
  var lastNumber: Double = 0
  var memoryValue: Double = 0

  init() {
    currentString = ""
    currentOperation = ""
    currentNumber2 = 0
    currentTotal = 0
    clear()
  }

  func resetInternals() {
    currentString = ""
    currentOperation = ""
    currentNumber2 = 0
    totalHasDot = false
    number2HasDot = false
    currentTotal = 0
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
      currentTotal = setValue(currentTotal, additionalDigit: value!, dotAdded: totalHasDot)
      currentString = forTailingZero(currentTotal)
    } else {
      currentNumber2 = setValue(currentNumber2!, additionalDigit: value!, dotAdded: number2HasDot)
      currentString = forTailingZero(currentNumber2!)
    }

    print("Value1 : \(currentTotal) \(currentOperation) Value2 : \(currentNumber2)  ")
    return currentString
  }

  func setValue(currentDigit: Double, additionalDigit: Double, dotAdded: Bool) -> Double {

    var returnDigit: Double = 0
    if dotAdded == false {
      if currentDigit == 0 {
        returnDigit = additionalDigit
      } else if currentTotal > 0 {
        returnDigit = (currentDigit * 10 ) + additionalDigit
      }
    } else {
      if currentDigit % 1 == 0 {
        let valueAsString = "\(Int(currentDigit)).\(Int(additionalDigit))"
        returnDigit = Double(valueAsString)!
      } else {
        let valueAsString = "\(Double(currentDigit))\(Int(additionalDigit))"
        returnDigit = Double(valueAsString)!
      }
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
      currentOperation = operation
      currentNumber2 = 0
      currentString = forTailingZero(currentTotal)
    }
    print(
      "setOperation:: V1 : \(currentTotal) \(currentOperation) V2 : \(currentNumber2)  ")
    return currentString
  }

  func process() -> String {
    print("process:: Value1 : \(currentTotal) \(currentOperation) Value2 : \(currentNumber2)  ")
    switch currentOperation {
    case "+":
      currentTotal = currentTotal + currentNumber2!
    case "-":
      currentTotal = currentTotal - currentNumber2!
    case "*":
      currentTotal = currentTotal * currentNumber2!
    case "/":
      currentTotal = currentTotal / currentNumber2!
    default:
      break
    }
    print("Value1 : \(currentTotal) \(currentOperation) Value2 : \(currentNumber2)  ")
    currentString = forTailingZero(currentTotal)
    return currentString
  }

  func clear() -> String {
    resetInternals()
    return forTailingZero(0)
  }

  func forTailingZero(temp: Double) -> String {
    let tempVar = String(format: "%g", temp)
    return tempVar
  }

  func addMemory() -> String {
    memoryValue = memoryValue + currentTotal
    currentTotal = memoryValue
    currentOperation = "M+"
    currentTotal = 0
    currentNumber2 = 0
    return forTailingZero(memoryValue)
  }

  func minusMemory() -> String {
    memoryValue = memoryValue - currentTotal
    currentTotal = memoryValue
    currentOperation = "M-"
    currentTotal = 0
    currentNumber2 = 0
    return forTailingZero(memoryValue)
  }

  func clearMemory() -> String {
    memoryValue = 0
    return "0"
  }

  func recallMemory() -> String {
    currentTotal = memoryValue
    currentNumber2 = 0
    return forTailingZero(memoryValue)
  }

  func addDot() -> String {
    var returnText = ""
    if currentOperation == "" {
      if totalHasDot == false {
        totalHasDot = true
        returnText = "\(Int(currentTotal))."
      } else {
        returnText = "\(currentTotal)"
      }
    } else {
      if number2HasDot == false {
        number2HasDot = true
        returnText = "\(Int(currentNumber2!))."
      } else {
        returnText = "\(currentNumber2)"
      }
    }
    return returnText
  }

  func posNeg() -> String {
    currentTotal = currentTotal * -1
    currentOperation = ""
    currentNumber2 = 0
    return forTailingZero(currentTotal)
  }

  func percentage() -> String {
    var tempValue = currentTotal
    if tempValue < 0 {
      tempValue = ( tempValue * -1 / 100 ) * -1
    } else {
      tempValue = currentTotal / 100
    }
    currentTotal = tempValue
    return forTailingZero(tempValue)
  }

}
