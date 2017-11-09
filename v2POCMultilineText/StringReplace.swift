//
//  StringReplace.swift
//  v2POCMultilineText
//
//  Created by Kunal Parekh on 09/11/17.
//  Copyright © 2017 v2soltions. All rights reserved.
//

import Foundation


extension String
{
    func stringByReplacingFirstOccurrenceOfString(
        target: String, withString replaceString: String) -> String
    {
        if let range = self.range(of: target) {
            return self.replacingCharacters(in: range, with: replaceString)
        }
        return self
    }
}
