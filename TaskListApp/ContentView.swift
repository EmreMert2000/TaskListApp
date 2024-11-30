import SwiftUI

struct ContentView: View {
    @State private var tasks: [String] = [] // Görevleri tutmak için bir dizi
    @State private var newTask: String = "" // Yeni görev metni

    var body: some View {
        NavigationView {
            VStack {
                // Görev ekleme alanı
                HStack {
                    TextField("Yeni görev ekle...", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    
                    Button(action: {
                        if !newTask.isEmpty {
                            tasks.append(newTask)
                            newTask = ""
                        }
                    }) {
                        Text("Ekle")
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()

                // Görevlerin listesi
                List {
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                    }
                    .onDelete(perform: deleteTask) // Silme işlemi
                }
            }
            .navigationTitle("Görev Listesi")
        }
    }
    
    // Silme fonksiyonu
    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

