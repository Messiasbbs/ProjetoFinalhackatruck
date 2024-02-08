import SwiftUI

struct PhotosDAY: Decodable, Hashable {
    
    let date : String?
    var explanation:  String?
    let hdurl :  String?
    var title:  String?
    
    
}

struct PhotosDAY2: Codable, Hashable {
    let date : String?
    var explanation:  String?
    let hdurl :  String?
    var title:  String?
}

struct Foguetes: Decodable, Hashable {
    let titulo: String?
    let url:  String?
    let resumo: String?
    let link: String?
    
 }
struct Noticias: Decodable, Hashable {
    let titulo: String?
    let url:  String?
    let resumo: String?
    let link: String?
}
struct Info: Decodable, Hashable {
    let titulo: String?
    let url:  String?
    let resumo: String?
    let link: String?
}
