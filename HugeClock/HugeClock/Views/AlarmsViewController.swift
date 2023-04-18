//
//  ViewController.swift
//  HugeClock
//
//  Created by Vinit Ingale on 13/04/23.
//

import UIKit

class AlarmsViewController: UIViewController {
    
    //MARK: Variables
    let alarmViewModel: AlarmViewModel
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
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
    
    @IBAction func addalarmButtonPressed(_ sender: Any) {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        
        let alertController = UIAlertController(title: "Add Alarm", message: nil, preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "Name"
        }
        alertController.view.addSubview(datePicker)
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: alertController.view.safeAreaLayoutGuide.topAnchor, constant: 60),
            datePicker.leadingAnchor.constraint(equalTo: alertController.view.leadingAnchor, constant: 20),
            datePicker.trailingAnchor.constraint(equalTo: alertController.view.trailingAnchor, constant: -20)
        ])
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak self] _ in
            guard let name = alertController.textFields?.first?.text,
                  !name.isEmpty else {
                return
            }
            let time = datePicker.date
            self?.alarmViewModel.addAlarm(alarm: Alarm(id: UUID().uuidString, name: name, time: time, enabled: true, deleted: false))
            self?.tableView.reloadData()
        }
        alertController.addAction(saveAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension AlarmsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmViewModel.alarms().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmTableViewCell", for: indexPath) as? AlarmTableViewCell
        let alarm = alarmViewModel.alarms()[indexPath.row]
        cell?.setUpAlarmCell(alarm)
        cell?.currentIndex = indexPath.row
        cell?.delegate = self
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            alarmViewModel.deleteAlarm(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension AlarmsViewController: AlarmTableViewCellDelegate {
    func toggleSwitch(_ index: Int) {
        alarmViewModel.toggleAlarm(index: index)
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
}

