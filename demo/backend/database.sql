

CREATE TABLE IF NOT EXISTS client( 
    id                      INTEGER PRIMARY KEY AUTOINCREMENT,
    prenom                  TEXT, 
    nom                     TEXT,
    courriel                TEXT,
    password                TEXT
); 

CREATE TABLE IF NOT EXISTS animal(
    id                      INTEGER PRIMARY KEY AUTOINCREMENT,
    nom                     TEXT,
    categorie               TEXT,
    race                    TEXT,
    age                     TEXT,
    sexe                    TEXT,
    keywords                TEXT,
    photo                   BLOB,
    status                  TEXT
);  

CREATE TABLE IF NOT EXISTS antecedent(
    id                      INTEGER PRIMARY KEY AUTOINCREMENT,
    animal_id               INTEGER,
    diagnostic              TEXT,
    date                    TEXT,
    traitement              TEXT,
    FOREIGN KEY(animal_id)  REFERENCES animal(id)
); 

CREATE TABLE IF NOT EXISTS administrateur(
    id                      INTEGER PRIMARY KEY,
    password                TEXT
); 

CREATE TABLE IF NOT EXISTS message(
    id                      INTEGER PRIMARY KEY AUTOINCREMENT,
    email                   TEXT, 
    prenom                  TEXT,
    nom                     TEXT,
    sujet                   TEXT,
    contenu                 TEXT
);

CREATE TABLE IF NOT EXISTS adoption(
    id                      INTEGER PRIMARY KEY AUTOINCREMENT,
    animal_id               INTEGER,
    client_id               INTEGER,
    date                    INTEGER,
    FOREIGN KEY(animal_id)  REFERENCES animal(id),
    FOREIGN key(client_id)  REFERENCES client(id)
); 

CREATE TABLE IF NOT EXISTS rencontre(
    id                      INTEGER PRIMARY KEY AUTOINCREMENT,
    client_id               INTEGER,  
    animal_id               INTEGER,
    jour                    INTEGER,
    mois                    TEXT,
    annee                   INTEGER,
    heure                   INTEGER,
    minutes                 INTEGER, 
    FOREIGN KEY(animal_id)  REFERENCES animal(id),
    FOREIGN key(client_id)  REFERENCES client(id)
); 

CREATE TABLE IF NOT EXISTS animalAime(
    client_id               INTEGER,
    animal_id               INTEGER
);

-- Insertion pour la table administrateur
INSERT INTO administrateur (id, password) VALUES (1, 'motdepasseadmin');

-- Insertions pour la table animal
INSERT INTO animal (nom, categorie, race, age, sexe, keywords, photo, status) VALUES 
('Félix', 'Chat', 'Siamois', '2 ans', 'Mâle', 'affectueux, joueur', NULL, 'Disponible'),
('Bella', 'Chien', 'Labrador', '3 ans', 'Femelle', 'docile, aime courir', NULL, 'Disponible'),
('Caramel', 'Chat', 'Persan', '1 an', 'Mâle', 'calme, câlin', NULL, 'Adopté'),
('Max', 'Chien', 'Golden Retriever', '4 ans', 'Mâle', 'sociable, obéissant', NULL, 'Disponible'),
('Luna', 'Chat', 'Maine Coon', '3 ans', 'Femelle', 'joueuse, indépendante', NULL, 'Disponible'),
('Rocky', 'Chien', 'Bulldog', '5 ans', 'Mâle', 'protecteur, aime les enfants', NULL, 'Disponible');

-- Insertions pour la table client
INSERT INTO client (prenom, nom, courriel, password) VALUES 
('Jean', 'Dupont', 'jean.dupont@email.com', 'mdpjean'),
('Marie', 'Durand', 'marie.durand@email.com', 'mdpmarie'),
('Pierre', 'Martin', 'pierre.martin@email.com', 'mdppierre'),
('Sophie', 'Lefebvre', 'sophie.lefebvre@email.com', 'mdpsophie');

-- Insertion pour la table message
INSERT INTO message (email, prenom, nom, sujet, contenu) VALUES 
('contact@email.com', 'John', 'Doe', 'Question sur adoption', 'Bonjour, j aimerais avoir plus d informations sur la procédure d adoption.');
