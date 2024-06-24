Create schema usojoin; 
 
 use usojoin;
  
CREATE TABLE a (x INT, y VARCHAR(5)); 

CREATE TABLE b (x INT, y VARCHAR(5)); 

CREATE TABLE c (x INT, y VARCHAR(5)); 

CREATE TABLE d (x INT); 

                                                        

INSERT INTO a(x,y) VALUES(1,'A');                       -- (1,A) 

INSERT INTO a(x,y) VALUES(2,'B');                       -- (2,B) 

INSERT INTO a(x,y) VALUES(3,'C');                       -- (3,C) 

INSERT INTO a(x,y) VALUES(4,'D');                       -- (4,D) 

  
  
INSERT INTO b(x,y) VALUES(1,'A'); 

INSERT INTO b(x,y) VALUES(3,'C'); 

insert into b(x,y) values(4,'Z'); 

  

INSERT INTO c(x,y) VALUES(1,'A'); 

INSERT INTO c(x,y) VALUES(2,'A'); 

INSERT INTO c(x,y) VALUES(3,'A'); 

INSERT INTO c(x,y) VALUES(1,'B'); 

INSERT INTO c(x,y) VALUES(2,'B'); 

INSERT INTO c(x,y) VALUES(3,'C'); 

INSERT INTO c(x,y) VALUES(3,'D'); 

    

INSERT INTO d(x) VALUES(1); 

INSERT INTO d(x) VALUES(2); 

INSERT INTO d(x) VALUES(3); 

  

    

select a.x,b.x from a inner join  b using (y);  
select  m.x,m.bx,c.y from (select a.x, b.x as bx from a join b using(x)) m join c on m.x= c.x;
 
select a.x,b.x from a left join  b using (y);  
 
select a.x,b.x from a right join  b using (y);  

select a.x,b.x,b.y from a cross join  b;  

select a.x,b.x,c.y, d.x from ((a natural join  b) natural join c) natural join d ;  
-- 1	1	A	1
-- 3	3	C	3

select a.x, b.x from a natural join b;
-- '1', '1'
-- '3', '3'

select a.x, b.x, c.y from (a natural join b) natural join c;
-- 1	1	A
-- 3	3	C





select ae.x,ai.x from a ae join  a ai  using(y);  -- self join  


