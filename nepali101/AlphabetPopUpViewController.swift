//
//  AlphabetPopUpViewController.swift
//  nepali101
//
//  Created by Sanjay Shrestha on 8/10/16.
//  Copyright © 2016 Dreams and Ideas. All rights reserved.
//

import UIKit
import AVFoundation


class AlphabetPopUpViewController: UIViewController {

    
    // MARK: IBOutlets
    
    @IBOutlet weak var letterLabel: UILabel!
    
    @IBOutlet weak var englishLetterLabel: UILabel!
    
    @IBOutlet weak var wordLabel: UILabel!

    @IBOutlet weak var englishWordLabel: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet var mainView: UIView!
    
    //MARK: ConsonantsArray
    
    var consonants: [Alphabet] = []
    var indexPath = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: mainView, action: #selector (dismissWindow))
        view.addGestureRecognizer(tap)
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.8)
        self.showAnimate()
        
        populateField(indexPath)
        
        //uncomment the following line to play sound
       /* var sound : AVAudioPlayer?

        if let getSound = self.setupAudioPlayerWithFile("ButtonTap", type:"wav") {
            VARIABLE = getSound
        }
        sound?.play()*/
        
    }
    
    //MARK: populateField 
    
    func populateField(indexPath: Int){
        letterLabel.text = consonants[indexPath].letter
        wordLabel.text = consonants[indexPath].word
        englishWordLabel.text = consonants[indexPath].englishWord
        englishLetterLabel.text = consonants[indexPath].englishLetter
        
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissWindow(){
        self.removeAnimate()

    }
    
    @IBAction func closeButtonPressed(sender: AnyObject) {
        self.removeAnimate()

        
    }
    
    @IBAction func closePopUp(sender: AnyObject) {
        self.removeAnimate()
        //self.view.removeFromSuperview()
    }
    
    
    // Mark: Animation
    func showAnimate()
    {
        self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
        self.view.alpha = 0.0;
        UIView.animateWithDuration(0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animateWithDuration(0.25, animations: {
            self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
            self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished)
                {
                    self.view.removeFromSuperview()
                }
        });
    }
    
    // MARK: Setting up Sound
    
    
    
    func setupAudioPlayerWithFile(file:NSString, type:NSString) -> AVAudioPlayer?  {
        //1
        let path = NSBundle.mainBundle().pathForResource(file as String, ofType: type as String)
        let url = NSURL.fileURLWithPath(path!)
        
        //2
        var audioPlayer:AVAudioPlayer?
        
        // 3
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print("Player not available")
        }
        
        return audioPlayer
    }


}
/*
 
 //for playing sound
 import AVFoundation
 
 let beepSoundURL =  NSBundle.mainBundle().URLForResource("beep", withExtension: "aif")!
 var beepPlayer = AVAudioPlayer()
 func playMySound(){
 beepPlayer = AVAudioPlayer(contentsOfURL: beepSoundURL, error: nil)
 beepPlayer.prepareToPlay()
 beepPlayer.play()
 }
 
 @IBAction func pistolButton(sender: AnyObject) {
 playMySound()
 }
 */
