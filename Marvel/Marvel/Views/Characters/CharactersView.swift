//
//  CharactersView.swift
//  Marvel
//
//  Created by Rodrigo Damacena Gamarra Maciel on 19/12/20.
//

import UIKit

protocol CharactersViewDelegate: AnyObject {
    func loadMore()
    func reloadListCharacters()
    func didSelectCharacter(_ idCharacter: Int)
}

class CharactersView: UIView {
    
    private var tableViewRowHeightCell: CGFloat = 250
    private var tableView = UITableView() {
        didSet {
            tableView.rowHeight = UITableView.automaticDimension
            tableView.estimatedRowHeight = tableViewRowHeightCell
            tableView.separatorStyle = .none
            tableView.footerViewEmpty()
        }
    }
    
    var items: [Character] = [] {
        didSet {
            tableView.reloadData()
            refreshControl.endRefreshing()
            hideTableView = items.isEmpty
        }
    }
    
    private var refreshControl: UIRefreshControl!
    weak var delegate: CharactersViewDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setups()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setups()
    }
    
    private func setups() {
        setupConstraints()
        setupTableView()
        setupRefreshControl()
        hideTableView = true
    }
    
    private func setupConstraints() {
        addSubview(tableView)
        self.stretch(view: tableView)
    }
    
    private func setupTableView() {
        tableView.register(CharacterTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupRefreshControl() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: UIControl.Event.valueChanged)
        tableView.refreshControl = self.refreshControl
    }
    
    @objc func refresh(_ sender:AnyObject) {
        delegate?.reloadListCharacters()
    }
    
    var hideTableView: Bool = true {
        didSet {
            self.tableView.isHidden = hideTableView
        }
    }
}

extension CharactersView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeue(CharacterTableViewCell.self, for: indexPath)
        cell.configure(items[indexPath.row])
        
        if indexPath.row == items.count - 1 {
            delegate?.loadMore()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectCharacter(items[indexPath.row].id)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableViewRowHeightCell
    }
}
