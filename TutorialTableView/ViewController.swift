//
//  ViewController.swift
//  TutorialTableView
//
//  Created by Daniel Wijono on 09/05/20.
//  Copyright © 2020 Daniel Wijono. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardTableView: UITableView!

    var cardArray: [String] = ["Ahmad", "Yovi"]
    var colorArray: [UIColor] = [.black,.blue]
    let cardCell = "CardCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        cardTableView.delegate = self
        cardTableView.dataSource = self
        cardTableView.register(UINib(nibName: cardCell, bundle: nil), forCellReuseIdentifier: cardCell)
        cardTableView.bounces = false
        cardTableView.allowsSelection = true
        cardTableView.tableFooterView = UIView() // This will remove extra separators from tableview
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardArray.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cardCell, for: indexPath) as? CardCell {

            cell.cardImage.backgroundColor = colorArray[indexPath.row]
            cell.cardImage.layer.cornerRadius = cell.cardImage.frame.size.width / 2
            cell.cardLabel.text = cardArray[indexPath.row]
            cell.selectionStyle = .none

            return cell
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

        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        return view
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
}






