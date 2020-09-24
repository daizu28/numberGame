//
//  RankViewController.swift
//  numberGame
//
//  Created by 小林玲衣奈 on 2020/09/24.
//

import UIKit

class RankViewController: UIViewController {
    
    @IBOutlet var rankOne: UILabel!
    
    @IBOutlet var rankTwo: UILabel!
    
    @IBOutlet var rankThree: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(){
        self.presentingViewController?.presentingViewController?
            .dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
