//
//  AppDelegate.swift
//  Bankey
//
//  Created by 이승민 on 5/5/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        
        window?.rootViewController = loginViewController
//        window?.rootViewController = OnboardingContainerViewController()
//        window?.rootViewController = OnboardingViewController()
        
        return true
    }
    
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        print("foo - 로그인 완료")
    }
}
