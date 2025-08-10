import SwiftUI

struct RecordView: View {
    // simple model for each record item
    struct Record: Identifiable {
        let id = UUID()
        let title: String
        let date: String
        let iconName: String
    }

    // sample list of records to show
    let records = [
        Record(title: "Meeting with Team", date: "Aug 10, 2025", iconName: "person.3.fill"),
        Record(title: "Project Milestone", date: "Aug 9, 2025", iconName: "flag.fill"),
        Record(title: "Code Review", date: "Aug 8, 2025", iconName: "doc.text.fill"),
        Record(title: "Deployment", date: "Aug 7, 2025", iconName: "arrow.up.right.square.fill"),
        Record(title: "Client Call", date: "Aug 6, 2025", iconName: "phone.fill"),
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    // loop through all records and display each row
                    ForEach(records) { record in
                        HStack(spacing: 16) {
                            // icon container with purple background
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.purple.opacity(0.3))
                                    .frame(width: 50, height: 50)

                                Image(systemName: record.iconName)
                                    .font(.system(size: 24))
                                    .foregroundColor(.white)
                            }

                            // title and date stacked vertically
                            VStack(alignment: .leading, spacing: 4) {
                                Text(record.title)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                Text(record.date)
                                    .font(.subheadline)
                                    .foregroundColor(Color.white.opacity(0.7))
                            }
                            Spacer()
                        }
                        .padding()
                        .background(Color(red: 0.1, green: 0.1, blue: 0.12))
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.7), radius: 8, x: 0, y: 4)
                    }
                }
                .padding()
                .background(Color.black.ignoresSafeArea()) // background for whole scroll view
            }
            .navigationTitle("Records")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.black)
        }
    }
}

struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
            .preferredColorScheme(.dark)
    }
}
