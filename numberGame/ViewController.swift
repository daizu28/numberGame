//
//  ViewController.swift
//  numberGame
//
//  Created by 小林玲衣奈 on 2020/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var startLayout: UIButton!
    @IBOutlet var rankingLayout: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startLayout.layer.borderColor = UIColor(red: 255/255, green: 44/255, blue: 80/255, alpha: 1.0).cgColor
        startLayout.backgroundColor = UIColor.white
        startLayout.layer.borderWidth = 6
        startLayout.layer.cornerRadius = 45.0
        startLayout.layer.shadowColor = UIColor(red: 239/255, green:46/255, blue: 87/255, alpha: 1.0).cgColor
        startLayout.layer.shadowOffset = CGSize(width: 0.0, height: 12.0)
        startLayout.layer.shadowOpacity = 1.0
        startLayout.layer.shadowRadius = 0
        
        rankingLayout.layer.borderColor = UIColor(red: 46/255, green: 131/255, blue: 255/255, alpha: 1.0).cgColor
        rankingLayout.backgroundColor = UIColor.white
        rankingLayout.layer.borderWidth = 6
        rankingLayout.layer.cornerRadius = 45.0
        rankingLayout.layer.shadowColor = UIColor(red: 43/255, green: 126/255, blue: 224/255, alpha: 1.0).cgColor
        rankingLayout.layer.shadowOffset = CGSize(width: 0.0, height: 12.0)
        rankingLayout.layer.shadowOpacity = 1.0
        rankingLayout.layer.shadowRadius = 0
        
    }
    
    @IBAction func start() {
        
    }
    
    @IBAction func ranking() {
        
    }


}

