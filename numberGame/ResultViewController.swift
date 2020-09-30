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
    
    //合計ポイント数
    var point: Int = 0
    //ランク表示ように整えた配列
    var rankArray: [Int] = [0,0,0]
    
    //ユーザーデフォルトを使いますよって
    let saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //合計ポイントを表示
        pointResult.text = String(point)
        
        //ユーザーデフォルトの中に何もない時は単純に追加する
        var value = saveData.array(forKey: "point")
        if value == nil {
            save()
        }else{
        
        //これまでの値を配列の中に入れる
        rankArray = saveData.object(forKey: "point") as! [Int]
        
        save()
        
        }

        // Do any additional setup after loading the view.
    }
    
 
    func save(){
        //今回の値を配列に加える
        rankArray.append(point)
        
        //降順に並べ替える
        rankArray.sort {$1 < $0}
        
        //配列をユーザーデフォルトに保存
        saveData.set(rankArray, forKey: "point")
    }
   
        
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
