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
    var isTextModified = false
    var isShrink = false
    private var glyphRangeArray = [NSRange]()
    private var lineRectArray = [CGRect]()
    private var usedRectArray = [CGRect]()
    
    override var text: String! {

        didSet {
            if !isTextModified && isShrink{
                modifiedText = self.text
                glyphRangeArray.removeAll()
                self.layoutManager.enumerateLineFragments(forGlyphRange: NSMakeRange(0, layoutManager.numberOfGlyphs), using: {
                    (lineRect: CGRect, usedRect: CGRect, textContainer: NSTextContainer!, glyphRange: NSRange, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
                    self.glyphRangeArray.append(glyphRange)
                    self.lineRectArray.append(lineRect)
                    self.usedRectArray.append(usedRect)
                })
                
                // 
                
                if glyphRangeArray.count > 2 {
                    
                    let secondGlyphRange = glyphRangeArray[1]
                    
                    if (self.text as NSString).substring(with: secondGlyphRange) == "\n"{
                        
                        let firstGlyphRange = glyphRangeArray[0]
                        let firstLineRect = lineRectArray[0]
                        let firstUsedRect = usedRectArray[0]                        
                        
                        var subString = (self.text as NSString).substring(with: firstGlyphRange)
                        subString = subString.trimmingCharacters(in: .whitespacesAndNewlines)
                        
                        if (firstLineRect.size.width - firstUsedRect.size.width) > 30{
                           // var appendString2 = subString+"..."
                            modifiedText = modifiedText.replacingOccurrences(of: subString, with: subString+"...")
                            isTextModified = true
                            self.text = modifiedText
                        }
                        else{
                            let subNSString = subString as NSString
                            let replaceString = subNSString.substring(to: subNSString.length - 3)
                            modifiedText = modifiedText.replacingOccurrences(of: subString, with: replaceString+"...")
                            isTextModified = true
                            self.text = modifiedText
                        }
                    }
                    else{
                     
                        var secondGlyphRange = glyphRangeArray[1]
                        let secondLineRect = lineRectArray[1]
                        let secondUsedRect = usedRectArray[1]
                        var subString = (self.text as NSString).substring(with: secondGlyphRange)
                        var isStringContainsNewLine = false
                        
                        if subString.contains("\n"){
                            isStringContainsNewLine = true
                        }
                        
                        let sNSString = subString as NSString
                        let lastString = sNSString.substring(to: sNSString.length - 1)
                        
                        print("Last string:- \(lastString)")
                        
                        subString = subString.trimmingCharacters(in: .whitespacesAndNewlines)
                        
                        if (secondLineRect.size.width - secondUsedRect.size.width) > 30{
//                            var appendString2 = subString+"..."
                            
                        //    let subNSString = subString as NSString
                           // var replaceString = subNSString.substring(to: subNSString.length - 3)
                            secondGlyphRange.length = secondGlyphRange.location + 1
                          //  var replaceString = subString+"...           "
                            
                            if isStringContainsNewLine{
                                modifiedText = (modifiedText as NSString).replacingCharacters(in: secondGlyphRange, with: subString+"... \n")
                                
                            }
                            else{
                                modifiedText = (modifiedText as NSString).replacingCharacters(in: secondGlyphRange, with: subString+"...           ")
                            }

                            isTextModified = true
                            self.text = modifiedText
                        }
                        else{
                            let subNSString = subString as NSString
                            var replaceString = subNSString.substring(to: subNSString.length - 3)
                            secondGlyphRange.length = secondGlyphRange.location + 1
                            
                            
                            replaceString = replaceString+"... "
                            
                            
                            if isStringContainsNewLine{
                                modifiedText = (modifiedText as NSString).replacingCharacters(in: secondGlyphRange, with: subString+"... \n")
                                
                            }
                            else{
                                modifiedText = (modifiedText as NSString).replacingCharacters(in: secondGlyphRange, with: replaceString)
                            }
                            
                            isTextModified = true
                            self.text = modifiedText
                        }
                        
                    }
                }
            }
        }
    }
}
