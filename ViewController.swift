//
//  ViewController.swift
//  HapticPlayground
//
//  Created by Jun Gu on 2022/2/25.
//

import UIKit

enum HapticType {
    case impact(_ style: UIImpactFeedbackGenerator.FeedbackStyle)
    case selection
    case notification(_ style: UINotificationFeedbackGenerator.FeedbackType)
}

class ViewController: UITableViewController {

    private var items: [(String, HapticType)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Haptic"
        navigationController?.navigationBar.prefersLargeTitles = true
        items = [(String, HapticType)]()
        items.append(("impact/light", .impact(.light)))
        items.append(("impact/medium", .impact(.medium)))
        items.append(("impact/heavy", .impact(.heavy)))
        items.append(("impact/soft", .impact(.soft)))
        items.append(("impact/rigid", .impact(.rigid)))
        items.append(("selection", .selection))
        items.append(("notification/success", .notification(.success)))
        items.append(("notification/warning", .notification(.warning)))
        items.append(("notification/error", .notification(.error)))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = items[indexPath.row]
        var conf = cell.defaultContentConfiguration()
        conf.text = item.0
        cell.contentConfiguration = conf
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = items[indexPath.row].1
        switch type {
        case .impact(let style):
            UIImpactFeedbackGenerator(style: style).impactOccurred()
        case .selection:
            UISelectionFeedbackGenerator().selectionChanged()
        case .notification(let style):
            UINotificationFeedbackGenerator().notificationOccurred(style)
        }
    }
}

