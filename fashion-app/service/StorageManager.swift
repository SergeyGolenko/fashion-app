//
//  StorageManager.swift
//  fashion-app
//
//  Created by Сергей Голенко on 14.01.2021.
//

import Foundation

class StorageManager{
    
    enum Key: String{
        case onboardingSeen
    }
    
    func isOnboardingSeen() -> Bool {
        UserDefaults.standard.bool(forKey: Key.onboardingSeen.rawValue)
    }
    
    func setOnboardingSeen() {
        UserDefaults.standard.set(true, forKey: Key.onboardingSeen.rawValue)
    }
    
    func resetOnboardingSeen() {
        UserDefaults.standard.set(false, forKey: Key.onboardingSeen.rawValue)
    }
    
    
}
