//
//  TabBarController.swift
//  ScooterQuests
//
//  Created by Olka on 09.03.2021.
//

import Foundation
import UIKit


final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemAboutUsNC = UITabBarItem()
        itemAboutUsNC.title = "О нас"
        itemAboutUsNC.image = UIImage(named: "NavBarAbout")
        let aboutUsNC = StartNavigationController()
        aboutUsNC.tabBarItem = itemAboutUsNC
        
        let itemQuestNC = UITabBarItem()
        itemQuestNC.title = "Квест"
        itemQuestNC.image = UIImage(named: "NavBarQuest")
        let questNC = QuestNavigationController()
        questNC.tabBarItem = itemQuestNC
        
        let itemRouteNC = UITabBarItem()
        itemRouteNC.title = "Маршруты"
        itemRouteNC.image = UIImage(named: "NavBarRoute")
        let routeNC = RouteNavigationController()
        routeNC.tabBarItem = itemRouteNC
        
        UITabBar.appearance().tintColor = UIColor(named: "blueColor")
        
        self.viewControllers = [aboutUsNC, questNC, routeNC]
        self.selectedViewController = aboutUsNC
    }
}
