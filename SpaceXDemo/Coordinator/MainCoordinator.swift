//
//  MainCoordinator.swift
//  SpaceXDemo
//
//  Created by Yusuf  Nacar on 8.08.2021.
//
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = LaunchListViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func navigateTo(with data : LaunchList) {
        let vc = LaunchDetailViewController.instantiate()
        vc.launchList = data
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
