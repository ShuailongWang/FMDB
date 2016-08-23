-- 创建个人表 --
CREATE TABLE IF NOT EXISTS T_Person (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    age INTEGER
);
-- 创建学生表 --
CREATE TABLE IF NOT EXISTS T_Student (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    age INTEGER,
    score INTEGER
);