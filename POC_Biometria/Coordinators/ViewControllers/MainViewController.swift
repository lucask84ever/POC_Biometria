//
//  MainViewController.swift
//  POC_Biometria
//
//  Created by lucas.silva on 23/05/22.
//
import UIKit
import SnapKit
import LocalAuthentication

class MainViewController: UIViewController {
    lazy var buttonLogin: UIButton! = {
        let loginButton = UIButton()
        loginButton.layer.cornerRadius = 26
        loginButton.layer.borderWidth = 2
        loginButton.layer.borderColor = UIColor.black.cgColor
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.black, for: .normal)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.proceedLogin))
        loginButton.addGestureRecognizer(tap)
        return loginButton
    }()
    
    var coordinator: MainCoordinator?
    
    // MARK: - view cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add any setup here
        self.view.backgroundColor = .white
        setup()
    }
}

//MARK: - Add To view
extension MainViewController: DesignProtocol {
    func layoutViews() {
        buttonLogin.snp.makeConstraints { [unowned self] make in
            make.width.equalToSuperview().offset(-40)
            make.height.equalTo(52)
            make.bottom.equalTo(self.view.snp_bottomMargin).offset(-20)
            make.centerX.equalToSuperview()
        }
    }
    
    func setup() {
        view.addSubview(buttonLogin)
        layoutViews()
    }
}

extension MainViewController {
    @objc func proceedLogin() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let reason = "Are you the owner?"
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { [weak self] success, error in
                DispatchQueue.main.async {
                    if success {
                        self?.coordinator?.showAlertLogged()
                    } else {
                        if let error = error {
                            print(error)
                        }
                    }
                }
            }
        }
    }
}
