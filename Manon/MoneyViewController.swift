//
//  MoneyViewController.swift
//  Manon
//
//  Created by Jimmy on 2023/10/12.
//

import UIKit

class MoneyFieldController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self

//        initUI()

        // Do any additional setup after loading the view.
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */

//    func initUI() {
//        self.view.addSubview(placeHolderLabel)
//        self.view.addSubview(emailTextField)
//    }
//
    
    let emailTextField: UITextField = {
        var field = UITextField()
        field.text = "₩ \(10000) 원"
        field.translatesAutoresizingMaskIntoConstraints = false

        return field
    }()
}

extension MoneyFieldController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {}

    func textFieldDidEndEditing(_ textField: UITextField) {}

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
