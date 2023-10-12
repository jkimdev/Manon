//
//  MainViewController.swift
//  Manon
//
//  Created by Jimmy on 2023/10/12.
//

import UIKit

class MainViewController: UIViewController {
    let calendar = CalendarViewController()
    let money = MoneyFieldController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
                        
        initUI()
        loadCalendar()
        // Do any additional setup after loading the view.
    }
    
    func initUI() {
        applyConstraints()
//        testButton.addTarget(self, action: #selector(setBtnTap), for: .touchUpInside)
    }
    
    let label: UILabel = {
        var label = UILabel()
        label.text = "MANON"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
//    let testButton: UIButton = {
//        var button = UIButton(type: .system)
//        button.setTitle("버튼", for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//
//        return button
//    }()
//
//    @objc
//    func setBtnTap() {}
    
    fileprivate func loadCalendar() {
        calendar.setCalendar()
        calendar.reloadDateView(date: Date())
    }
    
    fileprivate func applyConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        self.addChild(calendar)
        self.addChild(money)

        self.view.addSubview(label)
        self.view.addSubview(money.emailTextField)
//        self.view.addSubview(testButton)
        self.view.addSubview(calendar.dateView)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            
//            testButton.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
//            testButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            money.emailTextField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            money.emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            calendar.dateView.topAnchor.constraint(equalTo: money.emailTextField.bottomAnchor, constant: 16),
            calendar.dateView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])
    }
}
