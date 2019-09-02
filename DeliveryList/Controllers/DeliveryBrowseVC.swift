//
//  DeliveryBrowseVC.swift
//  DeliveryList
//
//  Created by Mohammad Zulqarnain on 02/09/2019.
//  Copyright © 2019 Mohammad Zulqarnain. All rights reserved.
//

import UIKit

protocol DeliveryBrowseVCProtocol {
    func setupView()
    func barItemSetUp()
    func loadView()
    func fetchDeliveryData()
    func pullDataFromPersistentStore()
    func callWebService(offset: Int, limit: Int)
    func stopActivityIndicator()
    func updateTableView()
    func getDeliveryList() -> [Delivery]
    func getTableView() -> UITableView
    func getActivityIndicator() -> UIActivityIndicatorView
}

/* DeliveryBrowseVC
 This is the UIViewcontroller class responsible for displaying the initial delivery list to the user
 */
class DeliveryBrowseVC: UIViewController {
    private let webserviceManager = WebserviceManager()
    private var refreshBarButton: UIBarButtonItem!
    static var deliveriesLimit = 20
    private var deliveryListBrowseView: DeliveryListBrowseView {
        view.backgroundColor = Colors.lightGray
        return view as! DeliveryListBrowseView
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
       setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        deliveryListBrowseView.isHidden = false
        fetchDeliveryData()
    }
}

extension DeliveryBrowseVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let deliveriesList = webserviceManager.deliveriesList as DeliveriesList? else { return 0 }
        return deliveriesList.deliveries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard webserviceManager.deliveriesList.deliveries.count > indexPath.row else { return UITableViewCell()}
        let cell = deliveryListBrowseView.table.dequeueReusableCell(withIdentifier: "\(DeliveryCell.self)") as! DeliveryCell
        let delivery = webserviceManager.deliveriesList.deliveries[indexPath.row]
        cell.configure(description: delivery.description, uRLString: delivery.imageUrl)
        cell.layoutMargins = .zero
        cell.contentView.layoutMargins.left = 5
        cell.contentView.layoutMargins.right = 5
        cell.contentView.layoutMargins.top = 5
        cell.contentView.layoutMargins.bottom = 5
        cell.contentView.backgroundColor = Colors.lightGray
        cell.backgroundColor = Colors.lightGray
        
        let whiteRoundedView : UIView = UIView(frame: CGRect(x:5, y:5, width:cell.frame.size.width + 18, height:DeliveryCell.thumbnailHeightWidth - 5))
        whiteRoundedView.layer.borderColor = Colors.blackish.cgColor
        whiteRoundedView.layer.borderWidth = 1.0
        whiteRoundedView.layer.backgroundColor = Colors.white.cgColor
        whiteRoundedView.layer.masksToBounds = false
        
        cell.contentView.addSubview(whiteRoundedView)
        cell.contentView.sendSubviewToBack(whiteRoundedView)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DeliveryCell.thumbnailHeightWidth
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let deliveryDetailVC = DeliveryDetailVC.getDeliveryDetailVC(delivery: webserviceManager.deliveriesList.deliveries[indexPath.row])
        deliveryListBrowseView.isHidden = true
        navigationController?.pushViewController(deliveryDetailVC, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let height = scrollView.frame.size.height
        let contentYoffset = scrollView.contentOffset.y
        let distanceFromBottom = scrollView.contentSize.height - contentYoffset
        if distanceFromBottom < height, let lastIndex = deliveryListBrowseView.table.indexPathsForVisibleRows?.last as IndexPath?, let row = lastIndex.row as Int?, (row + 1) % 20 == 0, Reachability.isConnectedToNetwork() {
            callWebService(offset: IntConstants.deliveriesOffset.rawValue, limit: DeliveryBrowseVC.deliveriesLimit)
        }
    }
}

extension DeliveryBrowseVC: DeliveryBrowseVCProtocol {
    func setupView() {
        barItemSetUp()
    }

    public func getDeliveryList() -> [Delivery] {
        return webserviceManager.deliveriesList.deliveries
    }
    
    func barItemSetUp() {
        let image = UIImage(named: "refreshButton")?.withRenderingMode(.alwaysOriginal)
        refreshBarButton = UIBarButtonItem(image: image, style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = self.refreshBarButton
    }

    override func loadView() {
        view = DeliveryListBrowseView(frame: UIScreen.main.bounds)
        title = "All Deliveries"
        deliveryListBrowseView.setupTable(dataSource: self, delegate: self)
    }
    
    func stopActivityIndicator() {
        self.deliveryListBrowseView.activityView.stopAnimating()
        self.deliveryListBrowseView.activityView.isHidden = true
    }
    
    
    public func getActivityIndicator() -> UIActivityIndicatorView {
        return deliveryListBrowseView.activityView
    }
    
    public func getTableView() -> UITableView {
        return deliveryListBrowseView.table
    }
    
    func fetchDeliveryData() {
        guard Reachability.isConnectedToNetwork() else {
            CommonFunctionality.presentAlert(viewController: self, title: StringConstants.internetErrorTitleText.rawValue, message: StringConstants.internetErrorMessageText.rawValue, callbackOnAffirmation:({
                guard Reachability.isConnectedToNetwork() else { return }
                self.callWebService(offset: IntConstants.deliveriesOffset.rawValue, limit: DeliveryBrowseVC.deliveriesLimit)
            }), callbackOnNegation: {
                self.pullDataFromPersistentStore()
            })
            return
        }
        callWebService(offset: IntConstants.deliveriesOffset.rawValue, limit: DeliveryBrowseVC.deliveriesLimit)
    }
    
    func pullDataFromPersistentStore() {
        guard let deliveries = PersistentStore.shared.getObject(StringConstants.deliveriesKey.rawValue, Array<Delivery>.self) as [Delivery]? else { return }
        self.webserviceManager.deliveriesList.deliveries = deliveries
        
        self.updateTableView()
    }
    
    func updateTableView() {
        DispatchQueue.main.async {
            self.stopActivityIndicator()
            self.deliveryListBrowseView.table.reloadData()
        }
    }
    
    func callWebService(offset: Int, limit: Int) {
        webserviceManager.getDeliveriesList(offset: offset, limit: limit, { results in
            switch results {
            case .Success(let value):
                self.webserviceManager.deliveriesList.deliveries = value
                
                //Clear persistent store
                PersistentStore.shared.clearData(StringConstants.deliveriesKey.rawValue)
                //saving deliveries to persistent store
                PersistentStore.shared.setObject(key: StringConstants.deliveriesKey.rawValue, value: value)
                self.updateTableView()
                //Update the offset for the next 20 items
                DeliveryBrowseVC.deliveriesLimit += 20
            case .Failure(let error):
                print(error.localizedDescription)
            }})
    }
    
}
