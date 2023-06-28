//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by Juhyun Yun on 2023/06/27.
//

import UIKit

extension UIViewController {
    func setStatusBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithTransparentBackground() // to hide Navigation Bar Line also0
        navBarAppearance.backgroundColor = appColor
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
    }
    
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large) // sf symbol large size
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
