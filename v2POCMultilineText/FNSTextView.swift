//
//  FNSTextView.swift
//  v2POCMultilineText
//
//  Created by Kunal Parekh on 09/11/17.
//  Copyright © 2017 v2soltions. All rights reserved.
//

import UIKit

class FNSTextView: UITextView {
    
    private var modifiedText: String = ""
    private var madeTruncateString = false
    private var glyphRangeArray = [NSRange]()
    private var lineRectArray = [CGRect]()
    private var usedRectArray = [CGRect]()
    
    override var text: String! {

        didSet {
            
            if !madeTruncateString{
                
                modifiedText = self.text
                glyphRangeArray.removeAll()
                self.layoutManager.enumerateLineFragments(forGlyphRange: NSMakeRange(0, layoutManager.numberOfGlyphs), using: {
                    (lineRect: CGRect, usedRect: CGRect, textContainer: NSTextContainer!, glyphRange: NSRange, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
                    
                    self.glyphRangeArray.append(glyphRange)
                    self.lineRectArray.append(lineRect)
                    self.usedRectArray.append(usedRect)
                    
                    print("Line rect \(lineRect)")
                    print("Used rect \(usedRect)")
                    print("First line \((self.text as NSString).substring(with: glyphRange))")
                    print("Range : \(glyphRange.location) , \(glyphRange.length)")
                })
                
                if glyphRangeArray.count > 2 && self.frame.size.height <= 58{
                    
                    let secondGlyphRange = glyphRangeArray[1]
                    
                    if (self.text as NSString).substring(with: secondGlyphRange) == "\n"{
                        let firstGlyphRange = glyphRangeArray[0]
                        let firstLineRect = lineRectArray[0]
                        let firstUsedRect = usedRectArray[0]
                        
                        if (firstLineRect.size.width - firstUsedRect.size.width) > 30{
                            
                            var subString = (self.text as NSString).substring(with: firstGlyphRange)
                            subString = subString.trimmingCharacters(in: .whitespacesAndNewlines)
                            var appendString2 = subString+"..."
                            
                            modifiedText = modifiedText.replacingOccurrences(of: subString, with: appendString2)
                            
                           //  modifiedText = modifiedText.stringByReplacingFirstOccurrenceOfString(target:subString , withString: appendString2)
                            madeTruncateString = true
                            self.text = modifiedText
                        }
                        else{
                            
                        }
                    }
                    else{
                     
                        let secondGlyphRange = glyphRangeArray[1]
                        let secondLineRect = lineRectArray[1]
                        let secondUsedRect = usedRectArray[1]
                        
                        if (secondLineRect.size.width - secondUsedRect.size.width) > 30{
                            
                            var subString = (self.text as NSString).substring(with: secondGlyphRange)
                            subString = subString.trimmingCharacters(in: .whitespacesAndNewlines)
                            var appendString2 = subString+"..."
                            
                            modifiedText = modifiedText.replacingOccurrences(of: subString, with: appendString2)
                            
                            //  modifiedText = modifiedText.stringByReplacingFirstOccurrenceOfString(target:subString , withString: appendString2)
                            madeTruncateString = true
                            self.text = modifiedText
                        }
                        else{
                            
                        }
                        
                    }
                }
            }
        }
    }
}
