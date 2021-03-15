//
//  NavigationController.swift
//  ScooterQuests
//
//  Created by Olka on 08.03.2021.
//

import Foundation
import UIKit


final class StartNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = StartPageViewController()
        self.pushViewController(vc, animated: true)
    }
}

final class QuestNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = QuestViewController()
        self.pushViewController(vc, animated: true)
    }
}

final class RouteNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc = RouteViewController()
        self.pushViewController(vc, animated: true)
    }
}

