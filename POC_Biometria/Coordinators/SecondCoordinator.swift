//
//  SecondCoordinator.swift
//  POC_Biometria
//
//  Created by lucas.silva on 23/05/22.
//

import UIKit

class SecondCoordinator: Coordinator {
    var childsCoordinators: [Coordinator]
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.childsCoordinators = []
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SecondViewController()
        vc.coordinator = self
        vc.navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func logout() {
        
        let alert = UIAlertController(title: "Logout", message: "Nos vemos em breve!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Deslogar", style: .destructive) { [weak self] _ in
            self?.navigationController.popToRootViewController(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Continuar logado", style: .default, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        navigationController.present(alert, animated: true, completion: nil)
    }
}
