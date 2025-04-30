//
//  TableController.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 29.04.2025.
//

import UIKit

final class TableController: BaseController {
    
    var viewModel: TableViewModelInterface?
    private var tableView: UITableView?
    private var tableManager: TableManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    func setViewModel(_ vModel: TableViewModelInterface) {
        self.viewModel = vModel
       
        guard let tableView = tableView,
        let viewModel = viewModel else { return }
        
        tableManager = TableManager(tableView, data: viewModel.models)
        tableManager?.eventHandler = { [weak self] event in
            guard let self = self,
            let viewModel = self.viewModel else { return }
            
            viewModel.getEvents(event)
        }
        viewModel.reloadTableView = { [weak self] _ in
            guard let self = self,
            let tableManager = self.tableManager else { return }
            
            tableManager.reloadData(data: viewModel.models)
        }
        viewModel.fetchModels()
    }
}

 private extension TableController {
    
    func configureUI() {
        setupTableView()
        createTitle(Titles.tableTitle.title)
    }
     
     func setupTableView() {
         // Add the tableView to the view
         tableView = UITableView()
         guard let tableView = tableView else { return }
         view.addSubview(tableView)

         // Set constraints (using Auto Layout)
         tableView.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
             tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
             tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
             tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
             tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
         ])
     }
}
