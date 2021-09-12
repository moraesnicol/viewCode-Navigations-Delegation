//
//  PresentViewController.swift
//  viewCode-Navigations-Delegation
//
//  Created by Gabriel on 09/09/21.
//

import UIKit

class PresentViewController: UIViewController {
    
    weak var delegate: TitleDelegate?
    
    private var button = UIButton()
    private var label = UILabel()
    private var textField = UITextField()
    
    var placeholderText: String!
    
    init(placeholder: String) {
        self.placeholderText = placeholder
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.text = placeholderText
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        view.addSubview(textField)
        setupLabel()
        setupButton()
        setupConstraints()
    }
    func setupLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Present"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        
        view.addSubview(label)
    }
    
    func setupButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 4
        view.addSubview(button)
        button.addTarget(self, action: #selector(dissmissViewController), for: .touchUpInside)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12),
            button.widthAnchor.constraint(equalToConstant: 120),
            button.heightAnchor.constraint(equalToConstant: 32),
        ])
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24),
            textField.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 32),
        ])
    }
    
    @objc func dissmissViewController(){
        delegate?.changeTitle(newTitle: textField.text ?? placeholderText)
        self.dismiss(animated: true, completion: nil)
    }
}
