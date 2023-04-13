//
//  ViewController.swift
//  HugeClock
//
//  Created by Vinit Ingale on 13/04/23.
//

import UIKit

class AlarmsViewController: UIViewController {
    let alarmViewModel: AlarmViewModel
    
    init?(coder: NSCoder, viewModel: AlarmViewModel) {
        self.alarmViewModel = viewModel
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

