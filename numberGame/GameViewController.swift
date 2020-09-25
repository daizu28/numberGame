//
//  GameViewController.swift
//  numberGame
//
//  Created by 小林玲衣奈 on 2020/09/24.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var time: UILabel!
    @IBOutlet var point: UILabel!
    @IBOutlet var ose: UILabel!
    
    var count: Float = 15.00
    
    var timer: Timer = Timer()
    
    var number: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //タイマーを動かす
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func plus() {
        
        number = number + 10
        point.text = String(number)
    }
    
    
    @objc func up() {
        //countを0.01足す
        count = count - 0.01
        //ラベルに小数点以下2桁まで表示
        time.text = String(format: "%.2f", count)
        
        if count == 0.00 {
            performSegueToResult()
            timer.invalidate()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toResultView"{
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.pointResult = self.point
        }
    }
    
    func performSegueToResult(){
        performSegue(withIdentifier: "toResultView", sender: nil)
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
