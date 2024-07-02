//
//  PhotoSelector.swift
//  Imgur-Study
//
//  Created by Lucas Francisco on 01/07/24.
//

import SwiftUI
import PhotosUI

struct PhotoSelector: View {
    
    @State var uiImage: UIImage? = nil
    @State var imageSelection: PhotosPickerItem? = nil
    @State var textTitle: String = ""
    @State var descriptionText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("title", text: $textTitle)
                    .textFieldStyle(.automatic)
                    .padding()
                    .font(.title)
                TextField("description (optional)", text: $descriptionText)
                    .textFieldStyle(.automatic)
                    .padding(.leading)
                    .font(.headline)
                Button(action: {
                    
                }) {
//                    ZStack {
//                        Rectangle()
//                            .frame(width: 93, height: 28)
//                            .cornerRadius(40)
//                            .foregroundColor(.blue)
                        HStack {
                            Image(systemName: "plus.circle.fill")
                                .frame(width: 18, height: 20)
                                .foregroundColor(.white)
                            Text("add tag")
                                .foregroundColor(.white)
//                                .padding(.trailing, 3)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 6)
                        .background{
                            RoundedRectangle(cornerRadius: 40)
                        }
                        .padding(.leading)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
//                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.trailing)
                Spacer()
                    
                ZStack {
                    Image(uiImage: uiImage ?? UIImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: 361, height: 361)
                        .clipped()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                    photoPickerButton
                }
                Button(action: {
                    
                }) {
                    ZStack {
                        Rectangle()
                            .frame(width: 361, height: 50)
                            .foregroundColor(.blue)
                            .cornerRadius(12)
                        Text("Share")
                            .foregroundColor(.white)
                    }
                }
                
                Spacer()
            }
            .onChange(of: imageSelection) {
                Task { @MainActor in
                    if let data = try? await imageSelection?.loadTransferable(type: Data.self) {
                        uiImage = UIImage(data:data)
                        return
                    }
                }
            }
            .navigationTitle("New post")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
    
    var photoPickerButton: some View {
        PhotosPicker(selection: $imageSelection, matching: .images, photoLibrary: .shared()) {
            Text("Clique para adicionar foto")
        }
        .photosPickerStyle(.presentation)
    }
}

#Preview {
    PhotoSelector()
}
