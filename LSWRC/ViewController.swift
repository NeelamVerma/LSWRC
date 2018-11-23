//
//  ViewController.swift
//  LSWRC
//
//  Created by Neelam Verma on 22/11/18.
//  Copyright © 2018 Neelam Verma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var result = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        print(lengthOfLongestSubstring("dvdf"))
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var tempStr = ""
        for ch in s {
            if !tempStr.contains(ch) {
                tempStr += String(ch)
            } else {
                let rangeq: Range<String.Index> = tempStr.range(of: String(ch))!
                let location = tempStr.distance(from: tempStr.startIndex, to: rangeq.upperBound)
                let index = s.index(s.endIndex, offsetBy: location - s.count)
                let sub = s.suffix(from: index)
                let nextCount = lengthOfLongestSubstring(String(sub))
                result = tempStr.count
                if nextCount >= result {
                    result = nextCount
                }
                return result
            }
        }
        return result > tempStr.count ? result : tempStr.count
    }
}
