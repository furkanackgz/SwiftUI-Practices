//
//  PhotoListFileManager.swift
//  SwiftfullThinkingBootcamp
//
//  Created by Furkan Açıkgöz on 29.12.2024.
//

import Foundation
import SwiftUI

class PhotoListFileManager {
    static let shared = PhotoListFileManager()
    private init() {
        createFolderIfNeeded()
    }
    
    private let folderName = "app_photos"
    
    func add(image: UIImage, key: String) {
        guard let pathForFile = getPathForFile(key: key) else {
            print("Error adding file to file manager")
            return
        }
        
        FileManager.default.createFile(atPath: pathForFile, contents: image.pngData())
    }
    
    func get(key: String) -> UIImage? {
        guard
            let pathForFile = getPathForFile(key: key),
            FileManager.default.fileExists(atPath: pathForFile)
        else {
            return nil
        }
        
        return UIImage(contentsOfFile: pathForFile)
    }
    
    private func createFolderIfNeeded() {
        guard let path = getPathForFolder() else { return }
        
        if FileManager.default.fileExists(atPath: path) == false {
            do {
                try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
            } catch {
                print("Error creating directory, \(error)")
            }
        }
    }
    
    private func getPathURLForFolder() -> URL? {
        FileManager
            .default
            .urls(for: .cachesDirectory, in: .userDomainMask)
            .first?
            .appending(path: folderName)
    }
    
    private func getPathForFolder() -> String? {
        getPathURLForFolder()?.path()
    }
    
    private func getPathURLForFile(key: String) -> URL? {
        guard let pathURLForFolder = getPathURLForFolder() else { return nil }
        let pathURLForFile = pathURLForFolder.appending(path: key + ".png")
        return pathURLForFile
    }
    
    private func getPathForFile(key: String) -> String? {
        guard let pathURLForFile = getPathURLForFile(key: key) else { return nil }
        return pathURLForFile.path()
    }
}
