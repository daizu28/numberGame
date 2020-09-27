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
    @IBOutlet var plusLabel1: UIButton!
    @IBOutlet var plusLabel2: UIButton!
    @IBOutlet var plusLabel3: UIButton!
    @IBOutlet var plusLabel4: UIButton!
    @IBOutlet var plusLabel5: UIButton!
    @IBOutlet var plusLabel6: UIButton!
    @IBOutlet var plusLabel7: UIButton!
    @IBOutlet var plusLabel8: UIButton!
    @IBOutlet var plusLabel9: UIButton!
    

    var count: Float = 15.00
    var timer: Timer = Timer()
    
    var number: Int = 0
    
    var label: Int!
    
    var countShufle: Int = 0


    var sujiArray = [Any]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //タイマーを動かす
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        
        
        sujiArray.append(["1"])
        sujiArray.append(["2"])
        sujiArray.append(["3"])
        sujiArray.append(["4"])
        sujiArray.append(["5"])
        sujiArray.append(["6"])
        sujiArray.append(["7"])
        sujiArray.append(["8"])
        sujiArray.append(["9"])
        
        sujiArray.shuffle()
        
        choiceSuji()

//        func decoButton(){
//            //ボタンの装飾
//            plusLabel.layer.borderColor = UIColor(red: 255/255, green: 44/255, blue: 80/255, alpha: 1.0).cgColor
//            plusLabel.backgroundColor = UIColor.white
//            plusLabel.layer.borderWidth = 2
//            plusLabel.layer.cornerRadius = 2
//        }
                
        // Do any additional setup after loading the view.
    }
   
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
