//
//  calculation.swift
//  Calculator
//
//  Created by sixinglu on 1/27/16.
//  Copyright (c) 2016 CynthiaLu. All rights reserved.
//

import Foundation
import UIKit

class Calculation{
    
    
    /******************************************************
    change output when change mode
    @param input buffer string and mode
    @return new result
    ******************************************************/
    func ChangeModeOutput(input:String, fromMode: Int, toMode:Int)->String?{
        
        if input==""{
            return ""
        }
        
        let operation = "+-*/powsqrt()"
        
        for ch in input{
            if contains(operation,ch){
                return ""
            }
        }
        
        var result = String2number(input, mode: fromMode)!
        
        switch toMode{
            case 0: return String(format:"%d", Int(result))
            case 1: return String(format:"%O", Int(result))
            case 2: return String(Int(result),radix: 2 )
            case 3: return String(format:"%X", Int(result))
            default: return ""
        }
    }
    
    /******************************************************
    append legal char to the end of output.
    @param input buffer string.
    @return new input string.
    ******************************************************/
    func CheckInput(input:String, lastc: String)-> String?{
        
        let number = "0123456789ABCDEF)."
        let firstInput = "0123456789ABCDEF().logsqrt"
        
        if input == "" { // last is num
            if firstInput.rangeOfString(lastc) != nil{
                if lastc == "()"{
                    return "("
                }
                else if lastc == "log"{
                    return "log("
                }
                else if lastc == "sqrt"{
                    return "sqrt("
                }
                else{
                    return lastc
                }
            }
            else{
                return ""
            }
        }
    
        let prev = input[input.endIndex.predecessor()]
        
        if firstInput.rangeOfString(lastc) != nil && input[input.endIndex.predecessor()]==")"{
                return input
            }

        
        // if lastc is =
        if lastc == "="{
            if contains(number, prev)==false{ // not a num or )
                return "ERROR"
            }
            else{
                return input
            }
        }
        
        // if lastc is log
        if lastc=="log"{
            if contains(number, prev)==true { // prev string last char is a num
                return input  // illegal
            }
            else{
                return input+"log("
            }
        }
        
        // if lastc is ()
        if lastc == "()"{
            if prev == "(" {
                return input + "("
            }
            
            var count_l = 0
            var count_r = 0
            for ch in input{
                if ch == "("{
                    count_l++
                }
                else if ch == ")"{
                    count_r++
                }
            }
            if contains(number, prev)==true{ // prev  is num or )
                if count_l<=count_r {
                    return input
                }
                else{
                    return input+")"
                }
            }
            else{
                return input+"("
            }
        }
     
        // if lastc is sqrt
        if lastc == "sqrt"{
            if contains(number, prev)==true { // prev string last char is a num
                return input  // illegal
            }
            else{
                return input+"sqrt("
            }
        }
        
        // if operator follow operator
        if number.rangeOfString(lastc) == nil{  // incoming char is not a number
            if contains(number, prev)==false { // prev string last char is not a num
                return input  // illegal
            }
        }
        
        // if lastc is pow
        if lastc == "pow"{
            
            if contains(number, prev)==false || prev==")"{ // prev string last char is not a num
                return input
            }
            else{
                var index = count(input)
                for cr in reverse(input) {
                    if contains(number, cr)==true && prev != ")"{  // continous number
                        index = index-1
                    }
                    else{
                        break;
                    }
                }
                let indexOfText = advance(input.startIndex,index)
                return input.substringToIndex(indexOfText) + "pow(" + input.substringWithRange(Range<String.Index>(start: indexOfText, end: input.endIndex)) + ")"
            }

        }
        
        // if lastc is +/-
        if lastc=="+/-"{
            if prev==")"{
                return input
            }
            else if contains(number, prev)==true {  // prev string last char is a num
                var index = count(input)
                //var index  = input.characters.count
                for cr in reverse(input) {
                    if contains(number, cr)==true && prev != ")"{  // continous number
                        index = index-1
                    }
                    else{
                        break;
                    }
                }
                let indexOfText = advance(input.startIndex,index)
                
                if input[indexOfText]=="-"{  // delete -
                    let indexOfTextpre = advance(input.startIndex,index-1)
                    return input.substringToIndex(indexOfTextpre) + input.substringWithRange(Range<String.Index>(start: indexOfText, end: input.endIndex))
                }
                else{
                    return input.substringToIndex(indexOfText) + "(-" + input.substringWithRange(Range<String.Index>(start: indexOfText, end: input.endIndex)) + ")"
                }
            }
            else{
                return input+"(-"
            }
        }
        
        // other operators
        return input+lastc
    }
    
    
    /******************************************************
    calculate result.
    @param input buffer string.
    @return result string.
    ******************************************************/
    func Calculate(input:String, mode: Int)-> String?{
        
        if input == ""{
            return ""
        }
        
        let validLast = "0123456789ABCDEF)"
        let lastC = input[input.endIndex.predecessor()]
        if contains(validLast,lastC) == false{
            return "ERROR"
        }


        var array : [NSNumber] = []
        let number = "0123456789ABCDEF."
        
        // pre-process string to NSnumber and operator
        var leftNO = 0
        var rightNP = 0
        var lastLP = -1
        var i = 0
        var currentNum = ""
        for ch in input {
            if  contains(number,ch) == false{ // not number
                if currentNum != ""{
                    array.append(String2number(currentNum as NSString, mode: mode)!)
                    i++
                }
                currentNum = ""
                switch ch{
                    case "(":
                        array.append(-0.000000012345678) // cannot use usual number because need search (
                        lastLP = i
                        leftNO++
                        i++
                        break
                    case ")":
                        array.append(-0.000000012345679) // cannot use usual number because need search )
                        rightNP++
                        i++
                        break
                    case "+":  // because the location is clear, use number is ok
                        array.append(-4)
                        i++
                        break
                    case "-":
                        array.append(-5)
                        i++
                        break
                    case "*":
                        array.append(-6)
                        i++
                        break
                    case "/":
                        array.append(-7)
                        i++
                        break
                    case "%":
                        array.append(-10)
                        i++
                        break
                    case "g":  // ignore lo
                        array.append(-11)
                        i++
                        break
                    case "w": // ignore po
                        array.append(-1)
                        i++
                        break
                    case "t": // ignore sqr
                        array.append(-2)
                        i++
                        break
                    default: break
                }
                
            }
            else{  // number
                currentNum = currentNum + String(Array(arrayLiteral: ch))
            }
            
        }
        if currentNum != ""{  // deal with last number
            array.append(String2number(currentNum as NSString, mode: mode)!)
        }

        
        if array.count==1{  // only one number inside
            return input
        }
        
        if leftNO != rightNP{
            return "ERROR"
        }
        
        // calculate what's inside (), from right most ( -> left most (, namely inner to outter
        var phaseResult:NSNumber
        while lastLP != -1{  // when there is (
            // find the closet )
            for var R = lastLP+1; R<array.count; ++R{  // find arrording )
                if array[R] == -0.000000012345679{ // hit )
                    
                    if array[lastLP+1] == -5{ // (-num
                        var expre : [NSNumber] = []
                        expre.append(-5)  // -
                        expre.append(array[lastLP+2])  // num
                        phaseResult = CalWithNoParenthesis(expre,mode:mode)  // update result
                        array = ReOrganzeExpression(lastLP,Right: R, old: array, phaseResult: phaseResult)
                        lastLP = findLastP(array)
                        break
                    }
                    var expression : [NSNumber] = []
                    expression.append(-100)  // put a random num in [0], cal from [1]
                    for var p = lastLP+1; p<=R-1; ++p{  // small range
                        expression.append(array[p])
                    }
                    phaseResult = CalWithNoParenthesis(expression,mode:mode)
                    if lastLP>=1{ // calculate pow, sqrt, log
                        if array[lastLP-1] == -1 || array[lastLP-1] == -2 || array[lastLP-1] == -11{
                            var expre : [NSNumber] = []
                            expre.append(array[lastLP-1])
                            expre.append(phaseResult)
                            phaseResult = CalWithNoParenthesis(expre,mode:mode)  // update result
                            array = ReOrganzeExpression(lastLP-1,Right: R, old: array, phaseResult: phaseResult)
                            lastLP = findLastP(array)
                            break
                        }
                    }
                    array = ReOrganzeExpression(lastLP,Right: R, old: array, phaseResult: phaseResult)
                    lastLP = findLastP(array)
                    break;  // only process closest )
                }
            }
            
        }
        
        // calculate rest expression without () or pow
        var final : [NSNumber] = []
        final = ReOrganzeExpression(0,Right: 0,old: array,phaseResult: -100)  // shift array so that [0] = -100
        phaseResult = CalWithNoParenthesis(final,mode:mode) // cal from [1]
        
        // transfer result to according string format
        switch mode{
            case 0: return String(format:"%f", Float(phaseResult))
            case 1: return String(format:"%O", Int(phaseResult))
            case 2: return String(Int(phaseResult), radix: 2)
            case 3: return String(format:"%X", Int(phaseResult))
            default: return nil
        }
        
    }
    
