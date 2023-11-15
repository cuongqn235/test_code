CREATE TABLE IF NOT EXISTS joke (
      id TEXT NOT NULL PRIMARY KEY,
      isFunny BOOLEAN NULL,
      descriptionJoke TEXT NOT NULL,
      createdAt TEXT NOT NULL,
      );