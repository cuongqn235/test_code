CREATE TABLE IF NOT EXISTS joke (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      isFunny TEXT NULL,
      descriptionJoke TEXT NOT NULL,
      createdAt TEXT NOT NULL
      );