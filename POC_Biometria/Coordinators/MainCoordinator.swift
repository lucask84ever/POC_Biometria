//
//  MainCoordinator.swift
//  POC_Biometria
//
//  Created by lucas.silva on 23/05/22.
//
import UIKit

class MainCoordinator: Coordinator {
    var childsCoordinators: [Coordinator]
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.childsCoordinators = []
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = MainViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showAlertLogged() {
        let alert = UIAlertController(title: "Login", message: "Carregando configurações", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Ok", style: .default) { [weak self] _ in
            self?.showLoggedArea()
        }
        alert.addAction(okAction)
        self.navigationController.present(alert, animated: true, completion: nil)
    }
    
    func showLoggedArea() {
        let second = SecondCoordinator(navigationController: navigationController)
        second.start()
    }
}
