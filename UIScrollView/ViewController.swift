//
//  ViewController.swift
//  UIScrollView
//
//  Created by Laxmikanth Reddy on 17/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView = ScrollView()
    
    override func loadView() {
        view = scrollView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        scrollView.label.text = dummyText
    }
    

}


class ScrollView: UIView {
    
    
    public lazy var requestView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        return view
    }()
    
    public lazy var requestButton: UIView = {
        let button = UIButton()
        button.setTitle("Request Data", for: .normal)
        button.tintColor = .white
        return button
    }()
    
    public lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.backgroundColor = .systemGroupedBackground
        return sv
    }()
    
    public lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGroupedBackground
        return view
    }()
    
    
    public lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.text = ""
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupRequestViewConstraints()
        setupRequestButtonConstraints()
        setupScrollViewConstraints()
        setupContentViewConstraints()
        setupLabelConstraints()
    }
    
    private func setupRequestViewConstraints() {
        addSubview(requestView)
        requestView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            requestView.bottomAnchor.constraint(equalTo: bottomAnchor),
            requestView.leadingAnchor.constraint(equalTo: leadingAnchor),
            requestView.trailingAnchor.constraint(equalTo: trailingAnchor),
            requestView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.12)
        ])
    }
    
    private func setupRequestButtonConstraints() {
        addSubview(requestButton)
        requestButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            requestButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            requestButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    private func setupScrollViewConstraints() {
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: requestView.topAnchor)
        ])
    }
    
    private func setupContentViewConstraints() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func setupLabelConstraints() {
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    
}
