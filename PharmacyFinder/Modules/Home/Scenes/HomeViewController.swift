//
//  HomeViewController.swift
//  PharmacyFinder
//
//  Created by Felipe Vergara on 23-04-20.
//  Copyright © 2020 Felipe Vergara. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var presenter: HomeContract.Presenter?
    private var pharmacies: [Record]?
    
    
    convenience init() {
        self.init(nibName: "HomeViewController", bundle: nil)
        setup()
    }
    
    func setup() {
        presenter = HomePresenter(view: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.presenter?.doLoadPharmacies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
    }
    
    private func setupTableView() {
        self.tableView.register(PharmacyCell.nib, forCellReuseIdentifier: PharmacyCell.identifier)
    }
    
    @objc func searchTapped() {
        self.presenter?.doFilterPharmacies(listToFilter: pharmacies)
    }
}

extension HomeViewController: HomeContract.View {
    func displayPopulatedTableView(pharmacies: PharmacyResponse) {
        self.pharmacies = pharmacies.result.records
        self.tableView.reloadData()
    }
    
    func displayAlertController(alertController: UIAlertController) {
        self.present(alertController, animated: true, completion: nil)
    }
    
    func displayUpdatedTableView(pharmacies: [Record]?) {
        self.pharmacies = pharmacies
        self.tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pharmacies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PharmacyCell.identifier, for: indexPath) as? PharmacyCell {
            if let pharmacies = pharmacies {
                cell.pharmacy = pharmacies[indexPath.row]
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

