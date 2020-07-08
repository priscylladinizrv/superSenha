//
//  ViewController.swift
//  SuperSenha
//
//  Created by priscylla.d.valenca on 01/07/20.
//  Copyright © 2020 Priscylla Diniz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfTotalPasswords: UITextField!
     @IBOutlet weak var tfNumberOfCharacters: UITextField!
     @IBOutlet weak var swLetters: UISwitch!
     @IBOutlet weak var swNumbers: UISwitch!
     @IBOutlet weak var swSpecialCharacters: UISwitch!
     @IBOutlet weak var swCaptitalLetters: UISwitch!

    @IBOutlet weak var disableButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func alerta(_ sender: Any) {
        
        let totalPass:Int? = Int(tfTotalPasswords.text!)
        
        if totalPass! <= 0 || totalPass! > 99 || (totalPass != nil) {
                let alert = UIAlertController (title: "Alerta", message:" Por favor insira um número entre 1 e 99", preferredStyle: UIAlertController.Style.alert)
                
                let buttonOk = UIAlertAction (title: "Ok", style: UIAlertAction.Style.default) { (UIAlertAction) in
                    self.dismiss(animated: true, completion: nil)
                }
            
            alert.addAction(buttonOk)
            self.present(alert, animated: true, completion: nil)
            }
    }
    
    
    @IBAction func alertCaracteres(_ sender: Any) {
        
        let totalCaracteres:Int? = Int(tfNumberOfCharacters.text!)
        
        if totalCaracteres! <= 0 || totalCaracteres! > 16 || (totalCaracteres != nil)  {
                let alert = UIAlertController (title: "Alerta", message:"Por favor insira um número entre 1 e 16", preferredStyle: UIAlertController.Style.alert)
                
                let buttonOk = UIAlertAction (title: "Ok", style: UIAlertAction.Style.default) { (UIAlertAction) in
                    self.dismiss(animated: true, completion: nil)
                }
            
            alert.addAction(buttonOk)
            self.present(alert, animated: true, completion: nil)
            }
    }
    
    
    
    
    @IBAction func disable(_ sender: Any) {
        if !swSpecialCharacters.isOn || !swCaptitalLetters.isOn || !swLetters.isOn || !swNumbers.isOn {
               disableButton.isEnabled = false
        }else{
            disableButton.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
          let passwordsViewController = segue.destination as! PassowordViewController
        
          
          // forma mais segura (usar if let)
          if let numberOfPasswords = Int(tfTotalPasswords.text!) {
              // se conseguir obter o valor do campo e converter para inteiro
              passwordsViewController.numberOfPasswords = numberOfPasswords
          }
          if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
              passwordsViewController.numberOfCharacters = numberOfCharacters
          }
        
        
        if !swSpecialCharacters.isOn {

               disableButton.isEnabled = false
               }
          passwordsViewController.useNumbers = swNumbers.isOn
          passwordsViewController.useCapitalLetters = swCaptitalLetters.isOn
          passwordsViewController.useLetters = swLetters.isOn
          passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
          
          // forcar encerrar o modo de edicao // remove o foco e libera teclado
          view.endEditing(true)

    }
    
    
    
    
  
}

