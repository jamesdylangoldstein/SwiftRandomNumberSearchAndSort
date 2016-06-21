//
//  main.swift
//  RandomNumberSortAndSearch
//
//  Created by James Dylan Goldstein on 6/20/16.
//  Copyright © 2016 James Dylan Goldstein. All rights reserved.
//

import Foundation

var lengthOfArray: Int = 20
var numberArray = [Int]()

func printArray(numberArray: Array<Int>) {
    for number in numberArray {
        print (number)
    }
}

func populateArray(lengthOfArray: Int) -> Array<Int> {
    
    var numberArray = [Int]()

    for number in 0..<lengthOfArray {
        let randomNumber = random() % 1001
        numberArray.append(randomNumber)
    }

    return numberArray
}

func bubbleSort (array: [Int]) {
    var swapCounter: Int
    var bubbleCounter: Int
    var numToCompare: Int
    var evenCounter: Int = 2
    
    repeat {
        swapCounter = 0
        
        if (evenCounter % 2 == 0) {
            bubbleCounter = 0
            numToCompare = 1
        }
        else {
            bubbleCounter = 1
            numToCompare = 2
        }
        
        while (bubbleCounter < numberArray.count) {
            
            if (numToCompare > bubbleCounter) {
                if (numberArray[bubbleCounter] > numberArray[numToCompare]) {
                    swapCounter += 1
                    var intBuffer = numberArray[bubbleCounter]
                    numberArray[bubbleCounter] = numberArray[numToCompare]
                    numberArray[numToCompare] = intBuffer
                }
            }
            else {
                if (numberArray[bubbleCounter] < numberArray[numToCompare]) {
                    swapCounter += 1
                    var intBuffer = numberArray[numToCompare]
                    numberArray[numToCompare] = numberArray[bubbleCounter]
                    numberArray[bubbleCounter] = intBuffer
                }
            }
            
            bubbleCounter += 2
            numToCompare += 2
            
            if (numToCompare > (numberArray.count - 1)) {
                numToCompare = 0
            }
        }
        
        evenCounter += 1
        
    } while (swapCounter != 0)
    
}



numberArray = populateArray(lengthOfArray)
print("The original array of unsorted random number:")
printArray(numberArray)
bubbleSort(numberArray)
print("The array sorted using bubble sort:")
printArray(numberArray)

