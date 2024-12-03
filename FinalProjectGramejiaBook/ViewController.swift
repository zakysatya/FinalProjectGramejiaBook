//
//  ViewController.swift
//  FinalProjectGramejiaBook
//
//  Created by prk on 12/3/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    // Sample User Data
     let users: [User] = [
         User(username: "admin", password: "admin123", role: "admin"),
         User(username: "user1", password: "user123", role: "user"),
         User(username: "user2", password: "user456", role: "user")
     ]
    
    @IBAction func OnClickLogin(_ sender: Any) {
        guard let username = usernameTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            errorLabel.text = "Please fill in all fields."
            errorLabel.isHidden = false
            return
        }
        
        // Authenticate User
        if let user = authenticateUser(username: username, password: password) {
            navigateToHome(for: user)
        } else {
            errorLabel.text = "Invalid username or password."
            errorLabel.isHidden = false
        }
    }
    
    // Authentication Function
    func authenticateUser(username: String, password: String) -> User? {
        return users.first { $0.username == username && $0.password == password }
    }
    
    // Navigate Based on Role
    func navigateToHome(for user: User) {
        if user.role == "admin" {
            // Navigate to Admin Home View
            let adminVC = storyboard?.instantiateViewController(withIdentifier: "AdminHomeViewController") as! AdminHomeViewController
            self.navigationController?.pushViewController(adminVC, animated: true)
        } else if user.role == "user" {
            // Navigate to User Home View
            let userVC = storyboard?.instantiateViewController(withIdentifier: "UserHomeViewController") as! UserHomeViewController
            self.navigationController?.pushViewController(userVC, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        errorLabel.isHidden = true
    }

    
}

