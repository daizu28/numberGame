//
//  GameViewController.swift
//  numberGame
//
//  Created by 小林玲衣奈 on 2020/09/24.
//

import UIKit

class GameViewController: UIViewController {
    
    //タイマーのラベル
    @IBOutlet var time: UILabel!
    //得点のラベル
    @IBOutlet var point: UILabel!
    //順番に押して!
    @IBOutlet var ose: UILabel!
    //各ボタンのラベル
    @IBOutlet var plusLabel1: UIButton!
    @IBOutlet var plusLabel2: UIButton!
    @IBOutlet var plusLabel3: UIButton!
    @IBOutlet var plusLabel4: UIButton!
    @IBOutlet var plusLabel5: UIButton!
    @IBOutlet var plusLabel6: UIButton!
    @IBOutlet var plusLabel7: UIButton!
    @IBOutlet var plusLabel8: UIButton!
    @IBOutlet var plusLabel9: UIButton!
    
    //タイマーの変数
    var count: Float = 15.00
    var timer: Timer = Timer()
    //得点の変数
    var number: Int = 0
    //ボタンの数字の配列(.appendでわざわざ追加してたけどここに初めから書いておくの方が良さそう)
    var sujiArray : [Any] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    //正解の数字
    var correctNumber: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //タイマーを動かす
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)

                
        // Do any additional setup after loading the view.
    }
   
    //ボタンに数字を表示させたい
    func choiceSuji(){
        
        let sujiIndex = sujiArray[0]as! [Any]
        
        plusLabel1.setTitle(sujiIndex[1] as? String, for: .normal)
        plusLabel2.setTitle(sujiIndex[2] as? String, for: .normal)
        plusLabel3.setTitle(sujiIndex[3] as? String, for: .normal)
        plusLabel4.setTitle(sujiIndex[4] as? String, for: .normal)
        plusLabel5.setTitle(sujiIndex[5] as? String, for: .normal)
        plusLabel6.setTitle(sujiIndex[6] as? String, for: .normal)
        plusLabel7.setTitle(sujiIndex[7] as? String, for: .normal)
        plusLabel8.setTitle(sujiIndex[8] as? String, for: .normal)
        plusLabel9.setTitle(sujiIndex[9] as? String, for: .normal)
        
    }
    
    //ボタンが正解のものが押された時に得点が入るようにしたい
    @IBAction func plus(_ sender: UIButton) {
        
        let correctNumber: [String] = ["1","2","3","4","5","6","7","8","9"]
        
        if ((sender.titleLabel?.text = sujiArray[0] as! String) != nil){
            
            number = number + 10
            point.text = String(number)
            sender.isEnabled = false
            sender.alpha = 0.05
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
            resultViewController.point = self.number
        }
    }

    //タイマーとタイマーが0以下になった時に遷移させる
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
