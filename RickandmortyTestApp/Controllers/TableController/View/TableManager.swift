//
//  TableManager.swift
//  RickandmortyTestApp
//
//  Created by Aleksandr on 29.04.2025.
//

import UIKit

typealias TableManagerExtension = TableManager

enum ListEvent {
    case selected(Int)
    case loadMore
}

class TableManager: NSObject {
    
    var eventHandler: Block<(ListEvent)>?
    private var tableView: UITableView
    private var data: [Morty] = []
    private var isLoadingList: Bool = false
   
    init(_ tableView: UITableView, data: [Morty]) {
        self.data = data
        self.tableView = tableView
        super.init()
        
        registerTableViewCells()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    func reloadData(data: [Morty]) {
        self.data = data
        isLoadingList = false
        tableView.reloadData()
    }
}

private extension TableManagerExtension {
    
    func registerTableViewCells() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
    private func loadMoreItemsForList() {
        eventHandler?(.loadMore)
    }
}

extension TableManagerExtension: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = data[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        cell.configure(model: model)
        return cell
    }
}

extension TableManagerExtension: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        eventHandler?(.selected(indexPath.row))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

extension TableManagerExtension: UIScrollViewDelegate {

func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height ) && !isLoadingList){
            self.isLoadingList = true
            self.loadMoreItemsForList()
        }
    }
}
