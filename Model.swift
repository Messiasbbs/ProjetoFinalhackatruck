import SwiftUI

struct PhotosDAY: Decodable, Hashable {
    let date : String?
    let explanation:  String?
    let hdurl :  String?
    let title:  String?
    
}
struct Foguetes: Decodable, Hashable {
    let titulo: String?
    let url:  String?
    let resumo: String?
}
struct Noticias: Decodable, Hashable {
    let titulo: String?
    let url:  String?
    let resumo: String?
}
struct Info: Decodable, Hashable {
    let titulo: String?
    let url:  String?
    let resumo: String?
}
