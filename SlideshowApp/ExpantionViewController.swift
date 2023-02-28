//
//  ExpantionViewController.swift
//  SlideshowApp
//
//  Created by 谷田　沙緒里 on 2023/02/27.
//

import UIKit

class ExpantionViewController: UIViewController {

    @IBOutlet var expantionImage: UIImageView!
    
    var argImage:String = "first.png"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.expantionImage.image = UIImage(named: self.argImage)
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
