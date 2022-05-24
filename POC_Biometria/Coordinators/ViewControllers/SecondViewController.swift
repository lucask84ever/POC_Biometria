//
//  SecondViewController.swift
//  POC_Biometria
//
//  Created by lucas.silva on 23/05/22.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    var coordinator: SecondCoordinator?
    
    lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Você está logado!"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    lazy var logoutButton: UIButton! = {
        let loginButton = UIButton(type: .custom)
        loginButton.layer.cornerRadius = 26
        loginButton.layer.borderWidth = 2
        loginButton.layer.borderColor = UIColor.white.cgColor
        loginButton.setTitle("Logout", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.logout))
        loginButton.addGestureRecognizer(tap)
        return loginButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
        setup()
    }
}

extension SecondViewController: DesignProtocol {
    func layoutViews() {
        helloLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().offset(-40)
            make.height.equalTo(32)
        }
        
        logoutButton.snp.makeConstraints { [unowned self] make in
            make.width.equalToSuperview().offset(-40)
            make.height.equalTo(52)
            make.centerY.equalTo(self.view.snp.bottom).offset(-52)
            make.centerX.equalToSuperview()
        }
    }
    
    func setup() {
        view.addSubview(helloLabel)
        view.addSubview(logoutButton)
        layoutViews()
    }
}

extension SecondViewController {
    @objc func logout() {
        coordinator?.logout()
    }
}
