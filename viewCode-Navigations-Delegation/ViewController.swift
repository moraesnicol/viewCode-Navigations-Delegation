//
//  ViewController.swift
//  viewCode-Navigations-Delegation
//
//  Created by Gabriel on 09/09/21.
//

import UIKit

//Create protocol to update title

protocol TitleDelegate: AnyObject {
    func changeTitle(newTitle: String)
}


class ViewController: UIViewController {
    
    private var pushButton  = UIButton()
    private var presentButton = UIButton()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        title = "Home"
        setupPushButton()
        setupPresentButton()
        setupViews()
    }
    
    func setupPushButton() {
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        pushButton.setTitle("Push", for: .normal)
        pushButton.setTitleColor(.black, for: .normal)
        pushButton.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        pushButton.layer.cornerRadius = 4
        pushButton.addTarget(self, action: #selector(pushViewControlllerButtonPressed), for: .touchUpInside)
        view.addSubview(pushButton)
    }
    
    func setupPresentButton() {
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        presentButton.setTitle("Present", for: .normal)
        presentButton.setTitleColor(.black, for: .normal)
        presentButton.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        presentButton.layer.cornerRadius = 4
        presentButton.addTarget(self, action: #selector(presentViewControlllerButtonPressed), for: .touchUpInside)
        view.addSubview(presentButton)
    }
    
    func setupViews(){
        NSLayoutConstraint.activate([
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushButton.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -6),
            pushButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
            pushButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        NSLayoutConstraint.activate([
           presentButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           presentButton.topAnchor.constraint(equalTo: pushButton.bottomAnchor, constant: 12),
           presentButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
           presentButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    
    @objc func pushViewControlllerButtonPressed() {
        let pushViewController = PushViewController()
        navigationController?.pushViewController(pushViewController, animated: true)
    }
    
    @objc func presentViewControlllerButtonPressed() {
        let presentViewController = PresentViewController(placeholder: navigationController?.title ?? "")
        presentViewController.delegate = self
        self.present(presentViewController, animated: true, completion: nil)
    }
    
}


extension ViewController: TitleDelegate {
    
    func changeTitle(newTitle: String) {
        title  = newTitle
    }
}
