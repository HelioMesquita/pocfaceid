//
//  ViewController.swift
//  POCFaceID
//
//  Created by Hélio Mesquita on 29/07/20.
//  Copyright © 2020 Hélio Mesquita. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var mensagem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func fazerLogin(_ sender: Any) {
        print("hello there!.. You have clicked the touch ID")
        let myContext = LAContext()
        
        mensagem.text = "Biometric Authntication testing !! "
        var authError: NSError?
        
        if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
            myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Biometric Authntication testing !! ", reply: handleAuth)
        } else {
          mensagem.text = "Sorry!!.. Could not evaluate policy."
        }
    }
    
    func handleAuth(success: Bool, error: Error?) {
        DispatchQueue.main.async {
            if success {
                self.mensagem.text = "Awesome!!... User authenticated successfully"
            } else {
                self.mensagem.text = "Sorry!!... User did not authenticate successfully"
            }
        }
    }
    
}

