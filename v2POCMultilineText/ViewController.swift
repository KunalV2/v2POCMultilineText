//
//  ViewController.swift
//  v2POCMultilineText
//
//  Created by Kunal Parekh on 06/11/17.
//  Copyright © 2017 v2soltions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textViewMultiline: FNSTextView!
    @IBOutlet weak var labelMultiline: UILabel!
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    
    var selctedTextType = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.intializeTextViewAndLabel()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
    @IBAction func textCClicked(_ sender: Any) {
        self.setMultiLineTextWithNewLinesAndLink()
    }
    
    @IBAction func textBClicked(_ sender: Any) {
        self.setMultilineTextA()
    }
    
    @IBAction func textAClicked(_ sender: Any) {
        self.setMultiLineText()
    }
    
    func intializeTextViewAndLabel(){
        
        // TextView intialization
        
        //self.textViewMultiline.textContainer.maximumNumberOfLines = 0
        self.textViewMultiline.dataDetectorTypes = .link
        self.textViewMultiline.isEditable = false
      //  self.textViewMultiline.isSelectable = false
        
      //  self.textViewMultiline.textContainer.lineBreakMode = .byTruncatingTail
     //   self.textViewMultiline.textContainer.heightTracksTextView = true
        
        // Label intialization
        
        self.labelMultiline.numberOfLines = 0
        self.labelMultiline.lineBreakMode = .byTruncatingTail
        
        
        let textviewTap = UITapGestureRecognizer(target: self, action: #selector(self.textViewTapped))
        textviewTap.numberOfTapsRequired = 1
        self.textViewMultiline.addGestureRecognizer(textviewTap)
        
       // self.setMultiLineTextWithLink()
        
    }
    
    
    func textViewTapped(){
        
        if self.textViewHeightConstraint.constant == 58{
            self.textViewMultiline.isShrink = false
            self.textViewHeightConstraint.constant = 300
           // self.textViewMultiline.layoutIfNeeded()
        }
        else{
            self.textViewMultiline.isShrink = true
            self.textViewHeightConstraint.constant = 58
           // self.textViewMultiline.layoutIfNeeded()
        }
        
        switch selctedTextType {
        case 0:
            self.setMultiLineText()
        case 1:
            self.setMultilineTextA()
        case 2:
            self.setMultiLineTextWithNewLinesAndLink()
        default:
            self.setMultiLineTextWithNewLinesAndLink()
        }
        
    }
    
    func setMultiLineText(){
        selctedTextType = 0
        self.textViewMultiline.isTextModified = false
        self.textViewMultiline.text = "Lorem ipsum dolor sit er \nLorem ipsum dolor sit er \n cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        
        self.labelMultiline.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    }
    
    func setMultiLineTextWithLink(){
        selctedTextType = 1
        self.textViewMultiline.isTextModified = false
        self.textViewMultiline.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. http://google.com . Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        
        self.labelMultiline.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. http://google.com . Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    }
    
    func setMultiLineTextWithNewLinesAndLink(){
        selctedTextType = 2
        self.textViewMultiline.isTextModified = false
        self.textViewMultiline.text = "jdjdjsjskkskdkdkd\n\ndmdkdk\nhttp://www.g@b.com"
        
        self.labelMultiline.text = "jdjdjsjskkskdkdkd\n\ndmdkdk\nhttp://g@b.com"
    }

    
    func setMultilineTextA(){
        selctedTextType = 1
        self.textViewMultiline.isTextModified = false
        self.textViewMultiline.text = "gxncjd sfkdgjstj afjdhkfy dgjstjt c xahg🤕🤮🤧🤕🤮🤕😺🙈💩😸😺😸👽jfjfjgkgkgk gmqhktktj\nfjjdfnnffj\nfnfncncn\nfjjfnffn\nfmnfncfm"
        
        self.labelMultiline.text = "gxncjd sfkdgjstj afjdhkfy dgjstjt c xahg🤕🤮🤧🤕🤮🤕😺🙈💩😸😺😸👽jfjfjgkgkgk gmqhktktj\nfjjdfnnffj\nfnfncncn\nfjjfnffn\nfmnfncfm"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
