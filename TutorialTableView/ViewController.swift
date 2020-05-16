//
//  ViewController.swift
//  tutorialPIODEC
//
//  Created by Daniel Wijono on 16/05/20.
//  Copyright © 2020 Daniel Wijono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardTableView: UITableView!

    let cardCell = "CardCell"
    let cardTypeTwoCell = "CardTypeTwoCell"

    var cardArray: [String] = ["Yovi", "Ilga", "Ahmad", "Budi"]
    var colorArray: [UIColor] = [.black, .blue,.black, .blue]
    var cardTypeTwoArray: [String] = ["Budi", "Giga", "Mantap"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        cardTableView.delegate = self
        cardTableView.dataSource = self
        cardTableView.register(UINib(nibName: cardCell, bundle: nil), forCellReuseIdentifier: cardCell)
        cardTableView.register(UINib(nibName: cardTypeTwoCell, bundle: nil), forCellReuseIdentifier: cardTypeTwoCell)
        cardTableView.bounces = false
        cardTableView.tableFooterView = UIView()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return cardArray.count
        } else if section == 1 {
            return cardTypeTwoArray.count
        }
        return 0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: cardCell, for: indexPath) as? CardCell {

                cell.cardLabel.text = cardArray[indexPath.row]
                cell.cardImage.layer.cornerRadius = cell.cardImage.frame.size.width / 2
                cell.cardImage.backgroundColor = colorArray[indexPath.row]
                cell.selectionStyle = .none

                return cell
            }
        } else if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: cardTypeTwoCell, for: indexPath) as? CardTypeTwoCell {

                cell.cardTypeTwoLabel.text = cardTypeTwoArray[indexPath.row]

                return cell
            }
        }

        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .systemTeal

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Section \(section + 1)"
        label.textColor = .black
        view.addSubview(label)

        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true

        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}

