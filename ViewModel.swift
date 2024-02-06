
import SwiftUI

class ViewModel : ObservableObject {
    @Published var arrayPhotosDay : [PhotosDAY] = []
    @Published var arrayInfo : [Info] = []
    @Published var arrayFoguetes : [Foguetes] = []
    @Published var arrayNoticias : [Noticias] = []
    
    func fotos(){
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
                    self?.arrayPhotosDay = []
                    self?.arrayPhotosDay.append(parsed)
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    func foguetes(){
        guard let url = URL(string: "http://127.0.0.1:1880/lerfoguetes" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Foguetes].self, from: data)
                
                DispatchQueue.main.async {
                   self?.arrayFoguetes = parsed
                   // self?.arrayFoguetes.append(parsed)
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    func info(){
        guard let url = URL(string: "http://127.0.0.1:1880/lerinfo" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Info].self, from: data)
                
                DispatchQueue.main.async {
                    self?.arrayInfo = parsed
                    //self?.arrayInfo.append(parsed)
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    func noticias(){
        guard let url = URL(string: "http://127.0.0.1:1880/lernoticias" ) else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
                guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Noticias].self, from: data)
                
                DispatchQueue.main.async {
                   self?.arrayNoticias = parsed
                    //self?.arrayNoticias.append(parsed)
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
}
