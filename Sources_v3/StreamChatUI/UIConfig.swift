//
// Copyright © 2020 Stream.io Inc. All rights reserved.
//

import StreamChat
import UIKit

public struct UIConfig<ExtraData: UIExtraDataTypes> {
    public var channelList: ChannelListUI
    public var currentUser: CurrentUserUI
    public var navigation: Navigation
    
    public init(
        channelList: ChannelListUI = .init(),
        currentUser: CurrentUserUI = .init(),
        navigation: Navigation = .init()
    ) {
        self.channelList = channelList
        self.currentUser = currentUser
        self.navigation = navigation
    }
}

// MARK: - UIConfig + Default

private var defaults: [String: Any] = [:]

public extension UIConfig {
    static var `default`: Self {
        get {
            let key = String(describing: ExtraData.self)
            if let existing = defaults[key] as? Self {
                return existing
            } else {
                let config = Self()
                defaults[key] = config
                return config
            }
        }
        set {
            let key = String(describing: ExtraData.self)
            defaults[key] = newValue
        }
    }
}

// MARK: - Navigation

public extension UIConfig {
    struct Navigation {
        public var navigationBar: ChatNavigationBar.Type
        public var channelListRouter: ChatChannelListRouter<ExtraData>.Type
        
        public init(
            navigationBar: ChatNavigationBar.Type = ChatNavigationBar.self,
            channelListRouter: ChatChannelListRouter<ExtraData>.Type = ChatChannelListRouter<ExtraData>.self
        ) {
            self.navigationBar = navigationBar
            self.channelListRouter = channelListRouter
        }
    }
}

// MARK: - ChannelListUI

public extension UIConfig {
    struct ChannelListUI {
        public var channelCollectionView: ChatChannelListCollectionView.Type
        public var channelCollectionLayout: UICollectionViewLayout.Type
        public var channelListItemView: ChatChannelListItemView<ExtraData>.Type
        public var channelViewCell: ChatChannelListCollectionViewCell<ExtraData>.Type
        public var newChannelButton: CreateNewChannelButton.Type
        public var channelListItemSubviews: ChannelListItemSubviews

        public init(
            channelCollectionView: ChatChannelListCollectionView.Type = ChatChannelListCollectionView.self,
            channelCollectionLayout: UICollectionViewLayout.Type = ChatChannelListCollectionViewLayout.self,
            channelListItemView: ChatChannelListItemView<ExtraData>.Type = ChatChannelListItemView<ExtraData>.self,
            channelViewCell: ChatChannelListCollectionViewCell<ExtraData>.Type = ChatChannelListCollectionViewCell<ExtraData>.self,
            newChannelButton: CreateNewChannelButton.Type = CreateNewChannelButton.self,
            channelListItemSubviews: ChannelListItemSubviews = .init()
        ) {
            self.channelCollectionView = channelCollectionView
            self.channelCollectionLayout = channelCollectionLayout
            self.channelListItemView = channelListItemView
            self.channelViewCell = channelViewCell
            self.channelListItemSubviews = channelListItemSubviews
            self.newChannelButton = newChannelButton
        }
    }
    
    struct ChannelListItemSubviews {
        public var avatarView: ChatChannelAvatarView<ExtraData>.Type
        public var unreadCountView: ChatUnreadCountView.Type
        public var readStatusView: ChatReadStatusCheckmarkView.Type
        
        public init(
            avatarView: ChatChannelAvatarView<ExtraData>.Type = ChatChannelAvatarView.self,
            unreadCountView: ChatUnreadCountView.Type = ChatUnreadCountView.self,
            readStatusView: ChatReadStatusCheckmarkView.Type = ChatReadStatusCheckmarkView.self
        ) {
            self.avatarView = avatarView
            self.unreadCountView = unreadCountView
            self.readStatusView = readStatusView
        }
    }
}

// MARK: - CurrentUser

public extension UIConfig {
    struct CurrentUserUI {
        public var currentUserViewAvatarView: CurrentChatUserAvatarView<ExtraData>.Type
        public var avatarView: AvatarView.Type
        
        public init(
            currentUserViewAvatarView: CurrentChatUserAvatarView<ExtraData>.Type = CurrentChatUserAvatarView<ExtraData>.self,
            avatarView: AvatarView.Type = AvatarView.self
        ) {
            self.currentUserViewAvatarView = currentUserViewAvatarView
            self.avatarView = avatarView
        }
    }
}