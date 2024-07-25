import SwiftUI

struct ContentView: View {
    @State private var website = ""
    @State private var blocklist = [String]()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter website", text: $website)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .frame(height: 50)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.leading, 20)
                    
                    Button(action: addWebsite) {
                        Text("Add")
                            .padding()
                            .frame(minWidth: 70)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.trailing, 20)
                    }
                }
                .padding(.top, 20)
                
                List {
                    ForEach(blocklist, id: \.self) { site in
                        Text(site)
                            .padding()
                            .background(Color(.systemGray5))
                            .cornerRadius(8)
                            .padding(.vertical, 2)
                    }
                    .onDelete(perform: removeWebsites)
                }
                .listStyle(PlainListStyle())
                .navigationBarTitle("Blocklist")
                .navigationBarItems(trailing: EditButton())
            }
            .background(Color(.systemGroupedBackground))
        }
    }
    
    private func addWebsite() {
        if !website.isEmpty {
            blocklist.append(website)
            website = ""
        }
    }
    
    private func removeWebsites(at offsets: IndexSet) {
        blocklist.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
