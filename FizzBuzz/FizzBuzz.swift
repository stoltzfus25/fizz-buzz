//
//  FizzBuzz.swift
//  FizzBuzz
//
//  Created by Samuel Stoltzfus on 7/31/19.
//  Copyright © 2019 Superior Plastic Products, Inc. All rights reserved.
//

import Foundation

class FizzBuzz {
    var rules: [Rule]

    init(rules: [Rule] = []) {
        self.rules = rules
    }
    
    func play(number: Int) throws -> String {
        guard number > 0 else { throw FizzBuzzError.illegalValue }
        
        for rule in rules {
            if rule.criteria(number) {
                return rule.output
            }
        }
        
        return "\(number)"
    }
}

enum FizzBuzzError: Error {
    case illegalValue
}

struct Rule {
    let criteria: (Int) -> Bool
    let output: String
}
