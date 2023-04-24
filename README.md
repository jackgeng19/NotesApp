<body>
    <h1>📝 Notes App</h1>
    <h4>After a semester-long journey with iOS Academy in the App Team, I rebuilt a simple yet powerful iOS note-taking application as it's the most-frequently-used app in my daily life. It allows users to create, edit, and manage notes across multiple folders just like Apple's Notes App.</h4>
    <h3>Check the demo!</h3>https://www.loom.com/share/18e3ac9ebfbf4d2b9d670c776aa09357
    <h2>🚀 Features</h2>
    <ul>
        <li>User-friendly interface</li>
        <li>Create and edit notes using a rich text editor</li>
        <li>Organize notes in custom folders</li>
        <li>Search functionality for quick note access</li>
        <li>Merge notes from multiple folders</li>
        <li>SwiftUI implementation for a native iOS experience</li>
    </ul>
    <h2>📁 Project Structure</h2>
    <ul>
        <li><code>SingleNoteView</code>: A SwiftUI view for creating and editing individual notes.</li>
        <li><code>FolderNotesView</code>: A SwiftUI view for displaying notes within a folder and managing navigation between notes.</li>
        <li><code>ContentView</code>: The main SwiftUI view, displaying a list of folders and providing access to note creation and folder management.</li>
        <li><code>FolderCell</code>: A reusable SwiftUI view component for displaying folder information in the list view.</li>
        <li><code>NewFolderView</code>: A SwiftUI view for creating new folders and adding them to the list.</li>
        <li><code>MyNotes</code>: An ObservableObject class to manage the folders and notes data and provide data manipulation methods.</li>
        <li><code>Folder</code> and <code>Note</code>: Structs representing folder and note objects.</li>
        <li><code>mergeFolder</code>: A utility function to merge notes from two folders into a new folder.</li>
    </ul>
    </ol>
</body>
