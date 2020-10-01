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
    //各ボタンのラベル([]をつけることによって複数に関連付けできて配列みたいに管理できるみたい)
    @IBOutlet var buttonLabel: [UIButton]!
    
    //タイマーの変数
    var count: Float = 15.00
    var timer: Timer = Timer()
    //得点の変数
    var number: Int = 0
    //ボタンの数字の配列(.appendでわざわざ追加してたけどここに初めから書いておくの方が良さそう)
    var sujiArray : [Any] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    //正解の数字
    var correctNumber: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //タイマーを動かす
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        
        shuffledSujiArray()
        choiceSuji()
                
        // Do any additional setup after loading the view.
    }
    
    //segueを準備する時に呼ばれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toResultView"{
            let resultViewController = segue.destination as!  ResultViewController
            resultViewController.point = self.number
        }
    }
   
    //ボタンが正解のものが押された時に得点が入るようにしたい
    @IBAction func plus(_ button: UIButton) {
        
        //押されたボタンと正解が同じだった時
        if button.titleLabel?.text == String(correctNumber){
            //得点が入って表示される、ボタンが押せなくなる
            number = number + 10
            point.text = String(number)
            button.setTitle("", for: .normal)
            //正解をずらしていく
            //8までは正解がずれていく
            if correctNumber < 9{
                correctNumber = correctNumber + 1
            } else {
                //正解を0に戻す
                correctNumber = 1
                shuffledSujiArray()
                choiceSuji()
            }
        }
        
    }
    
    @IBAction func performSegueToResult(){
        //画面遷移実行
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    //メソッド類
    //タイマーとタイマーが0以下になった時に遷移させる
    @objc func up() {
        //countを0.01足す
        count = count - 0.01
        //ラベルに小数点以下2桁まで表示
        time.text = String(format: "%.2f", count)
        
        if count < 0.00 {
            //遷移する
            self.performSegueToResult()
            //タイマーとめる(止めないと動きっぱなしになる)
            timer.invalidate()
        }
    }
    
    //ボタンに数字を表示させたい
    func choiceSuji(){
        for i in 0 ..< 9{
            buttonLabel[i].setTitle(sujiArray[i] as? String, for: .normal)
        }
    }
    
    //sujiArray内をシャッフルする
    func shuffledSujiArray(){
        sujiArray.shuffle()
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
