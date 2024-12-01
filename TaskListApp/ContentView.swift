import SwiftUI

struct ContentView: View {
    @State private var tasks: [String] = UserDefaults.standard.loadTasks()
    @State private var newTask: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                // Arkaplan Renk Geçişi
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack {
                    
                    Text("Görev Listesi")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 20)

                    
                    HStack {
                        TextField("Yeni görev ekle...", text: $newTask)
                            .padding()
                            .background(Color.white.opacity(0.8))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                            .padding(.horizontal)

                        Button(action: {
                            if !newTask.isEmpty {
                                tasks.append(newTask)
                                UserDefaults.standard.saveTasks(tasks)
                                newTask = ""
                            }
                        }) {
                            Text("Ekle")
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        }
                    }
                    .padding()

                  
                    List {
                        ForEach(tasks, id: \.self) { task in
                            HStack {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                    .padding(.trailing, 8)
                                Text(task)
                                    .fontWeight(.medium)
                            }
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        }
                        .onDelete(perform: deleteTask)
                    }
                    .listStyle(PlainListStyle()) // Modern bir liste stili
                    .background(Color.clear) // Arkaplanı şeffaf yap
                }
                .padding(.bottom, 20)
            }
        }
    }

    
    private func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
        UserDefaults.standard.saveTasks(tasks)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
