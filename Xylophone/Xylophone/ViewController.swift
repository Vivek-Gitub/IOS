//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer! // ! symbol
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func xylophoneActionButton(_ sender: UIButton) {
        
        let buttonTitle=sender.title(for: .normal)
        guard let url = Bundle.main.url(forResource: buttonTitle, withExtension: "wav") else { return }
        
        do {
            
            
//            try AVAudioSession.sharedInstance().setCategory(.playback,mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url,fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = player else{return}
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        
    }
    
    
}

