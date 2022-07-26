
--Questão 1: Utilizando uma query, obtenha todos os usuários (users) que vivem na cidade (cities) cujo nome seja “Rio de Janeiro”.

SELECT users.id, users.name, cities.name as city FROM users
JOIN cities
ON cities.name = 'Rio de Janeiro'
WHERE users."cityId" = 3658

--Questão 2: Utilizando umas query, obtenha todos os depoimentos (testimonials) cadastrados, incluindo o nome do remetente e do destinatário.

SELECT testimonials.*, u1.name as writerId, u2.name as recipient FROM testimonials
JOIN users u1
ON u1.id = testimonials."writerId" 
JOIN users u2
ON u2.id = testimonials."recipientId"

--Questão 3: Utilizando uma query, obtenha todos os cursos (courses) que o usuário com id 30 já finalizou, incluindo o nome da escola. O que indica que um usuário terminou um curso é o campo status da tabela educations, que deve estar como "finished".

SELECT educations."userId" as id, users.name , courses.name as course, schools.name as school, educations."endDate" FROM educations
JOIN users
ON users.id = 30
JOIN courses
ON educations."courseId" = courses.id
JOIN schools
ON educations."schoolId" = schools.id
WHERE educations."userId" = 30 AND educations.status = 'finished'

--Questão 4: Utilizando uma query, obtenha as empresas (companies) para as quais o usuário com id 50 trabalha atualmente. Para filtrar quem trabalha atualmente, utilize o campo endDate da tabela experiences. Se ele estiver null (IS NULL), significa que a pessoa ainda não encerrou a experiência dela na empresa, ou seja, está trabalhando lá.

SELECT experiences."userId", users.name, roles.name as role, companies.name as company, experiences."startDate" 
FROM experiences
JOIN users
ON users.id = 50
JOIN roles
ON experiences."roleId" = roles.id
JOIN companies
ON experiences."companyId" = companies.id
WHERE experiences."userId" = 50 AND experiences."endDate" IS NULL