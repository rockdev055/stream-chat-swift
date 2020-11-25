//
// Copyright © 2020 Stream.io Inc. All rights reserved.
//

import UIKit

open class ChatReadStatusCheckmarkView: UIView {
    public enum Status {
        case read, unread, empty
    }
    
    // MARK: - Properties
    
    public var status: Status = .empty {
        didSet {
            updateContent()
        }
    }
    
    public var readTintColor: UIColor = .systemBlue {
        didSet {
            updateContent()
        }
    }
    
    public var unreadTintColor: UIColor = .systemGray {
        didSet {
            updateContent()
        }
    }
    
    // MARK: - Subviews
    
    private lazy var imageView = UIImageView().withoutAutoresizingMaskConstraints
    
    // MARK: - Init
    
    public required init() {
        super.init(frame: .zero)
        commonInit()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        embed(imageView)
        setupLayout()
        setupAppearance()
        updateContent()
    }
    
    // MARK: - Public
    
    open func setupAppearance() {
        imageView.contentMode = .scaleAspectFit
    }
    
    open func setupLayout() {
        widthAnchor.constraint(equalTo: heightAnchor, multiplier: 1).isActive = true
    }
    
    open func updateContent() {
        switch status {
        case .empty:
            imageView.image = nil
        case .read:
            imageView.image = UIImage(named: "doubleCheckmark", in: .streamChatUI)
            imageView.tintColor = readTintColor
        case .unread:
            imageView.image = UIImage(named: "checkmark", in: .streamChatUI)
            imageView.tintColor = unreadTintColor
        }
    }
}