    /******************************************************
    Re-organize the expression after calculate a ().
    @param ( location, ) location, original [NSNumber], result.
    @return [NSNumber].
    ******************************************************/
    func ReOrganzeExpression(Left:Int, Right:Int, old: [NSNumber], phaseResult:NSNumber)-> [NSNumber]{
        var newarray : [NSNumber] = []
        
        var i = 0
        if Left == Right{
            newarray.append(phaseResult)
            while i < old.count {
                newarray.append(old[i])
                i++

            }
            return newarray
        }
        
        i = 0
        while i < old.count {
            if i==Left{
                newarray.append(phaseResult)
                i = Right+1
            }
            else{
                newarray.append(old[i])
                i++
            }
        }
        
        return newarray
    }
    
    /******************************************************
    Find the last (.
    @param [NSNumber].
    @return last ( loction.
    ******************************************************/
    func findLastP(newarray: [NSNumber])->Int{
        var lastP = -1;
        for var i=0; i < newarray.count; ++i{
            if newarray[i] == -0.000000012345678{
                lastP = i
            }
        }
        
        return lastP
    }
    
    /******************************************************
    change string to number
    @param NSString, mode.
    @return NSNumber.
    ******************************************************/
    func String2number(inputS: NSString, mode: Int)->NSNumber?{
        if mode==0{  // decimal
            return NSNumber(float: inputS.floatValue)
        }
        else if mode==1{  // Oct
            return NSNumber(longLong: strtoll(inputS.UTF8String,nil,8))
        }
        else if mode==2{ // Bin
            var test = strtoll(inputS.UTF8String,nil,2)
            return NSNumber(longLong: strtoll(inputS.UTF8String,nil,2))
        }
        else if mode==3{ // Hex
            return NSNumber(longLong: strtoll(inputS.UTF8String,nil,16))
        }
        else{
            return nil
        }
    }
    
