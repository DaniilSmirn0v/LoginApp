//
//  ViewController.swift
//  LoginApp
//
//  Created by Даниил Смирнов on 16.02.2022.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!

    let userInfo = User.getInfo()

    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else {return}
        for viewController in tabBarController.viewControllers! {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.userName = userInfo.person.fullname
            }

            if let navigationVC = viewController as? UINavigationController {
                let infoUserVC = navigationVC.topViewController as? InfoViewController
                infoUserVC?.info = userInfo.person
            }
        }

    }

    @IBAction func loginAction() {
        if userNameTF.text != userInfo.userName || passwordTF.text != userInfo.password {
            showAlert(title: "Incorrect data entry", message: "Enter correct Login or Password", textField: passwordTF)
            return
        }
        performSegue(withIdentifier: "welcome", sender: nil)
    }
    
    @IBAction func forgotNameAction(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Forgotten login", message: "Login - User😉")
        : showAlert(title: "Forgotten password", message: "Password - Password😉")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTF.text = ""
        passwordTF.text = ""
    }
}

extension LoginViewController {
    //создание универсального алерта
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension LoginViewController: UITextFieldDelegate {
    //скрытие клавиатуры путем тапа по экрану
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Перемещаем курсор из первого Текстового поля, в следующее, путем нажатия кнопки done на клавиатуре
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginAction()
        }
        return true
    }
}

