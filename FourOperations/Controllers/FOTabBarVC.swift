//
//  FOTabBarVC.swift
//  FourOperations
//
//  Created by Mutlu Aydin on 11/10/22.
//

import UIKit

class FOTabBarVC: UITabBarController {
    
    private let attributes = [NSAttributedString.Key.font:UIFont(name: FOFont.textFontNormal, size: 20)]
    private let titleAttributes = [NSAttributedString.Key.font:UIFont(name: FOFont.textFontBold, size: 25)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        additionalSafeAreaInsets.bottom = 10

        UITabBar.appearance().tintColor = FOColors.textColorH
        UITabBar.appearance().unselectedItemTintColor = FOColors.textColorL
        UITabBar.appearance().backgroundColor =  FOColors.buttonColor
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 0)
        UITabBarItem.appearance().setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 8)
        setViewControllers([createHomeNavigationController(),createStatsNavigationController()], animated: true)
    }
    
    // Home tab
    func createHomeNavigationController() -> UINavigationController {
        let homeVC = HomeVC()
        homeVC.title = "Home".withOneSixthEmSpacing
        homeVC.tabBarItem.tag = 0
        homeVC.tabBarItem.image = UIImage(systemName: "play")!.withBaselineOffset(fromBottom: UIFont.systemFontSize / 2)
        return UINavigationController(rootViewController: homeVC)
    }
    
    // Statistic tab
    func createStatsNavigationController() -> UINavigationController {
        let statsVC = SettingVC()
        statsVC.title = "Settings".withOneSixthEmSpacing
        statsVC.tabBarItem.tag = 1
        statsVC.tabBarItem.image = UIImage(systemName: "chart.bar")?.withBaselineOffset(fromBottom: UIFont.systemFontSize / 2)
        return UINavigationController(rootViewController: statsVC)
    }
    
   
}

extension String {
  var withOneSixthEmSpacing: String {
    let letters = Array(self)
    return letters.map { String($0) + "\u{2008}" }.joined()
  }


}
