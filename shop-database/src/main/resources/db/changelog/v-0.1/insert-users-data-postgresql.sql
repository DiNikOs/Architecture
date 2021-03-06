INSERT INTO users (username, password)
VALUES  ('admin0', '$2a$10$JXGyGx3v/JI/FoaLh76SiuerIvAg/ZHVBEiNYTTNj4/IrTQUUVtF6'),
        ('guest', '$2a$10$uedJ6jkBS08x5mxZY6gV6.LAKSd202CiVutxz5VDq3TIyj9alkmIq');
GO

INSERT INTO roles (name)
VALUES ('ROLE_ADMIN'), ('ROLE_GUEST');
GO

INSERT INTO users_roles(user_id, role_id)
SELECT  (SELECT id FROM users WHERE username = 'admin0'),
        (SELECT id FROM roles WHERE name = 'ROLE_ADMIN')
UNION ALL
SELECT  (SELECT id FROM users WHERE username = 'guest'),
        (SELECT id FROM roles WHERE name = 'ROLE_GUEST');
GO