//
//  LocalState.swift
//  Bankey
//
//  Created by 이승민 on 5/10/24.
//

import UIKit

public class LocalState {
    
    private enum Keys: String {
        case hasOnboarded // 온보딩 여부
    }
    
    public static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
