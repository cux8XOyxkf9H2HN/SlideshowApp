//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 谷田　沙緒里 on 2023/02/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previewButton: UIButton!
    
    var currentImagePath: String! = "first.png"
    var isSlidePlay: Bool! = false
    var timer: Timer!
    
    let first: String = "first.png"
    let second: String = "second.png"
    let third: String = "third.png"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.imageButton.setImage(UIImage(named: self.currentImagePath), for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(self.isSlidePlay) {
            stopSlideShow()
        }
        let expantionViewController:ExpantionViewController = segue.destination as! ExpantionViewController
        expantionViewController.argImage = self.currentImagePath
    }


    @IBAction func nextImage(_ sender: Any) {
        if(self.currentImagePath == first) {
            self.currentImagePath = second
        } else if(self.currentImagePath == second) {
            self.currentImagePath = third
        } else if(self.currentImagePath == third) {
            self.currentImagePath = first
        }
        self.imageButton.setImage(UIImage(named: self.currentImagePath), for: .normal)
    }
    
    @IBAction func previewImage(_ sender: Any) {
        if(self.currentImagePath == first) {
            self.currentImagePath = third
        } else if(self.currentImagePath == second) {
            self.currentImagePath = first
        } else if(self.currentImagePath == third) {
            self.currentImagePath = second
        }
        self.imageButton.setImage(UIImage(named: self.currentImagePath), for: .normal)
    }
    
    @IBAction func slideShow(_ sender: Any) {
        if(!self.isSlidePlay) {
            startSlideShow()
        } else {
            stopSlideShow()
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        }

    
    @objc func updateImage() {
        if(self.currentImagePath == first) {
            self.currentImagePath = second
        } else if(self.currentImagePath == second) {
            self.currentImagePath = third
        } else if(self.currentImagePath == third) {
            self.currentImagePath = first
        }
        self.imageButton.setImage(UIImage(named: self.currentImagePath), for: .normal)
    }
    
    func startSlideShow() {
        self.startStopButton.setTitle("停止", for: .normal)
        self.nextButton.isEnabled = false
        self.previewButton.isEnabled = false
        self.isSlidePlay = true
        if self.timer == nil {
        self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateImage), userInfo: nil, repeats: true)
        }
    }
    
    func stopSlideShow() {
        self.startStopButton.setTitle("再生", for: .normal)
        self.nextButton.isEnabled = true
        self.previewButton.isEnabled = true
        self.isSlidePlay = false
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
}

