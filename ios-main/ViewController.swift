//
//  ViewController.swift
//  ios-main
//
//  Created by Marco on 26/4/2019.
//  Copyright © 2019 Marco. All rights reserved.
//

import UIKit
import GoogleMobileAds
import Permutive_iOS

class ViewController: UITableViewController {
	let adSize = GADAdSizeFromCGSize(CGSize(width: 300, height: 250))
    
	override func viewDidLoad() {
		super.viewDidLoad()
//        PermutiveManager.testTracker()
	}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 300
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		if isIndexForBannerAd(indexPath) {
			return 250
		} else {
			return 350
		}
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if isIndexForBannerAd(indexPath) {
			let cell = tableView.dequeueReusableCell(withIdentifier: "bannerAdCell")!
			
			var adView: GAMBannerView! = cell.subviews.first(where: { $0 is GAMBannerView }) as? GAMBannerView
			if adView == nil  {
				adView = GAMBannerView(adSize: adSize)
				cell.addSubview(adView)
			}
			
			adView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
			adView.rootViewController = self
			adView.clipsToBounds = true
			adView.frame = cell.bounds
			adView.delegate = self
			adView.load(GAMRequest())
			return cell
		} else {
			let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell")!
			cell.textLabel?.text = String(indexPath.row)
			return cell
		}
	}
	
	private func isIndexForBannerAd(_ indexPath: IndexPath) -> Bool {
		return indexPath.row % 6 == 0 && indexPath.row > 0
	}
	
}

extension ViewController: GADBannerViewDelegate {
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
		print("adViewDidReceiveAd")
	}

    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
		print("didFailToReceiveAdWithError error:\(error.localizedDescription)")
	}
}
