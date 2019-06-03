//
//  VideoViewController.swift
//  LockBox
//
//  Created by Hammed opejin on 6/3/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import AVFoundation

class VideoViewController: UIViewController {
    
    var content: Content!
    var videoPlayer: AVPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupVideo()
        loopVideo()
    }
    
    private func setupVideo() {
        
        guard let url = FileService.loadWithFM(content.path!) else {
            return
        }
        
        videoPlayer = AVPlayer(url: url)
        let layer = AVPlayerLayer(player: videoPlayer)
        layer.frame = view.bounds
        view.layer.addSublayer(layer)
        videoPlayer.play()
    }
    
    private func loopVideo() {
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object:
        videoPlayer.currentItem, queue: .main) { [unowned self] _ in
            
            self.videoPlayer.seek(to: .zero)
            self.videoPlayer.play()
            
        }
    }

}
