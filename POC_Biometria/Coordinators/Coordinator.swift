//
//  Coordinator.swift
//  POC_Biometria
//
//  Created by lucas.silva on 23/05/22.
//
import UIKit

public protocol Coordinator {
    var childsCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
