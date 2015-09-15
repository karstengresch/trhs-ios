//: Closures

func printString(aString: String) {
  println("Printing the passed string: \(aString)")
}

printString("Hi, my lovely")

let someFunction = printString

someFunction("Hiya")

//func printInt(number: Int) {
//  println("\(number)")
//}
//
//let numberOfApples = 3
//
//printInt(numberOfApples)

func displayString(printStringFunc: (String) -> Void) {
  printStringFunc("I'm a function inside another function")
}

displayString(printString)

let allNumbers = [1,2,3,4,5,6,7,8,9,10]

func isEvenNumber(number: Int) -> Bool {
  return number % 2 == 0
}

isEvenNumber(-9000)

let ifEven = isEvenNumber
let evenNumbers = allNumbers.filter(ifEven)

// own

let someString = ["Makka", "Mokko", "Adelaide", "Omnicomni", "Marconi", "Serpent", "Zucchini", "Pasta", "Dolci", "Aurum", "Persistence"]

func containsMagicString(haystack: String) -> Bool {
  return contains(haystack, "a")
}

let getMagic = containsMagicString

let magicWords = someString.filter(getMagic)

// Challenge
func differenceBetweenNumbers(firstNumber: Int, secondNumber: Int) -> (Int) {
  return firstNumber - secondNumber
}

func mathOperation(differenceBetweenNumbers: (Int, Int) -> Int, firstNumber: Int,secondNumber: Int) -> Int {
  return differenceBetweenNumbers(firstNumber, secondNumber)
}

let difference = mathOperation(differenceBetweenNumbers, 4,8)

// Returning Functions




func printerFunction() -> (Int) -> () {
  func printInteger(number: Int) {
    println("The integer passed in is: \(number)")
  }
  return printInteger
}

let printAndReturnIntegerFunc = printerFunction()



printAndReturnIntegerFunc(2)

// Closure Expressions

func doubler(integer: Int) -> Int {
  return integer * 2
}

let doubleFunction = doubler

doubleFunction(3)

let doubledNumbers = allNumbers.map(doubleFunction)







