//
//  AppDelegate.swift
//  Bankey
//
//  Created by Juhyun Yun on 2023/06/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // UI를 놓을 수 있는 배경이고 이벤트를 처리함.
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        // key window(window가 여러개 존재할 때, 가장 앞쪽에 배치된 window)로 설정
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
//        window?.rootViewController = LoginViewController()
        window?.rootViewController = OnboardingContainerViewController()
        
        return true
    }
    
}

