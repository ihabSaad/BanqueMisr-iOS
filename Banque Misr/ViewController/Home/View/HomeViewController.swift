//
//  HomeViewController.swift
//  Banque Misr
//
//  Created by ihab saad on 07/04/2026.
//

import UIKit
import RxSwift
import CoreBankingAPI
import DesignSystem

class HomeViewController: UIViewController {

    // MARK: - Welcome Section
    @IBOutlet weak private var userNameLabel: UILabel!
    
    // MARK: - Card View Outlets
    @IBOutlet weak private var amountLabel: UILabel!
    @IBOutlet weak private var accountNumberLabel: UILabel!
    @IBOutlet weak private var cardHolderNameLabel: UILabel!
    @IBOutlet weak private var cardView: UIView!
    
    // MARK: -  Transactions TableView
    @IBOutlet weak var transactionsTableView: UITableView!
    
    var disposeBag = DisposeBag()
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults().setKeys(key: .isShowOnBoarding, value: true)
        setupCardStyle()
        setupTableView()
        bindAccountDetails()
        bindFetchTransactions()
        viewModel.getAccountDetails()
        viewModel.fetchTransactions()
   


    }
}


extension HomeViewController {
    
    
    private func setupTableView() {
        transactionsTableView.dataSource = self
        transactionsTableView.delegate = self
        transactionsTableView.register(UINib(nibName: String(describing: TransactionsTableViewCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TransactionsTableViewCell.self))
    }
    
    private func setupCardStyle() {
        cardView.layer.shadowOpacity = 0.1
        cardView.layer.shadowOffset = CGSize(width: 0, height: 5)
        cardView.layer.shadowRadius = 10
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 20
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.transactions.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TransactionsTableViewCell.self), for: indexPath) as! TransactionsTableViewCell
        
        let model = viewModel.transactions[indexPath.row]
            print("Row \(indexPath.row) will display: \(model.senderName)")
            
            cell.configureTableView(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
}


extension HomeViewController {
    
    func bindAccountDetails() {

        viewModel.publishAccountDetails.subscribe(onNext: { [weak self] state in
            guard let self = self else { return }

            switch state {

            case .success(let data):
                self.accountNumberLabel.text = data.accountNumber
                self.userNameLabel.text = "\(data.fullName ?? "")"
                self.cardHolderNameLabel.text = data.cardHolderName
                self.amountLabel.text = "\(data.currency ?? "") \(data.currentBalance ?? "")"

            case .failure(let msg):
                print("❌ \(msg)")

            case .loading:
                print("loading...")
            }
        }).disposed(by: disposeBag)
    }
    func bindFetchTransactions() {

        viewModel.transactionsState.subscribe(onNext: { [weak self] state in
            guard let self = self else { return }

            switch state {

            case .success(let data):
                print("✅ rows: \(data.count)")
                self.transactionsTableView.reloadData()

            case .failure(let msg):
                print("❌ \(msg)")

            case .showLoading:
                print("loading...")

            case .hideLoading:
                print("hide")
            }
        }).disposed(by: disposeBag)
    }
}
