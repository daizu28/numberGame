//
//  RankViewController.swift
//  numberGame
//
//  Created by 小林玲衣奈 on 2020/09/24.
//

import UIKit

class RankViewController: UIViewController {
    
    //ラベル類の宣言
    @IBOutlet var rankOne: UILabel!
    @IBOutlet var rankTwo: UILabel!
    @IBOutlet var rankThree: UILabel!
    //ランキング用の配列
    var rankArray: [Int] = []
    //合計ポイント数
    var point: Int = 0
    
    //ユーザーデフォルトにアクセス
    let saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        rankArray = saveData.object(forKey: "point") as! [Int]
        
        //ランキングを表示する
        rankOne.text = String(rankArray[0])
        rankTwo.text = String(rankArray[1])
        rankThree.text = String(rankArray[2])
        
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
