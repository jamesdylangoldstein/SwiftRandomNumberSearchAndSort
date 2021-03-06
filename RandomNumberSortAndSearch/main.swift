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
var intToFind: Int = 887
var halfSize: Int = lengthOfArray;

func printArray(array: [Int]) {
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

func searchForInt(intToFind: Int, startValue: Int, halfSize: Int, lengthOfArray: Int, array: [Int])
{
    var halfSizeFunc = halfSize
    halfSizeFunc = halfSizeFunc/2
    
    if (halfSizeFunc == 0)
    {
        print ("\(intToFind) not found!")
        return
    }
    
    var left: Int = startValue + halfSizeFunc - 1
    var right: Int = startValue + halfSizeFunc
    
    if (intToFind < numberArray[left])
    {
        // Left side
        searchForInt(intToFind, startValue: 0, halfSize: halfSizeFunc, lengthOfArray: lengthOfArray, array:numberArray)
    }
    else if (intToFind > numberArray[right])
    {
        // Right side
        searchForInt(intToFind, startValue: halfSizeFunc, halfSize: halfSizeFunc, lengthOfArray: lengthOfArray, array: numberArray)
    }
    else if (intToFind == numberArray[left])
    {
        // We found it
        print ("\(intToFind) found in position \(startValue + halfSizeFunc).")
        return
    }
    else if (intToFind == numberArray[right])
    {
        // We found it
        print ("\(intToFind) found in position \(startValue + halfSizeFunc + 1).")
        return
    }
    
    return
}

numberArray = populateArray(lengthOfArray)
print("The original array of unsorted random number:")
printArray(numberArray)
bubbleSort(numberArray)
print("The array sorted using bubble sort:")
printArray(numberArray)
searchForInt(intToFind, startValue: 0, halfSize: halfSize, lengthOfArray: lengthOfArray, array: numberArray)

