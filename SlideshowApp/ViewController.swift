//
//  ViewController.swift
//  SlideshowApp
//
//  Created by aykawano on 2020/12/04.
//  Copyright © 2020 ayaka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //img配列のインデックス番号
    var index: Int = 0
    
    //スライドショーさせる画像を宣言
    var img: [UIImage] = [UIImage(named: "img1")!, UIImage(named: "img2")!, UIImage(named: "img3")!]
    
    //自動送りのタイマー
    var timer: Timer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //起動時に最初の画像を表示させる
        imageView.image = img[0]
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextButton1: UIButton!
    @IBOutlet weak var backButton1: UIButton!
    
    //進むボタン
    @IBAction func nextButton(_ sender: Any) {
        if index == 0 {
            //一つ先の画像を表示
            index += 1
        }else if index == 1{
            //一つ先の画像を表示
            index += 1
        }else{
            //最後の画像の次は最初の画像を表示
            index = 0
        }
        imageView.image = img[index]
    }
    
    
    //戻るボタン
    @IBAction func backButton(_ sender: Any) {
        
        if index == 0 {
            //最初の画像の次は最後の画像を表示
            index = 2
        }else if index == 1{
            //一つ前の画像を表示
            index -= 1
        }else{
            //一つ前の画像を表示
            index -= 1
        }
        imageView.image = img[index]
    }
    
    
    //再生/停止ボタン
    @IBOutlet weak var startStopButton1: UIButton!
    @IBAction func startStopButton(_ sender: Any) {
        //再生中じゃなければ
        if timer == nil{
            //タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(startStop), userInfo: nil, repeats: true)
            //ボタン名を停止に変更
            startStopButton1.setTitle("■",for: .normal)
            //進むボタンを非活性化
            nextButton1.isEnabled = false
            nextButton1.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
            //戻るボタンを非活性化
            backButton1.isEnabled = false
            backButton1.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
            
        }else{
            //タイマーを停止する
            timer.invalidate()
            //再生中か判別するためにtimerにnilを代入
            timer = nil
            //ボタン名を再生に変更
            startStopButton1.setTitle("▶︎",for: .normal)
            //進むボタンを活性化
            nextButton1.isEnabled = true
            nextButton1.setTitleColor(#colorLiteral(red: 0.2859320939, green: 0.3646726012, blue: 0.7047989964, alpha: 1), for: .normal)
            //戻るボタンを活性化
            backButton1.isEnabled = true
            backButton1.setTitleColor(#colorLiteral(red: 0.2859320939, green: 0.3646726012, blue: 0.7047989964, alpha: 1), for: .normal)
        }
    }
    

    //再生/停止ボタンが押された時に実行する
    @objc func startStop(){
        if index == 0 {
            //一つ先の画像を表示
            index += 1
        }else if index == 1{
            //一つ先の画像を表示
            index += 1
        }else{
            //最後の画像の次は最初の画像を表示
            index = 0
        }
        imageView.image = img[index]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        //segueから遷移先のImageTapViewControllerを取得
        let imageTapViewController: ImageTapViewController = segue.destination as! ImageTapViewController
        //遷移先に画像を連携
        imageTapViewController.img = self.img[index]
        
        //再生中の処理
        if timer != nil{
            //遷移先から戻ってきた時に同じ画像を表示させるためにタイマーを停止する
            timer.invalidate()
            //再生中か判別するためにtimerにnilを代入
            timer = nil
        }
    }
    
    //遷移先で戻るボタンが押された時に呼び出される
    @IBAction func back(_ segue: UIStoryboardSegue){
        //ボタン名を再生に変更
        startStopButton1.setTitle("▶︎",for: .normal)
        //進むボタンを活性化
        nextButton1.isEnabled = true
        nextButton1.setTitleColor(#colorLiteral(red: 0.2859320939, green: 0.3646726012, blue: 0.7047989964, alpha: 1), for: .normal)
        //戻るボタンを活性化
        backButton1.isEnabled = true
        backButton1.setTitleColor(#colorLiteral(red: 0.2859320939, green: 0.3646726012, blue: 0.7047989964, alpha: 1), for: .normal)
    }
    
}
