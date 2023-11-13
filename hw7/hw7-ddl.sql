# hw7-ddl.sql
# Bryan Lizama Montecino
# CMSC 508

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS roles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.

DROP TABLE IF EXISTS skills;
CREATE TABLE skills (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(4096) NOT NULL, 
    tag VARCHAR(255) NOT NULL,
    url VARCHAR(255) DEFAULT NULL,
    time_commitment VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (id, name, description, tag, url, time_commitment) VALUES
    (1, 'Web Development', 'Building static and dynamic web applications and webpages', 'Skill 1', 'https://webdevelopment.com/', '3 months'),
    (2, 'Pottery', 'Hand making artistic pieces with clay, using a pottery wheel', 'Skill 2', 'https://www.clayshare.com/', '6 months'),
    (3, 'Spell Casting', 'Properly utilizing sorcery points and spells prior to entering Baldurs Gate', 'Skill 3', 'https://baldursgate3.game/', '2 months'),
    (4, 'SQL Databases', 'Mastering the art of database management and optimization with SQL', 'Skill 4', 'https://www.sql.org/', '5 months'),
    (5, 'Quantum Engineering', 'Understanding and applying principles of quantum mechanics in engineering', 'Skill 5', 'https://quantumengineering.org/', '12 months'),
    (6, 'Virtual Reality with Unity', 'Designing immersive virtual reality experiences using Unity', 'Skill 6', 'https://unity.com/', '8 months'),
    (7, 'TikTok Algorithm Developer', 'Learning to develop and optimize content for TikTok’s unique algorithm', 'Skill 7', 'https://www.tiktok.com/', '4 months'),
    (8, 'Media Creator with AI', 'Creating engaging digital media content using AI tools and techniques', 'Skill 8', 'https://ai4media.eu/', '7 months');

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

DROP TABLE IF EXISTS people;
CREATE TABLE people (
    id INT NOT NULL,
    first_name VARCHAR(255) DEFAULT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) DEFAULT NULL,
    linkedin_url VARCHAR(255) DEFAULT NULL,
    headshot_url VARCHAR(255) DEFAULT NULL,
    discord_handle VARCHAR(255) DEFAULT NULL,
    brief_bio VARCHAR(4096) DEFAULT NULL,
    date_joined DATE NOT NULL,
    PRIMARY KEY (id)
);

# Section 5
# Populate people with ten people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) VALUES
    (1, 'Bob', 'Person 1', 'bob1@email.com', 'https://linkedin.com/bob1', 'http://headshot.url/bob1', 'bob_discord1', 'Bio of Bob', '2020-06-06'),
    (2, 'Astarion', 'Person 2', 'astarion2@email.com', 'https://linkedin.com/astarion2', 'http://headshot.url/astarion2', 'astarion_discord2', 'Bio of Astarion', '2020-08-09'),
    (3, 'Glyzelle', 'Person 3', 'glyzelle3@email.com', 'https://linkedin.com/glyzelle3', 'http://headshot.url/glyzelle3', 'glyzelle_discord3', 'Bio of Glyzelle', '2020-01-15'),
    (4, 'Yassine', 'Person 4', 'yassine4@email.com', 'https://linkedin.com/yassine4', 'http://headshot.url/yassine4', 'yassine_discord4', 'Bio of Yassine', '2020-03-05'),
    (5, 'Alex', 'Person 5', 'alex5@email.com', 'https://linkedin.com/alex5', 'http://headshot.url/alex5', 'alex_discord5', 'Bio of Alex', '2020-11-11'),
    (6, 'Madison', 'Person 6', 'madison6@email.com', 'https://linkedin.com/madison6', 'http://headshot.url/madison6', 'madison_discord6', 'Bio of Madison', '2021-01-12'),
    (7, 'Allison', 'Person 7', 'allison7@email.com', 'https://linkedin.com/allison7', 'http://headshot.url/allison7', 'allison_discord7', 'Bio of Allison', '2020-12-24'),
    (8, 'Kevin', 'Person 8', 'kevin8@email.com', 'https://linkedin.com/kevin8', 'http://headshot.url/kevin8', 'kevin_discord8', 'Bio of Kevin', '2021-04-22'),
    (9, 'Brian', 'Person 9', 'brian9@email.com', 'https://linkedin.com/brian9', 'http://headshot.url/brian9', 'brian_discord9', 'Bio of Brian', '2020-01-10'),
    (10, 'Will', 'Person 10', 'will10@email.com', 'https://linkedin.com/will10', 'http://headshot.url/will10', 'will_discord10', 'Bio of Will', '2020-06-20');

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

DROP TABLE IF EXISTS peopleskills;
CREATE TABLE peopleskills (
    id INT AUTO_INCREMENT,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (skills_id) REFERENCES skills(id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    UNIQUE (skills_id, people_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (people_id, skills_id, date_acquired) VALUES
    (1, 1, '2022-04-01'),
    (1, 3, '2023-01-01'),
    (1, 6, '2022-06-06'),
    (2, 3, '2021-12-31'),
    (2, 4, '2021-03-04'),
    (2, 5, '2021-11-11'),
    (3, 1, '2023-01-03'),
    (3, 5, '2023-02-28'),
    (5, 3, '2022-09-01'),
    (5, 6, '2021-10-01'),
    (6, 2, '2021-09-11'),
    (6, 3, '2021-05-10'),
    (6, 4, '2022-02-02'),
    (7, 3, '2022-02-01'),
    (7, 5, '2022-04-02'),
    (7, 6, '2021-10-03'),
    (8, 1, '2023-01-03'),
    (8, 3, '2022-12-11'),
    (8, 5, '2023-03-05'),
    (8, 6, '2021-07-07'),
    (9, 2, '2022-02-02'),
    (9, 5, '2023-01-04'),
    (9, 6, '2022-11-29'),
    (10, 1, '2022-10-31'),
    (10, 4, '2023-01-11'),
    (10, 5, '2022-04-04');

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

DROP TABLE IF EXISTS roles;
CREATE TABLE roles (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    sort_priority INT NOT NULL,
    PRIMARY KEY (id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (id, name, sort_priority) VALUES
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

DROP TABLE IF EXISTS peopleroles;
CREATE TABLE peopleroles (
    id INT AUTO_INCREMENT,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES
    (1, 2, '2022-01-01'), -- Person 1 is Developer
    (2, 5, '2021-02-01'), -- Person 2 is Boss
    (2, 6, '2022-02-02'), -- Person 2 is also Mentor
    (3, 2, '2022-03-01'), -- Person 3 is Developer
    (3, 4, '2022-03-02'), -- Person 3 is also Team Lead
    (4, 3, '2022-04-01'), -- Person 4 is Recruit
    (5, 3, '2022-05-01'), -- Person 5 is Recruit
    (6, 2, '2022-06-01'), -- Person 6 is Developer
    (6, 1, '2022-06-02'), -- Person 6 is also Designer
    (7, 1, '2023-01-05'), -- Person 7 is Designer
    (8, 1, '2023-02-06'), -- Person 8 is Designer
    (8, 4, '2022-06-06'), -- Person 8 is also Team Lead
    (9, 2, '2022-07-07'), -- Person 9 is Developer
    (10, 2, '2022-08-08'), -- Person 10 is Developer
    (10, 1, '2023-01-02'); -- Person 10 is also Designer