    /******************************************************
    Calculate expression without ().
    @param [NSNumber], mode.
    @return NSNumber.
    ******************************************************/
    func CalWithNoParenthesis(expression: [NSNumber], mode: Int)->NSNumber{
        
        if expression[0] as! Int == -1 {  // pow
            return pow(expression[1].doubleValue, 2.0)
        }
        else if expression[0] as! Int == -2 {  // sqrt
            return sqrt(expression[1].doubleValue)
        }
        else if expression[0] as! Int == -11{  // log
            return log(expression[1].doubleValue)
        }
        else if expression[0] as! Int == -5 {  // +/- the same with -
            return NSNumber(double: -expression[1].doubleValue)
        }
        else{  // regular expression
            if mode == 0{  // decimal
            
                var i = 2
                var opLeft = expression[1].doubleValue
                while i < expression.count {
                    var operation = expression[i].intValue
                    var opRight = expression[++i].doubleValue
                    switch operation{
                        case -6: // -6 is *
                            opLeft = opLeft * opRight
                            break
                        case -7: // -7 is /
                            opLeft = opLeft / opRight
                            break
                        case -10: // %
                            opRight = opRight % opRight
                            break
                        case -4, -5:  // + or -
                            while i < expression.count-1 {
                                var operation2 = expression[++i].doubleValue
                                if operation2 == -4 || operation2 == -5{  // + -
                                    i--
                                    break
                                }
                                switch operation2{
                                    case -6:  // *
                                        opRight = opRight * expression[++i].doubleValue
                                        break
                                    case -7:  // /
                                        opRight = opRight / expression[++i].doubleValue
                                        break
                                    case -10: // %
                                        opRight = opRight % expression[++i].doubleValue
                                        break
                                    default:
                                        break
                                }
                                
                            }
                            if operation == -4{
                                opLeft = opLeft + opRight
                            }
                            else{
                                opLeft = opLeft - opRight
                            }
                            break;
                        default:
                            break
                    }
                    
                    i++
                }
                return opLeft
                //return NSNumber(double: opLeft)
                
            }
            else{  // other mode only has + -, or single number
                var i = 2
                var opLeft = expression[1].intValue
                while i < expression.count {
                    var operation = expression[i].intValue
                    var opRight = expression[++i].intValue
                    switch operation{
                        case -4: // -4 is +
                                 opLeft = opLeft + opRight
                                 break
                        case -5: // -5 is -
                                 opLeft = opLeft - opRight
                                 break
                        default:
                            break
                    }

                    i++
                }
                return NSNumber(int: opLeft)
                //return opLeft
            }
        }
    }
}