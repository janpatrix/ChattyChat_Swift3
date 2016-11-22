//
//  ViewController.swift
//  ChattyChat
//
//  Created by Patrick Gross on 18/11/2016.
//  Copyright © 2016 Patrick Gross. All rights reserved.
//

import UIKit

class CameraVC: CameraViewController, CameraVCDelegate {

    @IBOutlet weak var changeCameraBtn: UIButton!
    @IBOutlet weak var previewView: PreviewView!
    @IBOutlet weak var recordBtn: UIButton!
    
    override func viewDidLoad() {

        delegate = self
        _previewView = previewView
        
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func shouldEnableRecordUI(enabled: Bool) {
        if enabled {
            recordBtn.isEnabled = enabled
        }
        
    }
    
    func shouldEnableCameraUI(enabled: Bool) {
        if enabled {
            changeCameraBtn.isEnabled = enabled
        }
        
    }
    
    func recordingHasStarted() {
        
        
    }
    
    func canStartRecording() {
        
        
    }



    @IBAction func changeCameraBtnPressed(_ sender: Any) {
        
        print("Camera Button Pressed")

        changeCamera(changeCameraBtn)
    }
    @IBAction func recordBtnPressed(_ sender: Any) {
        
        print("Record Button Pressed")
        toggleCaptureMode(captureMode: 1)
        toggleMovieRecording(recordBtn)

    }
    
}

