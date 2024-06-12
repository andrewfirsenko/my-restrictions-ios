//
//  HeaderView.swift
//  MyRestrictions
//
//  Created by Andrey Firsenko on 12.06.2024.
//

import Foundation
import UIKit
import SnapKit

private extension UIImage {
    static let addButtonColor: UIImage = UIImage(resource: .addButton).withTintColor(.black, renderingMode: .alwaysOriginal)
}

protocol IHeaderViewDelegate: AnyObject {
    func didTapAddButton()
}

final class HeaderView: UIView {
    
    // Dependencies
    weak var delegate: IHeaderViewDelegate?
    
    // UI
    private let addButton = UIButton(type: .system)
    private let title = UILabel()
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        
        configureUI()
        configureActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func configureUI() {
        addSubview(addButton)
        addSubview(title)
        
        addButton.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(20)
        }
        title.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.lessThanOrEqualTo(addButton.snp.leading).inset(16)
        }
        
        addButton.setImage(.addButtonColor, for: .normal)
        addButton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        title.text = L10n.myRestrictions
        title.textColor = .black
        title.font = .boldSystemFont(ofSize: 20)
    }
    
    private func configureActions() {
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
    }
    
    @objc private func addButtonAction() {
        delegate?.didTapAddButton()
    }
}
