//
//  MainViewController.swift
//  MyRestrictions
//
//  Created by Andrey Firsenko on 12.06.2024.
//

import Foundation
import UIKit
import SnapKit

final class MainViewController: UIViewController {
    
    // UI
    private let headerView = HeaderView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Private
    
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(headerView)
        headerView.snp.makeConstraints {
            $0.height.equalTo(44)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
        headerView.delegate = self
    }
}

// MARK: - IHeaderViewDelegate

extension MainViewController: IHeaderViewDelegate {
    
    func didTapAddButton() {
        print("log: tap")
    }
}
