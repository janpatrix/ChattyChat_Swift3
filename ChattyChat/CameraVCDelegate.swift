//
//  CameraVCDelegate.swift
//  ChattyChat
//
//  Created by Patrick Gross on 20/11/2016.
//  Copyright © 2016 Patrick Gross. All rights reserved.
//

import Foundation

protocol CameraVCDelegate {
    
    func shouldEnableRecordUI(enabled: Bool)
    func shouldEnableCameraUI(enabled: Bool)
    func recordingHasStarted()
    func canStartRecording()
    }
