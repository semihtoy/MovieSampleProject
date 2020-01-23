import Foundation
struct Profile : Codable {
	let id : Int?
	let userFullName : String?
	let userImageUrl : String?
	let createdAt : String?
	let likeCount : Int?
	let commentCount : Int?
	let postImage : String?
	let postMessage : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case userFullName = "userFullName"
		case userImageUrl = "userImageUrl"
		case createdAt = "createdAt"
		case likeCount = "likeCount"
		case commentCount = "commentCount"
		case postImage = "postImage"
		case postMessage = "postMessage"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		userFullName = try values.decodeIfPresent(String.self, forKey: .userFullName)
		userImageUrl = try values.decodeIfPresent(String.self, forKey: .userImageUrl)
		createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
		likeCount = try values.decodeIfPresent(Int.self, forKey: .likeCount)
		commentCount = try values.decodeIfPresent(Int.self, forKey: .commentCount)
		postImage = try values.decodeIfPresent(String.self, forKey: .postImage)
		postMessage = try values.decodeIfPresent(String.self, forKey: .postMessage)
	}

}
