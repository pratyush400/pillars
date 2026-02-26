-- Player
CREATE TABLE Player (
  PlayerID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  FirstName VARCHAR(50) NOT NULL,
  LastName  VARCHAR(50) NOT NULL,
  Email     VARCHAR(250) NOT NULL UNIQUE,
  DOB       DATE NULL,
  PasswordHash VARCHAR(255) NOT NULL,
  PlayerLevel INT UNSIGNED,
  PlayerPillar VARCHAR(50),
);

-- Playthru (1 per player per game)
CREATE TABLE 10MPlaythru (
  PlaythruID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  PlayerID INT UNSIGNED UNIQUE NOT NULL, 
  CurrentDifficulty ENUM('EASY','MED','HARD', 'DONE'),
  FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID) ON DELETE CASCADE
);

-- Moral catalog (pre-built/core + common + custom)
CREATE TABLE Moral (
  MoralID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  Description VARCHAR(255) NOT NULL, -- (ex: "Thou shalt not kill.")
  MoralType ENUM('CORE','COMMON','CUSTOM') NOT NULL,
  CreatedByPlaythruID INT UNSIGNED NULL, -- for custom morals
  FOREIGN KEY (CreatedByPlaythruID) 
    REFERENCES 10MPlaythru(PlaythruID) 
    ON DELETE SET NULL
);

-- Final moral set for HARD (the 10 morals in current playthru)
CREATE TABLE PlaythruMoral (
  PlaythruID INT UNSIGNED NOT NULL,
  MoralID INT UNSIGNED NOT NULL,
  ReplacementMoralID INT UNSIGNED,
  Active TINYINT(1) NOT NULL, -- 1 for true, 0 for false
  Ranking TINYINT,
  PRIMARY KEY (PlaythruID, MoralID),
  FOREIGN KEY (PlaythruID) REFERENCES 10MPlaythru(PlaythruID) ON DELETE CASCADE,
  FOREIGN KEY (MoralID) REFERENCES Moral(MoralID),
  FOREIGN KEY (ReplacementMoralID) REFERENCES Moral(MoralID),
  UNIQUE (PlaythruID, Ranking) -- Only one moral per rank
);

-- CREATE INDEX idx_ranking_moral ON PlaythruMoral (MoralID, Rank);
