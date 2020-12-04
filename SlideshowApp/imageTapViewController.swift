//
//  ImageTapViewController.swift
//  SlideshowApp
//
//  Created by aykawano on 2020/12/04.
//  Copyright © 2020 ayaka. All rights reserved.
//

import UIKit

class ImageTapViewController: UIViewController {

    //遷移元から連携された画像を格納
    var img: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //画像表示
        imageView.image = img
    }
    
}
