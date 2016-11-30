//
//  ViewController.swift
//  StopWatch
//
//  Created by Allen on 16/1/4.
//  Copyright © 2016年 Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var timeLabel: UILabel!

    var Counter = 0.0
    var timer = Timer()
    var IsPlaying = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return UIStatusBarStyle.lightContent
        }
    }
    
    override func viewDidLoad() {
        timeLabel.text = String(Counter)
        super.viewDidLoad()
    }
    
    // 方法签名前面的"_"也是方法的一部分，必须和StoryBoard的一致否则无法调用，会报错误，导致点击事件无法执行
    // unrecognized selector sent to instance 0x7fc029703f50
    @IBAction func resetButtonDidTouch(_ sender: Any) {
        timer.invalidate()
        IsPlaying = false
        Counter = 0
        timeLabel.text = String(Counter)
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    
    @IBAction func playButtonDidTouch(_ sender: Any) {
        if(IsPlaying) {
            return
        }
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.UpdateTimer), userInfo: nil, repeats: true)
        IsPlaying = true
    }
    
    @IBAction func pauseButtonDidTouch(_ sender: Any) {
        
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        timer.invalidate()
        IsPlaying = false
        
    }
    
    func UpdateTimer() {
        Counter = Counter + 0.1
        timeLabel.text = String(format: "%.1f", Counter)
    }
    
    
}

