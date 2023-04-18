//
//  AlarmTableViewCell.swift
//  HugeClock
//
//  Created by Vinit Ingale on 18/04/23.
//

import UIKit

protocol AlarmTableViewCellDelegate: AnyObject {
    func toggleSwitch(_ index: Int)
}

class AlarmTableViewCell: UITableViewCell {
    @IBOutlet weak var alarmName: UILabel!
    @IBOutlet weak var alarmTime: UILabel!
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    var currentIndex: Int?
    
    weak var delegate: AlarmTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func toggleSwitch(_ sender: Any) {
        if let currentIndex {
            delegate?.toggleSwitch(currentIndex)
        }
    }
    
    func setUpAlarmCell(_ alarm: Alarm) {
        alarmName.text = alarm.name
        alarmTime.text = DateHelper.getHH_MM_FormatTimeString(date: alarm.time)
        toggleSwitch.isOn = alarm.enabled
    }
}
