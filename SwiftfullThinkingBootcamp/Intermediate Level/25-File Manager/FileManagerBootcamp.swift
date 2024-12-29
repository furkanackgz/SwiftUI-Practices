//
//  FileManagerBootcamp.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 29.12.2024.
//

import SwiftUI

class LocalFileManager {
    static let shared = LocalFileManager()
    private init() { }
    private let folderName = "MyApp_Images"
    
    func createFolderIfNeeded() {
        guard
            let folderPath = getPathForFolder()
        else {
            return
        }
        
        if FileManager.default.fileExists(atPath: folderPath) == false {
            do {
                try FileManager.default.createDirectory(atPath: folderPath,
                                                        withIntermediateDirectories: true)
                print("Success creating folder")
            } catch {
                print("Error creating folder: \(error)")
            }
        }
    }
    
    func deleteFolder() {
        guard
            let folderPath = getPathForFolder()
        else {
            return
        }
        
        if FileManager.default.fileExists(atPath: folderPath) {
            do {
                try FileManager.default.removeItem(atPath: folderPath)
                print("Success deleting folder")
            } catch {
                print("Error deleting folder: \(error)")
            }
        }
    }
    
    func saveImage(image: UIImage?, imageName: String) {
        guard
            let imagePath = getPathForImage(name: imageName),
            let image
        else {
            print("Error saving image")
            return
        }
        print("Success saving image")
        FileManager.default.createFile(atPath: imagePath, contents: image.pngData())
    }
    
    func getImage(imageName: String) -> UIImage? {
        guard
            let imagePath = getPathForImage(name: imageName),
            FileManager.default.fileExists(atPath: imagePath)
        else {
            print("Error getting image")
            return nil
        }
        
        if let data = FileManager.default.contents(atPath: imagePath) {
            print("Success getting image")
            return UIImage(data: data)
        } else {
            print("Error getting image")
            return nil
        }
    }
    
    func deleteImage(imageName: String) {
        guard
            let imagePath = getPathForImage(name: imageName),
            FileManager.default.fileExists(atPath: imagePath)
        else {
            return
        }
        
        do {
            try FileManager.default.removeItem(atPath: imagePath)
            print("Success deleting image")
        } catch {
            print("Error deleting image: \(error)")
        }
    }
    
    private func getPathURLForFolder() -> URL? {
        guard
            let path = FileManager
                .default
                .urls(for: .cachesDirectory, in: .userDomainMask)
                .first?
                .appending(path: folderName)
        else {
            return nil
        }
        
        return path
    }
    
    private func getPathForFolder() -> String? {
        guard
            let path = getPathURLForFolder()
        else {
            return nil
        }
        
        return path.path()
    }
    
    private func getPathForImage(name: String) -> String? {
        guard
            let folderPath = getPathURLForFolder()
        else {
            return nil
        }
        
        let imagePath = folderPath.appending(path: "\(name).png").path()
        return imagePath
    }
}

class FileManagerViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    private let imageName = "tesla"
    
    init() {
        LocalFileManager.shared.createFolderIfNeeded()
        getImageFromFileManager()
    }
    
    private func getImageFromAssets() {
        image = UIImage(named: imageName)
    }
    
    private func getImageFromFileManager() {
        image = LocalFileManager.shared.getImage(imageName: imageName)
    }
    
    func saveImageToFileManager() {
        LocalFileManager.shared.saveImage(image: image, imageName: imageName)
    }
    
    func deleteImageFromFileManager() {
        LocalFileManager.shared.deleteImage(imageName: imageName)
        LocalFileManager.shared.deleteFolder()
    }
}

struct FileManagerBootcamp: View {
    
    @StateObject private var vm = FileManagerViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                Spacer()
                
                if let image = vm.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                HStack(spacing: 16) {
                    Button {
                        vm.saveImageToFileManager()
                    } label: {
                        Text("Save")
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(radius: 8)
                    }

                    Button {
                        vm.deleteImageFromFileManager()
                    } label: {
                        Text("Delete")
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .shadow(radius: 8)
                    }
                }
                .tint(.white)
                Spacer()
                Spacer()
            }
            .navigationTitle("File Manager")
            .frame(maxWidth: .infinity)
            .background(
                Color.gray.ignoresSafeArea()
            )
        }
    }
}

#Preview {
    FileManagerBootcamp()
}
