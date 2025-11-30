-- ==========================================
-- SQL DML Statements
-- ==========================================
INSERT INTO student (student_id, first_name, last_name, email) VALUES
(1, 'Anna',  'Meier',   'anna.meier@uni.ch'),
(2, 'Lukas', 'Keller',  'lukas.keller@uni.ch'),
(3, 'Sara',  'Hoffmann','sara.hoffmann@uni.ch'),
(4, 'Tim',   'Suter',   'tim.suter@uni.ch'),
(5, 'Lea',   'Graf',    'lea.graf@uni.ch'),
(6, 'Joel',  'Brunner', 'joel.brunner@uni.ch'),
(7, 'Nina',  'Arnold',  'nina.arnold@uni.ch'),
(8, 'David', 'Schmid',  'david.schmid@uni.ch'),
(9, 'Fabio', 'Ritter',  'fabio.ritter@uni.ch'),
(10, 'Jonas', 'Weber',   'jonas.weber@uni.ch');

INSERT INTO instructor (instructor_id, first_name, last_name, email) VALUES
(1, 'Peter',   'Zimmermann', 'peter.zimmermann@uni.ch'),
(2, 'Claudia', 'Steiner',     'claudia.steiner@uni.ch'),
(3, 'Rolf',    'Baumann',     'rolf.baumann@uni.ch'),
(4, 'Julia',   'Hess',        'julia.hess@uni.ch'),
(5, 'Andreas', 'Koch',        'andreas.koch@uni.ch');

INSERT INTO course (course_id, title, credits) VALUES
(1, 'Datenbanken',        3),
(2, 'Webentwicklung',     4),
(3, 'Analysis',           5),
(4, 'Projektmanagement',  2),
(5, 'Machine Learning',   4),
(6, 'Statistik',          4),
(7, 'IT-Security',        3),
(8, 'Cloud Computing',    3),
(9, 'Big Data',           3),
(10, 'Software Engineering', 3);

INSERT INTO fuehrt (instructor_id, course_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(3, 6),
(4, 7),
(5, 8),
(1, 9),
(2, 10);

INSERT INTO belegt (student_id, course_id) VALUES
(1, 1),
(1, 3),
(2, 2),
(2, 1),
(3, 4),
(3, 3),
(4, 2),
(5, 5),
(6, 1),
(7, 2);
