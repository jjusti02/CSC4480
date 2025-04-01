-- Users Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL
);

-- Companies Table
CREATE TABLE Companies (
    CompanyID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Industry VARCHAR(100),
    Website VARCHAR(255)
);

-- Job Applications Table
CREATE TABLE JobApplications (
    ApplicationID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT NOT NULL,
    CompanyID INT NOT NULL,
    JobTitle VARCHAR(100) NOT NULL,
    Status ENUM('Applied', 'Interview Scheduled', 'Offer Received', 'Rejected', 'Withdrawn') NOT NULL,
    DateApplied DATE NOT NULL,
    FollowUpDate DATE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID) ON DELETE CASCADE
);

-- Interviews Table
CREATE TABLE Interviews (
    InterviewID INT PRIMARY KEY AUTO_INCREMENT,
    ApplicationID INT NOT NULL,
    InterviewDate DATE NOT NULL,
    InterviewType ENUM('Phone', 'Video', 'On-site', 'HR Screening', 'Technical', 'Behavioral'),
    InterviewNotes TEXT,
    FOREIGN KEY (ApplicationID) REFERENCES JobApplications(ApplicationID) ON DELETE CASCADE
);

-- Notes Table
CREATE TABLE Notes (
    NoteID INT PRIMARY KEY AUTO_INCREMENT,
    ApplicationID INT NOT NULL,
    Content TEXT NOT NULL,
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ApplicationID) REFERENCES JobApplications(ApplicationID) ON DELETE CASCADE
);

-- Documents Table
CREATE TABLE Documents (
    DocumentID INT PRIMARY KEY AUTO_INCREMENT,
    ApplicationID INT NOT NULL,
    FileName VARCHAR(255) NOT NULL,
    FileType VARCHAR(50),
    UploadDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ApplicationID) REFERENCES JobApplications(ApplicationID) ON DELETE CASCADE
);
