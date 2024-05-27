//
//  DecimalUtils.swift
//  Bankey
//
//  Created by 이승민 on 5/27/24.
//

import UIKit

extension Decimal {
    var doubleValue: Double { // 계산 속성
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
