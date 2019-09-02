//
//  DeliveryListBrowseView.swift
//  DeliveryList
//
//  Created by Mohammad Zulqarnain on 01/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//
import UIKit

protocol DeliveryListBrowseViewProtocol {
    func setupTable(dataSource: UITableViewDataSource, delegate: UITableViewDelegate)
}

/* DeliveryListBrowseView
 This is the view which is used in DeliveryListBrowseView ViewController
 */
class DeliveryListBrowseView: UIView, DeliveryListBrowseViewProtocol {
    internal let table: UITableView = {
        let table = UITableView()
        table.frame = CGRect(x: 0, y: 0, width: 480, height: 690)
        table.enableAutoLayout()
        return table
    } ()
    
    internal let activityView: UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(style: .whiteLarge)
        activityView.tintColor = UIColor.gray
        activityView.hidesWhenStopped = true
        return activityView
    } ()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(table)
        table.backgroundColor = Colors.lightGray
        table.separatorColor = Colors.lightGray
        table.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        table.topAnchor.constraint(equalTo: (self.topAnchor)).activate()
        table.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).activate()
        table.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor).activate()
        table.bottomAnchor.constraint(equalTo: (self.bottomAnchor)).activate()
        table.showsHorizontalScrollIndicator = false
        table.showsVerticalScrollIndicator = false
        
        setupActivityIndicator()
    }
    
    func setupTable(dataSource: UITableViewDataSource, delegate: UITableViewDelegate) {
        table.dataSource = dataSource
        table.delegate = delegate
        table.register(DeliveryCell.self, forCellReuseIdentifier: "\(DeliveryCell.self)")
    }
    
    func setupActivityIndicator() {
        activityView.center = self.center
        addSubview(activityView)
        activityView.startAnimating()
    }
}

