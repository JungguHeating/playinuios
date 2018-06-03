//
//  ViewController.swift
//  INULand
//
//  Created by Cho on 2018. 5. 29..
//  Copyright © 2018년 Cho. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        signInButtonInitialize()

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func signInButtonInitialize() {
        
        signInButton.layer.cornerRadius = signInButton.frame.size.height/2
        signInButton.layer.masksToBounds = true
        
        let buttonGradient = CAGradientLayer()
        buttonGradient.frame = signInButton.bounds
        buttonGradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        buttonGradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        buttonGradient.colors = [UIColor.init(red: 84/255, green: 125/255, blue: 227/255, alpha: 1.0).cgColor, UIColor.init(red: 102/255, green: 144/255, blue: 228/255, alpha: 1.0).cgColor]
        self.signInButton.layer.addSublayer(buttonGradient)
        signInButton.titleLabel?.text = "로그인"
        
    }

}

