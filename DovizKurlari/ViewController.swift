//
//  ViewController.swift
//  DovizKurlari
//
//  Created by macbook on 3.07.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var butonGorsel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        butonGorsel.layer.cornerRadius = 10
    }
    
    
    @IBAction func Button(_ sender: Any) {
        
        performSegue(withIdentifier: "aktarim", sender: nil)
    }
    
    


}

