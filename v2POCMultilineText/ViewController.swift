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
    
    var stringArray = [String]()
    var nextRecordIndex = 0
    var currentRecordIndex = 0
    
    var selctedTextType = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.intializeTextViewAndLabel()
        self.initializeArray()
    }
    
    @IBAction func changeText(_ sender: Any) {
        if nextRecordIndex > 0 && nextRecordIndex >= stringArray.count{
            nextRecordIndex = 0
        }
        
        if nextRecordIndex < stringArray.count{
            
            currentRecordIndex = nextRecordIndex
            
            self.textViewMultiline.isTextModified = false
            self.textViewMultiline.text = stringArray[nextRecordIndex]
            self.labelMultiline.text = stringArray[nextRecordIndex]
            
            nextRecordIndex = nextRecordIndex + 1
        }
    }
    
    func textViewTapped(){
        
        if self.textViewHeightConstraint.constant == 58{
            self.textViewMultiline.isShrink = false
            self.textViewHeightConstraint.constant = 270
        }
        else{
            self.textViewMultiline.isShrink = true
            self.textViewHeightConstraint.constant = 58
        }
        
        self.textViewMultiline.isTextModified = false
        self.textViewMultiline.text = stringArray[currentRecordIndex]
        self.labelMultiline.text = stringArray[currentRecordIndex]
    }

    // MARK: - View Intialization methods

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
    }
    
    func initializeArray() {
        
        stringArray = ["Lorem ipsum dolor sit er \nLorem ipsum dolor sit er \n cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
                        "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. http://google.com . Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
                        "jdjdjsjskkskdkdkd\n\ndmdkdk\nhttp://www.g@b.com",
                        "gxncjd sfkdgjstj afjdhkfy dgjstjt c xahg🤕🤮🤧🤕🤮🤕😺🙈💩😸😺😸👽jfjfjgkgkgk gmqhktktj\nfjjdfnnffj\nfnfncncn\nfjjfnffn\nfmnfncfm",
                        "Line A\n\nLine B\nLine C\nLineD",
                        "Line 1\nLine 2\nLine3\nLine4",
                        "hiiii🌸🌸🌸🌸",
                        "Hey guys&#8230;&#8230;.",
                        "Line&#8230;",
                        "gxncjd sfkdgjstj afjdhkfy dgjstjt c xahg🤕🤮🤧🤕🤮🤕😺🙈💩😸😺😸👽jfjfjgkgkgk gmqhktktj\nfjjdfnnffj\nfnfncncn\nfjjfnffn\nfmnfncfm",
                        "My life motto is \'Do my best, so that I can\'t blame myself for anything.\'",
                        "*+=•_\\|~.,<>$£€^%#",
                        "ADHM&#8230;&#8230;&#8230;",
                        "\"2345\"\n\'Hfhvh\'\n?.;:/-()₹?!,",
                        "My life motto is \'Do my best, so that I can\'t blame myself for anything.\'",
                        "Hello all my \n\nHello all my friends \nHey hey there you go to the game and get the app",
                        "Hello all my friends \nHello all my friends \nHey hey there you go to the game and get the app",
                        "Nobody can predict the future. You just have to give your all to the relationship you\'re in and do your best to take care of your partner, communicate and give them every last drop of love you have. I think one of the most important things in a relationship is caring for your significant other through good times and bad.",
                        "sgsbhshssddddndk\ns\nd\nddndkdkkekeos\nb@b.com",
                        "t\nh\ng\ng\nt\ng\n",
                        "Hello all&#8230;\nGood afternoon&#8230;.",
                        "\n\n\n\n\n\n\n\n\n\n\n\n\nNo of lines entered",
                        "feed post simple text \n\n\n&#8212; regards\n ios",
                        "\n\n\n\n\n\n\n\n\n\n\n\n\nhello guys welcome to new video of all time with friends on my new video video of my new video video for a great video post from a great.",
                        "Ig7c9bjk0 \nIjb9nk0\n7fxc8yv9\nx8g9hnk0l\np\nxgom\nthej\nbnkkjithesametimeb the same time as the first \n time buyers are you looking for an experienced and k the initiative knowbut Iamlookingnthefirst3%ofafewweeks ,[[bebbookbutbythen I have \n\nthej"
            
        ]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
