////
////  PhotoSelectorViewModel.swift
////  Imgur-Study
////
////  Created by Lucas Francisco on 01/07/24.
////
//
//import Foundation
//import PhotosUI
//import _PhotosUI_SwiftUI
//
//extension PhotoSelector {
//    @Observable
//    
//    class ViewModel {
//        @Published var imageSelection: PhotosPickerItem? = nil {
//            didSet {
//                if let imageSelection {
//                    let progress = loadTransferable(from: imageSelection)
//                    imageState = .loading(progress)
//                } else {
//                    imageState = .empty
//                }
//            }
//        }
//    }
//}
