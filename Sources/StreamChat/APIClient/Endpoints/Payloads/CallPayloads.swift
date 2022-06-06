//
// Copyright © 2022 Stream.io Inc. All rights reserved.
//

import Foundation

struct CallTokenPayload: Decodable {
    private enum CodingKeys: String, CodingKey {
        case token
        case agoraUid = "agora_uid"
    }
    
    /// The call token.
    let token: String
    /// The UID related to this token (Agora only).
    let agoraUid: String?
    
    init(token: String, agoraUid: String?) {
        self.token = token
        self.agoraUid = agoraUid
    }
}

struct AgoraPayload: Decodable {
    let channel: String
}

struct HMSPayload: Decodable {
    private enum CodingKeys: String, CodingKey {
        case roomId = "room_id"
        case roomName = "room_name"
    }

    let roomId: String
    let roomName: String
}

struct CallPayload: Decodable {
    let id: String
    let provider: String
    let agora: AgoraPayload?
    let hms: HMSPayload?
}

struct CreateCallPayload: Decodable {
    private enum CodingKeys: String, CodingKey {
        case token
        case agoraUid = "agora_uid"
        case call
    }

    /// The call object.
    let call: CallPayload

    /// The call token.
    let token: String

    /// The UID related to this token (Agora only).
    let agoraUid: String?
    
    init(call: CallPayload, token: String, agoraUid: String?) {
        self.call = call
        self.token = token
        self.agoraUid = agoraUid
    }
}
