//
//  ResultViewController.swift
//  numberGame
//
//  Created by 小林玲衣奈 on 2020/09/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    //ラベル類の宣言
    @IBOutlet var pointResult: UILabel!
    
    //ここの画面でもランキングみれたらいいかなって思ったけど一旦やめとく
//    @IBOutlet var rankOne: UILabel!
//    @IBOutlet var rankTwo: UILabel!
//    @IBOutlet var rankThree: UILabel!
    
    //合計ポイント数
    var point: Int = 0

    //ユーザーデフォルトを使いますよって
    let saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //合計ポイントを表示
        pointResult.text = String(point)
        
        //ユーザーデフォルトからランキング
//        rankArray = saveData.object(forKey: point) as! [Int]
        
        //らんんキングだしたかったですよって
//        if point > rankArray[1]{
//            rankArray.insert(point, at:0)
//        } else if point > rankArray[2] {
//            rankArray.insert(point, at:1)
//        } else if point > rankArray[3] {
//            rankArray.insert(point, at: 2)
//        } else {
//            rankArray.append(point)
//        }
//


        

        // Do any additional setup after loading the view.
    }
    
 
    
//    @objc  func setRank(){
//        if point > rankArray[1]{
//            rankArray.insert(point, at:0)
//        } else if point > rankArray[2] {
//            rankArray.insert(point, at:1)
//        } else if point > rankArray[3] {
//            rankArray.insert(point, at: 2)
//        } else {
//            rankArray.append(point)
//        }
//
//        saveData.set(rankArray, forKey: "point")
//
//        rankOne.text = String(rankArray[0])
//        rankTwo.text = String(rankArray[1])
//        rankThree.text = String(rankArray[2])
//    }
        
    //はじめの画面に戻る
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
