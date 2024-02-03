
import SwiftUI

class ViewModel : ObservableObject {
    @Published var arrayPhotosDay : [PhotosDAY] = []
    
    func fetch(){
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=mgiCGzPL0waPLzPFLXc4wGLmF3KBx1wLajfhkEAH" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode(PhotosDAY.self, from: data)
                
                DispatchQueue.main.async {
                   // self?.arrayPhotosDay = parsed
                    self?.arrayPhotosDay.append(parsed)
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
}
