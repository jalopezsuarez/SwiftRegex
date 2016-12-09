//
//  ViewController.swift
//  SwiftRegex
//
//  Created by John Holdsworth on 26/06/2014.
//  Copyright (c) 2014 John Holdsworth. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
                            
    @IBOutlet var input : UITextView!
    @IBOutlet var regex : UITextField!
    @IBOutlet var groups : UITextView!
    @IBOutlet var replace : UITextField!
    @IBOutlet var result : UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        regexChanged(nil)
    }

    @IBAction func regexChanged(_ sender : UITextField!) {
        sender?.resignFirstResponder()
        let text = input.text!
        let gps = text[regex.text!].allGroups()
        groups.text = "\(gps)"
        replaceChanged(sender)
    }

    @IBAction func replaceChanged(_ sender : UITextField!) {
        sender?.resignFirstResponder()
        let mtext = NSMutableString(string: input.text)
        mtext[regex.text!] ~= replace.text!
        result.text = mtext as String
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

