//
//  ViewController.swift
//  v2POCMultilineText
//
//  Created by Kunal Parekh on 06/11/17.
//  Copyright © 2017 v2soltions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textViewMultiline: UITextView!
    @IBOutlet weak var labelMultiline: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.intializeTextViewAndLabel()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func intializeTextViewAndLabel(){
        
        // TextView intialization
        
        self.textViewMultiline.textContainer.maximumNumberOfLines = 0
        self.textViewMultiline.dataDetectorTypes = .link
        self.textViewMultiline.textContainer.lineBreakMode = .byTruncatingTail
        self.textViewMultiline.textContainer.heightTracksTextView = true
        
        // Label intialization
        
        self.labelMultiline.numberOfLines = 0
        self.labelMultiline.lineBreakMode = .byTruncatingTail
        
        self.setMultiLineTextWithNewLinesAndLink()
        
    }
    
    func setMultiLineText(){
        self.textViewMultiline.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        
        self.labelMultiline.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    }
    
    func setMultiLineTextWithLink(){
        self.textViewMultiline.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. http://google.com . Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        
        self.labelMultiline.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. http://google.com . Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
    }
    
    func setMultiLineTextWithNewLinesAndLink(){
        self.textViewMultiline.text = "jdjdjsjskkskdkdkd\ndmdkdk\nhttp://g@b.com"
        
        self.labelMultiline.text = "jdjdjsjskkskdkdkd\n\ndmdkdk\nhttp://g@b.com"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

