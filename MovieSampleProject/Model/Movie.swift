import Foundation
struct Movie : Codable {
	let id : Int?
	let movieImage : String?
	let movieTitle : String?
	let movieYear : Int?
	let movieGenre : String?
	let isPopular : Bool?
	let isRecommended : Bool?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case movieImage = "movieImage"
		case movieTitle = "movieTitle"
		case movieYear = "movieYear"
		case movieGenre = "movieGenre"
		case isPopular = "isPopular"
		case isRecommended = "isRecommended"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		movieImage = try values.decodeIfPresent(String.self, forKey: .movieImage)
		movieTitle = try values.decodeIfPresent(String.self, forKey: .movieTitle)
		movieYear = try values.decodeIfPresent(Int.self, forKey: .movieYear)
		movieGenre = try values.decodeIfPresent(String.self, forKey: .movieGenre)
		isPopular = try values.decodeIfPresent(Bool.self, forKey: .isPopular)
		isRecommended = try values.decodeIfPresent(Bool.self, forKey: .isRecommended)
	}

}
