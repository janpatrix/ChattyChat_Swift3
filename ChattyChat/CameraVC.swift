//
//  ViewController.swift
//  ChattyChat
//
//  Created by Patrick Gross on 18/11/2016.
//  Copyright © 2016 Patrick Gross. All rights reserved.
//

import UIKit

class CameraVC: CameraViewController {

    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var previewView: PreviewView!
    
    override func viewDidLoad() {
     
        _previewView = previewView
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func recordBtnPressed(_ sender: Any) {
        
        toggleMovieRecording(recordBtn)
    }
    
}

