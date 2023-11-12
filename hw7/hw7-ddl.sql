# hw7-ddl.sql

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
# You can assign the skill descriptions.  Please be creative!

DROP TABLE IF EXISTS skills;
CREATE TABLE skills (
    id int NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(4096) NOT NULL, 
    tag VARCHAR(255) NOT NULL,
    url VARCHAR(255) DEFAULT NULL,  -- URL can be NULL as per requirements
    time_commitment VARCHAR(255) DEFAULT NULL,  -- Time commitment can be NULL
    PRIMARY KEY (id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (id, name, description, tag, url, time_commitment) VALUES
    (1, 'Python Programming', 'Mastering Python for data analysis and web development', 'Skill 1', 'https://python.org', '6 months'),
    (2, 'Digital Marketing', 'Developing strategies for online marketing and SEO', 'Skill 2', 'https://digitalmarketing.com', '3 months'),
    (3, 'Graphic Design', 'Creating visual content to communicate messages', 'Skill 3', 'https://designschool.com', '4 months'),
    (4, 'Project Management', 'Planning, executing, and closing projects effectively', 'Skill 4', 'https://projectmanagement.com', '5 months'),
    (5, 'Machine Learning', 'Applying algorithms and statistical models for data analysis', 'Skill 5', 'https://machinelearning.org', '8 months'),
    (6, '3D Modeling', 'Building digital three-dimensional models of objects', 'Skill 6', 'https://3dmodeling.com', '7 months'),
    (7, 'Cybersecurity', 'Protecting systems, networks, and programs from digital attacks', 'Skill 7', 'https://cybersecurity.com', '9 months'),
    (8, 'Mobile App Development', 'Creating software applications for mobile devices', 'Skill 8', 'https://appdevelopment.com', '6 months');

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

DROP TABLE IF EXISTS people;
CREATE TABLE people (
    id int NOT NULL,
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
    (1, 'John', 'Person 1', 'john1@email.com', 'https://linkedin.com/john1', 'http://headshot.url/john1', 'john_discord1', 'Bio of John', '2020-01-01'),
    (2, 'Emily', 'Person 2', 'emily2@email.com', 'https://linkedin.com/emily2', 'http://headshot.url/emily2', 'emily_discord2', 'Bio of Emily', '2020-02-01'),
    (3, 'Mike', 'Person 3', 'mike3@email.com', 'https://linkedin.com/mike3', 'http://headshot.url/mike3', 'mike_discord3', 'Bio of Mike', '2020-03-01'),
    (4, 'Sarah', 'Person 4', 'sarah4@email.com', 'https://linkedin.com/sarah4', 'http://headshot.url/sarah4', 'sarah_discord4', 'Bio of Sarah', '2020-04-01'),
    (5, 'Daniel', 'Person 5', 'daniel5@email.com', 'https://linkedin.com/daniel5', 'http://headshot.url/daniel5', 'daniel_discord5', 'Bio of Daniel', '2020-05-01'),
    (6, 'Laura', 'Person 6', 'laura6@email.com', 'https://linkedin.com/laura6', 'http://headshot.url/laura6', 'laura_discord6', 'Bio of Laura', '2020-06-01'),
    (7, 'Alex', 'Person 7', 'alex7@email.com', 'https://linkedin.com/alex7', 'http://headshot.url/alex7', 'alex_discord7', 'Bio of Alex', '2020-07-01'),
    (8, 'Sophia', 'Person 8', 'sophia8@email.com', 'https://linkedin.com/sophia8', 'http://headshot.url/sophia8', 'sophia_discord8', 'Bio of Sophia', '2020-08-01'),
    (9, 'Brian', 'Person 9', 'brian9@email.com', 'https://linkedin.com/brian9', 'http://headshot.url/brian9', 'brian_discord9', 'Bio of Brian', '2020-09-01'),
    (10, 'Zoe', 'Person 10', 'zoe10@email.com', 'https://linkedin.com/zoe10', 'http://headshot.url/zoe10', 'zoe_discord10', 'Bio of Zoe', '2020-10-01');

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
    (1, 1, '2021-01-01'),
    (1, 3, '2021-02-01'),
    (1, 6, '2021-03-01'),
    (2, 3, '2021-04-01'),
    (2, 4, '2021-05-01'),
    (2, 5, '2021-06-01'),
    (3, 1, '2021-07-01'),
    (3, 5, '2021-08-01'),
    (5, 3, '2021-09-01'),
    (5, 6, '2021-10-01'),
    (6, 2, '2021-11-01'),
    (6, 3, '2021-12-01'),
    (6, 4, '2022-01-01'),
    (7, 3, '2022-02-01'),
    (7, 5, '2022-03-01'),
    (7, 6, '2022-04-01'),
    (8, 1, '2022-05-01'),
    (8, 3, '2022-06-01'),
    (8, 5, '2022-07-01'),
    (8, 6, '2022-08-01'),
    (9, 2, '2022-09-01'),
    (9, 5, '2022-10-01'),
    (9, 6, '2022-11-01'),
    (10, 1, '2022-12-01'),
    (10, 4, '2023-01-01'),
    (10, 5, '2023-02-01');

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
    (1, 2, '2021-01-01'), -- Person 1 is Developer
    (2, 5, '2021-02-01'), -- Person 2 is Boss
    (2, 6, '2021-02-02'), -- Person 2 is also Mentor
    (3, 2, '2021-03-01'), -- Person 3 is Developer
    (3, 4, '2021-03-02'), -- Person 3 is also Team Lead
    (4, 3, '2021-04-01'), -- Person 4 is Recruit
    (5, 3, '2021-05-01'), -- Person 5 is Recruit
    (6, 2, '2021-06-01'), -- Person 6 is Developer
    (6, 1, '2021-06-02'), -- Person 6 is also Designer
    (7, 1, '2021-07-01'), -- Person 7 is Designer
    (8, 1, '2021-08-01'), -- Person 8 is Designer
    (8, 4, '2021-08-02'), -- Person 8 is also Team Lead
    (9, 2, '2021-09-01'), -- Person 9 is Developer
    (10, 2, '2021-10-01'), -- Person 10 is Developer
    (10, 1, '2021-10-02'); -- Person 10 is also Designer
