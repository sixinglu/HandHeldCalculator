//
//  ViewController.swift
//  Calculator
//
//  Created by sixinglu on 1/26/16.
//  Copyright (c) 2016 CynthiaLu. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    // calculator buttons
    @IBOutlet weak var Dec: UIButton!
    @IBOutlet weak var Oct: UIButton!
    @IBOutlet weak var Bin: UIButton!
    @IBOutlet weak var Hex: UIButton!
    @IBOutlet weak var pow: UIButton!
    @IBOutlet weak var percent: UIButton!
    @IBOutlet weak var log: UIButton!
    @IBOutlet weak var mutiply: UIButton!
    @IBOutlet weak var Clear: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    @IBOutlet weak var sqrt: UIButton!
    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var divid: UIButton!
    @IBOutlet weak var plus_minus: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var point: UIButton!
    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var B: UIButton!
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var parenthese: UIButton!
    @IBOutlet weak var D: UIButton!
    @IBOutlet weak var E: UIButton!
    @IBOutlet weak var F: UIButton!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var equal: UIButton!
    
    // output textbox
    @IBOutlet weak var output: UITextView!
    
    // 0 is decimal, 1 is oct, 2 is bin, 3 is hex
    var mode = 0
    var prevPress = ""
    
   let runCal = Calculation()
   
    
    // change mode
    @IBAction func DecAction(sender: UIButton) {
 
        output.text = runCal.ChangeModeOutput(output.text, fromMode: mode, toMode: 0)
        
        mode = 0 // set the global control
        
        // enable buttons
        Dec.enabled = false
        Oct.enabled = true
        Bin.enabled = true
        Hex.enabled = true
        A.enabled = false
        B.enabled = false
        C.enabled = false
        D.enabled = false
        E.enabled = false
        F.enabled = false
        two.enabled = true
        three.enabled = true
        four.enabled = true
        five.enabled = true
        six.enabled = true
        seven.enabled = true
        eight.enabled = true
        nine.enabled = true
        point.enabled = true
        mutiply.enabled = true
        divid.enabled = true
        sqrt.enabled = true
        plus_minus.enabled = true
        
        
        // set button color
        Dec.backgroundColor = UIColor(red: 255, green: 178, blue: 102, alpha: 0.5)
        Oct.backgroundColor = UIColor.whiteColor()
        Bin.backgroundColor = UIColor.whiteColor()
        Hex.backgroundColor = UIColor.whiteColor()
        A.backgroundColor = UIColor.lightGrayColor()
        B.backgroundColor = UIColor.lightGrayColor()
        C.backgroundColor = UIColor.lightGrayColor()
        D.backgroundColor = UIColor.lightGrayColor()
        E.backgroundColor = UIColor.lightGrayColor()
        F.backgroundColor = UIColor.lightGrayColor()
        two.backgroundColor = UIColor.whiteColor()
        three.backgroundColor = UIColor.whiteColor()
        four.backgroundColor = UIColor.whiteColor()
        five.backgroundColor = UIColor.whiteColor()
        six.backgroundColor = UIColor.whiteColor()
        seven.backgroundColor = UIColor.whiteColor()
        eight.backgroundColor = UIColor.whiteColor()
        nine.backgroundColor = UIColor.whiteColor()
        point.backgroundColor = UIColor.whiteColor()
        mutiply.backgroundColor = UIColor.whiteColor()
        divid.backgroundColor = UIColor.whiteColor()
        sqrt.backgroundColor = UIColor.whiteColor()
        plus_minus.backgroundColor = UIColor.whiteColor()
        
    }
    @IBAction func OctAction(sender: UIButton) {
        
        output.text = runCal.ChangeModeOutput(output.text, fromMode: mode, toMode: 1)
        
        mode = 1 // set the global control


        // disable buttons
        Dec.enabled = true
        Oct.enabled = false
        Bin.enabled = true
        Hex.enabled = true
        A.enabled = false
        B.enabled = false
        C.enabled = false
        D.enabled = false
        E.enabled = false
        F.enabled = false
        two.enabled = true
        three.enabled = true
        four.enabled = true
        five.enabled = true
        six.enabled = true
        seven.enabled = true
        eight.enabled = false
        nine.enabled = false
        point.enabled = false
        mutiply.enabled = false
        divid.enabled = false
        sqrt.enabled = false
        plus_minus.enabled = false
        
        // set button color
        Oct.backgroundColor = UIColor(red: 255, green: 178, blue: 102, alpha: 0.5)
        Dec.backgroundColor = UIColor.whiteColor()
        Bin.backgroundColor = UIColor.whiteColor()
        Hex.backgroundColor = UIColor.whiteColor()
        A.backgroundColor = UIColor.lightGrayColor()
        B.backgroundColor = UIColor.lightGrayColor()
        C.backgroundColor = UIColor.lightGrayColor()
        D.backgroundColor = UIColor.lightGrayColor()
        E.backgroundColor = UIColor.lightGrayColor()
        F.backgroundColor = UIColor.lightGrayColor()
        two.backgroundColor = UIColor.whiteColor()
        three.backgroundColor = UIColor.whiteColor()
        four.backgroundColor = UIColor.whiteColor()
        five.backgroundColor = UIColor.whiteColor()
        six.backgroundColor = UIColor.whiteColor()
        seven.backgroundColor = UIColor.whiteColor()
        eight.backgroundColor = UIColor.lightGrayColor()
        nine.backgroundColor = UIColor.lightGrayColor()
        point.backgroundColor = UIColor.lightGrayColor()
        mutiply.backgroundColor = UIColor.lightGrayColor()
        divid.backgroundColor = UIColor.lightGrayColor()
        sqrt.backgroundColor = UIColor.lightGrayColor()
        plus_minus.backgroundColor = UIColor.lightGrayColor()

    }
    @IBAction func BinAction(sender: UIButton) {
        
        output.text = runCal.ChangeModeOutput(output.text, fromMode: mode, toMode: 2)
        mode = 2 // set the global control

        // disable buttons
        Dec.enabled = true
        Oct.enabled = true
        Bin.enabled = false
        Hex.enabled = true
        A.enabled = false
        B.enabled = false
        C.enabled = false
        D.enabled = false
        E.enabled = false
        F.enabled = false
        two.enabled = false
        three.enabled = false
        four.enabled = false
        five.enabled = false
        six.enabled = false
        seven.enabled = false
        eight.enabled = false
        nine.enabled = false
        point.enabled = false
        mutiply.enabled = false
        divid.enabled = false
        sqrt.enabled = false
        plus_minus.enabled = false
        
        // set button color
        Bin.backgroundColor = UIColor(red: 255, green: 178, blue: 102, alpha: 0.5)
        Dec.backgroundColor = UIColor.whiteColor()
        Oct.backgroundColor = UIColor.whiteColor()
        Hex.backgroundColor = UIColor.whiteColor()
        A.backgroundColor = UIColor.lightGrayColor()
        B.backgroundColor = UIColor.lightGrayColor()
        C.backgroundColor = UIColor.lightGrayColor()
        D.backgroundColor = UIColor.lightGrayColor()
        E.backgroundColor = UIColor.lightGrayColor()
        F.backgroundColor = UIColor.lightGrayColor()
        two.backgroundColor = UIColor.lightGrayColor()
        three.backgroundColor = UIColor.lightGrayColor()
        four.backgroundColor = UIColor.lightGrayColor()
        five.backgroundColor = UIColor.lightGrayColor()
        six.backgroundColor = UIColor.lightGrayColor()
        seven.backgroundColor = UIColor.lightGrayColor()
        eight.backgroundColor = UIColor.lightGrayColor()
        nine.backgroundColor = UIColor.lightGrayColor()
        point.backgroundColor = UIColor.lightGrayColor()
        mutiply.backgroundColor = UIColor.lightGrayColor()
        divid.backgroundColor = UIColor.lightGrayColor()
        sqrt.backgroundColor = UIColor.lightGrayColor()
        plus_minus.backgroundColor = UIColor.lightGrayColor()
        
    }
    @IBAction func HexAction(sender: UIButton) {
        
        output.text = runCal.ChangeModeOutput(output.text, fromMode: mode, toMode: 3)
        mode = 3 // set the global control
 
        // disable buttons
        Dec.enabled = true
        Oct.enabled = true
        Bin.enabled = true
        Hex.enabled = false
        A.enabled = true
        B.enabled = true
        C.enabled = true
        D.enabled = true
        E.enabled = true
        F.enabled = true
        two.enabled = true
        three.enabled = true
        four.enabled = true
        five.enabled = true
        six.enabled = true
        seven.enabled = true
        eight.enabled = true
        nine.enabled = true
        point.enabled = false
        mutiply.enabled = false
        divid.enabled = false
        sqrt.enabled = false
        plus_minus.enabled = false
        
        // set button color
        Hex.backgroundColor = UIColor(red: 255, green: 178, blue: 102, alpha: 0.5)
        Oct.backgroundColor = UIColor.whiteColor()
        Bin.backgroundColor = UIColor.whiteColor()
        Dec.backgroundColor = UIColor.whiteColor()
        A.backgroundColor = UIColor.whiteColor()
        B.backgroundColor = UIColor.whiteColor()
        C.backgroundColor = UIColor.whiteColor()
        D.backgroundColor = UIColor.whiteColor()
        E.backgroundColor = UIColor.whiteColor()
        F.backgroundColor = UIColor.whiteColor()
        two.backgroundColor = UIColor.whiteColor()
        three.backgroundColor = UIColor.whiteColor()
        four.backgroundColor = UIColor.whiteColor()
        five.backgroundColor = UIColor.whiteColor()
        six.backgroundColor = UIColor.whiteColor()
        seven.backgroundColor = UIColor.whiteColor()
        eight.backgroundColor = UIColor.whiteColor()
        nine.backgroundColor = UIColor.whiteColor()
        point.backgroundColor = UIColor.lightGrayColor()
        mutiply.backgroundColor = UIColor.lightGrayColor()
        divid.backgroundColor = UIColor.lightGrayColor()
        sqrt.backgroundColor = UIColor.lightGrayColor()
        plus_minus.backgroundColor = UIColor.lightGrayColor()
    }
    
    // check pressed button and expression is valid
    let number = "0123456789ABCDEF"
    @IBAction func powAction(sender: UIButton) {
        output.text = runCal.CheckInput(output.text, lastc: "pow")
        prevPress = "pow"
    }
    @IBAction func percentAction(sender: UIButton) {

        output.text = runCal.CheckInput(output.text, lastc: "%")
        prevPress = "%"
    }
    @IBAction func logAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "log")
        prevPress = "log"
    }
    @IBAction func multiplyAction(sender: UIButton) {
        output.text = runCal.CheckInput(output.text, lastc: "*")
        prevPress = "*"
    }
    @IBAction func sevenAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "7")
        prevPress = "7"
    }
    @IBAction func eightAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "8")
        prevPress = "8"
    }
    @IBAction func nineAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "9")
        prevPress = "9"
    }
    @IBAction func sqrtAction(sender: UIButton) {
        output.text = runCal.CheckInput(output.text, lastc: "sqrt")
        prevPress = "sqrt"
    }
    @IBAction func fourAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "4")
        prevPress = "4"
    }
    @IBAction func fiveAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "5")
        prevPress = "5"
    }
    @IBAction func sixAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "6")
        prevPress = "6"
    }
    @IBAction func divideAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "/")
        prevPress = "/"
    }
    @IBAction func plusminusAction(sender: UIButton) {
        output.text = runCal.CheckInput(output.text, lastc: "+/-")
        prevPress = "+/-"
    }
    @IBAction func oneAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "1")
        prevPress = "1"
    }
    @IBAction func twoAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "2")
        prevPress = "2"
    }
    @IBAction func threeAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "3")
        prevPress = "3"
    }
    @IBAction func plusAction(sender: UIButton) {
        output.text = runCal.CheckInput(output.text, lastc: "+")
        prevPress = "+"
    }
    @IBAction func pointAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: ".")
        prevPress = "."
    }
    @IBAction func aAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "A")
        prevPress = "A"
    }
    @IBAction func bAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "B")
        prevPress = "B"
    }
    @IBAction func cAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "C")
        prevPress = "C"
    }
    @IBAction func minusAction(sender: UIButton) {
        output.text = runCal.CheckInput(output.text, lastc: "-")
        prevPress = "-"
    }
    @IBAction func parentheseAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "()")
        prevPress = "()"
    }
    @IBAction func dAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "D")
        prevPress = "D"
    }
    @IBAction func eAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "E")
        prevPress = "E"
    }
    @IBAction func fAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "F")
        prevPress = "F"
    }
    @IBAction func zeroAction(sender: UIButton) {
        if prevPress == "="{  // clr output
            self.output.text = ""
        }
        output.text = runCal.CheckInput(output.text, lastc: "0")
        prevPress = "0"
    }
    
    
    @IBAction func deleteAction(sender: UIButton) {
        if output.text != ""{
            self.output.text.removeAtIndex(self.output.text.endIndex.predecessor())
        }
        prevPress = "del"
    }
    @IBAction func ClearAction(sender: UIButton) {
        output.text  = ""
        prevPress = "clr"
    }
    @IBAction func equalAction(sender: UIButton) {
        output.text = runCal.CheckInput(output.text, lastc: "=")
        if output.text != "ERROR"{
            output.text = runCal.Calculate(output.text, mode: mode)
        }
        prevPress = "="
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // disable buttons
        Dec.enabled = false
        Oct.enabled = true
        Bin.enabled = true
        Hex.enabled = true
        A.enabled = false
        B.enabled = false
        C.enabled = false
        D.enabled = false
        E.enabled = false
        F.enabled = false
        two.enabled = true
        three.enabled = true
        four.enabled = true
        five.enabled = true
        six.enabled = true
        seven.enabled = true
        eight.enabled = true
        nine.enabled = true
        point.enabled = true
        mutiply.enabled = true
        divid.enabled = true
        sqrt.enabled = true
        plus_minus.enabled = true
        
        
        // set button color
        Dec.backgroundColor = UIColor(red: 255, green: 178, blue: 102, alpha: 0.5)
        Oct.backgroundColor = UIColor.whiteColor()
        Bin.backgroundColor = UIColor.whiteColor()
        Hex.backgroundColor = UIColor.whiteColor()
        A.backgroundColor = UIColor.lightGrayColor()
        B.backgroundColor = UIColor.lightGrayColor()
        C.backgroundColor = UIColor.lightGrayColor()
        D.backgroundColor = UIColor.lightGrayColor()
        E.backgroundColor = UIColor.lightGrayColor()
        F.backgroundColor = UIColor.lightGrayColor()
        two.backgroundColor = UIColor.whiteColor()
        three.backgroundColor = UIColor.whiteColor()
        four.backgroundColor = UIColor.whiteColor()
        five.backgroundColor = UIColor.whiteColor()
        six.backgroundColor = UIColor.whiteColor()
        seven.backgroundColor = UIColor.whiteColor()
        eight.backgroundColor = UIColor.whiteColor()
        nine.backgroundColor = UIColor.whiteColor()
        point.backgroundColor = UIColor.whiteColor()
        mutiply.backgroundColor = UIColor.whiteColor()
        divid.backgroundColor = UIColor.whiteColor()
        sqrt.backgroundColor = UIColor.whiteColor()
        plus_minus.backgroundColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

