CREATE TABLE IF NOT EXISTS joke (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      isFunny BOOLEAN,
      descriptionJoke TEXT NOT NULL,
      createdAt TEXT NOT NULL
      );