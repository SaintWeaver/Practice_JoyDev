//
//  SegmentedViewTableCell.swift
//  Lab1
//
//  Created by George Weaver on 29.10.2021.
//

import UIKit

protocol HeaderViewDelegate: AnyObject {
    func segmentedTapped(_ index: Int)
}

class HeaderView: UIView {
    
    let segmentedControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Вход", "Регистрация"])
        segment.tintColor = .blue
        return segment
    }()
    
    var segmentSelected: ((Int) -> Void)?
    weak var delegate: HeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        addActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: self.topAnchor, constant: 4),
            segmentedControl.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 12),
            segmentedControl.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            segmentedControl.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -12),
            segmentedControl.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func configure(_ segmentedIndex: Int) {
        segmentedControl.selectedSegmentIndex = segmentedIndex
    }
    
    func addActions() {
        segmentedControl.addTarget(self, action: #selector(handleChange), for: .valueChanged)
    }
    
    @objc func handleChange() {
        delegate?.segmentedTapped(segmentedControl.selectedSegmentIndex)
    }
    
}
