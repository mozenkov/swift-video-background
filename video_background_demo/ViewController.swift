//
//  ViewController.swift
//  video_background_demo
//
//  Created by Mozenkov on 19.06.17.
//  Copyright © 2017 Mozenkov. All rights reserved.
//

import UIKit

//импортируем AVxx библиотеки для использования плеера
import AVKit
import AVFoundation

class ViewController: UIViewController {
    // определяем переменную плеера для фонового видео
    var player: AVPlayer?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Загружаем видео, которое лежит в корне проекта
        let videoURL: URL = Bundle.main.url(forResource: "video", withExtension: "mov")!
        
        player = AVPlayer(url: videoURL)
        player?.actionAtItemEnd = .none
        player?.isMuted = true
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.zPosition = -1
        
        playerLayer.frame = view.frame
        
        view.layer.addSublayer(playerLayer)
        
        player?.play()
        
        //делаем видео зацикленным
         NotificationCenter.default.addObserver(self, selector: #selector(ViewController.loopVideo), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        }

    func loopVideo(){
        player?.seek(to: kCMTimeZero)
        player?.play()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

