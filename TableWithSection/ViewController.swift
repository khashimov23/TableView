//
//  ViewController.swift
//  TableWithSection
//
//  Created by Shavkat Khoshimov on 21/12/21.
//

import UIKit

let dailyTasks = ["daily task 1", "daily task 2", "daily task 3", "daily task 4", "daily task 5"];
let weeklyTasks = ["weekly task 1", "weekly task 2", "weekly task 3"];
let monthlyTasks = ["monthly task 1", "monthly task 2", "monthly task 3", "monthly task 4"];

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return dailyTasks.count
            case 1:
                return weeklyTasks.count
            case 2:
                return monthlyTasks.count
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        switch indexPath.section {
            case 0:
                cell.imageView?.image = UIImage(systemName: "hourglass.circle.fill")
                cell.detailTextLabel?.text = "This is a subtitle"
                cell.textLabel?.text = dailyTasks[indexPath.row]
                cell.accessoryType = .disclosureIndicator
            case 1:
                cell.imageView?.image = UIImage(systemName: "alarm.fill")
                cell.detailTextLabel?.text = "This is also a subtitle"
                cell.textLabel?.text = weeklyTasks[indexPath.row]
                cell.accessoryType = .detailButton
            case 2:
                cell.imageView?.image = UIImage(systemName: "clock.fill")
                cell.detailTextLabel?.text = "This is a subtitle too"
                cell.textLabel?.text = monthlyTasks[indexPath.row]
                cell.accessoryType = .checkmark
            default:
                cell.textLabel?.text = "Invalid section"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:
                return "Daily Tasks"
            case 1:
                return "Weekly Tasks"
            case 2:
                return "Monthly Tasks"
            default:
                return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You select row \(indexPath.row) in section \(indexPath.section) ")
    }
}


