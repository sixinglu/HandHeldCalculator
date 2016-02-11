//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by sixinglu on 1/26/16.
//  Copyright (c) 2016 CynthiaLu. All rights reserved.
//

import Foundation
import UIKit
import XCTest
import SystemConfiguration
import Calculator

class CalculatorTests: XCTestCase {
    
    let testrunCal = Calculation()
    
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testChangeModeOutput() {
       
        let result1 = testrunCal.ChangeModeOutput("", fromMode: 0, toMode:1) // empty change mode
        XCTAssert(result1=="", "Pass")
        
        let result2 = testrunCal.ChangeModeOutput("10", fromMode: 0, toMode:2) // decimal to binary
        XCTAssert(result2=="1010", "Pass")
        
        let result3 = testrunCal.ChangeModeOutput("1+2", fromMode: 2, toMode:3) // invalid num change mode
        XCTAssert(result3=="", "Pass") 
        
    }
    
    func testCheckInput(){
        
        let result1 = testrunCal.CheckInput("", lastc: "A")  // input num
        XCTAssert(result1=="A", "Pass")
        
        let result2 = testrunCal.CheckInput("2", lastc: "3") // append num
        XCTAssert(result2=="23", "Pass")
        
        let result3 = testrunCal.CheckInput("2/", lastc: "+") // input operator after operator
        XCTAssert(result3=="2/", "Pass")
        
        let result4 = testrunCal.CheckInput("2+(3-4)", lastc: "()") // input (), but detect invalid
        XCTAssert(result4=="2+(3-4)", "Pass")
        
        let result5 = testrunCal.CheckInput("4+", lastc: "sqrt") // test valid sqrt
        XCTAssert(result5=="4+sqrt(", "Pass")
        
        let result6 = testrunCal.CheckInput("2*", lastc: "log") // test valid log
        XCTAssert(result6=="2*log(", "Pass")
        
        let result7 = testrunCal.CheckInput("5", lastc: "pow") // test valid pow
        XCTAssert(result7=="pow(5)", "Pass")
        
        let result8 = testrunCal.CheckInput("8/9", lastc: "+/-")  // test valid +/-
        XCTAssert(result8=="8/(-9)", "Pass")
        
    }
    
    func testCalculate(){
        
        let result1 = testrunCal.Calculate("A+B", mode: 3) // test hex
        XCTAssert(result1=="15", "Pass")
        
        let result2 = testrunCal.Calculate("1001-11", mode: 2) // test binary
        XCTAssert(result2=="110", "Pass")
        
        let result3 = testrunCal.Calculate("777+1", mode: 1) // test Oct
        XCTAssert(result3=="1000", "Pass")
        
        let result4 = testrunCal.Calculate("4/2", mode: 0) // test decimal
        XCTAssert(result4=="2.000000", "Pass")
        
        let result5 = testrunCal.Calculate("log(2+8)", mode: 0) // test log
        XCTAssert(result5=="2.302585", "Pass")
        
        let result6 = testrunCal.Calculate("(4/2)+(", mode: 0) // error case
        XCTAssert(result6=="ERROR", "Pass")
        
        let result7 = testrunCal.Calculate("(4/2)-", mode: 0) // error case
        XCTAssert(result7=="ERROR", "Pass")
        
        let result8 = testrunCal.Calculate("((-8)+3)/2-1", mode: 0) // () case
        XCTAssert(result8=="-3.500000", "Pass")
        
        let result9 = testrunCal.Calculate("4/2", mode: 0) // test decimal
        XCTAssert(result9=="2.000000", "Pass")
        
        let result10 = testrunCal.Calculate("3.5/5+pow(2)", mode: 0) // test pow
        XCTAssert(result10=="4.700000", "Pass")
        
    }
    
    func testReOrganzeExpression(){
        
        let final1 : [NSNumber] = [-100,-5,7]
        let result1 = testrunCal.ReOrganzeExpression(0, Right:0, old: [-5,7], phaseResult:-100)
         XCTAssert((result1 == final1)==true, "Pass")
        
        let final2 : [NSNumber] = [-0.000000012345678,-8,-4,3,-0.000000012345679,-7,2,-5,1]
        let result2 = testrunCal.ReOrganzeExpression(1, Right:3, old: [-0.000000012345678,-0.000000012345678,-8,-0.000000012345679,-4,3,-0.000000012345679,-7,2,-5,1], phaseResult:-8)
        XCTAssert((result2 == final2)==true, "Pass")

        
    }
    
    func testfindLastP(){
        
        let input : [NSNumber] = [-0.000000012345678,-0.000000012345678,-8,-0.000000012345679,-4,3,-0.000000012345679,-7,2,-5,1]
        let result = testrunCal.findLastP(input)
        XCTAssert((result == 1)==true, "Pass")

    }
    
    func testString2number(){
        
        let result1 = testrunCal.String2number("43.6", mode: 0)
        let temp = result1!.doubleValue - 43.6
        XCTAssert( fabs(temp)<0.0001 , "Pass")
        
        let result2 = testrunCal.String2number("77", mode: 1)
        XCTAssert(result2 == 63 , "Pass")
        
        let result3 = testrunCal.String2number("1001", mode: 2)
        XCTAssert(result3 == 9 , "Pass")
        
        let result4 = testrunCal.String2number("ACCD", mode: 3)
        XCTAssert(result4 == 44237  , "Pass")
    }
    
    func testCalWithNoParenthesis(){
        
        let input1 : [NSNumber] = [-100,-8,-4,3,-7,2,-5,1] // all input transfers to num already
        let result1 = testrunCal.CalWithNoParenthesis(input1, mode: 0)
        XCTAssert(result1 == -7.500000, "Pass")
        
        let input2 : [NSNumber] = [-1,10] // pow
        let result2 = testrunCal.CalWithNoParenthesis(input2, mode: 0)
        XCTAssert(result2 == 100.000000, "Pass")
        
        let input3 : [NSNumber] = [-2,10] // sqrt
        let result3 = testrunCal.CalWithNoParenthesis(input3, mode: 0)
        XCTAssert(fabs(result3.doubleValue-3.162278)<0.0001, "Pass")
        
        let input4 : [NSNumber] = [-11,10] // log
        let result4 = testrunCal.CalWithNoParenthesis(input4, mode: 0)
        XCTAssert(fabs(result4.doubleValue-2.302585)<0.0001, "Pass")
        
        let input5 : [NSNumber] = [-5,10] // -
        let result5 = testrunCal.CalWithNoParenthesis(input5, mode: 0)
        XCTAssert(result5 == -10.000000, "Pass")
        
        let input6 : [NSNumber] = [-100,10,-4,2] // all input transfers to num already, Oct just format
        let result6 = testrunCal.CalWithNoParenthesis(input6, mode: 1) // Oct
        XCTAssert(result6 == 12, "Pass")
        
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
