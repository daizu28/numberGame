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
    @IBOutlet var plusLabel: UIButton!
    
    var count: Float = 15.00
    
    var timer: Timer = Timer()
    
    var number: Int = 0
    
    var label: Int!
    
    var countShufle: Int = 0

    
    let sujiArray: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let sujiIndex = Int.random(in: 0...8)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //タイマーを動かす
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        
        
        let sujiIndex = Int.random(in: 0...8)
        func changeButtonLabel(){
        plusLabel.setTitle(String(sujiArray[sujiIndex]), for: .normal)
        }
        

//        func decoButton(){
//            //ボタンの装飾
//            plusLabel.layer.borderColor = UIColor(red: 255/255, green: 44/255, blue: 80/255, alpha: 1.0).cgColor
//            plusLabel.backgroundColor = UIColor.white
//            plusLabel.layer.borderWidth = 2
//            plusLabel.layer.cornerRadius = 2
//        }
                
        // Do any additional setup after loading the view.
    }
    
    func changeButtonLabel(){
    plusLabel.setTitle(String(sujiArray[sujiIndex]), for: .normal)
    }
    
    @IBAction func plus() {
        
        if sujiIndex == 1 {
            //ボタンを押したらポイントが１０入る
            number = number + 10
            point.text = String(number)
            plusLabel.alpha = 0.3;
        }
        if sujiIndex == 2 {
            //ボタンを押したらポイントが１０入る
            number = number + 10
            point.text = String(number)
            plusLabel.alpha = 0.3;
        }
        if sujiIndex == 3 {
            //ボタンを押したらポイントが１０入る
            number = number + 10
            point.text = String(number)
            plusLabel.alpha = 0.3;
        }
        if sujiIndex == 4 {
            //ボタンを押したらポイントが１０入る
            number = number + 10
            point.text = String(number)
            plusLabel.alpha = 0.3;
        }
        if sujiIndex == 5 {
            //ボタンを押したらポイントが１０入る
            number = number + 10
            point.text = String(number)
            plusLabel.alpha = 0.3;
        }
        if sujiIndex == 6 {
            //ボタンを押したらポイントが１０入る
            number = number + 10
            point.text = String(number)
            plusLabel.alpha = 0.3;
        }
        if sujiIndex == 7 {
            //ボタンを押したらポイントが１０入る
            number = number + 10
            point.text = String(number)
            plusLabel.alpha = 0.3;
        }
        if sujiIndex == 8 {
            //ボタンを押したらポイントが１０入る
            number = number + 10
            point.text = String(number)
            plusLabel.alpha = 0.3;
        }
        if sujiIndex == 9 {
            //ボタンを押したらポイントが１０入る
            number = number + 10
            point.text = String(number)
            plusLabel.alpha = 0.3;
        }
        
        countShufle = countShufle + 1
        
        if countShufle == 9 {
            let sujiIndex = Int.random(in: 0...8)
            func changeButtonLabel(){
            plusLabel.setTitle(String(sujiArray[sujiIndex]), for: .normal)
            }
        }
        
    }
    
    @IBAction func performSegueToResult(){
        //画面遷移実行
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    //segueを準備する時に呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toResultView"{
            let resultViewController = segue.destination as!  ResultViewController
            resultViewController.pointResult = self.point
        }
    }

    
    @objc func up() {
        //countを0.01足す
        count = count - 0.01
        //ラベルに小数点以下2桁まで表示
        time.text = String(format: "%.2f", count)
        
        if count < 0.00 {
            self.performSegueToResult()
        }
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
