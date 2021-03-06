//
//  OfferWallViewController.swift
//  Kinit
//

import UIKit
import KinUtil

private let newOfferPolicyKey = "org.kinfoundation.kinwallet.showNewOfferPolicy"

class OfferWallViewController: UIViewController {
    fileprivate var layout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    var selectedCell: OfferCollectionViewCell?
    let linkBag = LinkBag()
    var subscriber: FetchableCollectionViewSubscriber<Offer>!

    override func viewDidLoad() {
        super.viewDidLoad()

        //swiftlint:disable:next force_cast
        layout = (collectionView!.collectionViewLayout as! UICollectionViewFlowLayout)

        let itemWidth = view.frame.width - layout.sectionInset.left  - layout.sectionInset.right
        layout.itemSize = OfferCollectionViewCell.itemSize(for: itemWidth)

        collectionView!.register(nib: OfferCollectionViewCell.self)

        configureSubscriber()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        logViewPage()
        collectionView.flashScrollIndicators()

        showPolicyChangeIfNeeded()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    private func showPolicyChangeIfNeeded() {
        guard UserDefaults.standard.bool(forKey: newOfferPolicyKey) == false else {
            return
        }

        UserDefaults.standard.set(true, forKey: newOfferPolicyKey)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            let alertController = KinAlertController(title: nil,
                                                     titleImage: Asset.weMadeASmallChange.image,
                                                     message: L10n.NewOffersPolicy.message,
                                                     primaryAction: .init(title: L10n.NewOffersPolicy.action),
                                                     secondaryAction: nil)
            self?.presentAnimated(alertController)
        }
    }

    func configureSubscriber() {
        subscriber = FetchableCollectionViewSubscriber<Offer>
            .init(collectionView: collectionView,
                  observable: DataLoaders.kinit.offers,
                  linkBag: linkBag,
                  itemsAvailabilityChanged: { [weak self] items, error in
                    self?.availabilityChanged(items: items, error: error)
            })
    }

    func availabilityChanged(items: [Offer]?, error: Error?) {
        children.first?.remove()
        if items == nil {
            let offersUnavailableViewController = OffersUnavailableViewController()
            offersUnavailableViewController.error = error
            add(offersUnavailableViewController) { $0.fitInSuperview(with: .safeArea) }
        }

        if view.window != nil {
            logViewPage()
        }
    }
}

extension OfferWallViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? OfferCollectionViewCell else {
            fatalError("Couldn't get cell at OfferWallViewController collectionView:didSelecItemAtIndexPath:")
        }

        let offer = subscriber.items[indexPath.item]

        guard offer.isAvailable else {
            return
        }

        selectedCell = cell

        logTappedOffer(offer, index: indexPath.row)
        let navController = StoryboardScene.Spend.offerDetailsNavigationController.instantiate()
        guard let detailsViewController = navController.viewControllers.first as? OfferDetailsViewController else {
            fatalError("OfferDetailsNavigationController root vc should be OfferDetailsViewController")
        }
        navController.transitioningDelegate = self
        detailsViewController.offer = offer
        present(navController, animated: true)
    }
}

extension OfferWallViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subscriber.items.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as OfferCollectionViewCell
        cell.offer = subscriber.items[indexPath.item]

        return cell
    }
}

// MARK: Analytics
extension OfferWallViewController {
    func logViewPage() {
        switch DataLoaders.kinit.offers.value! {
        case .none(let error):
            if let error = error {
                let errorType: Events.ErrorType = error.isInternetError ? .internetConnection : .generic
                let failureReason = error.localizedDescription
                Events.Analytics
                    .ViewErrorPage(errorType: errorType, failureReason: failureReason)
                    .send()
            } else {
                Events.Analytics
                    .ViewEmptyStatePage(menuItemName: .earn,
                                        taskCategory: "")
                    .send()
            }
        case .some(let offers):
            Events.Analytics
                .ViewSpendPage(numberOfOffers: offers.count)
                .send()
        }
    }

    func logTappedOffer(_ offer: Offer, index: Int) {
        Events.Analytics
            .ClickOfferItemOnSpendPage(brandName: offer.author.name,
                                       kinPrice: Int(offer.price),
                                       numberOfOffers: subscriber.items.count,
                                       offerCategory: offer.domain,
                                       offerId: offer.identifier,
                                       offerName: offer.title,
                                       offerOrder: index,
                                       offerType: offer.type)
            .send()
    }
}

extension OfferWallViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: L10n.giftCards)
    }
}
