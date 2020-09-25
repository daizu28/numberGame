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
    
    let suji: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //タイマーを動かす
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        
        plusLabel.setTitle(String(suji.randomElement()!), for: .normal)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func plus() {
        
        //ボタンを押したらポイントが１０入る
        number = number + 10
        point.text = String(number)
        
    //1-9を順番に押せたらボタンの数字がシャッフルされる
        plusLabel.setTitle(String(suji.randomElement()!), for: .normal)
        
    }
    
    
    //segueが動作することをViewControllerに通知するメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        // segueのIDを確認して特定のsegueの時のみ動作させる
        if segue.identifier == "toResultView"{
            //遷移先のViewControllerの取得
            let resultViewController = segue.destination as?  ResultViewController
            //用意した遷移先の変数に値を戻す
            resultViewController?.pointResult = self.inputField.text
        }
    }
    
    @IBAction func performSegueToResult(_ sender: Any){
        //画面遷移実行
        performSegue(withIdentifier: "toResultView", sender: nil)
        if count == 0 {
            performSegueToResult()
            timer.invalidate()
        }
    }

    
    @objc func up() {
        //countを0.01足す
        count = count - 0.01
        //ラベルに小数点以下2桁まで表示
        time.text = String(format: "%.2f", count)
    
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
