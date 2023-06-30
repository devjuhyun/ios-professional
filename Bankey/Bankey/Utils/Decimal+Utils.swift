//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Juhyun Yun on 2023/06/30.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        // Decimal -> Double
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
